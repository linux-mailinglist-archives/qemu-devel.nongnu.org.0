Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E5F4CC095
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:02:07 +0100 (CET)
Received: from localhost ([::1]:54624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPmxy-0002Um-4P
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:02:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nPmvD-0000NL-Dw
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 09:59:15 -0500
Received: from [2607:f8b0:4864:20::636] (port=39927
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nPmvB-0000u9-Mo
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 09:59:15 -0500
Received: by mail-pl1-x636.google.com with SMTP id 9so4770984pll.6
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 06:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SUxPj9c/gQNxI2u8Fy5K66dfTdZdmDIzI9S7s4OCJ+w=;
 b=FYdqyQsVcZ6s0XkTTA9XzColAi4MjIu7XA1lYmD1O0q0uQFao3HfRvkc/Z7E9NlfWP
 0rnSVOPYer1nl0Ub7op3fm0G2PaeGMf6IsPS2B+hptuhuqZNehplwCaowBP0YaTyAirh
 14aova58SDSdXRfazqxnUOggM3CAbzKkubRsQHpkK0UoeqeD2QHLyhJdya83tin1GBdv
 /VytDtz0vpV+AMFAXqMSYPEPxSTTfsJuLUunGuJ+ABINVypA9C13B+RqpqSlGGp5uhvU
 90XiQUmGRHcpf56GlMPx9aK1X4EA8hcr0MYPkK7XUgGXa8KmcBdl5qL8tZ+TzugDpUB9
 IwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SUxPj9c/gQNxI2u8Fy5K66dfTdZdmDIzI9S7s4OCJ+w=;
 b=ul92IEvc8yQMBAkIXXUiNlnAxuBDLBqlC5yqstCaXs23XvTOCXY3OVy3LeYR9ip0om
 xPoAXoVF5j3pg/N0YicQz7TDLYlRwSvdai8raQFyTSW6A9Skc/Sw31KY/T5an37yZLWC
 djhJJHl+kzXBr5oLUDcYP17VBdnXv+0SERnrgpXr3joDhZ4TI6FAXiaHOZUTCbqtyHxC
 w2iIgRehFWDgarPVh56ntyKjH7QDfuspv1fBKGltHdHBhb03H2WgsnPgD2k07+x9lnTn
 8720iq3I6XVLmG88H7xvcSWTyFPuqsJ+UEVm18lRjHx1kpAtV97jURa+OXBAsPBPG4HQ
 7zkA==
X-Gm-Message-State: AOAM531AmeGtae0cbP12K8AZFR65dNeCiGmsYFeQYmYaU2TOsRcn0xux
 Fwu+Lv5ELiA2t7joUEVBf7Y=
X-Google-Smtp-Source: ABdhPJwq7eDR/RbnGzJgvKZVosdCCaMIMx7FT4U8OjMvo+KWo02Sh2RvPwkt4sAwz0ziJlpuaUzgCQ==
X-Received: by 2002:a17:902:7e4d:b0:14f:e295:5a41 with SMTP id
 a13-20020a1709027e4d00b0014fe2955a41mr36349043pln.27.1646319552026; 
 Thu, 03 Mar 2022 06:59:12 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 k22-20020aa788d6000000b004f1335c8889sm2873050pff.7.2022.03.03.06.59.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 06:59:11 -0800 (PST)
Message-ID: <a507b986-c8fb-3deb-5531-54fcbb35039e@gmail.com>
Date: Thu, 3 Mar 2022 15:59:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v4 12/14] add sysbus-mmio-map qapi command
Content-Language: en-US
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org,
 mark.burton@greensocs.com, edgari@xilinx.com
References: <20220223090706.4888-1-damien.hedde@greensocs.com>
 <20220223090706.4888-13-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220223090706.4888-13-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/2/22 10:07, Damien Hedde wrote:
> This command allows to map an mmio region of sysbus device onto
> the system memory. Its behavior mimics the sysbus_mmio_map()
> function apart from the automatic unmap (the C function unmaps
> the region if it is already mapped).
> For the qapi function we consider it is an error to try to map
> an already mapped function. If unmapping is required, it is
> probably better to add a sysbus-mmip-unmap command.

"sysbus-mmio-unmap" typo I presume.

> This command is still experimental (hence the 'unstable' feature),
> as it is related to the sysbus device creation through qapi commands.
> 
> This command is required to be able to dynamically build a machine
> from scratch as there is no qapi-way of doing a memory mapping.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
> Cc: Alistair Francis <alistair.francis@wdc.com>
> 
> v4:
>   + integrate priority parameter
>   + use 'unstable' feature flag instead of 'x-' prefix
>   + bump version to 7.0
>   + dropped Alistair's reviewed-by as a consequence
> ---
>   qapi/qdev.json   | 31 ++++++++++++++++++++++++++++++
>   hw/core/sysbus.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 80 insertions(+)
> 
> diff --git a/qapi/qdev.json b/qapi/qdev.json
> index 2e2de41499..4830e87a90 100644
> --- a/qapi/qdev.json
> +++ b/qapi/qdev.json
> @@ -160,3 +160,34 @@
>   ##
>   { 'event': 'DEVICE_UNPLUG_GUEST_ERROR',
>     'data': { '*device': 'str', 'path': 'str' } }
> +
> +##
> +# @sysbus-mmio-map:
> +#
> +# Map a sysbus device mmio onto the main system bus.
> +#
> +# @device: the device's QOM path
> +#
> +# @mmio: The mmio number to be mapped (defaults to 0).
> +#
> +# @addr: The base address for the mapping.
> +#
> +# @priority: The priority of the mapping (defaults to 0).
> +#
> +# Features:
> +# @unstable: Command is meant to map sysbus devices
> +#            while in preconfig mode.
> +#
> +# Since: 7.0
> +#
> +# Returns: Nothing on success
> +#
> +##
> +
> +{ 'command': 'sysbus-mmio-map',
> +  'data': { 'device': 'str',
> +            '*mmio': 'uint8',
> +            'addr': 'uint64',
> +            '*priority': 'int32' },

I wonder if not providing the explicit parent container now could
be problematic later, and if we shouldn't start with a QOM MR path
(default to 'system_memory'). Anyway, sysbus are currently
restricted to system_memory so as you described, this mimics well
sysbus_mmio_map().

> +  'features': ['unstable'],
> +  'allow-preconfig' : true }
> diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
> index 05c1da3d31..df1f1f43a5 100644
> --- a/hw/core/sysbus.c
> +++ b/hw/core/sysbus.c
> @@ -23,6 +23,7 @@
>   #include "hw/sysbus.h"
>   #include "monitor/monitor.h"
>   #include "exec/address-spaces.h"
> +#include "qapi/qapi-commands-qdev.h"
>   
>   static void sysbus_dev_print(Monitor *mon, DeviceState *dev, int indent);
>   static char *sysbus_get_fw_dev_path(DeviceState *dev);
> @@ -154,6 +155,54 @@ static void sysbus_mmio_map_common(SysBusDevice *dev, int n, hwaddr addr,
>       }
>   }
>   
> +void qmp_sysbus_mmio_map(const char *device,
> +                         bool has_mmio, uint8_t mmio,
> +                         uint64_t addr,
> +                         bool has_priority, int32_t priority,
> +                         Error **errp)
> +{
> +    Object *obj = object_resolve_path_type(device, TYPE_SYS_BUS_DEVICE, NULL);
> +    SysBusDevice *dev;
> +
> +    if (phase_get() != PHASE_MACHINE_INITIALIZED) {
> +        error_setg(errp, "The command is permitted only when "
> +                         "the machine is in initialized phase");

"command only permitted during the " #PHASE_MACHINE_INITIALIZED "phase"?

> +        return;
> +    }
> +
> +    if (obj == NULL) {
> +        error_setg(errp, "Device '%s' not found", device);
> +        return;
> +    }
> +    dev = SYS_BUS_DEVICE(obj);
> +
> +    if (!has_mmio) {
> +        mmio = 0;
> +    }
> +    if (!has_priority) {
> +        priority = 0;
> +    }
> +
> +    if (mmio >= dev->num_mmio) {
> +        error_setg(errp, "MMIO index '%u' does not exist in '%s'",
> +                   mmio, device);
> +        return;
> +    }
> +
> +    if (dev->mmio[mmio].addr != (hwaddr)-1) {
> +        error_setg(errp, "MMIO index '%u' is already mapped", mmio);
> +        return;
> +    }
> +
> +    if (!memory_region_try_add_subregion(get_system_memory(), addr,
> +                                         dev->mmio[mmio].memory, priority,
> +                                         errp)) {
> +        return;
> +    }
> +
> +    dev->mmio[mmio].addr = addr;
> +}

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

