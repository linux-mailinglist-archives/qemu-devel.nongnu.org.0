Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A453F320D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 19:12:22 +0200 (CEST)
Received: from localhost ([::1]:37780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH845-00037F-H2
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 13:12:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH82g-0002C8-9Z
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 13:10:54 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:41669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH82e-0006yJ-Et
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 13:10:53 -0400
Received: by mail-ej1-x62e.google.com with SMTP id d11so21515475eja.8
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 10:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DMDVoEmeFWFuA1Js3Z5fq5LVnujYqkOmMn4BySb6eNc=;
 b=iedpnS/oJ4hTNdTf8lOx3JAoP0KJjtwYv7lPeJIc4JVGF1U7KBohmxVKelsEbeuDpX
 290mvofdgOPaGigTpBqQEsKni/X9+Xnwaag3A287fadb8mhI3FYUPycXlu7kno/+V2xg
 XXKne6GsRjfbXHuehSq7vX80m4Z6qKQ2LJDFXQVV8AsdgWBHEBQJeohaiX7mhgHBdIKH
 3UloiTNz/rE8+Q+8ZBN6taGc4LAk35YGVEyQjGHoIfqbUWGk5PbJHmiq/hpceoim/mu7
 vzDB1pt9w2zWzsU7vSn9teo3tPNnwMTmwFt0WlxVRSQ9H49NQNsXUf4ceFaYCxjPslDG
 JUyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DMDVoEmeFWFuA1Js3Z5fq5LVnujYqkOmMn4BySb6eNc=;
 b=f0ZjAHcItDcenmDNYlNLryfY3YKYJvg0kSMXUra3YpUe7T3dxtgvObzFOFT9qbOqO3
 3azclwu1F/SXu/xiLEhJjCnZkWjmDmOJDCs5Hu77eAk9nje7GALk/rRLSnSLvvJnKKFX
 tDuEng6rU9RDsohbWYaKrdxS818pUwTLLRaJnj2a0/7wvIm+qh4zUPGsHH0uAquI0htf
 d3i7J/vDq7RjwNoWKJGHYV0GO1YsSbR/Azd+DVyJSRNObQe+5eFHku9sFfPZnIBXmtKv
 NK5dM3bT9EpGWB+WVGp681fHBtKCgDtSF+5k95cI7Uxe9fvcIaWljIrB6P5Cde/nNXIf
 eIJQ==
X-Gm-Message-State: AOAM5337IsjYchL9gUVP1XWj2u2Z6wrFAfosXG+tgMqmP4dLCEvYUHfj
 LnaH9PWMauE/8xlJqC5PRj2AVpC3+fPd2/M3YEryZQ==
X-Google-Smtp-Source: ABdhPJznHOAgXy4XJUNADE/O0/e4etYGWhs8mCc8hBiEQGDX4GL5eoIOIvYvS8TtVw7aJmIlPGs2G0SUCSTMHep5gdU=
X-Received: by 2002:a17:906:e8d:: with SMTP id
 p13mr23039125ejf.85.1629479450386; 
 Fri, 20 Aug 2021 10:10:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210511081350.419428-1-pbonzini@redhat.com>
 <20210511081350.419428-4-pbonzini@redhat.com>
 <CAFEAcA867BUEpCYrXuMTqt55f+18D+ROMuU=h6MzubNrmp=D=g@mail.gmail.com>
 <54fae2d9-db1e-fbd0-e58a-0c2b5ab0f046@redhat.com>
In-Reply-To: <54fae2d9-db1e-fbd0-e58a-0c2b5ab0f046@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Aug 2021 18:10:04 +0100
Message-ID: <CAFEAcA_voL8vzZ+ZXTJa8+F=+smh1pHx=XRhUTYf=4oU8bxD1Q@mail.gmail.com>
Subject: Re: [PULL 03/33] i386: split cpu accelerators from cpu.c,
 using AccelCPUClass
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Connor Kuehl <ckuehl@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 Aug 2021 at 18:02, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 8/20/21 6:55 PM, Peter Maydell wrote:
> > On Tue, 11 May 2021 at 09:22, Paolo Bonzini <pbonzini@redhat.com> wrote=
:
> >>
> >> From: Claudio Fontana <cfontana@suse.de>
> >>
> >> i386 is the first user of AccelCPUClass, allowing to split
> >> cpu.c into:
> >>
> >> cpu.c            cpuid and common x86 cpu functionality
> >> host-cpu.c       host x86 cpu functions and "host" cpu type
> >> kvm/kvm-cpu.c    KVM x86 AccelCPUClass
> >> hvf/hvf-cpu.c    HVF x86 AccelCPUClass
> >> tcg/tcg-cpu.c    TCG x86 AccelCPUClass
> >>
> >> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> >> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >>
> >> [claudio]:
> >> Rebased on commit b8184135 ("target/i386: allow modifying TCG phys-add=
r-bits")
> >>
> >> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> >> Message-Id: <20210322132800.7470-5-cfontana@suse.de>
> >> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> >> ---
> >
> >> diff --git a/MAINTAINERS b/MAINTAINERS
> >> index b692c8fbee..c2723b32cb 100644
> >> --- a/MAINTAINERS
> >> +++ b/MAINTAINERS
> >> @@ -351,7 +351,7 @@ M: Paolo Bonzini <pbonzini@redhat.com>
> >>  M: Richard Henderson <richard.henderson@linaro.org>
> >>  M: Eduardo Habkost <ehabkost@redhat.com>
> >>  S: Maintained
> >> -F: target/i386/
> >> +F: target/i386/tcg/
> >>  F: tests/tcg/i386/
> >>  F: tests/tcg/x86_64/
> >>  F: hw/i386/
> >
> > This change to MAINTAINERS has left all the .c files
> > in target/i386 that are not in one of the tcg, hvf, whpx,
> > kvm, hax, nvmm subdirectories orphaned -- they are no
> > longer covered by any MAINTAINERS section.
> >
> > Where should those files be listed ?
> >
> > (I just discovered this when get_maintainers.pl said it couldn't
> > find a maintainer for a change I made to target/i386/sev.c.)
>
> This patch maybe got lost:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg816326.html

Looks like it, but we should have a general fallback for target/i386
as well...

-- PMM

