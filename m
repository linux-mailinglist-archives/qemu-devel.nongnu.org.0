Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E70CD50B444
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 11:41:56 +0200 (CEST)
Received: from localhost ([::1]:58646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhpnT-0007gN-Ko
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 05:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhpjp-0005RD-El
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:38:05 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:40599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhpjn-0007GH-LG
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 05:38:04 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id i20so13461954ybj.7
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 02:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nyE3jf8rMzXIMLK2sOOnK9N+5N9mf9GUJ73VUWf7LDE=;
 b=gioLt8MMnFFepNasfCP//lif8qaKRh45kCjER4D4j6K7tR+43og5oDgwPnJHUQ0naU
 VCkgSCEF7j407KYCJybe3hh6OFIloAFhWeKpq6TNrJtSV6FJoeqqG+x/ZecCxXMFCbmb
 4ql71UWpPpJWWUcW4co7W7U+5NfPNMGy0Ge5Fa6XzcSPQiNzQw5lsdsjnjYFZRSk0Nll
 1GL3uSW7ytL9vrrwLJ1LIaHEjsTkhY+2MZDTp9Wc1R9+A75pGj03/v+82Q6rExn9601X
 Xma23teMMU3h7m7LzQ8m4CTezfqbkEA7zZOsSe7HnOhKvOewTXq3lLPIgphNwc4iBVt9
 X3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nyE3jf8rMzXIMLK2sOOnK9N+5N9mf9GUJ73VUWf7LDE=;
 b=EWI+mtcc0fHUnfroVcS0Yaa7QopjbzGijxZb3AllstSScolIR6DBdZQP1b0c6HBprz
 qNPwYLw2CB278oqruXZGgq/JN5ZZCoM5zo6myNG3o9USk8qQ/Aui1NvBGpgAUZuFwaRu
 TY3UlPH0bd2gVsUd0xadG3pF8mJyigvG0tMYGbPCNfUDrLbzP4c66EbrfVVPKKkxLpsG
 ap/A2oyd+zn5v0w+shXkxZyp3BbuNi46p8ZEiBNk9gZuOaQUXlh146XWNRzmiWH9Ubzk
 XKpu304fBkgRUr19rLWVTD9HiYZRW0BH2xSUXAb8C4LGAFZSxwvKzGo+kAGGmA5uJ+Wr
 Dz6Q==
X-Gm-Message-State: AOAM533/hyYrmO+NRZLgvF+PECnaIDTH3dmhghH/GRKTnyTQZXPC429v
 lxD0GueZb3GOWL4klDuA72T84OOYXO/s2N1OEKDPLw==
X-Google-Smtp-Source: ABdhPJzOIH71Ew6Km4Vrtd2vkRs5LwFjFBUVe/biAe8alra1yiTmsqpYK42Rv0p3dA5nhPb9QFYTeEXZRsrxECYQRyA=
X-Received: by 2002:a25:a287:0:b0:645:3c4f:7dec with SMTP id
 c7-20020a25a287000000b006453c4f7decmr3522219ybi.479.1650620282591; Fri, 22
 Apr 2022 02:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-27-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-27-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 10:37:51 +0100
Message-ID: <CAFEAcA98sjUhUccvEAjAWeK+Z7-HER9LDz6LMSFMNuVnBSPW=Q@mail.gmail.com>
Subject: Re: [PATCH v3 26/60] target/arm: Replace sentinels with ARRAY_SIZE in
 cpregs.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 17 Apr 2022 at 19:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove a possible source of error by removing REGINFO_SENTINEL
> and using ARRAY_SIZE (convinently hidden inside a macro) to
> find the end of the set of regs being registered or modified.
>
> The space saved by not having the extra array element reduces
> the executable's .data.rel.ro section by about 9k.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---




> +#define define_arm_cp_regs_with_opaque(CPU, REGS, OPAQUE)               \
> +    do {                                                                \
> +        QEMU_BUILD_BUG_ON(ARRAY_SIZE(REGS) == 0);                       \
> +        if (ARRAY_SIZE(REGS) == 1) {                                    \
> +            define_one_arm_cp_reg_with_opaque(CPU, REGS, OPAQUE);       \
> +        } else {                                                        \
> +            define_arm_cp_regs_with_opaque_len(CPU, REGS, OPAQUE,       \
> +                                               ARRAY_SIZE(REGS));       \
> +        }                                                               \
> +    } while (0)

Do we actually need to special case "array has one element" here,
or is this just efficiency?

Anyway
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

