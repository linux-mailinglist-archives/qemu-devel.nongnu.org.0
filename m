Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1799C5EF0A3
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 10:37:16 +0200 (CEST)
Received: from localhost ([::1]:43062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odp2g-0000Lq-Ow
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 04:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1odoEn-0001FD-Cp; Thu, 29 Sep 2022 03:45:41 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1odoEl-0008Q6-50; Thu, 29 Sep 2022 03:45:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s0plKylrRKwoBQgvbEnzYjpBNp0S0OohoY5xAhNxjME=; b=YznhHEfWtu59ZUyQIOn0Rx0pKW
 inLHy1XNlp9LdPL9dsAZ1bWQLSQmu57bzgQn8Nsfnpkd4UIx09O7hMTwjaoBfk10k54vRJwR1k9w1
 Fh1olk53QWzAUfWlPjeFM70qHN41YP0BUsC0WpIH5HD/16g4JKj4UAxvVAvg3K7eYVQiFvi0jAb/u
 5jj0pCYgUJwtLEUVP3CwgsgNQzyvCtRwSIQgKXfAHZACY78dg2HjDvGco2u8MayWWh/R+IFM16FG7
 AdWiBl75bQVFo7GZTSOxAMvb4yo/8J4GPEcVdYHzl5BQuqAE6QjvV6+dQ5VNLJ5xMXp7lr+cZryHl
 VwDBeARmyjQEPsrDAIR2GvaBVbU2LYQbFmNyxC+jdGdQ/0bUEtwN6jSfCmFi7BDT0twZbao8r4Ccx
 Hu2GUdLHxCG3qR6OMGV4+bQoNB7957xGyHv19pjZzWzb1leBHSoWkpKfiO57gWUjv2EN0JUlMJkRr
 LmD6iZHWqAFOoiyGSjIpXgIEy35aiRMYH4xnYmtEM1ijCvvM8XBAYQw7YlnV0Rv5+Nwuo+9k1ir7y
 cGSdGwzmOlC5fEiaAi0+OAMLBGV0inD55/oA4B56fUrmrFWtV9yGzP3UoH/C7Ix+wgK3TqDCvQOSc
 cWfWbViXkvgpzYPJQ8IYvCy5W3SZqTYl1p5VfOKdg=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1odoD0-000BiY-EL; Thu, 29 Sep 2022 08:43:54 +0100
Message-ID: <5ef0c7a2-6529-a0b2-98bc-8e16ae0297df@ilande.co.uk>
Date: Thu, 29 Sep 2022 08:45:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1664108862.git.balaton@eik.bme.hu>
 <ed0551ed1d861c50706e27b39f24fd4699429c7e.1664108862.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <ed0551ed1d861c50706e27b39f24fd4699429c7e.1664108862.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 13/13] mac_nvram: Use NVRAM_SIZE constant
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

> The NVRAM_SIZE constant was defined but not used. Rename it to
> MACIO_NVRAM_SIZE to match the device model and use it where appropriate.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/misc/macio/macio.c        | 2 +-
>   hw/ppc/mac_newworld.c        | 4 ++--
>   include/hw/nvram/mac_nvram.h | 3 +--
>   3 files changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
> index 93a7c7bbc8..08dbdd7fc0 100644
> --- a/hw/misc/macio/macio.c
> +++ b/hw/misc/macio/macio.c
> @@ -226,7 +226,7 @@ static void macio_oldworld_init(Object *obj)
>   
>       object_initialize_child(OBJECT(s), "nvram", &os->nvram, TYPE_MACIO_NVRAM);
>       dev = DEVICE(&os->nvram);
> -    qdev_prop_set_uint32(dev, "size", 0x2000);
> +    qdev_prop_set_uint32(dev, "size", MACIO_NVRAM_SIZE);
>       qdev_prop_set_uint32(dev, "it_shift", 4);
>   
>       for (i = 0; i < 2; i++) {
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index c0b2173cbd..37fb7845f1 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -445,12 +445,12 @@ static void ppc_core99_init(MachineState *machine)
>           nvram_addr = 0xFFE00000;
>       }
>       dev = qdev_new(TYPE_MACIO_NVRAM);
> -    qdev_prop_set_uint32(dev, "size", 0x2000);
> +    qdev_prop_set_uint32(dev, "size", MACIO_NVRAM_SIZE);
>       qdev_prop_set_uint32(dev, "it_shift", 1);
>       sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
>       sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, nvram_addr);
>       nvr = MACIO_NVRAM(dev);
> -    pmac_format_nvram_partition(nvr, 0x2000);
> +    pmac_format_nvram_partition(nvr, MACIO_NVRAM_SIZE);
>       /* No PCI init: the BIOS will do it */
>   
>       dev = qdev_new(TYPE_FW_CFG_MEM);
> diff --git a/include/hw/nvram/mac_nvram.h b/include/hw/nvram/mac_nvram.h
> index baa9f6a5a6..b780aca470 100644
> --- a/include/hw/nvram/mac_nvram.h
> +++ b/include/hw/nvram/mac_nvram.h
> @@ -29,9 +29,8 @@
>   #include "exec/memory.h"
>   #include "hw/sysbus.h"
>   
> -#define NVRAM_SIZE        0x2000
> +#define MACIO_NVRAM_SIZE 0x2000
>   
> -/* Mac NVRAM */
>   #define TYPE_MACIO_NVRAM "macio-nvram"
>   OBJECT_DECLARE_SIMPLE_TYPE(MacIONVRAMState, MACIO_NVRAM)

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

