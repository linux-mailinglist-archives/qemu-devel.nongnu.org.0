Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E12664F02
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 23:49:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFNPI-00079w-H8; Tue, 10 Jan 2023 17:47:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pFNOX-0006uF-Ct; Tue, 10 Jan 2023 17:47:07 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pFNOV-0003Nb-HW; Tue, 10 Jan 2023 17:47:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PGmo9uYa8vK0zxTJduNaWqy1ldUZXZXgJcZrA67JliM=; b=PKTXR6OnO+ruTmGMzDn4g4FQww
 p1i2G7W7LwCdJOqxmVpsFt17ayqKvmCyd3QtLYNQg/mdyGteevsFTnUxbh/i0bksKll13cxMgi+R4
 Z2oFLMvtzNlnI39/shOLuf66Wt/QAzPpIIbgcXfizocwz9jou/PA6Y+iZz7TgGaWFhDBpgQOC2EQQ
 jiehmDAutwR5Jd/PlXERoQxVDk+opZZyPvReO7FdmBrO6/corwKmY5W97vUsJHbrWuLN6wsyLt3TS
 ZwvTfQ6ehIdXft/TEF230gahtx/nRjcuX+yrTI4FGeSO8RiImRpsW9LWCOnzocuYfBgBAjG+wnpEC
 HoyvCpRu4fiKfCmZgjxP3L3XQzRgoexvOs1bo1BOJkifzmZSiM5xAPfwriJAdY3T1uJKgFyLoWDpP
 bkca2R8uT6IdwWWaZlimVGKC0wUGI1ESs2fnVpG69ncUUCC1eDN17e/nm5joLEMrueyVd/3KjvsSd
 NfsU/etfI5k//xW5oZFh9A12dKCWOe2jUP1xrJm8E+qgZUq5YicM+pfn1Z8XbubKb2l/rgUOzPw8o
 q61sK1fQIR9//uLNb75f1ie1eZGaNWQYthWgAFKNClqgyIGWDZbhaNfJc984KT1nxxhmDaq41Gum0
 Vtq8ous13WcfQ7Hin8Jeci6okHS552tlue4lb8AKA=;
Received: from [2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pFNO3-0008oO-GR; Tue, 10 Jan 2023 22:46:35 +0000
Message-ID: <ece23a2e-33a9-d2e2-14fd-097878acfa1f@ilande.co.uk>
Date: Tue, 10 Jan 2023 22:46:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <b8aa89c354027fc71cdb93b697b139e93ac05e25.1672868854.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <b8aa89c354027fc71cdb93b697b139e93ac05e25.1672868854.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:d400:877:cbd2:6fe8:34fc
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v7 4/7] mac_newworld: Add machine types for different
 mac99 configs
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 04/01/2023 21:59, BALATON Zoltan wrote:

> The mac99 machine emulates different machines depending on machine
> properties or even if it is run as qemu-system-ppc64 or
> qemu-system-ppc. This is very confusing for users and many hours were
> lost trying to explain it or finding out why commands users came up
> with are not working as expected. (E.g. Windows users might think
> qemu-system-ppc64 is just the 64 bit version of qemu-system-ppc and
> then fail to boot a 32 bit OS with -M mac99 trying to follow an
> example that had qemu-system-ppc.) To avoid such confusion, add
> explicit machine types for the different configs which will work the
> same with both qemu-system-ppc and qemu-system-ppc64 and also make the
> command line clearer for new users.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

Some thoughts on this: the first is that not everyone agrees that for qemu-system-X 
that X represents the target. There were previous discussion where some KVM people 
assumed X represented the host, i.e. ppc64 was the binary that ran all PPC guests but 
with hardware acceleration for ppc64 guests on ppc64 hosts. This was a while ago, so 
it may be worth starting a thread on qemu-devel to see what the current consensus is.

Secondly it's not clear to me why you've chosen names like "powermac_3_1" instead of 
"g4agp"? Does powermac_3_1 uniquely identify the G4 AGP Sawtooth model? For QEMU it 
is always best to emulate real machines, and whilst I understand you want to separate 
out the two versions of the mac99 machine, having "powermac_X_Y" seems less clear to me.

