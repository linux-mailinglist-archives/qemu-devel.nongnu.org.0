Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 758D03CABF7
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 21:31:01 +0200 (CEST)
Received: from localhost ([::1]:54080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m474V-0000GB-Ly
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 15:30:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m473J-0007nf-LG
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 15:29:45 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:39826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m473I-0007jt-3s
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 15:29:45 -0400
Received: by mail-ed1-x535.google.com with SMTP id v1so9721600edt.6
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 12:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iOgTNX8o23idiqZD3+PahvcNwv4GJBpkYn5xX1HkZzU=;
 b=jLIvxLVE0b+RxSnedLTx1uDIN+fvM0to5FIpjM8AEBnN/I73/L0F77cOWxF2j42T3R
 /wiTdZdyRPhNJ6h1TZHYX/fs77iUtwribDxL70mTw6fUsslztFpiDZQ5unKCNQ4WvRja
 yb/AYvDd3GRsiZYSYuU8leR8kJL0/aaTp3Eak/6/QMSVWP0ok5Yu4T1s98mBHCEZlqUt
 1q+STdjEh8OWokmqwboq/eU+oRUPuACug5nOYm6s6OcmzQOIsziCLVWJINcHuYKI8hb/
 JnDnCnQcKRCl5ypXZATUQoYgEaTk//kHiRVdlqdubMk0xFuLlJO32euBqr8dGIMBfezf
 lzdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iOgTNX8o23idiqZD3+PahvcNwv4GJBpkYn5xX1HkZzU=;
 b=gsQePbmFBIpx3IsX+0j9BRTYQLV7X382wGs/Ec55vF/04FxuNxUkUc+Zi5StQflohn
 juNGPO9dthndCTqOCbI+zeeJ9dEYJWVaZvdpEEJkKPNhHg7Iv1JNGivCmUGFlx9s+QrX
 U0nyeF7J4jh7RquR5tgyOiAyahvxYi5uS/7RYmyglix4rDG5gQ/1DKFpK9Ss30tHlwBf
 oeDhmhfSyzETdRuFMhi9bMpVufkadW+Xo9P2lcP0OHWlGz/utALETV+mcJzPzbNzNdUR
 r86T1bXrYXkZfdW8K/clQ1vVMFvhKeZ5qS8UGLWBx8QIM7uHTp5Y/WoCIA12B3kTKptQ
 uzTw==
X-Gm-Message-State: AOAM530GYrBXkznNs89NE7SkrOVStQSD11YkQMVh1P7yQldj5RJnrvvF
 dtUIuny5w1vnGnT7MFmMLia8kebidzHi7cxSfqxsDw==
X-Google-Smtp-Source: ABdhPJyetSuZEgbJOHFFjfsdtSJpD4r7SDE/VG+UDmHm4UTsp2Yd16ZL3rVOYCq1dVzI9odDdiuHi/albWXb21OE5hQ=
X-Received: by 2002:a05:6402:1ca4:: with SMTP id
 cz4mr9297241edb.52.1626377382438; 
 Thu, 15 Jul 2021 12:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <1624662174-175828-1-git-send-email-joe.komlodi@xilinx.com>
 <CAFEAcA_vxA12WMi6qdV2_wNiNAKZ4j6-FTKnwfphT7nGznJoYw@mail.gmail.com>
 <12d4c7de-1346-2aee-75f5-4db729b7f1c7@linaro.org>
In-Reply-To: <12d4c7de-1346-2aee-75f5-4db729b7f1c7@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Jul 2021 20:29:02 +0100
Message-ID: <CAFEAcA9kdOm1kLg=SqCg7oK=2mq-Sya9+ydS7L9vx_PuQOCLyw@mail.gmail.com>
Subject: Re: [PATCH 0/1] target/arm: Check NaN mode before silencing NaN
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Joe Komlodi <joe.komlodi@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 28 Jun 2021 at 16:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/28/21 7:54 AM, Peter Maydell wrote:
> > Richard, Alex: what is the assertion trying to achieve ? It doesn't
> > seem entirely obvious to me that because we're in default-NaN mode
> > (which is a property of the *output* of FPU insns) that we should
> > blow up on calling float*_silence_nan() (which is typically an action
> > performed on the *input* of FPU insns).
>
> This was in response to e9e5534ff30.
>
> My assumption in adding the assert is that it was probably a configuration error.  If you
> disagree, I suppose we can revert it, as it's not critical.

I just ran across this again, in a different context. For MVE VMAXNMV
(which uses the "default FPSCR value"), I need to silence input SNaNs
before performing the max/min operation. The logical way to do that is
to call float*_silence_nan(). Except that that barfs on this assertion.

So I think that having run into this assertion() twice now it's
more awkward than helpful and I intend to put a patch deleting it
in the appropriate part of my next MVE series.

(In theory I could work around it by deliberately squashing the
"use the default NaN value flag" in a local copy of the fp_status,
but that seems like unnecessary work.)

thanks
-- PMM

