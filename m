Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BBD21122C
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jul 2020 19:49:34 +0200 (CEST)
Received: from localhost ([::1]:53810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqgrV-0008A9-EQ
	for lists+qemu-devel@lfdr.de; Wed, 01 Jul 2020 13:49:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1jqgqO-00072D-SV
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 13:48:24 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:35621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1jqgqN-0006Bj-7L
 for qemu-devel@nongnu.org; Wed, 01 Jul 2020 13:48:24 -0400
Received: by mail-lf1-x143.google.com with SMTP id t74so14232587lff.2
 for <qemu-devel@nongnu.org>; Wed, 01 Jul 2020 10:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kJlUd0h7bFiZZ+kSimzCjjvLy84Qs7MGqC3R5ahqhKs=;
 b=rgANEDHtoDlOwhCGQBjlkJhJmu3pNK05VaeVc0gGw/EmyXYweHBnM0ztD5ffXYpB8o
 gBJ8YrMfo+VyriPWU/zML4mV+2x/H8WBXqDvHRTLv86Wkk2PC6+mG4kC+imDzFw6o6K1
 OL74dTFQHCDbwQEU3Fx8XvDxjLms/HCv1FQCcqzk+FOoX/HaDNWSCTQYImkypShYT+z3
 71qjW/bazK/EiRIshDXw23rR3E5tWIH64tYLW8yw1oVRsvUoAFjKeYE4N4fkqIZlORBY
 KnRKEczVS771WclJPYMwBbFxSAbuYI5FjSQMnLYEf4XTPsZ4xWOFOxrG0z67n96L1bZ9
 g4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kJlUd0h7bFiZZ+kSimzCjjvLy84Qs7MGqC3R5ahqhKs=;
 b=NhmfFic2wERRUuBc+YBfpDrpG0iMENwxu5AVkECcJ4VLTAEhxJ+S/gT7NI17j8uycB
 MeGqmD5NO3ENqIvvfXekrIuma5mO8FSTwrfeuFtoThwd2x4N/JH+ntnPaDzlcK5bWlkp
 8Brh3C36ScVRn4c+/J5igcCAmXHD/gjcDRm0gA1bGKsv5Tb5Z2SOfWajGTym25kvutvP
 D7/g+OWP2yPDuUqm/UU1t2GizKa778pHKGEw8m4vvc2xLXbQMKKq3ZQuqBhkqqzoF3EN
 uKUBeTKuEGM6V3PNKakAIs6RLx2qA+/ho4CTJRUunfNu39r3UgksBIfw8pivXgYitR7o
 oz9g==
X-Gm-Message-State: AOAM532p5rQON+Z3+smCs7s7dTcCmp9D5DFqS6RiQtqgNC5EeTBEk+yj
 dBC5oj1p+JSX36/Lm5sAaRsD+lktZjqojwA+YPs=
X-Google-Smtp-Source: ABdhPJw5MicEL65kjiTdhPDyZc0pFluZhUBJcP3RTZZR54mU03fcrcFRPZ/HeQsY7BNhmRwoqux5rT7jLQxw5x8wAig=
X-Received: by 2002:a05:6512:d0:: with SMTP id
 c16mr2018673lfp.85.1593625700167; 
 Wed, 01 Jul 2020 10:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <CALTWKrVAW33jJs1Q+51wN07DDUbAqwo=o+WDCpoT=NFB6dNZ6A@mail.gmail.com>
 <878sg5svu5.fsf@linaro.org>
 <CALTWKrVx+e0oRVrvd27WeXAbAAZHVispG27cRPKwVo3HfNYbkQ@mail.gmail.com>
 <87sgebqm1i.fsf@linaro.org>
In-Reply-To: <87sgebqm1i.fsf@linaro.org>
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
Date: Wed, 1 Jul 2020 19:47:43 +0200
Message-ID: <CALTWKrXJZnE8Ag=5b2WozuKtO_gUhevb4Nj7JOX9vp9Z+h7kSw@mail.gmail.com>
Subject: Re: [REPORT] [GSoC - TCG Continuous Benchmarking] [#2] Dissecting
 QEMU Into Three Main Parts
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::143;
 envelope-from=ahmedkhaledkaraman@gmail.com; helo=mail-lf1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?B?THVrw6HFoSBEb2t0b3I=?= <ldoktor@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 1, 2020 at 5:42 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
>
> Ahmed Karaman <ahmedkhaledkaraman@gmail.com> writes:
>
> > On Mon, Jun 29, 2020 at 6:03 PM Alex Benn=C3=A9e <alex.bennee@linaro.or=
g> wrote:
> >>
> >> Assuming your test case is constant execution (i.e. runs the same each
> >> time) you could run in through a plugins build to extract the number o=
f
> >> guest instructions, e.g.:
> >>
> >>   ./aarch64-linux-user/qemu-aarch64 -plugin tests/plugin/libinsn.so -d=
 plugin ./tests/tcg/aarch64-linux-user/sha1
> >>   SHA1=3D15dd99a1991e0b3826fede3deffc1feba42278e6
> >>   insns: 158603512
> >>
> >> --
> >> Alex Benn=C3=A9e
> >
> > Hi Mr. Alex,
> > I've created a plugins build as you've said using "--enable-plugins" op=
tion.
> > I've searched for "libinsn.so" plugin that you've mentioned in your
> > command but it isn't in that path.
>
> make plugins
>
> and you should find them in tests/plugins/
>
> >
> > Are there any other options that I should configure my build with?
> > Thanks in advance.
> >
> > Regards,
> > Ahmed Karaman
>
>
> --
> Alex Benn=C3=A9e

Thanks a lot.

