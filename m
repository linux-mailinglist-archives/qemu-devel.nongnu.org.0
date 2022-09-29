Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2493E5EF06C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 10:28:33 +0200 (CEST)
Received: from localhost ([::1]:52138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odouF-000375-UU
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 04:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1odoDp-0000OF-0C; Thu, 29 Sep 2022 03:44:41 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:38164)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1odoDn-00083s-GV; Thu, 29 Sep 2022 03:44:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KyJ7OxwXMsSGJ0DKfzQpmxWF5Fj1e57nGDjOWd+VZL0=; b=lhred92xau9nAeV/Ptap0ID4ie
 imFFs0zfDj5EIlp+gIuEfCCTOC0KECjebuecvDINC0ITUATmWfT3YDqsXTqyhDxdeJhTDfNGOzQbj
 vs3RxCsV1Eig0NZEbzshXbV1z6/gkIbCr+1s9DeJwXfCx4K3xqam27qyndXPqhvGWg2db7A/Pblba
 kW/hJeG7ZKlW8U7kLIKkLyGErDoUT44xWMzVoAkYAkBFAJ0G5xBxcrvedc0pNCc7XqovFE7pGO7w9
 mZs+EfR2fIY909O54hrZzSvmST4Rec+6Mg8+cnJHWbBCFhk5Uv4xWdTcbg4t49/27OB/4o4wntBg9
 urA00/ghwUUy7jrqXkfkxmmV8cGRY+SiVgLAYBrbSYJ+/7FPKjceW86HKrZkhwI3+1E3lTadeVjCB
 7mPlm+QSZaZCTUA1wuV/n5SOyDOl+Cwndpf/T/BpVlFGQXb+TiV7UO93T8TrWh6znx9p+TdJCZkr/
 7atalQEN8nzl6QKIcCpIYpkWzzuT8u2PBh5z0yBQ8auTCxbcRVFb4jb1CY+C5Ww6IklvTrkdZc64m
 osy57qroGiK2KklKj0Ut4AUMk//xtqO4fpGpKSlro/obJMh7/KK61O/I+/mBxuAmsuApggWyXpfik
 PLsV0m1mwRRFeWkaO0A5BFjTCT3WtB4NPQ69SadN0=;
Received: from [2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1odoC2-000Bhq-Ep; Thu, 29 Sep 2022 08:42:54 +0100
Message-ID: <197f737f-3ae8-6c73-7605-5bd89721dc3e@ilande.co.uk>
Date: Thu, 29 Sep 2022 08:44:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1664108862.git.balaton@eik.bme.hu>
 <2ff9b0ca151cab09512b37d855d03eee4a62812a.1664108862.git.balaton@eik.bme.hu>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <2ff9b0ca151cab09512b37d855d03eee4a62812a.1664108862.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba7:8700:f0a2:2ba9:489e:6915
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 10/13] hw/ppc/mac.h: Move grackle-pcihost declaration
 out from shared header
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

> It is only used by mac_oldworld anyway and it already instantiates
> a few devices by name so this allows reducing the shared header further.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/pci-host/grackle.c | 1 +
>   hw/ppc/mac.h          | 3 ---
>   hw/ppc/mac_oldworld.c | 2 +-
>   3 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/pci-host/grackle.c b/hw/pci-host/grackle.c
> index b05facf463..5282123004 100644
> --- a/hw/pci-host/grackle.c
> +++ b/hw/pci-host/grackle.c
> @@ -34,6 +34,7 @@
>   #include "trace.h"
>   #include "qom/object.h"
>   
> +#define TYPE_GRACKLE_PCI_HOST_BRIDGE "grackle-pcihost"
>   OBJECT_DECLARE_SIMPLE_TYPE(GrackleState, GRACKLE_PCI_HOST_BRIDGE)
>   
>   struct GrackleState {
> diff --git a/hw/ppc/mac.h b/hw/ppc/mac.h
> index 55cb02c990..fe77a6c6db 100644
> --- a/hw/ppc/mac.h
> +++ b/hw/ppc/mac.h
> @@ -35,9 +35,6 @@
>   #define KERNEL_LOAD_ADDR 0x01000000
>   #define KERNEL_GAP       0x00100000
>   
> -/* Grackle PCI */
> -#define TYPE_GRACKLE_PCI_HOST_BRIDGE "grackle-pcihost"
> -
>   /* Mac NVRAM */
>   #define TYPE_MACIO_NVRAM "macio-nvram"
>   OBJECT_DECLARE_SIMPLE_TYPE(MacIONVRAMState, MACIO_NVRAM)
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index 1fa7b770b7..1355d032ff 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -214,7 +214,7 @@ static void ppc_heathrow_init(MachineState *machine)
>       }
>   
>       /* Grackle PCI host bridge */
> -    grackle_dev = qdev_new(TYPE_GRACKLE_PCI_HOST_BRIDGE);
> +    grackle_dev = qdev_new("grackle-pcihost");
>       qdev_prop_set_uint32(grackle_dev, "ofw-addr", 0x80000000);
>       s = SYS_BUS_DEVICE(grackle_dev);
>       sysbus_realize_and_unref(s, &error_fatal);

Why did you include this patch again in v2 when I nacked it in v1?


ATB,

Mark.

