Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8B738D5D5
	for <lists+qemu-devel@lfdr.de>; Sat, 22 May 2021 14:35:08 +0200 (CEST)
Received: from localhost ([::1]:56812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkQqR-0005Bj-5O
	for lists+qemu-devel@lfdr.de; Sat, 22 May 2021 08:35:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lkQoH-0004Ub-Vg
 for qemu-devel@nongnu.org; Sat, 22 May 2021 08:32:55 -0400
Received: from mail-oo1-f46.google.com ([209.85.161.46]:36636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lkQoF-0008JX-ND
 for qemu-devel@nongnu.org; Sat, 22 May 2021 08:32:52 -0400
Received: by mail-oo1-f46.google.com with SMTP id
 v13-20020a4aa40d0000b02902052145a469so5220815ool.3
 for <qemu-devel@nongnu.org>; Sat, 22 May 2021 05:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lVQuU6qrxZHvFAlD4cTjGvv1lbidpa1icXxpXkWWpaQ=;
 b=N3cpCeimbDx5gXLjVnteoyu7jEqjkw3EjLjLKVsulWqu62DG/4C44bN6rFcVaI/4eq
 YjW5umA9/qRl7BC1shTy8igeSlQbOuRKzHUJawnRyvHsbUon8kpFocXjewxYPT3CKzZz
 m+2zazsVC4Nql1rV2wWtXSSdIzc5bfifBwVy0WoBcGDv9veri+meUvnx1CM2wIsBBPdK
 xUfK+K5uJjatxVs342F+bFxmZ/ptN6ZOovu/g1li+jAW0Sl4HN8d8C+FCfnXAcYlOKYB
 OfJlOTZPWfU7fh1rF3iPTeLJwQcRiSUP8/4jzz8I9TBjDq1AQGmd3hI84ek8nM86bnJQ
 1y7A==
X-Gm-Message-State: AOAM5324giLt8h1H16sRQCv08wRr1xcyG4TUP6Ie80FGX7TiD4WocyJJ
 w/nwqzqr8We9TUjLCIgjJFARi2aNPd01ULeOEqc=
X-Google-Smtp-Source: ABdhPJziZaMUhn0l860DU5DFIVYBzoDTkVCBbhiubbXcHyveqGiXN64q02QK5BKVQxA2pwIysICU7Dxhy6VLlJuPBl0=
X-Received: by 2002:a4a:db42:: with SMTP id 2mr11761481oot.47.1621686769565;
 Sat, 22 May 2021 05:32:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210427191152.260421-1-f4bug@amsat.org>
 <f48f0433-9608-3cc6-8a9a-6eef8c213c7b@linaro.org>
In-Reply-To: <f48f0433-9608-3cc6-8a9a-6eef8c213c7b@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sat, 22 May 2021 14:32:37 +0200
Message-ID: <CAAdtpL7_99Dn62nZBuqHE0apt7ew2LRL191u_s6jv25MuKnt+A@mail.gmail.com>
Subject: Re: [RFC PATCH] target/mips: Allow building without Inter-Thread
 Communication hardware
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.161.46;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oo1-f46.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 28, 2021 at 12:13 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 4/27/21 12:11 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > The Inter-Thread Communication unit (TYPE_MIPS_ITU) is an optional
> > device that is only selected by a few machines. However it goes
> > deep into the translation code, as the MTC0/MTHC0 SAAR helpers
> > call itc_reconfigure().
> >
> > When building with no machine selecting the ITU component (which
> > is implemented in hw/misc/mips_itu.c), we get the following link
> > failure:
> >
> >    /usr/bin/ld: target_mips_cp0_helper.c.o: in function `helper_mtc0_sa=
ar':
> >    target/mips/cp0_helper.c:1118: undefined reference to `itc_reconfigu=
re'
> >    /usr/bin/ld: target_mips_cp0_helper.c.o: in function `helper_mthc0_s=
aar':
> >    target/mips/cp0_helper.c:1135: undefined reference to `itc_reconfigu=
re'
> >
> > Fix by adding a stub, built when the ITU isn't selected.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9<f4bug@amsat.org>
> > ---
> > RFC because too much Meson machinery to my taste.
> > But how to deal with such architectural devices else?
> >
> > To reproduce:
> >
> > $ echo CONFIG_JAZZ=3Dy > default-configs/devices/mips64el-softmmu.mak
> > $ echo CONFIG_SEMIHOSTING=3Dy >> default-configs/devices/mips64el-softm=
mu.mak
> > $ configure --without-default-devices
> > $ ninja qemu-system-mips64el
> > $ ./qemu-system-mips64el -M magnum -S
> > ---
> >   target/mips/cp0_itu-stub.c | 15 +++++++++++++++
> >   target/mips/meson.build    |  3 +++
> >   2 files changed, 18 insertions(+)
> >   create mode 100644 target/mips/cp0_itu-stub.c
>
> Perhaps use __attribute__((weak)) on itc_reconfigure?  Then you don't nee=
d the
> stub at all.  You're already protecting the actual call, so there should =
be no
> change needed there.
>
> We're not using weak so far, but as far as I can tell this is supported b=
y gcc
> on windows as well.

Apparently we are:

$ git grep attribute.*weak
softmmu/memory.c:3286:void __attribute__((weak)) fuzz_dma_read_cb(size_t ad=
dr,
tests/qtest/libqtest-single.h:16:QTestState *global_qtest
__attribute__((common, weak));

I think we should use either stubs or attribute weak, not both.

