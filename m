Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 480B36EF588
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 15:30:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prfDP-0001V4-1e; Wed, 26 Apr 2023 09:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prfDH-0001Up-Ko; Wed, 26 Apr 2023 09:29:39 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prfDF-0004TW-QP; Wed, 26 Apr 2023 09:29:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d7YfCOMWc7e17oROX5V7BRxXXtGm8S56NcB4GAmyURs=; b=DvVjkbv0SviAIra57vDcRT/VFB
 rNDDJZ5CXoq/sBuXl0OQglkbPbR1HD/chn2yLo0WxY2o9YxcdpVM1LoiLM+C1U1vjcYlh10z0Nk2o
 2+Cvx9q2fIrfyBjYtx4dyqj53g2nBh+qZ2yNUo7gXykFOCCdxEIc4vTIEf/VCVcByrnI59w9ObJlZ
 byxQDqwl+sAvX3+Io8VaoAfRD+vBGZ+fT0F67FPK21HuNp/UpJcDwJakFtO22KbHEJVs3rW8uB5Fv
 MLk8wRfD91iMyfE3q0rGehFPTofbA/cMWehnhXLax6UHnF+Khj9zU/hgDrm3SaiNujSUppk37SG2f
 I8dEbSIDlK5AWwygB3IxZUQCeTRMu+Sm0eVW0shnkHDRBEOKvKJ5T+9QzqMNutk/2UiM8dPzMpRXR
 wFUopELoYnYztprto19auCCvBArKhXddhdunjn3N7tqPtpf8iviH6mA/sEeS1IWMVgo4s9X3Ma/8y
 IX13RSsdSYN7Ms28YtoknTZd0UfjzPVUSU2gsJxrRapHGodUNtKtG1zgb7ETwXd90QxAdvlVz0ZmR
 HbVNi5kcQEkK3bLySOnUKqjwwhZL1CXK+KqoPogcyBhdurrxXxM447OdgFNYDoEapoMacdWj2jmgf
 2L+/GTGX9x7kNif6cwd6X/NIkv0AYhvxwwt9xsBwM=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prfCG-0002nj-5p; Wed, 26 Apr 2023 14:28:40 +0100
Message-ID: <f069afba-3d02-7981-556f-96e911d33da1@ilande.co.uk>
Date: Wed, 26 Apr 2023 14:29:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, qemu-ppc@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20230302224058.43315-1-philmd@linaro.org>
 <20230302224058.43315-16-philmd@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230302224058.43315-16-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 15/18] hw/southbridge/piix: Use
 OBJECT_DECLARE_SIMPLE_TYPE() macro
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

> Manually convert to OBJECT_DECLARE_SIMPLE_TYPE() macro,
> similarly to automatic conversion from commit 8063396bf3
> ("Use OBJECT_DECLARE_SIMPLE_TYPE when possible").
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/southbridge/piix.h | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
> index 0bf48e936d..a58bf13a41 100644
> --- a/include/hw/southbridge/piix.h
> +++ b/include/hw/southbridge/piix.h
> @@ -29,7 +29,7 @@
>   #define PIIX_NUM_PIC_IRQS       16      /* i8259 * 2 */
>   #define PIIX_NUM_PIRQS          4ULL    /* PIRQ[A-D] */
>   
> -struct PIIXState {
> +struct PIIX3State {
>       PCIDevice dev;
>   
>       /*
> @@ -57,14 +57,12 @@ struct PIIXState {
>       /* IO memory region for Reset Control Register (PIIX_RCR_IOPORT) */
>       MemoryRegion rcr_mem;
>   };
> -typedef struct PIIXState PIIX3State;
>   
>   #define TYPE_PIIX3_PCI_DEVICE "pci-piix3"
> -DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
> -                         TYPE_PIIX3_PCI_DEVICE)
> -
>   #define TYPE_PIIX3_DEVICE "PIIX3"
>   #define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
>   #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
>   
> +OBJECT_DECLARE_SIMPLE_TYPE(PIIX3State, PIIX3_PCI_DEVICE)
> +
>   #endif

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

