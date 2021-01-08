Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 636672EFBB7
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 00:34:14 +0100 (CET)
Received: from localhost ([::1]:38764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ky1Gn-00044A-GL
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 18:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ky1FU-0003TT-51
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 18:32:52 -0500
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131]:41562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1ky1FP-0007aR-Gk
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 18:32:51 -0500
Received: by mail-il1-x131.google.com with SMTP id w17so11958948ilj.8
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 15:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=SgRLUYexW8t+HR0jzP3wfgukt6uzafvnapKkoDRD0kU=;
 b=u5oH701eU7h0orowLxWsR8/eQ7VvjyJRxMFmSTnmj1BhAYGJlaqXHFTiiIzTINAORZ
 3B0HODg5VyjlQNKo6kv0ET90puSFiT3MOe/Vsn7kLuMdJ+Z3IHwheKEhHhFEHzB/RxV7
 f0s0y8cqSmP2Cm12CKGMyUT8LfsAyHJfe4jFCDBGQSWDo1/0LSPdNk0KBsCCRSPDacFu
 VbKzit+wY7p5mGQD6Luji0NlgY/czOnVFIpWnwA5fQJ/5bRNmSmZl+mcyEDnDrowU+2C
 0bnFICsuPEdFwDkQdBaytdFhRbEM0ZKVuQ+nGIOxNEK6xqFOdOGFxOIJZ9rECfMGUCZd
 C+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=SgRLUYexW8t+HR0jzP3wfgukt6uzafvnapKkoDRD0kU=;
 b=JQVy67ZXucL+E9BbZwE/w+DjgbDfLOou4CGdqQy//aW6ZzJsG85wEHrcgyVDzfF8jI
 7JD4KMAZ6odxViv/fblFdsv70xdSukOfHkwpgbrf2/IIEYWI+FR3uO70uFDiJ/QMHGRi
 7AwUMzlVOx5kvJzK2Br7Hm+sEdI0Q95M3jRt3MESsYXnEFRLyAYCwG9oCroSoizEa5fb
 NAiw5uRe17o22sgtDmuxCzi6lPRTOUCvMPmrii5d4uUKcKPufZ8365q5RapVje+u4dVy
 SdHgGJ4JwTvRq1wewX/p3bFAny3Gst+oSqtGQ5Z1FL7w5zMiQYOEFPaVtqP20gYQyvo+
 TIeg==
X-Gm-Message-State: AOAM532p9C3RfUjI11iBi3iMdS/snXafpfpqP7o8bqCJkFPtc2O7pe3H
 eBzoXKoQ+zhSsnMrjZpmI4Es69P3K9Gzf4m77K4=
X-Google-Smtp-Source: ABdhPJyoGxZKjJPG6PGarP91t3kGBOVH5sAm3LGkXNqmb5X5bXVn/AX9jkBD/xo/Db4QxI82o2DuBMhdorUg1M7C/gI=
X-Received: by 2002:a92:4c3:: with SMTP id 186mr6206342ile.177.1610148766422; 
 Fri, 08 Jan 2021 15:32:46 -0800 (PST)
MIME-Version: 1.0
References: <20210108224256.2321-1-alex.bennee@linaro.org>
 <20210108224256.2321-18-alex.bennee@linaro.org>
In-Reply-To: <20210108224256.2321-18-alex.bennee@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 8 Jan 2021 15:32:20 -0800
Message-ID: <CAKmqyKOrCWwO5JsbWcsa+SPGKOth-_+kQNj2z8bWDTJsWfAHaA@mail.gmail.com>
Subject: Re: [PATCH v1 17/20] riscv: Add semihosting support for user mode
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::131;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x131.google.com
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
Cc: Keith Packard <keithp@keithp.com>, Kito Cheng <kito.cheng@sifive.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 8, 2021 at 3:05 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> From: Kito Cheng <kito.cheng@sifive.com>
>
> This could made testing more easier and ARM/AArch64 has supported on
> their linux user mode too, so I think it should be reasonable.
>
> Verified GCC testsuite with newlib/semihosting.
>
> Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
> Reviewed-by: Keith Packard <keithp@keithp.com>
> Message-Id: <20210107170717.2098982-7-keithp@keithp.com>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

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
> --
> 2.20.1
>
>

