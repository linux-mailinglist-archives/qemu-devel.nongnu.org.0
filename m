Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BED9EC14C
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Nov 2019 11:35:30 +0100 (CET)
Received: from localhost ([::1]:37456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iQUHA-0002V0-ST
	for lists+qemu-devel@lfdr.de; Fri, 01 Nov 2019 06:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45702)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iQUG0-0001vU-WC
 for qemu-devel@nongnu.org; Fri, 01 Nov 2019 06:34:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iQUFz-0002Hp-Nu
 for qemu-devel@nongnu.org; Fri, 01 Nov 2019 06:34:16 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:43138)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iQUFz-0002Ey-HI
 for qemu-devel@nongnu.org; Fri, 01 Nov 2019 06:34:15 -0400
Received: by mail-oi1-x232.google.com with SMTP id s5so7749024oie.10
 for <qemu-devel@nongnu.org>; Fri, 01 Nov 2019 03:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x33eqc7XdlGR2riuYWE+uF92EPAry1rp7FXaqUJ6N1Q=;
 b=WCePeokNP2RvS1haVOItECA0hSM97QFTZDBPxM/tgdpBGQTE0gmLe5GwbpcKjlkdhI
 HwBwJIVgjvmNHadInqJstVgbw6d1A/l6nM5CufhW9Qe7aiWB29j2xmktH9tzU/d8jmRk
 pQutXHk/owbkzJHQG0zC3GHXMOPgcam2ZmiLssakCjKqTEqXhgddI9u7QbccI+/pmt+L
 Kdql/BoGdjOElZAN0qekdr30QTZpIXUsS5w7XbAQYwSU09lHlkbJfeWypQpJDaUBw6EE
 I2KKEbSVbQw5trD7sndIwpkT/0eosCOrqr2n/yKOcWKtOmFPbispUSmPDFAMEvUT1g3L
 mX0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x33eqc7XdlGR2riuYWE+uF92EPAry1rp7FXaqUJ6N1Q=;
 b=XxEIubF8ntKQWxlev/MFmzpSB1l86D5vfJB4roawHT++BQ6XDjwnx+HwN73zHPVx7Z
 eA+P3bMcme/lRyw6JO/8f4AR0RcAj6g4HE8+L7wvt2UfEChuunzB5c4cidYO2TN0q9q0
 4nZ5ihSk8IVNT2Q532MHndEYprtHtSSUyTIRW4bUo7iDV+SBRjHVNoWjoINeVunGOx00
 7l+V/rfX/3AXDGar0herFlwzYzq85PxfBz8mgfenHk9tbM4tQ7moim7brwaLqlhFV0BD
 iA9JoLqUd6hBQfRoCk6G3nB/HIEF8TW0MRXwgXpysMfqoex90cVmxJTAYJxKt0J5WnwU
 R5gQ==
X-Gm-Message-State: APjAAAXERVHYizCc8kYGqBaiRqeCPy/R5WAfGTuopV/ZceMLJs1TicUQ
 a9LOPbBydO5GWyKMf9MIlTrhAUft5B/Y6giKQNUvpQDgi1o+d3qG
X-Google-Smtp-Source: APXvYqzmYZgN20KmFmTctToMhBHasXj6eSrbx+Y7ts1Y+iIDsCJbeCzKKLHZMzSnbapNWj2pQiW0q4WNBzqz1KfpbsY=
X-Received: by 2002:a05:6808:7d1:: with SMTP id
 f17mr4362889oij.163.1572604454242; 
 Fri, 01 Nov 2019 03:34:14 -0700 (PDT)
MIME-Version: 1.0
References: <20191101085140.5205-1-peter.maydell@linaro.org>
 <CAFEAcA-N-Fh7+NCHGPXuK-H6DUTOwjfCU6rmZGz4k8n+tkKdxw@mail.gmail.com>
 <20191101095438.a6wd2mal4w75irvg@kamzik.brq.redhat.com>
In-Reply-To: <20191101095438.a6wd2mal4w75irvg@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Nov 2019 10:34:02 +0000
Message-ID: <CAFEAcA9_PMjhEgMn3qnr1xsiGU5YkNr1KeCvez6pFm=93EzTpA@mail.gmail.com>
Subject: Re: [PULL 00/11] target-arm queue
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::232
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 1 Nov 2019 at 09:54, Andrew Jones <drjones@redhat.com> wrote:
> Darn it. Sorry about that, but if it's still failing then I think QEMU
> must believe KVM is enabled, i.e. kvm_enabled() in QEMU must be true.
> I can try to confirm that and fix it, but I'll need to set up this
> environment first.

Yeah, it looks like trying to run with KVM in an aarch32 chroot
doesn't work but we don't notice it -- in qemu kvm_init() succeeds
but then we fail when we try to actually create CPUs, so:
$ ./arm-softmmu/qemu-system-arm -M virt -M accel=kvm:tcg
qemu-system-arm: kvm_init_vcpu failed: Invalid argument

we barf rather than falling back to tcg the way we ought to.

Does i386-on-x86_64 KVM handle this case?

thanks
-- PMM

