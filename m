Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB884610D73
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 11:39:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooLo6-0001Ds-92; Fri, 28 Oct 2022 05:37:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ooLo3-0001Cb-Qt; Fri, 28 Oct 2022 05:37:39 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ooLo2-0001Dc-5e; Fri, 28 Oct 2022 05:37:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=woMJ1NscYyJJ37jyIMhRf93YSRqxl0zzmz6HHN1F0bs=; b=b7BK8XfHRBMwZ7dwG2WADBhjBP
 C5+tGg0MexHr2JrGmfKiocfH1VKKgtWpPBuhuefcdBrvhYgHd0keTcTJ/UaeJWtS0OXG/2bTI1tsK
 l+u5Ng+GNCYVtQXj58lhdGRovWxSJYTjngExLTHLkfubbCvfq+QVmuhuKy+ZstcYyeHNVAsWjfgk3
 TgrWZoLnh2D8s1HCc9FOFfTIsyvuXmB7TDLrQF+CO6zUdWoFO5eqd5peOZWDJwY17oFz0qSkwlV2V
 qkyta6wppNOCp/2sSArrxD+IpZaW1n7LGKjJQWhekgZvFMMz1jPniH+GdvoRsZcGkmXO3X9NIJbLw
 kCH/ERBqx7Bu7Uequn9XebScWtZVBDXsqDGMOWFrqq48eXwd5W3eKoNpOtkMSXbdnUPrjxqZY58SI
 oGmMMTLV0mKES4QjU+KVwHueLYQ7n0huVy+en6BJWaJVmDvQtmrP+RLvqLJxPslvvCD2RM2sdUoni
 M3NnZq+Vz6HnzPcDrnWTRx7qaGk7caeHLDD2c/m0UcKN/hHxEvzJo8vrdvNgQBSRb6oAxN/UA1wM3
 3yYYFPEdy0Gsmheh+y/P2iWOM7zFvyJu1n8vmyRSSvn7BohLj2S7keuWspXSsfcTVaz3nZkCYHarL
 B0kxsqcg25UPdpP4DBLWvjIVBTUCJFX1jrvbsQivI=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ooLnt-0005fp-4H; Fri, 28 Oct 2022 10:37:33 +0100
Message-ID: <948ef9f2-452f-9c0a-11e1-4dcee3bac3ff@ilande.co.uk>
Date: Fri, 28 Oct 2022 10:37:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1666715145.git.balaton@eik.bme.hu>
 <7114fc8a10d7359f354a7dbee364a520dcf362df.1666715145.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <7114fc8a10d7359f354a7dbee364a520dcf362df.1666715145.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v4 16/19] mac_newworld: Add machine types for different
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 25/10/2022 17:44, BALATON Zoltan wrote:

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

What was the outcome of the discussion re: having separate machines for 32-bit and 
64-bit PPC targets? My understanding is the issue here was deciding what to do, 
rather than actually making the code changes.

Also what was your motivation for choosing the machine names? I see you've used 
powerbook for via=pmu-adb, but I think quite a few people use pmu-adb for older OS X 
server hardware. At the very least some pointers to reference device trees and some 
rationale behind the decision is needed for review.

> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/mac_newworld.c | 94 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 94 insertions(+)
> 
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index bcd6566ead..7321ac925e 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -649,9 +649,103 @@ static const TypeInfo core99_machine_info = {
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

