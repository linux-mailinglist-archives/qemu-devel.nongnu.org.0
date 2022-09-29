Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5C25EEF7C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 09:44:37 +0200 (CEST)
Received: from localhost ([::1]:58516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odoDk-0008WK-FS
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 03:44:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1odnyb-0005CG-5o; Thu, 29 Sep 2022 03:28:57 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1odnyZ-00069v-J3; Thu, 29 Sep 2022 03:28:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lzNq9ELXjf3bKf/kJ8+M8cfGR0NOILAXyqBRNlbhc4w=; b=mj6Gwkmwgpx29nhdKPFR9YGsak
 i7J/LS3uKck8rvNPSedg4sM3lyPDFZAnpWirjK9fHMSWcPR003FaO/zB5xfrS5/Fryt5Z2ANqTchA
 RAIdjim1zcEMMq12tDwBS24DcDHX7eTeHpkS1FkrFbAxKi05kJn2ktBgoEHnHNW+sEZItopvAjc+8
 4e4K9r1pY7oT2KIX192gwGjhWEz16fiHMtC50WRmEUhsSFFn7xvgg9S1qEH5RqGGYfKu8Ru3jp2mi
 BH4kh+OVmiUWd8j9jyg2h9hieJl7jImAIkIRzUjmGytgE17dRs3w8IqKMrEYYZvy/iHw30q7ChHz/
 uh1AUNv6FpFNCAfOqswQy/eK8BNBSW9O2cBMjhIR8VDtv49nTBnvgs+j31HCPkdsS+zDeH01y/S7x
 C8cCsA3wnfsqidCcm8kBLQmlzKnrwRJH3TR0atP0yNmnoIh8jFIFEVgp5cnWY3J85HEuZYpeyEnit
 eY+zZchD6I5dPxCKBhvVsf8nQfUJuEWJRIfxMhqVu074Hdu+OMFHdYrl6K3UwKPn5aqz/rvkwaDew
 jBk519PdMfGAjezHtr6qKIwHn1xZiXA+BMBacbh5Y/7SZ2cO7zc1Akd1KjhNGyUtWormkfoI+oCYY
 gzrz+L4Ald9PuOzs1RT/2RPBoTa3roJ0bhVKiJwZc=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1odnwo-000BdP-CG; Thu, 29 Sep 2022 08:27:10 +0100
Message-ID: <7bc0d445-009e-ba7c-d79f-5c67e5b9ddd3@ilande.co.uk>
Date: Thu, 29 Sep 2022 08:28:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1664108862.git.balaton@eik.bme.hu>
 <f6b0aa3528e9bd538c7111cd29e89a0c3623fbe5.1664108862.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <f6b0aa3528e9bd538c7111cd29e89a0c3623fbe5.1664108862.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 05/13] mac_oldworld: Do not open code sysbus_mmio_map()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/09/2022 13:38, BALATON Zoltan wrote:

> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/mac_oldworld.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index cb67e44081..75fbd2a7df 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -218,16 +218,12 @@ static void ppc_heathrow_init(MachineState *machine)
>       qdev_prop_set_uint32(grackle_dev, "ofw-addr", 0x80000000);
>       s = SYS_BUS_DEVICE(grackle_dev);
>       sysbus_realize_and_unref(s, &error_fatal);
> -
>       sysbus_mmio_map(s, 0, GRACKLE_BASE);
>       sysbus_mmio_map(s, 1, GRACKLE_BASE + 0x200000);
>       /* PCI hole */
> -    memory_region_add_subregion(get_system_memory(), 0x80000000ULL,
> -                                sysbus_mmio_get_region(s, 2));
> +    sysbus_mmio_map(s, 2, 0x80000000);
>       /* Register 2 MB of ISA IO space */
> -    memory_region_add_subregion(get_system_memory(), 0xfe000000,
> -                                sysbus_mmio_get_region(s, 3));
> -
> +    sysbus_mmio_map(s, 3, 0xfe000000);
>       pci_bus = PCI_HOST_BRIDGE(grackle_dev)->bus;
>   
>       /* MacIO */

Please drop this patch for now. The code was written on assumption that both sysbus 
and sysbus devices would be going away soon, and there are certainly discussions 
under way about coming up with a migration strategy to allow them to be completely 
removed.


ATB,

Mark.

