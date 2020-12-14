Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BF72D9761
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 12:33:23 +0100 (CET)
Received: from localhost ([::1]:45052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kom6U-0005DG-4w
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 06:33:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kom58-0004Pi-PW
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:31:59 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:37055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kom55-0001yv-P9
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 06:31:58 -0500
Received: by mail-wr1-x441.google.com with SMTP id i9so16122238wrc.4
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 03:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=55uNDgTmjQTqFAUux/gfXayylv0Wg8SpovOrEt4m9jQ=;
 b=FLBK9z9bSNvR+14zjeXzvQZyPiMvIIIOdK3g2Nm8JyQojHf2yZZ8+gfmBkQLYHy5Zb
 IthDehjrNqRGuP0/wQCWKiQmxu/02LZGbpF4zykwiajhAyGDyL9b5ghWpR2gBx6KYUWb
 kEmiwoH7JhLT0WnyGkc8F8KUV7yatBPicUiAkwYv/czRLrm7hRLC4AeMYws7kET/AHMJ
 i3owe2dUw2zYrnUhQD2T61N9iwRR10292GfN1TO61xAc2jAR26WlvCCZcasBT69kAoB8
 v+3Z7KbWZ4fDCrmcIodrNYM63dWsVAJj/L9CTbtBDUJ5Pdl9qSU8MwR1zWtUw1sT1Nz2
 mViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=55uNDgTmjQTqFAUux/gfXayylv0Wg8SpovOrEt4m9jQ=;
 b=tZz8QoT19mg2Rjqd530OxVnjTvCpl06u268Q8XRfxS5/N8jwHe058jMeMjZkpo8STL
 Addmrv0THnwvNWB7Ic7vMMWjmkuedOOPBKvqqYPFXuf3zRCYcDLc6LbuBGi/jcH4GHE3
 5O640RQuWfIK8zgOMEJvL0RPLB5xM+vDFyUgV1eUF++bmodLVywwcaNISWNZJ1ydRfSz
 riguutHPg4BShYqiRN3QJZQ2AIHgjAbZSlazvIjLZLtylj/8FnWxEyIFYckWP9bYi5Ww
 dHxHWkXIHYi5NftHbUZ8dsN5WJYcOOtVWnucqKlQ1TD/PNpQEOkeELcw6jfljWmONxR7
 DEsA==
X-Gm-Message-State: AOAM531qM7vKIKhgzB0/JF68X75sFDo7EYAFl4C/WQCDUO512Zy6vu2I
 KmH+H2lJE8Jai4K2SrsxZMCcKg==
X-Google-Smtp-Source: ABdhPJxCDJbf4G6bmPAaE5OwWN6TT2lWdNZ00T3FdqqWX+y7KknqRgMS3tTku9bmHXDzCd1fpQkhrg==
X-Received: by 2002:a5d:4587:: with SMTP id p7mr22263050wrq.178.1607945513810; 
 Mon, 14 Dec 2020 03:31:53 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 125sm31425025wmc.27.2020.12.14.03.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 03:31:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B78771FF7E;
 Mon, 14 Dec 2020 11:31:51 +0000 (GMT)
References: <20201125213617.2496935-1-keithp@keithp.com>
 <20201125213617.2496935-6-keithp@keithp.com>
 <CA+yXCZC038LfuswrAo6W3gHXfGkwPscMEKDQJvutV7xcoC+wPw@mail.gmail.com>
 <87r1nz6iz4.fsf@keithp.com>
 <CA+yXCZA7XhLXDN7ZDk8D90eyXOLCzsrzwUyego1Sn=D9x3BGMQ@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Kito Cheng <kito.cheng@gmail.com>
Subject: Re: [PATCH 5/8] riscv: Add semihosting support [v13]
Date: Mon, 14 Dec 2020 11:29:35 +0000
In-reply-to: <CA+yXCZA7XhLXDN7ZDk8D90eyXOLCzsrzwUyego1Sn=D9x3BGMQ@mail.gmail.com>
Message-ID: <87zh2gtyhk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x441.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Keith Packard <keithp@keithp.com>,
 qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Kito Cheng <kito.cheng@gmail.com> writes:

> Hi Keith:
>
> Thanks for your reply, but it seems like we need some more modification in
>  linux-user/riscv/cpu_loop.c to enable that, I guess I should post that i=
n mail
> rather than attachment :)
>
> Patch here:
>
> From 2f1eb5825a6dda177d3289106970eab05cb08445 Mon Sep 17 00:00:00 2001
> From: Kito Cheng <kito.cheng@sifive.com>
> Date: Wed, 9 Dec 2020 14:24:51 +0800
> Subject: [PATCH] riscv: Add semihosting support for user mode
>
> This could make testing easier and ARM/AArch64 has support on
> their linux user mode too, so I think it should be reasonable.
>
> Verified GCC testsuite with newlib/semihosting.
>
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>

If the riscv linux-user maintainer is happy with it I'll take it through
semihosting/next. It certainly has a use case in the ARM case.

> ---
>  linux-user/riscv/cpu_loop.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/linux-user/riscv/cpu_loop.c b/linux-user/riscv/cpu_loop.c
> index aa9e437875..9665dabb09 100644
> --- a/linux-user/riscv/cpu_loop.c
> +++ b/linux-user/riscv/cpu_loop.c
> @@ -23,6 +23,7 @@
>  #include "qemu.h"
>  #include "cpu_loop-common.h"
>  #include "elf.h"
> +#include "hw/semihosting/common-semi.h"
>
>  void cpu_loop(CPURISCVState *env)
>  {
> @@ -91,6 +92,10 @@ void cpu_loop(CPURISCVState *env)
>              sigcode =3D TARGET_SEGV_MAPERR;
>              sigaddr =3D env->badaddr;
>              break;
> +        case RISCV_EXCP_SEMIHOST:
> +            env->gpr[xA0] =3D do_common_semihosting(cs);
> +            env->pc +=3D 4;
> +            break;
>          case EXCP_DEBUG:
>          gdbstep:
>              signum =3D TARGET_SIGTRAP;


--=20
Alex Benn=C3=A9e

