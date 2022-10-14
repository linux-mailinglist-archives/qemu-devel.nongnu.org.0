Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0225FEB48
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Oct 2022 11:00:07 +0200 (CEST)
Received: from localhost ([::1]:50492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojGY1-0005KI-K5
	for lists+qemu-devel@lfdr.de; Fri, 14 Oct 2022 05:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ojGVK-0003MF-Oc; Fri, 14 Oct 2022 04:57:18 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:57818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ojGVI-0001wY-58; Fri, 14 Oct 2022 04:57:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vdAcmGTfj5p49NQiubOLe0YRkZXWdXZlLtsCqUUmX9g=; b=SLuWxxZC1i7tXnSzIwVmnkkr+l
 J2BEEbpCfqy9SUKhem9fEDP2EN21GJ43/mjW87rNXdwYWrP/53y4EboHVTfTusOh+dHXfXCFciIqy
 wizHB0LEphL3K+w3n+66rTCYLb76/srOjLTgJfnxef5aM7wFZdX8h17iORjsMxysOLKNDV4qr0ev0
 mdlPsGZ6fQJU5P9r0zxqok67YQdcJYKJsKtGwoyaFgeXu9WWB3aiUzIVc2QUZb11VyjVQ9Uyf/YAH
 dzO+NbiLvRCHOEUGscnvoz0QMSGMIpsuI0eBeYYEYjKpdJAVX8Gu0jh5xBAG65hhvLbv/X5tFIXzP
 EFbnEgmGuuunQGCi+TbaOBUFYYTkD2jq6zxqy7hrW9yqeyx7GexL/s2xphZ3X9YvjHxeFBRzK4ZVp
 dJrfimDdsr5HSRsS25z7+jlysz868tlM94z8wMaxvBAP5/8+s+aks4vgPTFVmm3uzuRLEzY9ShUAg
 8iXzq82pdYiZ5WE3Sft7vgQ9z6bSlQaLudAOoTQTu7+12BjKg1eHJESk19wgVVrfreKQq0lXyBa1A
 wqoHMgKp2egCBqHMBDaZCBFGlHhnnEEWKSMUSUyYVi6RVRfcvd5eCnvU9p6xBzgiSKxPPFLyEdYxI
 urDHaEC7KNJOaCk8j5WkCG/oDKNntE+VsrElfijO8=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ojGTR-0001K2-T6; Fri, 14 Oct 2022 09:55:26 +0100
Message-ID: <1a8cace1-1401-1420-d933-0ab7c7d78bfd@ilande.co.uk>
Date: Fri, 14 Oct 2022 09:57:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1664827008.git.balaton@eik.bme.hu>
 <2514e45b2ac438e40180cdf51e156a9dcf6a4df4.1664827008.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <2514e45b2ac438e40180cdf51e156a9dcf6a4df4.1664827008.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 05/13] mac_{old|new}world: Simplify cmdline_base
 calculation
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.25,
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

On 03/10/2022 21:13, BALATON Zoltan wrote:

> By slight reorganisation we can avoid an else branch and some code
> duplication which makes it easier to follow the code.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/mac_newworld.c | 6 +++---
>   hw/ppc/mac_oldworld.c | 7 +++----
>   2 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 6bc3bd19be..73b01e8c6d 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -194,9 +194,11 @@ static void ppc_core99_init(MachineState *machine)
>                            machine->kernel_filename);
>               exit(1);
>           }
> +        cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size +
> +                                         KERNEL_GAP);
>           /* load initrd */
>           if (machine->initrd_filename) {
> -            initrd_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + KERNEL_GAP);
> +            initrd_base = cmdline_base;
>               initrd_size = load_image_targphys(machine->initrd_filename,
>                                                 initrd_base,
>                                                 machine->ram_size - initrd_base);
> @@ -206,8 +208,6 @@ static void ppc_core99_init(MachineState *machine)
>                   exit(1);
>               }
>               cmdline_base = TARGET_PAGE_ALIGN(initrd_base + initrd_size);
> -        } else {
> -            cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + KERNEL_GAP);
>           }
>           ppc_boot_device = 'm';
>       } else {
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index cb67e44081..b424729a39 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -168,10 +168,11 @@ static void ppc_heathrow_init(MachineState *machine)
>                            machine->kernel_filename);
>               exit(1);
>           }
> +        cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size +
> +                                         KERNEL_GAP);
>           /* load initrd */
>           if (machine->initrd_filename) {
> -            initrd_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size +
> -                                            KERNEL_GAP);
> +            initrd_base = cmdline_base;
>               initrd_size = load_image_targphys(machine->initrd_filename,
>                                                 initrd_base,
>                                                 machine->ram_size - initrd_base);
> @@ -181,8 +182,6 @@ static void ppc_heathrow_init(MachineState *machine)
>                   exit(1);
>               }
>               cmdline_base = TARGET_PAGE_ALIGN(initrd_base + initrd_size);
> -        } else {
> -            cmdline_base = TARGET_PAGE_ALIGN(kernel_base + kernel_size + KERNEL_GAP);
>           }
>           ppc_boot_device = 'm';
>       } else {

Is there any particular reason why you would want to avoid the else branch? I don't 
feel this patch is an improvement since by always setting cmdline_base to a non-zero 
value, as a reviewer I then have to check all other uses of cmdline_base in the file 
to ensure that this doesn't cause any issues.

I much prefer the existing version since setting the values of cmdline_base and 
initrd_base is very clearly scoped within the if statement.


ATB,

Mark.

