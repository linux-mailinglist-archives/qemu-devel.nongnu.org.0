Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AC14E5AC4
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 22:41:33 +0100 (CET)
Received: from localhost ([::1]:56126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX8jU-0008Db-D9
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 17:41:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nX8hs-0007Vk-5C
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 17:39:52 -0400
Received: from [2001:4860:4864:20::2a] (port=38301
 helo=mail-oa1-x2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nX8hq-0000zY-8J
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 17:39:51 -0400
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-dacc470e03so3095657fac.5
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 14:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Hv3F13Ux04XF/buEPovAi9rUxpumHdIvUjgl1tPL8MQ=;
 b=YdsKu5GouiWhv7uAaWOC473n27e1lURFLdYKp4xBMpQBE3O+1Cg3P7EodUc9XU+2YL
 vBwvHRjc+DZu/uOaVGGsq5S43tQSDo8L2evQF9Ngl/FbKeNbGHuU6Zs2mVwL2NnYt/N7
 ZsMyrwzLYquDNLd4p5SUE7Nj264uh8yo1IuXhGSYJHSpc88niEAA2eIUhkynn5Sbhi20
 h11+NfQ6HBT5BBIvLwOZxNxorGQXJ8HfnhyIVkK59tx7H8abAkY9925pKq4ZhYsgsFso
 n9duBnU7nZBBKzF2UJmhRgjtr2jTH/k9WyFquPXBMoqMJ4cMzFG5oSpbLp4G7PTBnuS8
 eIOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Hv3F13Ux04XF/buEPovAi9rUxpumHdIvUjgl1tPL8MQ=;
 b=1Hx/QjGNXbsA7CW62Xq7nPxeorwbtXHsxEgiMncFEWi/Sg+tpuPFpGUqgD+sNXmRzF
 74AMUKYI0YjsEH5L0EhCz24++tQGrebXbiEen29hCHeH2vWud1dJ2XQr1fPOLm1Ou9Ha
 76L/o/Gc0d+qeilspiKsBiQCypTye6DyX13mvlWp/viM8jyFfqEOEsTCkPQgJISV/ap1
 zyltPL6lDsyT9Gp+7Xotp+Bf2NhUgpKP/xmj9AgukC9WFcEjci263TVxTNeHGTUe79g0
 RZYTEJcFPrVe+cNAK7cmUyOUKSNNGYok1yurr1beXvbQkLZ0Xqj/elsLK+Ztl+fqKD/o
 TXTQ==
X-Gm-Message-State: AOAM533gzWyvS/dZM57yYkK491wnb3+JRukrFOVCiUVDElgnY3tULrZN
 ReFQBV2/HOLDmEompjIiDnI=
X-Google-Smtp-Source: ABdhPJxDUkLpNZ4TCLwI+LtKY9u5+zBgEVfH/TFJIThUc5/kzPTBkqdegH+ouXt1S/3ZE3WHmN3q1A==
X-Received: by 2002:a05:6870:ec9e:b0:dd:e1fd:d76c with SMTP id
 eo30-20020a056870ec9e00b000dde1fdd76cmr1038090oab.7.1648071588414; 
 Wed, 23 Mar 2022 14:39:48 -0700 (PDT)
Received: from ?IPV6:2804:431:c7c6:daa8:ba9e:6f18:bac1:8a96?
 ([2804:431:c7c6:daa8:ba9e:6f18:bac1:8a96])
 by smtp.gmail.com with ESMTPSA id
 kx3-20020a056871400300b000ddca3b6a95sm488759oab.4.2022.03.23.14.39.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 14:39:48 -0700 (PDT)
Message-ID: <c224e326-f16b-d895-7598-87b215a95043@gmail.com>
Date: Wed, 23 Mar 2022 18:39:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Question about vmstate_register(), dc->vmsd and instance_id
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <38c43d66-e57c-e0fe-d35f-c411d40d6611@gmail.com>
 <CAFEAcA8eZ0G=ZxyCv7xCk-ZE7R_t6BnDtbGCsYgSBuLwyHprsQ@mail.gmail.com>
 <YjNh2jSDpWvLJ1S3@work-vm>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <YjNh2jSDpWvLJ1S3@work-vm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2a
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2a;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2a.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/17/22 13:29, Dr. David Alan Gilbert wrote:
> * Peter Maydell (peter.maydell@linaro.org) wrote:
>> On Thu, 17 Mar 2022 at 14:03, Daniel Henrique Barboza
>> <danielhb413@gmail.com> wrote:
>>> I've been looking into converting some vmstate_register() calls to use dc->vmsd,
>>> using as a base the docs in docs/devel/migration.rst. This doc mentions that we
>>> can either register the vmsd by using vmstate_register() or we can use dc->vmsd
>>> for qdev-based devices.
>>>
>>> When trying to convert this vmstate() call for the qdev alternative (hw/ppc/spapr_drc.c,
>>> drc_realize()) I found this:
>>>
>>>       vmstate_register(VMSTATE_IF(drc), spapr_drc_index(drc), &vmstate_spapr_drc,
>>>                        drc);
>>>
>>> spapr_drc_index() is an unique identifier for these DRC devices and it's being used
>>> as instance_id. It is not clear to me how we can keep using this same instance_id when
>>> using the dc->vmsd alternative. By looking a bit into migration files I understood
>>> that if dc->vmsd is being used the instance_id is always autogenerated. Is that correct?
>>
>> Not entirely. It is the intended common setup, but because changing
>> the ID value breaks migration compatibility there is a mechanism
>> for saying "my device is special and needs to set the instance ID
>> to something else" -- qdev_set_legacy_instance_id().
> 
> Yes, this is normally only an issue for 'system' or memory mapped
> devices;  for things hung off a bus that has it's own device naming,
> then each instance of a device has it's own device due to the bus name
> so instance_id's aren't used.  Where you've got a few of the
> same device with the same name, and no bus for them to be named by, then
> the instance_id is used to uniquify them.



(long reply inc)

So, qdev_set_legacy_instance_id() doesn't set 'instance_id' as I've expected but rather
'alias_id'. The function will set dev->instance_id_alias, which is then used in device_set_realized()
as follows:


         if (qdev_get_vmsd(dev)) {
             if (vmstate_register_with_alias_id(VMSTATE_IF(dev),
                                                VMSTATE_INSTANCE_ID_ANY,
                                                qdev_get_vmsd(dev), dev,
                                                dev->instance_id_alias,
                                                dev->alias_required_for_version,
                                                &local_err) < 0) {
                 goto post_realize_fail;
             }
         }

instance_id is set to VMSTATE_INSTANCE_ID_ANY, meaning that is  going to be autogenerated. The
SaveStateEntry (SE) will be generated with se->alias_id = (custom value we set) and
se->instance_id = autogenerated.

The migration stream transmits se->instance_id but not se->alias_id. When loading the migration
in the destination, find_se() will make a search using the received instance_id from the source
and compare it to both se->instance_id and se->alias_id from the destination.

If I try to convert an existing migratable device that is setting instance_id via vmstate_register()
to use qdev's dc->vmsd, if the existing code is already setting instance_id via vmstate_register(),
I end up breaking backward migration. This is what happened in patch
https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg05617.html where I attempted this
conversion.

The code before the patch (B) has the following SEs for the device I changed:

===== spapr_iommu: se->instanceid = 0x80000000 se->alias_id = 0xffffffff ====
===== spapr_iommu: se->instanceid = 0x80000001 se->alias_id = 0xffffffff ====

And the code after the patch (A):

===== spapr_iommu: se->instanceid = 0x0 se->alias_id = 0x80000000 ====
===== spapr_iommu: se->instanceid = 0x1 se->alias_id = 0x80000001 ====


Migrating a pseries guest from B to A works because the new code, although using a different
instance_id, is matching with its alias_id. This is the output in A using the following trace:


     trace_qemu_loadvm_state_section_startfull(section_id, idstr, instance_id, version_id);

qemu_loadvm_state_section_startfull 15(vty@71000000/spapr_vty) 0 1
qemu_loadvm_state_section_startfull 16(nvram@71000001/spapr_nvram) 0 1
qemu_loadvm_state_section_startfull 560(spapr_iommu) 2147483648 2
qemu_loadvm_state_section_startfull 561(spapr_iommu) 2147483649 2
(...)

But the backward migration, A to B, doesn't work:

qemu_loadvm_state_section_startfull 560 (spapr_iommu) 0 2
qemu-system-ppc64: Unknown savevm section or instance 'spapr_iommu' 0. Make sure that your current
VM setup matches your saved VM setup, including any hotplugged devices
qemu-system-ppc64: load of migration failed: Invalid argument

The failure happens because the code without the patch is trying to match an instance_id = 0
(which A is now autogenerating) to its se->instance_id = 0x80000000 | se->alias = 0xffffffff.
The match fails and the error is thrown.


It seems that what I'm trying to do, convert vmstate_register() calls to qdev's dc->vmsd, when
the existing  code is setting custom instance_ids in vmstate_register(), is not feasible to be
done without breaking backward migration. At least with the current qdev APIs.
qdev_set_legacy_instance_id() helps to allow older guests to migrate to newer QEMUs, but not
the other way around.


Am I missing something here?


Thanks,


Daniel















> 
> Dave
> 
>>> Given that this is a 13 year old comment from Anthony Liguori I wanted to confirm its
>>> validity. Is there a long term goal of getting rid of instance_id? Can I ignore its
>>> role when converting these calls to dc->vmsd?
>>
>> Only if you're prepared to break migration compatibility, I think.
>>
>> -- PMM
>>

