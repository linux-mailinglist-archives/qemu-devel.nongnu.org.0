Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 982BE36112F
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 19:37:25 +0200 (CEST)
Received: from localhost ([::1]:60520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX5vg-0004qB-N8
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 13:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lX5tZ-0003eK-9l
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 13:35:14 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:42590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lX5tW-0008AZ-Dg
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 13:35:12 -0400
Received: by mail-ed1-x532.google.com with SMTP id d21so8955360edv.9
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 10:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wtD98WdQcA0AbtawXI5Ih4VPg30HhlDeZrK5SpBi5wI=;
 b=DCu4ylfOUcbULZvcwFw0rquq65UHTkO5mhk2f8/zykIMPVNb0An5ioAGfbhpl7McQS
 jF2RXzz1qbkbHaCkDwS5YOBYQ3aBkBni7jIQabfekpgV5LKPNbPC9NEBST8rGT8v26Ew
 vHjAzRMGFL/JXHgXCeTQE/E1EP5k9+KXE2SGxrkPU0cSrmgYokg8mmqXRxgJYy0nlTf+
 5Q/t+p5L3qV996jMdShxM9rg9UwKmfzvmNtOA0aERBpvYDmDRP3JWYOKWEMWKBEXAfku
 gwQRF9aJIjOD+TnbF5LZ4zsyrbMY8QXAtqJFkUOJV+k8xWQ4Gi+PP6z1/9Vq8+td3gY6
 787Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wtD98WdQcA0AbtawXI5Ih4VPg30HhlDeZrK5SpBi5wI=;
 b=uccfYLErFSKqQ3yhi1u9mBR/sEUNpKWMaskctaodpH6HoOgUvDrUnI7tc45TFN9G6w
 ViPpgaL9t00g40LNgaF3dQIPKyWpc64PXS3DQtXbivKPpIB/+0ibUuUvRj2j8HxHs9aS
 XsxMcqYpXpRtySQuow2QaKKKFd1oHiPxnw4uOizyOfrQvZ+VsBlMMucTgW9rwppQnDFV
 hCHjfZEDBk96YkY6XeIvH/LSGrN2klecAuWwTcP/dejW3NF+kz1hbfsMjTnL7LjRWakW
 uIpDXAkWQ6HaUor5cO9HGOKRkLE099t9tKjj74vUUNp5p+OkBjZjDtPfkwAo3SYT30Ts
 obog==
X-Gm-Message-State: AOAM530v4VTTkCQ0oJ0NxyjE7g35EUNdxp5VuxYQ230fd8Gbll3lqUqP
 bTlp4Q+qazaDsA2fNBMGQmCzf98/nUT8bEIBd/64CH3wecI=
X-Google-Smtp-Source: ABdhPJzVR6r38/amAeYYYd11CbIf3puIsQnsd5nlKtfBTvA/tZuDg09TWdxVdh00TVgBO6Zz/8V7kXN9INHnYF4jp/M=
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr5624027edt.36.1618508108534; 
 Thu, 15 Apr 2021 10:35:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210218094706.23038-1-alex.bennee@linaro.org>
 <20210218094706.23038-19-alex.bennee@linaro.org>
 <CAFEAcA8micdrGgwyS-20mnGkdpJ3mMnq=MEJJFZCh3XGx0uMbg@mail.gmail.com>
 <CAFEAcA9G-WabAM_EdgMzd0Xv6z8xRYjw57DiEqB6Z_Wbj=X1Eg@mail.gmail.com>
 <87blaflit2.fsf@linaro.org>
 <CAFEAcA_Uqvc5zyJs8XHWDGR1B_jUZ9jY5EdgHSmaczuOc02ykg@mail.gmail.com>
 <b989ebfe-1294-5eef-53a2-9599421e0069@amsat.org>
 <6597cb54-44d9-0798-0786-098286001fe0@kaod.org>
In-Reply-To: <6597cb54-44d9-0798-0786-098286001fe0@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Apr 2021 18:34:21 +0100
Message-ID: <CAFEAcA-x-eNaH=JROoSgF-ruWJDC2++qLNxz3ZEtziyUO-3aEQ@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [PULL 18/23] accel/tcg: re-factor non-RAM
 execution code
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 15 Apr 2021 at 18:18, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 4/15/21 5:55 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 4/15/21 4:54 PM, Peter Maydell wrote:
> >> On Thu, 15 Apr 2021 at 15:32, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
> >>> --8<---------------cut here---------------start------------->8---
> >>> accel/tcg: avoid re-translating one-shot instructions
> >>>
> >>> By definition a single instruction is capable of being an IO
> >>> instruction. This avoids a problem of triggering a cpu_io_recompile o=
n
> >>> a non-cached translation which would only do exactly this anyway.
> >>>
> >>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >>>
> >>> 1 file changed, 1 insertion(+), 1 deletion(-)
> >>> accel/tcg/translate-all.c | 2 +-
> >>>
> >>> modified   accel/tcg/translate-all.c
> >>> @@ -1863,7 +1863,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
> >>>
> >>>      if (phys_pc =3D=3D -1) {
> >>>          /* Generate a one-shot TB with 1 insn in it */
> >>> -        cflags =3D (cflags & ~CF_COUNT_MASK) | 1;
> >>> +        cflags =3D (cflags & ~CF_COUNT_MASK) | CF_LAST_IO | 1;
> >>>      }
> >>>
> >>>      max_insns =3D cflags & CF_COUNT_MASK;
> >>> --8<---------------cut here---------------end--------------->8---
> >>
> >> Yes, this fixes the problem. Do we want to put this in for 6.0? My
> >> feeling is that executing from non-RAM is pretty niche, so maybe
> >> if we need an rc4 anyway, but this isn't important enough to cause an
> >> rc4 itself.
> >
> > Isn't it the default for Aspeed machines (with U-Boot)? (Cc'ing C=C3=A9=
dric).
>
> You need to set the 'execute-in-place' machine option to load/execute the
> instructions from the AHB window of CE0. It's not on by default because
> boot can be really slow with some recent u-boot which heavily trash the T=
Bs.
>
> But this seems to work fine with -rc3.

Triggering the bug requires both execute-in-place and -icount -- did
you test with -icount enabled?

thanks
-- PMM

