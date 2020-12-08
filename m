Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4F82D20DE
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 03:34:24 +0100 (CET)
Received: from localhost ([::1]:40880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmSpb-0006yB-C2
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 21:34:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1kmSoI-0006Wy-8o
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 21:33:02 -0500
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:42954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1kmSoF-0005OF-Eb
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 21:33:02 -0500
Received: by mail-qk1-x741.google.com with SMTP id z188so14780665qke.9
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 18:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NRv0LnZqQ7Ioq4aOdJyKGoTqijSVK0rhb0DmU22RmcQ=;
 b=je/xIzn2fjuOIiV2NonCChGJrxoO2KF8yCG+URD0bQqv6YSL4gdkKLv1HWBgiPaiHm
 ZMvSL0iD5xDwNpiUEdNLwuUGbHm3pROW/91ghzJTedvfqRGigzvUUW9tOXLaEev885YI
 0pQCxIccl2enhE6NJ71VWix1iEIxU06Z9puMxe6JLf0igZN5U1NuDxZYl3DbXlGqlsG7
 uOdF0XIqXkHITtTiO2pxyUOChWzml1K8SPtHHwY5kTJplVFJkZSyXf3iuBuOMX5q+CSi
 NjMycgkEu8JKWYniUdrEiLQkCONtXzAuk8yq1chyPw2+iUUobnZvFilgJWYN03oeN7e1
 vCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NRv0LnZqQ7Ioq4aOdJyKGoTqijSVK0rhb0DmU22RmcQ=;
 b=njM71jCdxWzgppOBidLYXsRcjvb7/XEK/uORZiZioreyS/89G2qpOrCOlW7fzsCiv7
 om+3PYa93yfxpwHTgn2yuoE2FrBU8sfQJ/XnTZpRv13mecMUuOvVJ03AoOmR9A67HTMS
 6WI0iwDzPsnJSbXWhWeEBAyE8gj993ag52daaLvCG1uRYfdLaK65aO0EmGhAqAxbRupP
 /9LZlSWYC20bZHsISJ3zZ4t0AIpLbpZTN4vgG16GnUXYag8dMni03Z4MndvcIM/Eortv
 Obfr83v8zV5cSm3Z4LepVrVEaYYq2RVG2n+2JDmJUmRhzMgOCjyGRJSg7XA3tiYLtb3S
 yTzQ==
X-Gm-Message-State: AOAM533Jnp3nmWF5JCcZtiVnxuj7bfEsrysuSPDh7EjX1BaMHs7p3aM3
 4gqqxnLTcMx78NQAAvf1E9Y=
X-Google-Smtp-Source: ABdhPJzOXGMndjcHZivrcYD12W+t0zYCudnPN3YLtD7ayIgyd6nWPEtXSCSMvl3yv0obTqW1XdQMkA==
X-Received: by 2002:a37:4f12:: with SMTP id d18mr8218705qkb.378.1607394778219; 
 Mon, 07 Dec 2020 18:32:58 -0800 (PST)
Received: from ?IPv6:2804:431:c7c7:c1a:69c1:2b22:e880:fc49?
 ([2804:431:c7c7:c1a:69c1:2b22:e880:fc49])
 by smtp.gmail.com with ESMTPSA id y15sm3740761qto.51.2020.12.07.18.32.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 18:32:57 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 10/15] vl: make qemu_get_machine_opts static
To: Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20201202081854.4126071-1-pbonzini@redhat.com>
 <20201202081854.4126071-11-pbonzini@redhat.com>
 <20201207170728.0a39f201@redhat.com>
