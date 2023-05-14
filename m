Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBE6701D4A
	for <lists+qemu-devel@lfdr.de>; Sun, 14 May 2023 14:29:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyAqT-0002MC-2E; Sun, 14 May 2023 08:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pyAqF-0002LW-TJ; Sun, 14 May 2023 08:28:49 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pyAqD-000398-Ui; Sun, 14 May 2023 08:28:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q5S79XUuI1ZIvlasYKnvWNHO5Ub7qvuhOhrOlYK7eBk=; b=fXQKwxXi7rXxJVeqf9454Sqrl5
 WTBIv7lVT4879Nm3N1Ehfx2ZAirOg9jevOQlKZY+xqkZ3cl2kQMSAbwKzDfhug1DPMImoUX4/jz6Y
 wIUAmKw+R1U2thAS3ElhYlOTht4a9ifyspiCA71yaMmE3WajCiGZLh49XTxdHJxgkM82GQQgxsX+z
 H7YmhOlOdhrmACjGu1uJHct9H3BwU+iIZAAmQXtqwDbpjSxioUkHBbE9QX+zeu2SW5fcfO9ftIzIg
 H8Rv0Jlz2POVeVgYh+YbzJG/hnPeAb7WChDAdSz7qnsw6wd6+fZd2kFbvI5kQxHe0pUSJ/xClQWn7
 nUi40bUd4X1jHAXGM+41DNvIULzsXcCuQFmeYmHuqVmtoC2btyiIDyKo4h7nKXl7tKqdIsr5Sdqot
 G08uLcMGFKl0/g3zVgUczujqYSz7GqN50lEkvHixf9tN0fy8yUORb1Nw73Ox5oLrhJ4GHMsiElc3d
 5NzsI3Ji1kD5faTTysNHiUPXMkN8o+fIOL9xOJs88tUylZ0l5D/CRUH5Cp1rytZ5arkCxhZaIPY9U
 ZpWRVUiXwRqxEBoszRrv8SEMjEzPK/hx6RMfRbGPKOJQ6d4JZXNIKbVdtDM3uYUENepo7P6xshKSg
 ZXkf6G77plSAOU9dnpdnfNC+WM75xM2M2rElgPAls=;
Received: from [2a00:23c4:8bac:6900:b726:cf58:4c12:f013]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pyAp7-00039K-GZ; Sun, 14 May 2023 13:27:41 +0100
Message-ID: <dae15445-d03f-1bfa-b32c-91acd5cc8182@ilande.co.uk>
Date: Sun, 14 May 2023 13:28:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20230513100906.46672-1-shentey@gmail.com>
 <20230513100906.46672-3-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230513100906.46672-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bac:6900:b726:cf58:4c12:f013
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 2/4] hw/arm/omap: Remove unused omap_uart_attach()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.93,
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

On 13/05/2023 11:09, Bernhard Beschow wrote:

> The function is unused since commit
> bdad3654d3c55f478e538037d9eccd204e5fc8ee ('hw/arm/nseries: Remove
> invalid/unnecessary n8x0_uart_setup()').
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/arm/omap.h | 1 -
>   hw/char/omap_uart.c   | 9 ---------
>   2 files changed, 10 deletions(-)
> 
> diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
> index c275d9b681..067e9419f7 100644
> --- a/include/hw/arm/omap.h
> +++ b/include/hw/arm/omap.h
> @@ -724,7 +724,6 @@ struct omap_uart_s *omap2_uart_init(MemoryRegion *sysmem,
>                   qemu_irq txdma, qemu_irq rxdma,
>                   const char *label, Chardev *chr);
>   void omap_uart_reset(struct omap_uart_s *s);
> -void omap_uart_attach(struct omap_uart_s *s, Chardev *chr);
>   
>   struct omap_mpuio_s;
>   qemu_irq *omap_mpuio_in_get(struct omap_mpuio_s *s);
> diff --git a/hw/char/omap_uart.c b/hw/char/omap_uart.c
> index 1c890b9201..6848bddb4e 100644
> --- a/hw/char/omap_uart.c
> +++ b/hw/char/omap_uart.c
> @@ -175,12 +175,3 @@ struct omap_uart_s *omap2_uart_init(MemoryRegion *sysmem,
>   
>       return s;
>   }
> -
> -void omap_uart_attach(struct omap_uart_s *s, Chardev *chr)
> -{
> -    /* TODO: Should reuse or destroy current s->serial */
> -    s->serial = serial_mm_init(get_system_memory(), s->base, 2, s->irq,
> -                               omap_clk_getrate(s->fclk) / 16,
> -                               chr ?: qemu_chr_new("null", "null", NULL),
> -                               DEVICE_NATIVE_ENDIAN);
> -}

A quick grep agrees, so:

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.


