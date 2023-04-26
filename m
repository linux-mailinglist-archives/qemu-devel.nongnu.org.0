Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD8B6EF4B4
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 14:52:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1precq-0001CL-Gf; Wed, 26 Apr 2023 08:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1preco-0001C8-6W; Wed, 26 Apr 2023 08:51:58 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1precm-0003qW-ON; Wed, 26 Apr 2023 08:51:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9kz83Rmyszinq3i1VUIXg72ps0VIxwis/jUYiPJELwQ=; b=Yd9hQ2NTcdWADwE87neWl6DmBy
 dBsPfITLlD9aFiVoiHr87CXHQA3CWjrDxHuRQhPU7r4Gc1xTHbv+GBJQj1pchgWr3Gw43vaBJDOL2
 bE+7+w8w1cq6qVjpWqr735tIAcq3ve/QL2p1Qh9to6PZ3MxZu/rMklLtCZm4UxbZGGdC1CaD9l7Ao
 ZuHBVF8wb2DlxGLMeTTiC9nxwxB2lZM0paFHTkAR2CJiqgKjEfymiGtliB7JTxaKtIrLQthAW8b30
 Z6H8JX+xMChygkoqh+Qpdclpg+YUQkQmTBQ4ijyz9KQVpITgrsUIZ2o0zno6a/8HMJMWmSqtYFTRb
 OlNcP4VwzXxNzkhiBtbZY0LTULgvkOmsjdYl2q42x28739f5dNLYf7qTsBEHMQdlf5foato3gKWHX
 i8FqCLymmjiOwuuijmXYA6XC0YK1tRaz2p3WHrty8xP5E8mnwVzIGcZ17Ckg2S3nApV8szHAUlPBN
 lYxsfm2VhRfeVD+FIKGGxocQRAm6NusIqU684cWRvasYKC9yi6t5nhwee4iB17qJDLE4+TQP/nKIe
 1toqWoQGtV39joszt9rIEFfdBKlD1I34zuLnNztVZjyfkAsdJ4Fft/zcAKIWmAlq/49ZnHo/xRllZ
 rKH/+RwG8YySS+YmJcJ63e6STpCIxvlTsJEoCbjxI=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1prebf-0002Tx-BV; Wed, 26 Apr 2023 13:50:51 +0100
Message-ID: <7f94c0cc-f5b1-fd5a-fbc0-114620d98dc6@ilande.co.uk>
Date: Wed, 26 Apr 2023 13:51:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, qemu-ppc@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
References: <20230302224058.43315-1-philmd@linaro.org>
 <20230302224058.43315-5-philmd@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230302224058.43315-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 04/18] hw/isa/piix4: Wire PIIX4 IDE ouput IRQs to ISA
 bus IRQs 14/15
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

> piix4_realize() initialized an array of 16 ISA IRQs in
> PIIX4State::isa[], use it to wire the IDE output IRQs.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/isa/piix4.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
> index e0b149f8eb..702b458a3e 100644
> --- a/hw/isa/piix4.c
> +++ b/hw/isa/piix4.c
> @@ -229,6 +229,8 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
>   
>       /* IDE */
>       qdev_prop_set_int32(DEVICE(&s->ide), "addr", dev->devfn + 1);
> +    qdev_connect_gpio_out_named(DEVICE(&s->ide), "ide-irq", 0, s->isa[14]);
> +    qdev_connect_gpio_out_named(DEVICE(&s->ide), "ide-irq", 1, s->isa[15]);
>       if (!qdev_realize(DEVICE(&s->ide), BUS(pci_bus), errp)) {
>           return;
>       }

The wiring approach looks right, although again the qdev_connect_gpio_out*() should 
be after qdev_realize().


ATB,

Mark.

