Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 148B06EF593
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 15:36:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prfJW-0004tv-0o; Wed, 26 Apr 2023 09:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prfJT-0004th-TD; Wed, 26 Apr 2023 09:36:04 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prfJS-0005nv-D9; Wed, 26 Apr 2023 09:36:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KPHRQ+59Ay4XnGKW/gq6oM5ni+pkBWBLlfIN4XlprMI=; b=Xjuv2Mn7YCCTR9XSTwJdLW4DQF
 fitA3OZuj9i148FegjSZiSigPEloLrLHBCPRC9crtAwd/9hRHRXoFR0XIedWnG3pgy+TC3O4J/fqe
 XVmyldC67QHWP6tkK0xD1hGYPpI8DeY1wOgOiyqQ6Isz3sjHlFt7HKQTij5GrqpDwIAkP2aM2j7ta
 +2fgnTlQhLsvt9lx+WPzcljuCp++gR4tfxGRJnVQBByo1YMq4lLQsjcrJEm2kRG29mf7PxSnz4X20
 nk13afKTgMyJilvNO2Mc0P1/hKfVV2tn9UFm+5fyavhP06eRVc6ZUZmh6iJ0QI8d47G3w+W3cG5QR
 wux8DTyreT+DCTZY36lqNzBsFfWhBIm2wfBAVftzFeEc18J8QHVpDZa4oyBAhT0kd27kMp/HFFh+g
 +2Nzsqso1QSg2Hg+yc0E7rWwXaP5Z4o+wsYBO9GxYXkZlDZToKW53yqgGFCkPaSa91uSeLqXLRX2s
 tMs6uBA52LDBcFDJDMRnTsaZw6uSZD40xWkqBTNjOytS6YSq1H013lhXMfz5+e7VywKKga3YwLgSq
 3FDODXpPuysASXBrcv3a04Pi2A3iESqJ+fOecpvj9hp8jYCULH3Lz4Yaa4Sq02hzy7uBzBZ7rkQ4Y
 P9sQPnSCW2xZ2np+CXx9ncuq+/bFEeS3TLtVllMDM=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prfIO-0002rU-67; Wed, 26 Apr 2023 14:35:00 +0100
Message-ID: <b17d899e-6adb-ea45-0c26-3241315587fa@ilande.co.uk>
Date: Wed, 26 Apr 2023 14:35:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20230302224058.43315-1-philmd@linaro.org>
 <20230302224058.43315-19-philmd@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230302224058.43315-19-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 18/18] hw/isa/piix: Unify PIIX-ISA QOM type names using
 qdev aliases
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 02/03/2023 22:40, Philippe Mathieu-Daudé wrote:

> Unify PIIX ISA (PCI function #0) as:
> 
>   pci-piix3 -> piix-isa       (abstract base class)
>   PIIX3     -> piix3-isa      (PIIX3 implementation)
>   PIIX3-xen -> piix3-isa-xen  (PIIX3 implementation with Xen extensions)
>   piix4-isa -> piix4-isa      (PIIX4 implementation)
> 
> Alias previous names in the QDevAlias table.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/southbridge/piix.h | 6 +++---
>   softmmu/qdev-monitor.c        | 3 +++
>   2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
> index 71a82ef266..cce65e8f44 100644
> --- a/include/hw/southbridge/piix.h
> +++ b/include/hw/southbridge/piix.h
> @@ -58,9 +58,9 @@ struct PIIX3State {
>       MemoryRegion rcr_mem;
>   };
>   
> -#define TYPE_PIIX_ISA       "pci-piix3"
> -#define TYPE_PIIX3_ISA      "PIIX3"
> -#define TYPE_PIIX3_ISA_XEN  "PIIX3-xen"
> +#define TYPE_PIIX_ISA       "piix-isa"
> +#define TYPE_PIIX3_ISA      "piix3-isa"
> +#define TYPE_PIIX3_ISA_XEN  "piix3-isa-xen"
>   #define TYPE_PIIX4_ISA      "piix4-isa"
>   
>   OBJECT_DECLARE_SIMPLE_TYPE(PIIX3State, PIIX3_ISA)
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index b8d2c4dadd..820e7f52ad 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -72,6 +72,9 @@ static const QDevAlias qdev_alias_table[] = {
>       { "ES1370", "es1370" }, /* -soundhw name */
>       { "ich9-ahci", "ahci" },
>       { "lsi53c895a", "lsi" },
> +    { "piix-isa", "pci-piix3" },
> +    { "piix3-isa", "PIIX3" },
> +    { "piix3-isa-xen", "PIIX3-xen" },
>       { "virtio-9p-device", "virtio-9p", QEMU_ARCH_VIRTIO_MMIO },
>       { "virtio-9p-ccw", "virtio-9p", QEMU_ARCH_VIRTIO_CCW },
>       { "virtio-9p-pci", "virtio-9p", QEMU_ARCH_VIRTIO_PCI },

Same comment here re: naming: I completely agree that the existing name is confusing, 
however I don't find the replacements that less confusing either :/


ATB,

Mark.

