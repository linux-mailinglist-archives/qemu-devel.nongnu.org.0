Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6205F3599F9
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 11:55:00 +0200 (CEST)
Received: from localhost ([::1]:53688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUnqt-0007L9-G4
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 05:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUnpt-0006ov-9M
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:53:57 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:43660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUnpr-00048s-Gl
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 05:53:57 -0400
Received: by mail-ed1-x530.google.com with SMTP id e7so5806835edu.10
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 02:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RxV8qs/mL9BEswU9raH+M466WwQsxLw5LjXS7KMR0uE=;
 b=lkBXASXFJCUtt2G6vDr80mjMIooYXUBgjqoRMlGNss9B2iy56zigC6Xxi9fNCnY6f8
 I4fKeStDNGbZMcWUKNsmvYdV4BVy+T13dK/Foo0XAO4YHfFInqkCUUF9t8nCD6ngqfw4
 aVojCzUzr59M0l9+QE7EXZeA2lpbl4jYS1D15OlawS/fEFVe8CuMv6lwFFHv+ywttDpf
 zsBjSaf3IDLDNCF47bVBhmwAwb7sxmhEwpVJ8mqoKbFCrxPcjj0NhSIi1/Cj7Pi4YUs7
 GHTp4g7XMZ6YZ62T4U/8oY23xYa3hTeDUcjcxFIgReOwQFngD9Cqse/HgZiwUBiOa1u2
 jLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RxV8qs/mL9BEswU9raH+M466WwQsxLw5LjXS7KMR0uE=;
 b=CrUuqEi6IpnfbCadkL7fyvCE/kiIjhsthk39oyQG2ku6SdnGs24DSbzrOxcaff3ku3
 xN1oIR3EDWShoCtdS61/g3RG27VpjUGGhVNp7/CQYq+xI0sC8jlpCd6Rc3ZHo7m6xXI0
 B0jvegqzbxR1AvpA0JPazmxiKBEJzJZ8t+/+zB+ZnFlCtO7SA3blK9n2t3ksCOKbEFgI
 9OST62+GbB5CKAOIUp2HwBFLNkGMldDoAhpSDdUHC3II7fVEvySd1KUf3hB55DsbWDaP
 zYm4U7N1vA9QW9gnluN012kV5TRkYfG6h4MqPW8qdgp1GEfqms3AOARM81EkigGqqSqN
 OFLg==
X-Gm-Message-State: AOAM53041yhTPyIkZMzawuwUF8gRZLJhufuLLz/rDrihuZnl8c9bicMK
 hsjXxWfMYlirLN4txUCCatPnd+emUt46pRs/MJXGNw==
X-Google-Smtp-Source: ABdhPJwUVwfWVNPxu/TV7VHuI7M93X70OrRLkqAg6qU5zbfZse9UV6Tt/SlJEVKjlCTkqpM6tIY9Gz0sRXbZ22UrYQc=
X-Received: by 2002:aa7:d843:: with SMTP id f3mr11104483eds.52.1617962033914; 
 Fri, 09 Apr 2021 02:53:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <CAFEAcA_9v7i1p59EThNPfuJHxXqwgavupV4otqaZMt9Q5d=SsA@mail.gmail.com>
 <18c76f1b-cba5-8205-b945-bb908d460bf2@linaro.org>
In-Reply-To: <18c76f1b-cba5-8205-b945-bb908d460bf2@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Apr 2021 10:53:12 +0100
Message-ID: <CAFEAcA-RztdFMwVvR2NsH0RF9sSMKk0AJPN7xMox0uoFFwvtpg@mail.gmail.com>
Subject: Re: [PATCH v4 00/12] target/arm mte fixes
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Apr 2021 at 15:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/8/21 5:47 AM, Peter Maydell wrote:
> >> Richard Henderson (12):
> >>    accel/tcg: Preserve PAGE_ANON when changing page permissions
> >>    target/arm: Check PAGE_WRITE_ORG for MTE writeability
> >>    target/arm: Fix mte_checkN
> >>    target/arm: Split out mte_probe_int
> >>    target/arm: Fix unaligned checks for mte_check1, mte_probe1
> >>    test/tcg/aarch64: Add mte-5
> >>    target/arm: Replace MTEDESC ESIZE+TSIZE with SIZEM1
> >>    target/arm: Merge mte_check1, mte_checkN
> >>    target/arm: Rename mte_probe1 to mte_probe
> >>    target/arm: Simplify sve mte checking
> >>    target/arm: Remove log2_esize parameter to gen_mte_checkN
> >>    exec: Fix overlap of PAGE_ANON and PAGE_TARGET_1
> >
> > So, what should we do with this series for 6.0 ? We'll be at rc3
> > next week, and this big a change seems risky at this point
> > in the cycle. Is there anything in here that's worth extracting
> > as a for-6.0 change? (maybe patches 1, 2, 12?)
>
> Definitely 12, since that broke BTI.
>
> Patches 1 and 2 are certainly simple enough.
>
> Otherwise... the rest would be nice to have.  It's quite isolated to mte=on.
> If you defer, I guess that's fine too -- the bug report did come in quite late.

OK, I'm going to take 1, 2 and 12 into target-arm.next for 6.0, and we'll
defer the rest. AIUI the bug fixed by the remaining patches is basically
"we didn't do some tag checks we should have done in a corner case of
misaligned accesses that span two differently tagged regions", and I think
that's not a terrible bug to leave in 6.0, compared to the risk of breaking
MTE more seriously while fixing it.

thanks
-- PMM

