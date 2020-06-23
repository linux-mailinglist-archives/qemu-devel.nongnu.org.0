Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C0D204DC9
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 11:21:39 +0200 (CEST)
Received: from localhost ([::1]:56522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnf7a-0004iN-VC
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 05:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jnf5y-0003HG-P7
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 05:19:58 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:41896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jnf5v-0001NC-NV
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 05:19:58 -0400
Received: by mail-ot1-x344.google.com with SMTP id k15so15881194otp.8
 for <qemu-devel@nongnu.org>; Tue, 23 Jun 2020 02:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AEb5s+GUhyRzuTnhQbtbo27oAkxKXoB/Zj5TeJetDe0=;
 b=i+THWZ5UaDbQXuNVseEZyK5cFQklmhA3f50o/rX6QUzrezkeoyn2jyNux1l/zteJWE
 SHRJo5X/tx/gsNra/S7gQJzjsgHir326zb1wyNUuZe5TpVrE8JZf9/RjHhf+LZOa/lCv
 mqtf1qz7p9NEsmB/CNmgQbyYrV+XhL6QWrC0U3RMOkwE/J8MWo5fThOvRlgkm7EdVbqd
 7dDWyT5oNLW+viGp11OzRc/TUOkaT3JvcE4hiN1OiePb/U0XdndnhzedxTdZRKCmVLKM
 ldZZoY9BWee1N11+kLbx2PwcY40G93A5lSBEuP7QYPhLYO90OW6WrjyEG0wJZEErfZj9
 gjjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AEb5s+GUhyRzuTnhQbtbo27oAkxKXoB/Zj5TeJetDe0=;
 b=jCu3ISfH7Er9Y5WCPpayp6V/ZvmpLugWNkaE5QgAyBbH8ssz17JU+Q56FCKB1IrKhc
 +J3rsQvgddZaUX/02vRf4bPeskZAt2+BezHK0pZDZjcNtwbHCwOzwSf3ehOvRyh/CtqE
 9ko78ZTrtq9dZ8w1uRk4HhbIR+8xf0UNtOqGuIvdrPq7N3sOj3ZXeMoRcx67tHfT6VFT
 ou48H+5G74N5eRDryDbFpgCbdiYWzgy8eS6m/OqzOGrhkA30z/uEHATWE4u3J7IM9jvk
 o9r68GAsgNV8ZqWqu/+GSb2xSFKdk5xMLOtdQTeJIJTrhdhTIziXB3wkfAIw+W6cOg/I
 iZJQ==
X-Gm-Message-State: AOAM532swrBe034yoe5GYCPR2OIEyf5uwTrntJmVYxZFrPDeHzmGt46l
 P9oxdsPJWNJoY6nhy72lhFVt0pM6v9HunPRF1jziug==
X-Google-Smtp-Source: ABdhPJw3QSud07RewYsEGl8YDK+8cD3uzas0MwvOEfk2fxtu2UeDM2rcV88JRv8fjUbcja10MxHa/29qrpOmBAB/jfw=
X-Received: by 2002:a9d:5786:: with SMTP id q6mr3344560oth.135.1592903994331; 
 Tue, 23 Jun 2020 02:19:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200623090622.30365-1-philmd@redhat.com>
 <20200623091807.vlqy53ckagcrhoah@kamzik.brq.redhat.com>
In-Reply-To: <20200623091807.vlqy53ckagcrhoah@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Jun 2020 10:19:43 +0100
Message-ID: <CAFEAcA-2-g=ZMMRkxoT-ncxqbdjc5vV1WbFzGXw7R8o7QOb6hQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] target/arm: Fix using pmu=on on KVM
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 kvm-devel <kvm@vger.kernel.org>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Jun 2020 at 10:18, Andrew Jones <drjones@redhat.com> wrote:
>
> On Tue, Jun 23, 2020 at 11:06:20AM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Since v2:
> > - include Drew test fix (addressed Peter review comments)
> > - addressed Drew review comments
> > - collected R-b/A-b
> >
> > Andrew Jones (1):
> >   tests/qtest/arm-cpu-features: Add feature setting tests
> >
> > Philippe Mathieu-Daud=C3=A9 (1):
> >   target/arm: Check supported KVM features globally (not per vCPU)
> >
> >  target/arm/kvm_arm.h           | 21 ++++++++-----------
> >  target/arm/cpu.c               |  2 +-
> >  target/arm/cpu64.c             | 10 ++++-----
> >  target/arm/kvm.c               |  4 ++--
> >  target/arm/kvm64.c             | 14 +++++--------
> >  tests/qtest/arm-cpu-features.c | 38 ++++++++++++++++++++++++++++++----
> >  6 files changed, 56 insertions(+), 33 deletions(-)
> >
> > --
> > 2.21.3
> >
> >
>
> Hi Phil,
>
> Thanks for including the test patch. To avoid breaking bisection, if one
> were to use qtest to bisect something, then the order of patches should
> be reversed. I guess Peter can apply them that way without a repost
> though.

Yeah, I can just flip the order.

thanks
-- PMM

