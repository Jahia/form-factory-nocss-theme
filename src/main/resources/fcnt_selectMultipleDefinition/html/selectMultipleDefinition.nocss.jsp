<!-- Select multiple-->
<div ng-class="{'ff-has-error': form[input.name].$invalid&&form[input.name].$dirty}"
     ng-show="resolveLogic()">
    <label>
        {{input.label}}<span ng-if="isRequired()" ng-show="asteriskResolver()"><sup>&nbsp;*</sup></span>
    </label>

    <select multiple
                type="select"
                ng-model-options="{allowInvalid:true}"
                name="{{input.name}}"
                ng-model="input.value"
                ng-required="isRequired()"
                ng-disabled="readOnly"
                ff-validations
                ff-logic
                ff-focus-tracker="{{input.name}}">
            <option ng-repeat="option in input.options | filter: 'true' : null : visible" value="{{option.key}}">{{option.value}}</option>
        </select>
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
