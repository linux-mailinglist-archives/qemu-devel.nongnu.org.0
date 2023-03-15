Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B25E6BAC24
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 10:28:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcNPh-0004Bq-DE; Wed, 15 Mar 2023 05:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pcNPf-0004BI-64; Wed, 15 Mar 2023 05:27:15 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pcNPd-0003P0-HL; Wed, 15 Mar 2023 05:27:14 -0400
Received: by mail-ed1-x536.google.com with SMTP id eh3so16919358edb.11;
 Wed, 15 Mar 2023 02:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678872430;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6u0/9DkaXf61/SVebR0X1ItbjiCuucqpC+3fTLp/bdI=;
 b=Amreh5oV4cBaUERm9GoeMm8vfZQ4ZRgGRxID1SonrlP/pemM45eTP8tzfdCnj0CitW
 L041ZUCKASmd+vEYxKxVKB7PRANc5BuorMJ4CQ2PAgI31Oo2sQDq9awBfv/PqKLTJlw0
 K1XXF4ISup+IBYsvUuJ+nXeF6h453EGHVrT8Ij9U627ZA3Ydcn+EWof6SkGaohj1MKOV
 9r83TIrhElRH5TEItY1so0CauEMM9VF2wAwestg+b4IicQBrt9AyNLU1QiGN6XxixyG7
 AYBv1Cuu9gnfct9YbGve3QQOYQM0RpLBm1pNSAA+wxnT3UxZ3dZqibqCcDDdEC8uG76y
 PmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678872430;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6u0/9DkaXf61/SVebR0X1ItbjiCuucqpC+3fTLp/bdI=;
 b=ND2Z3I854RaU/yxPJ6rvxonPxZFl6M+QwAdefI1LoyxR4IzCXE+brAOZ2emnElR2jx
 MUENF4AZrOACZsylbXcjCkRqTI56NHKmb5WM2P79j/gzxhMYVLXS08d/BJtx+D3LzPCQ
 ZARQJKyXuji/IBKQyCxKWv7/Zq7qIol28QcHfOyHfuEt8fxzUxVA3cLWuYkxLs2kzGU8
 r6zNpJAk6IUomj98XKjmX4/che1s+PYpMEwxU4hn/D+tjhNNqD0AXuCTNecVbmOhSEz0
 bjUluD5EcD7zWMngjLHfQjVJxjT3jd/yFmoc4b5rFKMtLXiCFDcJ9ysSukqRXHCbKI9p
 mFlA==
X-Gm-Message-State: AO0yUKXR93KPP2/oC+j1uKhEKJ4kgaJdp8BeRMqm3nGqy0Xly65z325b
 a/e9DKP3sC4PHdCiLYhRYC4=
X-Google-Smtp-Source: AK7set//WqOSjl5TSqiG+AmOYyimhgwAqtVjc9+zDl/WQMXLyH+QpGqZIX9eRrEW8Vo19vMvIZDFiw==
X-Received: by 2002:a05:6402:7da:b0:4fc:709f:7ab0 with SMTP id
 u26-20020a05640207da00b004fc709f7ab0mr2111178edy.0.1678872430489; 
 Wed, 15 Mar 2023 02:27:10 -0700 (PDT)
Received: from [128.178.122.40] (dhcp-122-dist-b-040.epfl.ch. [128.178.122.40])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a50cd84000000b004fc24b4a283sm1498075edi.40.2023.03.15.02.27.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 02:27:10 -0700 (PDT)
Message-ID: <be144c99-f669-aba9-0c21-4b248fea2025@gmail.com>
Date: Wed, 15 Mar 2023 10:27:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH for-8.0] hw/char/cadence_uart: Fix guards on invalid
 BRGR/BDIV settings
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, cyruscyliu@gmail.com
References: <20230314170804.1196232-1-peter.maydell@linaro.org>
From: Qiang Liu <cyruscyliu@gmail.com>
In-Reply-To: <20230314170804.1196232-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=cyruscyliu@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 3/14/23 6:08 PM, Peter Maydell wrote:
> The cadence UART attempts to avoid allowing the guset to set invalid
> baud rate register values in the uart_write() function.  However it
> does the "mask to the size of the register field" and "check for
> invalid values" in the wrong order, which means that a malicious
> guest can get a bogus value into the register by setting also some
> high bits in the value, and cause QEMU to crash by division-by-zero.
>
> Do the mask before the bounds check instead of afterwards.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1493
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/char/cadence_uart.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> index c069a30842e..807e3985419 100644
> --- a/hw/char/cadence_uart.c
> +++ b/hw/char/cadence_uart.c
> @@ -450,13 +450,15 @@ static MemTxResult uart_write(void *opaque, hwaddr offset,
>           }
>           break;
>       case R_BRGR: /* Baud rate generator */
> +        value &= 0xffff;
>           if (value >= 0x01) {
> -            s->r[offset] = value & 0xFFFF;
> +            s->r[offset] = value;
>           }
>           break;
>       case R_BDIV:    /* Baud rate divider */
> +        value &= 0xff;
>           if (value >= 0x04) {
> -            s->r[offset] = value & 0xFF;
> +            s->r[offset] = value;
>           }
>           break;
>       default:

Tested on my side.

Tested-by: Qiang Liu <cyruscyliu@gmail.com>


