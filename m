Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4797261DEB6
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 22:41:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orQtF-0007BZ-N0; Sat, 05 Nov 2022 17:39:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1orQtE-0007BN-Ab; Sat, 05 Nov 2022 17:39:44 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1orQtC-0001CG-SP; Sat, 05 Nov 2022 17:39:44 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 r61-20020a17090a43c300b00212f4e9cccdso11198803pjg.5; 
 Sat, 05 Nov 2022 14:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CjdDl5lucWcLPu/wMgkxkVx/ZmCQBY9YCxIiAwMFO6U=;
 b=gF0WaNmvh6IP9iLpNcYS/h2PmNkpmjgVVgDFCH12BB9So3oJHsVf+3+4K+F03+XjjQ
 SLARzYh2grlmZBuTTJgA/Mq5gkadpSP/l+bLxdV0y3MixjLYqMPzoyXzHHPVfbccMnQ2
 cXMdKby3UPv3ZYvjmfOlusCYMdIC4kcOC5VWVHj5SERoVl6wtOS5WkvEC2tW46G3DePJ
 BJ4glhNAotvjHhxp8nDmshgerMavUIWNNFHPekHkvn0rhAOETTOO01ZKT6jdY5f64WPp
 ZDk1PqSliYOMBUo8ee/CodH6GNPja2r/jN5VrfIPiWWXg1LdrsLIdROU8ybNE2mNW9ZU
 h71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CjdDl5lucWcLPu/wMgkxkVx/ZmCQBY9YCxIiAwMFO6U=;
 b=1rhj7dAoZh0Iw8paidB0O7s7XEJJri7w3tHB+Q38ErxzlAmX0ShMV4B7pbIfZ6OcYZ
 82woIYYfCzhnBP5nfZl5rBy9YdmOUjqRf8WAiVhJ1KGb9JqgcVPTuWUXNcBjANreM+sw
 g93BEJzAh4wwNvQy4MFGm7Iiiepr20L0gORiEfyZe7xBtkBQ2X3zp4LAfk7Xp0MDul32
 ku7FBpVAfWUg7/F9nCbYKClDIO4FS+SZUI2NU/FDKvfvsuIEdGfZru8z/qXmULUnvGpB
 Ywk13WSKOWYa1m3WhKzBhjqMu2fTq1Hb229btqHo+ogeCV3gxslhKz5zDH46BpkcIh86
 cUCw==
X-Gm-Message-State: ACrzQf1kR68krKVIy3UK7jeg74EYBa3jY2j+lth+OhyDsxWu9FGO8LCt
 VioskZthCJ0MRPjF0cbwtHBKEWX6It3gIwUnj+Q=
X-Google-Smtp-Source: AMsMyM5kIl+C7qnft9PJohABPsEDzFBaBblJGlj4j3ZfF8++lU11yE/NF+GOjSwDukMViJAtdEANR16R784dYpNtqEo=
X-Received: by 2002:a17:902:7294:b0:187:146c:316f with SMTP id
 d20-20020a170902729400b00187146c316fmr36685696pll.149.1667684380417; Sat, 05
 Nov 2022 14:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <20221105115329.306527-1-mjt@msgid.tls.msk.ru>
In-Reply-To: <20221105115329.306527-1-mjt@msgid.tls.msk.ru>
From: Alistair Francis <alistair23@gmail.com>
Date: Sun, 6 Nov 2022 07:39:12 +1000
Message-ID: <CAKmqyKNgFa98gzNAvEdFH6w4c=Ax5PNmHJctYMTMxDnAUEkkwA@mail.gmail.com>
Subject: Re: [PATCH trivial for 7.2] hw/ssi/sifive_spi.c: spelling: reigster
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>, Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sat, Nov 5, 2022 at 9:54 PM Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> Fixes: 0694dabe9763847f3010b54ab3ec7d367d2f0ff0
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/ssi/sifive_spi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/ssi/sifive_spi.c b/hw/ssi/sifive_spi.c
> index 03540cf5ca..1b4a401ca1 100644
> --- a/hw/ssi/sifive_spi.c
> +++ b/hw/ssi/sifive_spi.c
> @@ -267,7 +267,7 @@ static void sifive_spi_write(void *opaque, hwaddr addr,
>      case R_RXDATA:
>      case R_IP:
>          qemu_log_mask(LOG_GUEST_ERROR,
> -                      "%s: invalid write to read-only reigster 0x%"
> +                      "%s: invalid write to read-only register 0x%"
>                        HWADDR_PRIx " with 0x%x\n", __func__, addr << 2, value);
>          break;
>
> --
> 2.30.2
>
>

