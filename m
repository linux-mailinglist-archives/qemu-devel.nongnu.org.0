Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 163755F9D40
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 13:03:35 +0200 (CEST)
Received: from localhost ([::1]:39224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohqZJ-0001T8-VL
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 07:03:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohqUq-0005xq-O3
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 06:58:56 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:55133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohqUp-0001l1-3d
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 06:58:56 -0400
Received: by mail-pj1-x1034.google.com with SMTP id 70so9529678pjo.4
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 03:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EBEu6+4XooF2QTBR41U4r5/84nUUuzBQ/3onbfHDkcM=;
 b=st0z7kiAhgIA3VvPAeeLZYhQObWuPwZmi6GOpnwLyfJPw/ZMCrSAoMghQpK6UZn9BV
 KwlFQwM8Yp3JBEzMBsyAWHslTERGdz66nS5kCEk3to0iWH0r1XxUBMzOF9IISyDjtLFV
 0D9PZu/TsX2RhYIg3Xv6U8W5TbDViH6irNA20FSF5Gv2CC94XZZhUxbhEYyAgNNqfg8P
 FcbobNtztoOcOECl/Qdd65zq/Lf3ZVwFO3ngvnO+V95Uw9rj5hJSNHU1TOrJZSCvrjKf
 krkc+lNqWVQ5hdltRQsShFBfLwKF6iPRTf61pIUQvh3fST8iCMzcwgEl8ZEDPezm+xR3
 sREw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EBEu6+4XooF2QTBR41U4r5/84nUUuzBQ/3onbfHDkcM=;
 b=jsMpobXz0k01n285bCWcGnpqYSE3kRQhwAn8yFdT2q+Ggd2U9V4vWopmCZ0ESCK9px
 r7ZXuLEs0NHaxdUHFKC+nqZegXiH6RCmPPjBe7M8o7gKEDg3q0hpw0h4RncyLGj/lqaL
 V2hGqEOqYRv/LFK5GGTh1iuEZA6jfAxR1QxXNTuDahWtuicDLcidMoWetCnEbPAZA4U0
 YBpDFrcyWbFUIT4J5w0pAUxIjY4p4d74LCzaEtjtYEWH6QJ5kMCjDTCjk2Gr73CBcCTW
 mzv8E0wK2Po8tqztHcEOr/SNTmPxY7btZczpHsFH6mBtU8kHplIs9oXDa2E00v0nj9QD
 Akig==
X-Gm-Message-State: ACrzQf0g5KtNxCF+/CDsVeoknChirNjIziK8UHbuptDIBxdveDlnIMip
 +SGqzvktQoGKmIEWmaScvdEuOJALMQpcxyJZujwwAQ==
X-Google-Smtp-Source: AMsMyM77E1Z+pNoeJGrQZJNRhK314qO+3dmtvJcWg36ZTkwNOcwyfu/ccTstvRJDUkAFuine11Y3ltjZt+JM6nbpKmg=
X-Received: by 2002:a17:902:aa8b:b0:178:8f1d:6936 with SMTP id
 d11-20020a170902aa8b00b001788f1d6936mr18616959plr.168.1665399533635; Mon, 10
 Oct 2022 03:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220929232339.372813-1-Jason@zx2c4.com>
 <CAFEAcA-Ac-=i_DK5MUtKtTqH7OpyzHAi6u=tHFAFZyvdr1KP8A@mail.gmail.com>
 <CAFEAcA-fOdNeDz9_Hbm7R3_3o2T4Zw8wPrgOtVLK9tUNMciZow@mail.gmail.com>
In-Reply-To: <CAFEAcA-fOdNeDz9_Hbm7R3_3o2T4Zw8wPrgOtVLK9tUNMciZow@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Oct 2022 11:58:42 +0100
Message-ID: <CAFEAcA8+m=8KgYU7FBzV+=jjbcevH_TFCgtG4XS_kdKFCxnpSw@mail.gmail.com>
Subject: Re: [PATCH 1/6] device-tree: add re-randomization helper function
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
 David Gibson <david@gibson.dropbear.id.au>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, 
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 10 Oct 2022 at 11:54, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Thu, 6 Oct 2022 at 14:16, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Fri, 30 Sept 2022 at 00:23, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> > >
> > > When the system reboots, the rng-seed that the FDT has should be
> > > re-randomized, so that the new boot gets a new seed. Several
> > > architectures require this functionality, so export a function for
> > > injecting a new seed into the given FDT.
> > >
> > > Cc: Alistair Francis <alistair.francis@wdc.com>
> > > Cc: David Gibson <david@gibson.dropbear.id.au>
> > > Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> >
> > Hi; I've applied this series to target-arm.next (seems the easiest way
> > to take it into the tree).
>
> Unfortunately it turns out that this breaks the reverse-debugging
> test that is part of 'make check-avocado'.
>
> Running all of 'check-avocado' takes a long time, so here's how
> to run the specific test:
>
>       make -C your-build-tree check-venv   # Only for the first time
>       your-build-tree/tests/venv/bin/avocado run
> your-build-tree/tests/avocado/boot_linux.py

derp, wrong test name, should be

 your-build-tree/tests/venv/bin/avocado run
your-build-tree/tests/avocado/reverse_debugging.py

-- PMM

