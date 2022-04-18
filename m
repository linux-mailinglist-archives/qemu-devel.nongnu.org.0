Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A03A3505E8F
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 21:34:28 +0200 (CEST)
Received: from localhost ([::1]:59292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngX8l-0005Z5-J0
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 15:34:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ngX7q-0004sH-MT
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 15:33:31 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:32913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ngX7p-0006KU-2E
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 15:33:30 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2eba37104a2so150534647b3.0
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 12:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dH0JeCqJdGA12LDu/OM4T4K7om4YFD4Yj6Ht1IhNZO8=;
 b=rvz9VCLRnfK2GJNfH5CKEiro4719opBZxsKoWyAKFm5Q11oYF59ZCVQXpVVDmj/X7Y
 LalhXXY8SGlcJSTAix1WLimqIvOjwJrj8GoSilGK1pUnVYzu00qI9yxlZPfoQ3ttp3Hf
 Yy3SZVBRUWybWtF0LJMmksQWmCSvohZC3U+lDtcunkvtC0oIWPPwNhkiObcGP4lTMgjO
 /OjV0ykO07UsqDNtW7eI1qw+T5yS7EbWHarBy6CAbBKwwrpvNI8UNoXWpMnoY2doikpy
 K82yg8IgTE0x2wQkk3lQPktZdT9W9tjHmsy6KnB1VDiTkaIfEotT7Xce5IndmGR4asxV
 y6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dH0JeCqJdGA12LDu/OM4T4K7om4YFD4Yj6Ht1IhNZO8=;
 b=tvJKb0tlD8FJTu12JQsmYxzglDYpRDhSjIeFtAcRTed6jJ7KfwNkNdELF7v9hM3HzX
 Smf5RFIo+y2QQEXhVElmOccggo4kc3SDvmIbd1JckRoq96IBZcX4a/AxIvCit4zJEfWO
 oCmdl1mYgKhznpVYnz2yKQrUkd4endFvgX7blgi2hLZmdHtYgR5u5fBOHSSgdrVIIbYy
 bjT8VYtPoolKOfi42dNvMOJMTwyJIHCAZP4Z4AdBNPPho/DMWI50HY8734mtYF0eSEPw
 IIOZL+iq93bIyuYBLEHFHhbQdmCEeHv3F5rb9bk6IqERq+0QCA4IItpM80eGnWAZIEjw
 0Vrw==
X-Gm-Message-State: AOAM533dM5s/O6ylqr09jB7Actk76BbttTzfr21dO8DSAr2jDMlRJ/bE
 Yh+ILGXi7Tbpa/hpu1fTH8PyXIwGaHehElqHD8SQlg==
X-Google-Smtp-Source: ABdhPJxGSMzmMj1lLxK/W7w7Ms1HuUJaJQOW6dJdhtV9zZevZdpLSjJEWuwbDODj7yY2kwQEwN2Dbh6iXRgvJivlLxs=
X-Received: by 2002:a81:13d6:0:b0:2ec:2b3f:28c6 with SMTP id
 205-20020a8113d6000000b002ec2b3f28c6mr11945001ywt.10.1650310406691; Mon, 18
 Apr 2022 12:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220418173904.3746036-1-paul@nowt.org>
 <20220418173904.3746036-3-paul@nowt.org>
In-Reply-To: <20220418173904.3746036-3-paul@nowt.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Apr 2022 20:33:15 +0100
Message-ID: <CAFEAcA_HgZmoKO8u_m7XXjKibBuT9HqeOcc+2R9yQkd9-sAdDw@mail.gmail.com>
Subject: Re: [PATCH 2/4] TCG support for AVX
To: Paul Brook <paul@nowt.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 18 Apr 2022 at 18:48, Paul Brook <paul@nowt.org> wrote:
>
> Add TCG translation of guest AVX/AVX2 instructions
> This comprises:
>
> * VEX encodings of most (all?) "legacy" SSE operations.
>   These typically add an extra source operand, and clear the unused half
>   of the destination register (SSE encodings leave this unchanged)
>   Previously we were incorrectly translating VEX encoded instructions
>   as if they were legacy SSE encodings.
> * 256-bit variants of many instructions. AVX adds floating point
>   operations. AVX2 adds integer operations.
> * A few new instructions (VBROADCAST, VGATHER, VZERO)
>
> Signed-off-by: Paul Brook <paul@nowt.org>
> ---
>  target/i386/cpu.c            |    8 +-
>  target/i386/helper.h         |    2 +
>  target/i386/ops_sse.h        | 2606 ++++++++++++++++++++++++----------
>  target/i386/ops_sse_header.h |  364 +++--
>  target/i386/tcg/fpu_helper.c |    3 +
>  target/i386/tcg/translate.c  | 1902 +++++++++++++++++++------
>  6 files changed, 3597 insertions(+), 1288 deletions(-)

Massively too large for a single patch, I'm afraid. This needs
to be split, probably into at least twenty patches, which each
are a reviewable chunk of code that does one coherent thing.

(Also I think Paolo may have been looking at AVX implementation?)

thanks
-- PMM