Message-ID: <44bc2a0b-ff1e-d9d5-772c-a5cbe23da94a@gmail.com>
Date: Mon, 7 Dec 2020 23:32:55 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201207170728.0a39f201@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::741;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x741.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/7/20 1:07 PM, Igor Mammedov wrote:
> On Wed,  2 Dec 2020 03:18:49 -0500
> Paolo Bonzini <pbonzini@redhat.com> wrote:
> 
>> Machine options can be retrieved as properties of the machine object.
>> Encourage that by removing the "easy" accessor to machine options.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   accel/kvm/kvm-all.c     | 11 ++++-------
>>   hw/arm/boot.c           |  2 +-
>>   hw/microblaze/boot.c    |  9 ++++-----
>>   hw/nios2/boot.c         |  9 ++++-----
>>   hw/ppc/e500.c           |  5 ++---
>>   hw/ppc/spapr_nvdimm.c   |  4 ++--
>>   hw/ppc/virtex_ml507.c   |  2 +-
>>   hw/riscv/sifive_u.c     |  6 ++----
>>   hw/riscv/virt.c         |  6 ++----
>>   hw/xtensa/xtfpga.c      |  9 ++++-----
>>   include/sysemu/sysemu.h |  2 --
>>   softmmu/device_tree.c   |  2 +-
>>   softmmu/vl.c            |  2 +-
>>   13 files changed, 28 insertions(+), 41 deletions(-)
>>
> [...]
>> diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
>> index a833a63b5e..84715a4d78 100644
>> --- a/hw/ppc/spapr_nvdimm.c
>> +++ b/hw/ppc/spapr_nvdimm.c
>> @@ -38,7 +38,6 @@ bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
>>   {
>>       const MachineClass *mc = MACHINE_GET_CLASS(hotplug_dev);
>>       const MachineState *ms = MACHINE(hotplug_dev);
>> -    const char *nvdimm_opt = qemu_opt_get(qemu_get_machine_opts(), "nvdimm");
>>       g_autofree char *uuidstr = NULL;
>>       QemuUUID uuid;
>>       int ret;
>> @@ -57,10 +56,11 @@ bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
>>        * ensure that, if the user sets nvdimm=off, we error out
>>        * regardless of being 5.1 or newer.
>>        */
>> -    if (!ms->nvdimms_state->is_enabled && nvdimm_opt) {
>> +    if (!ms->nvdimms_state->is_enabled && ms->nvdimms_state->has_is_enabled) {
>>           error_setg(errp, "nvdimm device found but 'nvdimm=off' was set");
>>           return false;
>>       }
>> +    ms->nvdimms_state->is_enabled = true;
> 
> it looks like nvdimm is always enabled since 5.0 and there is no way to disable it


I'm not sure I'm following this statement. Testing here with all patches
up to this one applied, in a x86 machine:


$ sudo ./x86_64-softmmu/qemu-system-x86_64 -M pc,nvdimm=off -object memory-backend-file,id=mem0,size=1G,mem-path=/tmp/aa -device nvdimm,id=dimm0,memdev=mem0
qemu-system-x86_64: -device nvdimm,id=dimm0,memdev=mem0: nvdimm is not enabled: missing 'nvdimm' in '-M'
$
$ sudo ./x86_64-softmmu/qemu-system-x86_64 -M pc -object memory-backend-file,id=mem0,size=1G,mem-path=/tmp/aa -device nvdimm,id=dimm0,memdev=mem0
qemu-system-x86_64: -device nvdimm,id=dimm0,memdev=mem0: nvdimm is not enabled: missing 'nvdimm' in '-M'
$

This is the x86 NVDIMM behavior I considered when patching pseries NVDIMM support.
As Paolo mentioned in patch 09, pseries has different default values. We screwed
it up when pushing the first version of pseries NVDIMM support and we ended up
enabling it by default, as opposed to disabling it by default like x86. One release
later people complained that we weren't honoring 'nvdimm=off' to disable NVDIMM
support. The path of less pain that I chose was to at the very least disable
the support when "nvdimm=off" was specified by the user.





> how about dropping 9/15 and just error out is it's not enabled, something like:
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index b7e0894019..d63f095bff 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -2668,6 +2668,7 @@ static void spapr_machine_init(MachineState *machine)
>       char *filename;
>       Error *resize_hpt_err = NULL;
> +    if (mc->nvdimm_supported) { // by default it is always enabled
> +        ms->nvdimms_state->is_enabled = true;
> +    }
>       msi_nonbroken = true;
>   
>       QLIST_INIT(&spapr->phbs);
> diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
> index a833a63b5e..b11c85dbaa 100644
> --- a/hw/ppc/spapr_nvdimm.c
> +++ b/hw/ppc/spapr_nvdimm.c
> @@ -57,7 +57,7 @@ bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
>        * ensure that, if the user sets nvdimm=off, we error out
>        * regardless of being 5.1 or newer.
>        */
> -    if (!ms->nvdimms_state->is_enabled && nvdimm_opt) {
> +    if (!ms->nvdimms_state->is_enabled) {
>           error_setg(errp, "nvdimm device found but 'nvdimm=off' was set");
>           return false;
>       }
> 
> if I didn't miss something, that way we do not abuse nvdimm_opt and still
> have nvdimm enabled by default and error out if it turns to disabled for whatever reason.


Just tried this out. This doesn't disable the NVDIMM support when passing 'nvdimm=off'
machine option.


As far pseries NVDIMM support goes, we'll need patch 09 and to consider nvdimm_opt
to keep the same behavior we already have today, like Paolo is already doing in
this patch.



Thanks,


DHB

> 
> 
>>       if (object_property_get_int(OBJECT(nvdimm), NVDIMM_LABEL_SIZE_PROP,
>>                                   &error_abort) == 0) {
> [...]
> 
>   
> 

