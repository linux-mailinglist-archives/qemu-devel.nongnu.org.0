Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A974E5AD2
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 22:46:26 +0100 (CET)
Received: from localhost ([::1]:58728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX8oD-00029s-Db
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 17:46:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nX8mK-00014E-8X; Wed, 23 Mar 2022 17:44:28 -0400
Received: from [2607:f8b0:4864:20::231] (port=38584
 helo=mail-oi1-x231.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nX8mI-0003FN-Mg; Wed, 23 Mar 2022 17:44:27 -0400
Received: by mail-oi1-x231.google.com with SMTP id r8so3046764oib.5;
 Wed, 23 Mar 2022 14:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=caEfRrdX5O7nVIspztTymSSwMD2XV2FEnPXZA3AFw18=;
 b=Ysw7JdzJBn1KUmIeTMub+weLdVlbGB5jW6IyuVQdsp3YKQpqk1qW5IPfziR8FHNT+F
 z3CrGiLDdAJp7KKAV3KlnDT2vZtEvURQsUP2jQVhkKXu+DQgsHcP4AgjkSt4MGayRmES
 +VJ6RDS0xhfyvfiQU61dg4XpoCyqtHbIv0LdTGTc+1K4H9dnDHPwKtsIK5KocnLFjabJ
 c0lsNz17rWobpla0d5d7wgX5onENjo1zoQObt41mM+X2i9iIDWTkNk3Mph73fy+xEZY6
 BJCwRHVHpwEkJu9dwV82ObV9Xor6IYwvKjrbXOusBqcMOjUdM8fuoRqx+kKv+cFMru95
 T+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=caEfRrdX5O7nVIspztTymSSwMD2XV2FEnPXZA3AFw18=;
 b=A+O6109w2mMbmKcm/G0PB59Mf+7P+SC5wQEtcAlN3+mmsytFrBdRPn11Vs4yaUAGBa
 wo+kU+HxMRSlVV/w2FfMOm5Qh6B7Ot9gVkFseJc2A465JtnEAaO9aB9z82G8IMSDaXCD
 Tu3kzdh9C8vhYPq9bBaA+XU/xU0l+uoVoxDdwEiRGlVNtVLQbCqdY/9WFBzgdIE+Bs8p
 79l8+EQfLknxBGuZ/Ikq13ir7o5faSo2kkpXuxzZO7siQSpD5HYh8Me0CFY8TFm/pdbO
 VS3hTB5h8CCIJC75CyG4s0Jqazgn5etvdGecmUWd2xGTD0riupMWqZRJkcPSWnTcYmjr
 KC7Q==
X-Gm-Message-State: AOAM532O3eZuQvOLwEj/AjqoEGWw3yN5/ApBZ+OfKYpjA+PxJrHDVaFg
 TlABSepIEDw9ErDxT2jjNSCEXLH/NJU=
X-Google-Smtp-Source: ABdhPJw+AQ3YkRqWRrlHuNE65pfuoGb20gYiMmz2FGAnYgrYf791AP1OHYnuBUdOKDDRuQ3ef2GtMw==
X-Received: by 2002:a05:6808:1115:b0:2ec:e103:99c8 with SMTP id
 e21-20020a056808111500b002ece10399c8mr1132445oih.194.1648071864014; 
 Wed, 23 Mar 2022 14:44:24 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c6:daa8:ba9e:6f18:bac1:8a96?
 ([2804:431:c7c6:daa8:ba9e:6f18:bac1:8a96])
 by smtp.gmail.com with ESMTPSA id
 l133-20020aca3e8b000000b002ef8ed00461sm493094oia.19.2022.03.23.14.44.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 14:44:23 -0700 (PDT)
Message-ID: <9fc262cf-7706-1611-fb64-467ee37d6117@gmail.com>
Date: Wed, 23 Mar 2022 18:44:21 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 2/4] hw/ppc: use qdev to register physical DRC
 vmstates
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
References: <20220322183854.196063-1-danielhb413@gmail.com>
 <20220322183854.196063-3-danielhb413@gmail.com> <Yjp8hkhiiVDrUTIa@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <Yjp8hkhiiVDrUTIa@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::231
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/22/22 22:48, David Gibson wrote:
> On Tue, Mar 22, 2022 at 03:38:52PM -0300, Daniel Henrique Barboza wrote:
>> Similar to logical DRCs, let's convert physical DRCs to register their
>> vmstates using dc->vmsd.
>>
>> The same constraints with instance_id being set to spapr_drc_index()
>> also applies in this case. However, since realize_physical() calls
>> drc_realize(), qdev_set_legacy_instance_id() is already being set.
> 
> Ok, and you've verified that you don't need to set the legacy ID on
> both "layers"?  That is, have you tested that you can migrate from
> before this change to after?

It works for the wrong reasons. The way I tested this patch wasn't triggering
the migration of the DRCs.

Doing a hotplug and migrating afterwards was enough to migrate the DRC back in 2017,
but after all the work we did in DRC code over these years what happens now is that,
during machine reset, the drc is set to ready_state:

     if (drc->dev) {
         /* A device present at reset is ready to go, same as coldplugged */
         drc->state = drck->ready_state;

And spapr_drc_needed() is returning false:

     /*
      * We need to reset the DRC at CAS or to migrate the DRC state if it's
      * not equal to the expected long-term state, which is the same as the
      * coldplugged initial state, or if an unplug request is pending.
      */
     return drc->state != drck->ready_state || spapr_drc_unplug_requested(drc);


So the CPU DRCs aren't being migrated. I noticed that when turning on traces
of the migration code to debug a problem with patch 03.



Daniel

> 
>>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/ppc/spapr_drc.c | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/ppc/spapr_drc.c b/hw/ppc/spapr_drc.c
>> index a5ef64d2a2..5a60885876 100644
>> --- a/hw/ppc/spapr_drc.c
>> +++ b/hw/ppc/spapr_drc.c
>> @@ -640,9 +640,6 @@ static void realize_physical(DeviceState *d, Error **errp)
>>           return;
>>       }
>>   
>> -    vmstate_register(VMSTATE_IF(drcp),
>> -                     spapr_drc_index(SPAPR_DR_CONNECTOR(drcp)),
>> -                     &vmstate_spapr_drc_physical, drcp);
>>       qemu_register_reset(drc_physical_reset, drcp);
>>   }
>>   
>> @@ -651,7 +648,6 @@ static void unrealize_physical(DeviceState *d)
>>       SpaprDrcPhysical *drcp = SPAPR_DRC_PHYSICAL(d);
>>   
>>       drc_unrealize(d);
>> -    vmstate_unregister(VMSTATE_IF(drcp), &vmstate_spapr_drc_physical, drcp);
>>       qemu_unregister_reset(drc_physical_reset, drcp);
>>   }
>>   
>> @@ -662,6 +658,8 @@ static void spapr_drc_physical_class_init(ObjectClass *k, void *data)
>>   
>>       dk->realize = realize_physical;
>>       dk->unrealize = unrealize_physical;
>> +    dk->vmsd = &vmstate_spapr_drc_physical;
>> +
>>       drck->dr_entity_sense = physical_entity_sense;
>>       drck->isolate = drc_isolate_physical;
>>       drck->unisolate = drc_unisolate_physical;
> 

