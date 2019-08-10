Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B784B88793
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Aug 2019 03:59:09 +0200 (CEST)
Received: from localhost ([::1]:34490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hwGey-00047C-Vs
	for lists+qemu-devel@lfdr.de; Fri, 09 Aug 2019 21:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49124)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hwGeE-0003bH-Lo
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 21:58:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hwGeD-0003Tr-KC
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 21:58:22 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:41967)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hwGeD-0003SY-Bv; Fri, 09 Aug 2019 21:58:21 -0400
Received: by mail-lj1-x244.google.com with SMTP id d24so93659090ljg.8;
 Fri, 09 Aug 2019 18:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GUD0JUM/tK32nGQAydZHcxC2FxuNsT0D8pMliw6A5po=;
 b=kATjWfftb2id0pKivWW5f5BJ2OGFhQ5rEKeqp4ll7ccupXrIsvbuQKOLarTXPR7eKS
 VqPEfbIOrQLql1w27SLeG7cxhlF+oqzWgs78+BR2xuHaHu7LgK1Et68SWz14XnOG0amX
 2ISDa4xd8gDu8dRCmDsTi9Sfk0aD9ZtXr2j0nzmSO2sw5IoPTWTppYXAQ7gzeRHl/KZV
 fSuF42lGIGNjOwbvy8HhBsWjqis5E2m6RV+BjBAT/XtYClbwkVIiG90rPXugHsHOimyo
 s2NVlXJVmZNBulBGuxTZzCZUYhtE9tzZT0fP82PfhXaDlA2wWTwyPelj9A7My7ap1U8v
 2ikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GUD0JUM/tK32nGQAydZHcxC2FxuNsT0D8pMliw6A5po=;
 b=DJv04b/rbBiQRHSMg+NxLNRpJzgac372VcT5UoxfMoR75UKj9D58SdKcNOu94+zs7P
 pVbKt0whiqIGhdZYe3OxiWZ9UbNy3v2p1mkQXz4DxCdXg9v+HTCCiiqwh0pfObDuvEln
 dpF6KZwGa7/1keLLYBPPLIatjDNJAzOcMY6IAi49zAaybiOoQ/RC/GvyfC6BbItnYmjr
 puNdg8wktHxGus5bCmgbqOD4mo8SBKy9PB4n5fk8Tux8qpNkrtY7nbh2EN4akbbjbEI0
 DbbmWlA8xcqPN93M6VD3jMNNA67W84CFJct1lulObW4OFiWTjlYd/yw+B8ZIHsjQledW
 kqYg==
X-Gm-Message-State: APjAAAU4HybSyJqQIQZ70ZI0QAjsOj/aUYCpBmWLQ7lNwN5KR25j+/dN
 eiIqobxeTJKFM/y8uhYKeaj1GTm35455y6SWWyU=
X-Google-Smtp-Source: APXvYqw9VSOUxeDaTKN9nNXqeIVOghxQKFX5uz02Epq5DJbOUpzpOAuTPRLA4xaAw5wY7/upgpjpmY93mrB7kVepP70=
X-Received: by 2002:a2e:86cc:: with SMTP id n12mr12791141ljj.146.1565402299897; 
 Fri, 09 Aug 2019 18:58:19 -0700 (PDT)
MIME-Version: 1.0
References: <1565335544-23584-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1565335544-23584-1-git-send-email-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 9 Aug 2019 18:57:53 -0700
Message-ID: <CAKmqyKOyTXgs5uZuukZjAEqQkTtf1U+vD=u9_470+OgsfaQdqQ@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-devel] [PATCH v3] hw: net: cadence_gem: Fix build errors
 in DB_PRINT()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 9, 2019 at 12:26 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> When CADENCE_GEM_ERR_DEBUG is turned on, there are several
> compilation errors in DB_PRINT(). Fix them.
>
> While we are here, update to use appropriate modifiers in
> the same DB_PRINT() call.
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

>
> ---
>
> Changes in v3:
> - use PRIx64 as rx_desc_get_buffer() returns uint64_t
> - use %u for unsigned
> - remove unnecessary cast in DB_PRINT()
>
> Changes in v2:
> - use HWADDR_PRIx instead of TARGET_FMT_plx for consistency
> - use 'z' modifier to print sizeof(..)
>
>  hw/net/cadence_gem.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index d412085..e26ff98 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -983,8 +983,9 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
>              return -1;
>          }
>
> -        DB_PRINT("copy %d bytes to 0x%x\n", MIN(bytes_to_copy, rxbufsize),
> -                rx_desc_get_buffer(s->rx_desc[q]));
> +        DB_PRINT("copy %u bytes to 0x%" PRIx64 "\n",
> +                 MIN(bytes_to_copy, rxbufsize),
> +                 rx_desc_get_buffer(s, s->rx_desc[q]));
>
>          /* Copy packet data to emulated DMA buffer */
>          address_space_write(&s->dma_as, rx_desc_get_buffer(s, s->rx_desc[q]) +
> @@ -1156,9 +1157,9 @@ static void gem_transmit(CadenceGEMState *s)
>
>              if (tx_desc_get_length(desc) > sizeof(tx_packet) -
>                                                 (p - tx_packet)) {
> -                DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x space " \
> -                         "0x%x\n", (unsigned)packet_desc_addr,
> -                         (unsigned)tx_desc_get_length(desc),
> +                DB_PRINT("TX descriptor @ 0x%" HWADDR_PRIx \
> +                         " too large: size 0x%x space 0x%zx\n",
> +                         packet_desc_addr, tx_desc_get_length(desc),
>                           sizeof(tx_packet) - (p - tx_packet));
>                  break;
>              }
> --
> 2.7.4
>
>