Finally can you post links to the device trees that you are using for each of the new 
machine types so that we have a clear reference point for future changes to the QEMU 
Mac machines? Even better include the links in the comments for each machine so that 
the information is easily visible for developers.

> ---
>   hw/ppc/mac_newworld.c | 94 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 94 insertions(+)
> 
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 60c9c27986..3f5d1ec097 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -642,9 +642,103 @@ static const TypeInfo core99_machine_info = {
>       },
>   };
>   
> +static void powermac3_1_machine_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
> +    core99_machine_class_init(oc, data);
> +    mc->desc = "Apple Power Mac G4 AGP (Sawtooth)";
> +    mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("7400_v2.9");
> +}
> +
> +static void powermac3_1_instance_init(Object *obj)
> +{
> +    Core99MachineState *cms = CORE99_MACHINE(obj);
> +
> +    cms->via_config = CORE99_VIA_CONFIG_PMU;
> +    return;
> +}
> +
> +static const TypeInfo powermac3_1_machine_info = {
> +    .name          = MACHINE_TYPE_NAME("powermac3_1"),
> +    .parent        = TYPE_MACHINE,
> +    .class_init    = powermac3_1_machine_class_init,
> +    .instance_init = powermac3_1_instance_init,
> +    .instance_size = sizeof(Core99MachineState),
> +    .interfaces = (InterfaceInfo[]) {
> +        { TYPE_FW_PATH_PROVIDER },
> +        { }
> +    },
> +};
> +
> +static void powerbook3_2_machine_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
> +    core99_machine_class_init(oc, data);
> +    mc->desc = "Apple PowerBook G4 Titanium (Mercury)";
> +    mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("7400_v2.9");
> +}
> +
> +static void powerbook3_2_instance_init(Object *obj)
> +{
> +    Core99MachineState *cms = CORE99_MACHINE(obj);
> +
> +    cms->via_config = CORE99_VIA_CONFIG_PMU_ADB;
> +    return;
> +}
> +
> +static const TypeInfo powerbook3_2_machine_info = {
> +    .name          = MACHINE_TYPE_NAME("powerbook3_2"),
> +    .parent        = TYPE_MACHINE,
> +    .class_init    = powerbook3_2_machine_class_init,
> +    .instance_init = powerbook3_2_instance_init,
> +    .instance_size = sizeof(Core99MachineState),
> +    .interfaces = (InterfaceInfo[]) {
> +        { TYPE_FW_PATH_PROVIDER },
> +        { }
> +    },
> +};
> +
> +#ifdef TARGET_PPC64
> +static void powermac7_3_machine_class_init(ObjectClass *oc, void *data)
> +{
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
> +    core99_machine_class_init(oc, data);
> +    mc->desc = "Apple Power Mac G5 (Niagara)";
> +    mc->default_cpu_type = POWERPC_CPU_TYPE_NAME("970fx_v3.1");
> +}
> +
> +static void powermac7_3_instance_init(Object *obj)
> +{
> +    Core99MachineState *cms = CORE99_MACHINE(obj);
> +
> +    cms->via_config = CORE99_VIA_CONFIG_PMU;
> +    return;
> +}
> +
> +static const TypeInfo powermac7_3_machine_info = {
> +    .name          = MACHINE_TYPE_NAME("powermac7_3"),
> +    .parent        = TYPE_MACHINE,
> +    .class_init    = powermac7_3_machine_class_init,
> +    .instance_init = powermac7_3_instance_init,
> +    .instance_size = sizeof(Core99MachineState),
> +    .interfaces = (InterfaceInfo[]) {
> +        { TYPE_FW_PATH_PROVIDER },
> +        { }
> +    },
> +};
> +#endif
> +
>   static void mac_machine_register_types(void)
>   {
>       type_register_static(&core99_machine_info);
> +    type_register_static(&powermac3_1_machine_info);
> +    type_register_static(&powerbook3_2_machine_info);
> +#ifdef TARGET_PPC64
> +    type_register_static(&powermac7_3_machine_info);
> +#endif
>   }
>   
>   type_init(mac_machine_register_types)


ATB,

Mark.

