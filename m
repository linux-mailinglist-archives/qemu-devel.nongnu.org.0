Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6F62D30F7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 18:27:21 +0100 (CET)
Received: from localhost ([::1]:47614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmglk-0006hE-1w
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 12:27:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1kmgiz-0005Nj-OI
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 12:24:29 -0500
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:40317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1kmgiw-0000XV-J3
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 12:24:28 -0500
Received: by mail-qk1-x741.google.com with SMTP id z11so7462366qkj.7
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 09:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BKmU1ESZT3/6aEDnrUgjuXLcGUhJzlds3WQaZ8e1EkY=;
 b=YNrZGwh2W2tWG0aDmYYC1Hu7OQRcWdfPMk7dxIuyOeKOISzP7rrHeKBtp47ZGjvMvK
 3Ff4MdAirZSwy0YKHkR0+4a9l1UYurAXYH09VR9sLVKnmF3RTRD1mY52FO43hqJNd47b
 p6HVJ0z74pAPS9FUtnMPuD/qQNT81Wkpx6XDIuFpl4GklSFcuw/r5xfjOlfy0tAP1Wuj
 TmRIgsdEcqXx2vyf1V4qzcX7T3UKRGUKjzCzl2iB6x4hUDc1GpHQdRPMQptKJxj0HN0S
 d8yRsG2+0yDHCTwLYZs5mvA/pTpH7/Hgz8w2sIgacbazt37Wy7PAOzvLcSXXKvWAaEKa
 ZEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BKmU1ESZT3/6aEDnrUgjuXLcGUhJzlds3WQaZ8e1EkY=;
 b=C7A73e6khU2dgeWxBuLmUVCBcTkR/g1TVSqvGLF40KNvvV6UtjFo3gEdaWZtnvRl73
 Wp/QFgsN1GQSejZsoIUPyyzM4Q+hQW529rXT4FpzAvjGyzjvjmtC8Zyfg7FKUCvE0ZBs
 UzJPCsNUN9NtNCfZVx84F3RuwY1+GPQZ0zKm1eEb13DfU22niwYJE/hbZj2krpSuF0uL
 SdQ9mBtwsOh3AoVAcMkHOOJ1GNb9pZD3bV2NkJNousD32h5aAN/BpThtWOxH6prGwcuR
 lF8c16cYYjBGS3zyYvZotWPAkF1MItNhOcAhBYhtNr3jGPPIk+aIbEd7Cgn2mIAuhO5f
 cP7A==
X-Gm-Message-State: AOAM533rRagjXuKbUh0IlOyo7tcfbgVxda4qn1LdNCh0uiAwou4Lbo8l
 aUUqu73/kJoxfYd8XldIX2g=
X-Google-Smtp-Source: ABdhPJwpYw8HDJKtdQEf/qbQZ6Omrg9f870TGSBOE9dae7vVKMt/8McHgHu2gyMkX1S66ILcfJms+Q==
X-Received: by 2002:a37:a950:: with SMTP id s77mr19844601qke.122.1607448265577; 
 Tue, 08 Dec 2020 09:24:25 -0800 (PST)
Received: from ?IPv6:2804:431:c7c7:c1a:69c1:2b22:e880:fc49?
 ([2804:431:c7c7:c1a:69c1:2b22:e880:fc49])
 by smtp.gmail.com with ESMTPSA id q16sm3177595qtl.91.2020.12.08.09.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 09:24:25 -0800 (PST)
Subject: Re: [PATCH v2] ppc/spapr: cleanup -machine pseries,nvdimm=X handling
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20201208110532.4099624-1-imammedo@redhat.com>
 <20201208164606.4109134-1-imammedo@redhat.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <16474f79-93b1-e21c-124a-91e20894e47c@gmail.com>
Date: Tue, 8 Dec 2020 14:24:22 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201208164606.4109134-1-imammedo@redhat.com>
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
Cc: pbonzini@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 12/8/20 1:46 PM, Igor Mammedov wrote:
> Since NVDIMM support was introduced on pseries machine,
> it ignored machine's nvdimm=on|off option and effectively
> was always enabled on machines that support NVDIMM.
> Later on commit
>    (28f5a716212 ppc/spapr_nvdimm: do not enable support with 'nvdimm=off')
> makes QEMU error out in case user explicitly set 'nvdimm=off'
> on CLI by peeking at machine_opts.
> 
> However that's a workaround and leaves 'nvdimms_state->is_enabled'
> in inconsistent state (false) when it should be set true
> by default.
> 
> Instead of using on machine_opts, set default to true for pseries
> machine in initfn time. If user sets manually 'nvdimm=off'
> it will overwrite default value to false and QEMU will error
> as expected without need to peek into machine_opts.
> 
> That way pseries will have, nvdimm enabled by default and

nit: extra ',' here

> will honor user provided 'nvdimm=on|off'.

I believe it's plausible to add a:

Fixes: 28f5a716212 ("ppc/spapr_nvdimm: do not enable support with 'nvdimm=off'")

To indicate that this is amending my commit you mentioned up there.


> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---

Thanks for taking the time patching this up. Tested on top of Patch 08 in a
Power 9 host and it works as intended.

Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>


ps: I'm assuming that that this is deprecating Paolo's patch:

"[PATCH 09/15] machine: record whether nvdimm= was set"

and also the chunks of Patch 10/15 that are changing spapr_nvdimm.c. If that's
not the case, let me know and I'll re-test.



Thanks,


DHB



> CC: danielhb413@gmail.com
> CC: david@gibson.dropbear.id.au
> CC: pbonzini@redhat.com
> 
> v2:
>    - simplify a bit more by using spapr_instance_init() to set
>      default value instead of doing it in generic machine code
> 
> PS:
> Patch should be applied on top of:
>    [PATCH 08/15] machine: introduce MachineInitPhase
> ---
>   hw/ppc/spapr.c        | 13 +++++++++++++
>   hw/ppc/spapr_nvdimm.c | 14 +-------------
>   2 files changed, 14 insertions(+), 13 deletions(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index b7e0894019..803a6f52a2 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -3267,6 +3267,19 @@ static void spapr_instance_init(Object *obj)
>   {
>       SpaprMachineState *spapr = SPAPR_MACHINE(obj);
>       SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(spapr);
> +    MachineState *ms = MACHINE(spapr);
> +    MachineClass *mc = MACHINE_GET_CLASS(ms);
> +
> +    /*
> +     * NVDIMM support went live in 5.1 without considering that, in
> +     * other archs, the user needs to enable NVDIMM support with the
> +     * 'nvdimm' machine option and the default behavior is NVDIMM
> +     * support disabled. It is too late to roll back to the standard
> +     * behavior without breaking 5.1 guests.
> +     */
> +    if (mc->nvdimm_supported) {
> +        ms->nvdimms_state->is_enabled = true;
> +    }
>   
>       spapr->htab_fd = -1;
>       spapr->use_hotplug_event_source = true;
> diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
> index a833a63b5e..66cd3dc13f 100644
> --- a/hw/ppc/spapr_nvdimm.c
> +++ b/hw/ppc/spapr_nvdimm.c
> @@ -27,10 +27,8 @@
>   #include "hw/ppc/spapr_nvdimm.h"
>   #include "hw/mem/nvdimm.h"
>   #include "qemu/nvdimm-utils.h"
> -#include "qemu/option.h"
>   #include "hw/ppc/fdt.h"
>   #include "qemu/range.h"
> -#include "sysemu/sysemu.h"
>   #include "hw/ppc/spapr_numa.h"
>   
>   bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
> @@ -38,7 +36,6 @@ bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
>   {
>       const MachineClass *mc = MACHINE_GET_CLASS(hotplug_dev);
>       const MachineState *ms = MACHINE(hotplug_dev);
> -    const char *nvdimm_opt = qemu_opt_get(qemu_get_machine_opts(), "nvdimm");
>       g_autofree char *uuidstr = NULL;
>       QemuUUID uuid;
>       int ret;
> @@ -48,16 +45,7 @@ bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
>           return false;
>       }
>   
> -    /*
> -     * NVDIMM support went live in 5.1 without considering that, in
> -     * other archs, the user needs to enable NVDIMM support with the
> -     * 'nvdimm' machine option and the default behavior is NVDIMM
> -     * support disabled. It is too late to roll back to the standard
> -     * behavior without breaking 5.1 guests. What we can do is to
> -     * ensure that, if the user sets nvdimm=off, we error out
> -     * regardless of being 5.1 or newer.
> -     */
> -    if (!ms->nvdimms_state->is_enabled && nvdimm_opt) {
> +    if (!ms->nvdimms_state->is_enabled) {
>           error_setg(errp, "nvdimm device found but 'nvdimm=off' was set");
>           return false;
>       }
> 

