<!-- Checkboxes input-->
<div ng-class="{'ff-has-error': form[input.name].$invalid&&form[input.name].$dirty}"
     ng-show="resolveLogic()">
    <label>
        {{input.label}}
        <span ng-if="isRequired()"
              ng-show="asteriskResolver()">
            <sup>&nbsp;*</sup>
        </span>
    </label>

    <div ff-validations ff-logic>
        <div ng-repeat="checkboxOption in input.checkboxes | filter: 'true' : null : visible">
            <label>
                <input type="checkbox"
                       name="{{input.name}}" checklist-model="input.value"
                       ng-required="checkValues()"
                       checklist-value="checkboxOption.key"
                       checklist-change="makeDirty(); ffValidate()"
                       checklist-watch="readOnly"
                       ng-model-options="{'allowInvalid':true}"
                       ng-disabled="readOnly"
                       ff-focus-tracker="{{input.name}}_{{checkboxOption.key}}">
                {{checkboxOption.value}}
            </label>
        </div>
        <p>
            <span ng-show="input.helptext != undefined">
                {{input.helptext}}
            </span>
            <br/>
            <span ng-repeat="(validationName, validation) in input.validations"
                      ng-show="showErrorMessage(validationName)">
                {{validation.message}}
            </span>
        </p>
    </div>
</div>