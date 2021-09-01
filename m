Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 076703FE27B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 20:43:28 +0200 (CEST)
Received: from localhost ([::1]:57080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLVCo-0002oQ-LI
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 14:43:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLVBe-00028P-1Y
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 14:42:14 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLVBc-0004vm-5O
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 14:42:13 -0400
Received: by mail-wr1-x434.google.com with SMTP id b6so1009369wrh.10
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 11:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4wD9EobuVUlFY29E7gK64WUYMqlXYtaM0R4nxccL7IA=;
 b=fp/bHM/j5OW6U3/Su6o2AhQn8BN4OCCUpIHttzdqnNfBinpT6K6TsPHyFJ7MAi7u52
 KoOkNnCPAnjzOYBeqZkErme3viVgQWsnjB0ZgPAi34PxdS18+b4CYQJ415zUlBuqC+Pt
 CPLrkyH3minDOX46I+clZlP4N+9zWrzV0vXRgUGO21dXvl8+Owd8/dgReS4SlvrYz1QL
 H1R3+0HPz9qKLOfdADJ0bQbY8ecVMKz+am4/+UPH6hdwx+WN2pDaGKFRNwYcz3M9gHEE
 G5AENKsIvS7TTnQBF3K77bp8GFKFO9JWGbUA3Hu5l3hEreSqQtG2DKPlyE37U0lEmfKI
 hMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4wD9EobuVUlFY29E7gK64WUYMqlXYtaM0R4nxccL7IA=;
 b=RUN/O30LRaEhiWGw+uODTxu1rDjzUdEnyTlV4Mez27EQZrw3QJDeWyj3MvSJnX2UQN
 XNPCSvosA0D9Va3b9f0EuB53/2RBJWxpMOhK5OI6/aXDwtHjfaVTlnBqOkqAGMpvwsj+
 ojcNSiI3ciJpyy4VNxIE2vPPTDzi4HSROsFq5nTb25GCe/OGiiyRXbrw4uqRJ4HrMKfK
 R4T2lzWBM6BzmRGrtv+5cfZfe5qBe0eMEzXcv9eDR5hRNZ63K5LMM5rPg3PJJ7+I3Atx
 6phutA8TSneNp37UHYM4fRZseDd0xWb/qz9X+BRhiVOu2OtqcX9thq0Gq0QDsOcABz9c
 eqrQ==
X-Gm-Message-State: AOAM530N5gJEsjr5kOvZMXVSl7MjNXbUiXEDBd21/EIxZwA7H03pLT27
 AFXH4smWMBZNyUhr9omlOym10JVF6G9X0H1YtPEZ5Q==
X-Google-Smtp-Source: ABdhPJyOMfnKs4LpVsmNhwoEjHiYXfNyVjSm4zAChRY81VGMPTn/Vzh6hv0eMudOjOq9gM4dvDe7pMSqc7oh4jJlV5w=
X-Received: by 2002:adf:b748:: with SMTP id n8mr891634wre.133.1630521729547;
 Wed, 01 Sep 2021 11:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210901164446.2722007-1-rjones@redhat.com>
 <20210901164446.2722007-2-rjones@redhat.com>
 <CAFEAcA8WD97HqQRRzB8Z1LVMCmkKZu3_EAQZM1HAMxccQ=PMnA@mail.gmail.com>
 <20210901183009.GG26415@redhat.com>
In-Reply-To: <20210901183009.GG26415@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Sep 2021 19:41:21 +0100
Message-ID: <CAFEAcA-V7kp+HGBkHM_Zjfq28KhRReo74nowbtP4ZuZzVaw+kw@mail.gmail.com>
Subject: Re: [PATCH] tcg/arm: Increase stack alignment for function generation
To: "Richard W.M. Jones" <rjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-stable <qemu-stable@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 1 Sept 2021 at 19:30, Richard W.M. Jones <rjones@redhat.com> wrote:
>
> On Wed, Sep 01, 2021 at 07:18:03PM +0100, Peter Maydell wrote:
> > On Wed, 1 Sept 2021 at 18:01, Richard W.M. Jones <rjones@redhat.com> wrote:
> > >
> > > This avoids the following assertion when the kernel initializes X.509
> > > certificates:
> > >
> > > [    7.315373] Loading compiled-in X.509 certificates
> > > qemu-system-arm: ../tcg/tcg.c:3063: temp_allocate_frame: Assertion `align <= TCG_TARGET_STACK_ALIGN' failed.
> > >
> > > Fixes: commit c1c091948ae
> > > Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1999878
> > > Cc: qemu-stable@nongnu.org
> > > Tested-by: Richard W.M. Jones <rjones@redhat.com>
> > > Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> > > ---
> > >  tcg/arm/tcg-target.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/tcg/arm/tcg-target.h b/tcg/arm/tcg-target.h
> > > index d113b7f8db..09df3b39a1 100644
> > > --- a/tcg/arm/tcg-target.h
> > > +++ b/tcg/arm/tcg-target.h
> > > @@ -115,7 +115,7 @@ extern bool use_neon_instructions;
> > >  #endif
> > >
> > >  /* used for function call generation */
> > > -#define TCG_TARGET_STACK_ALIGN         8
> > > +#define TCG_TARGET_STACK_ALIGN          16
> > >  #define TCG_TARGET_CALL_ALIGN_ARGS     1
> > >  #define TCG_TARGET_CALL_STACK_OFFSET   0
> >
> > The 32-bit Arm procedure call standard only guarantees 8-alignment
> > of SP, not 16-alignment, so I suspect this is not the correct fix.
>
> Wouldn't it be a good idea if asserts in TCG dumped out something
> useful about the guest code?  Because I can only reproduce this bug in
> a very awkward batch environment I need to collect as much information
> from log messages as possible.

Is the failure case short enough to allow -d ... logging to
be taken? That's usually the most useful info, but it's so huge
it's often not feasible.

Anyway, the problem here is that the arm backend now supports
Neon, and it will try to do some operations on 128 bit types,
where at least the loads and stores require 16-alignment. But
nothing is enforcing that we have 16 alignment. (Without the assert
we'd probably blunder on and fault on an unaligned access.)

Rereading the TCG code, maybe your patch here is right. It's
not clear to me whether TCG_TARGET_STACK_ALIGN is intended
to specify "alignment the calling convention requires" (though
that's what the comment above it suggests) or "alignment that
TCG requires". The prologue does seem to actively align to the
specified value, not merely assume-and-preserve that alignment.

-- PMM

