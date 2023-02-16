Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C9D699CE6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 20:16:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSjjo-0000rB-L8; Thu, 16 Feb 2023 14:16:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSjjm-0000qJ-8D
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 14:16:10 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSjji-00028S-VM
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 14:16:09 -0500
Received: by mail-wm1-x333.google.com with SMTP id n33so2369175wms.0
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 11:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AZeWqv2ZNAQJbJtqJWL9bZQ/ArEq6WS/wXiLtp5D8xo=;
 b=S6i9sSlpUlScXSmjKewv9t2rk6H7jsG1kL+BWjVMjcJqWPHfWTViRi9knNmoTEHGN5
 ng0R4VEpLZx+/KZSVpo9oQikjqkC08WnrjJAe2lT9M9iwDOLLgA8EEyvv76JM80BG1Cq
 EFoIzMr1iqY4joSfU0q+8sxCdjEYcnwPAST54z2OUUdGs1rWIRDVZWXSW6ZPPljfXmCy
 QGjtFgLseOqaPAzP6FchVqPC2ZZtbzfL3kWTgqrko6nmxz8oIcVID9LaRwj1tm62QP8j
 VxBXBBImuI88EbPz8HR8vywVLH8+b45nI9i7QGD4Hd5Gb9oGqD4MpUIeI35hgfToWbdv
 3MJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AZeWqv2ZNAQJbJtqJWL9bZQ/ArEq6WS/wXiLtp5D8xo=;
 b=sPMR9iTdwq11mDvGJhuUQ4+WNNghTYf1Spklph/v9UHJyZZYlkyMz5cIf7FfpMHiE5
 raVnDo4U/GRKtDLv91ngBhEvy9oTsiKvXuCiS8cT94h0gpQc4EB+kbQbepjVDPhcmNRL
 u/dHg2rXE9WMCBb2xKn8wkkMnqHbRhmOEtAtQEP7FblL/IprFaAfy6+TQ0q3Ic9blo6O
 NMx95JoIMrqUTu16vUAAReyxs+0VYzC5Y4MVpiYMFeeeqvbl3LV2QDIrQIob+8020LMt
 ND18FxsY4ee0NzG/KZsD3yDwiVW5JXh2ay9dVomXLAqCkauZvLLYOl3Hnsv87OR1PLCy
 Qohg==
X-Gm-Message-State: AO0yUKUI8vfb/hglktgLLnls/3xl1tFK0ZzfBB81/dJJYaPdneYLAjLi
 PjqseJO1COGtZMPyRFAFkzwoaQ==
X-Google-Smtp-Source: AK7set8RzH9QtCs1XeDZic9CwgdXsJTVbCqN2Cdw1YcljXWDpAzPId8igheqArqltUv1xWtuNy7iHg==
X-Received: by 2002:a05:600c:318f:b0:3df:e659:f9d9 with SMTP id
 s15-20020a05600c318f00b003dfe659f9d9mr5270226wmp.34.1676574965097; 
 Thu, 16 Feb 2023 11:16:05 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p22-20020a05600c205600b003de2fc8214esm2502497wmg.20.2023.02.16.11.16.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 11:16:04 -0800 (PST)
Message-ID: <56bb0fe8-d1f0-73a6-7881-f2a0e43bf2fa@linaro.org>
Date: Thu, 16 Feb 2023 20:16:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [RFC PATCH 5/5] hw/ppc/pnv_bmc: Simplify pnv_bmc_find()
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org
References: <20230216122524.67212-1-philmd@linaro.org>
 <20230216122524.67212-6-philmd@linaro.org>
 <e4e0217e-9bd3-1bb7-c91c-0686cf67fc02@kaod.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <e4e0217e-9bd3-1bb7-c91c-0686cf67fc02@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.351,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 16/2/23 19:12, Cédric Le Goater wrote:
> On 2/16/23 13:25, Philippe Mathieu-Daudé wrote:
>> ForeachArgs::name is only used once as TYPE_IPMI_BMC.
>> Since the penultimate commit, object_child_foreach_recursive()'s
>> handler takes an Error* argument and return a boolean.
>> We can directly pass ForeachArgs::obj as context, removing the
>> ForeachArgs structure.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>
>> ---
>> RFC: please double-check...
>>
>>
>>   hw/ppc/pnv_bmc.c | 25 +++++++++----------------
>>   1 file changed, 9 insertions(+), 16 deletions(-)
>>
>> diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
>> index 05acc88a55..566284469f 100644
>> --- a/hw/ppc/pnv_bmc.c
>> +++ b/hw/ppc/pnv_bmc.c
>> @@ -278,36 +278,29 @@ IPMIBmc *pnv_bmc_create(PnvPnor *pnor)
>>       return IPMI_BMC(obj);
>>   }
>> -typedef struct ForeachArgs {
>> -    const char *name;
>> -    Object *obj;
>> -} ForeachArgs;
>> -
>>   static bool bmc_find(Object *child, void *opaque, Error **errp)
>>   {
>> -    ForeachArgs *args = opaque;
>> +    Object **obj = opaque;
>> -    if (object_dynamic_cast(child, args->name)) {
>> -        if (args->obj) {
>> -            return false;
> 
> The purpose of this test was to catch multiple bmc devices and it's removed
> now.

Great.

>> +    if (object_dynamic_cast(child, TYPE_IPMI_BMC)) {
>> +        if (*obj) {
>> +            return true;
>>           }
>> -        args->obj = child;
>> +        *obj = child;
>>       }
>>       return true;
>>   }
>>   IPMIBmc *pnv_bmc_find(Error **errp)
>>   {
>> -    ForeachArgs args = { TYPE_IPMI_BMC, NULL };
>> -    int ret;
>> +    Object *obj = NULL;
>> -    ret = object_child_foreach_recursive(object_get_root(), bmc_find,
>> -                                         &args, NULL);
>> -    if (ret) {
>> +    if (!object_child_foreach_recursive(object_get_root(), bmc_find, 
>> &obj,
>> +                                        NULL)) {
>>           error_setg(errp, "machine should have only one BMC device. "
>>                      "Use '-nodefaults'");>           return NULL;
>>       }
> 
> We don't test obj against NULL any more. This could break the QOM cast 
> below.

IIUC QOM cast-macros are NULL-safe, see
https://lore.kernel.org/qemu-devel/20210107121304.1db97130@bahia.lan/

If you concur I'll try to update the QOM API doc where relevant.

>> -    return args.obj ? IPMI_BMC(args.obj) : NULL;
>> +    return IPMI_BMC(obj);
>>   }
> 


