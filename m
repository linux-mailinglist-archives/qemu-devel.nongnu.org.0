Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 947914DA241
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 19:23:09 +0100 (CET)
Received: from localhost ([::1]:43244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUBp6-0007Sn-36
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 14:23:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUBjE-0004Jz-Bb
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 14:17:04 -0400
Received: from [2607:f8b0:4864:20::b2e] (port=40458
 helo=mail-yb1-xb2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUBjC-0001f8-T3
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 14:17:03 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id z8so126836ybh.7
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 11:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+MDqVwAZUOLna5dBQYerfiffKZT3SRb+bLbJTZe9TJs=;
 b=db+mpMWN/M8QIqBPdmzNougrFWaTdpLE6XFUZ1GWSoQRdCxNL0XM1Y9GZLWRfjykv4
 wQrmZJPTn68Sm3JIRikT5ETP9gJ7HFsmaBpn+7lRkKElLEPPwQhXKwdp4WzCjyNpiv2h
 lzhrrjycgRSJ4OvHNG5MWzBWspaSvP09yr7kOPIcrRGCR0qE7Dz6I5HEMuRHC8fMhpru
 y5oiwrDd6kMKA7bOumPPNLjb6Eb28FSJM0x0GvpcwZdn7Mq+H6LZGz1SwPA+O0T05SVe
 /W2R+9ytxufB0AF52m8SYcx2Dw1YfbhSnWDRH1ldl6UDMK5Ycaq3ve1Z60pI/qVIVyV6
 EtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+MDqVwAZUOLna5dBQYerfiffKZT3SRb+bLbJTZe9TJs=;
 b=oGpNYM/2JqUva+o1PCc94PHFi9l5ddER7v7DO45O1iaWcr1AQGGOdMff29+8KeAg82
 rp5fR6BUaorYH+UJjSfWYEq9TTF+SeCRDmWsl9RHv8ourtCWyfuDamGGjz+Foa0WsjmX
 +BGTNvMK3Ikm4r/+qVz2d41PJCUadEuS3HAYjaEBaGq6M5jF9+pK+v2hbNBrAVMaum1y
 y+RU4i2j+dKlCFhbMmE5KoIo0O6GSI4f/EmSsHegdSfx6a4PZ+cfFskCLmQPoNDdfZ6F
 WizBnz63fax7ml/gz/pYcbLOsg+nft4fuY+zw2i3B1LDTmYClSUE1T2dNKKYjRz6XXEo
 Q93g==
X-Gm-Message-State: AOAM533Z8igl96j1++aXcqo6R2C9uEqtmfw2Sh0+WzaBNwYeVy+dbZi/
 poILmENPrSV8W9S4Cj6iXLGectAjubXpbGegXXvuyA==
X-Google-Smtp-Source: ABdhPJw2gjdf4ugmLSak4gdJiP5Q51oh71cUGNm7MtAJqxx5ao8lDjgM2wupDb5OtbXNqEERAVKCXGJnM4NReev2/Ck=
X-Received: by 2002:a25:2d27:0:b0:633:7521:4794 with SMTP id
 t39-20020a252d27000000b0063375214794mr4359836ybt.193.1647368221656; Tue, 15
 Mar 2022 11:17:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220314044305.138794-1-richard.henderson@linaro.org>
 <20220314044305.138794-3-richard.henderson@linaro.org>
In-Reply-To: <20220314044305.138794-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 18:16:50 +0000
Message-ID: <CAFEAcA9H=-5h2hPHDDdu+JVk6C8C+AufPYeL1-KapEArpBBs5A@mail.gmail.com>
Subject: Re: [PATCH 2/3] linux-user/arm: Implement __kernel_cmpxchg with host
 atomics
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Mar 2022 at 04:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The existing implementation using start/end_exclusive
> does not provide atomicity across processes.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/arm/cpu_loop.c | 85 +++++++++++++++++++++++++++------------
>  1 file changed, 60 insertions(+), 25 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

