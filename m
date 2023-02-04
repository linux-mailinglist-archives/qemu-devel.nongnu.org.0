Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2050368AAD1
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 16:06:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOK6j-0000K7-QC; Sat, 04 Feb 2023 10:05:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pOK6h-0000Gc-Og
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 10:05:35 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pOK6f-0005vN-W9
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 10:05:35 -0500
Received: by mail-pj1-x102b.google.com with SMTP id d2so4032109pjd.5
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 07:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=76DNRTjLhsE3p7nnzjMQtgUW12HTRpj69nbID7cdQWA=;
 b=OBgoZ9BM3zvGxKfUPw8EKvyX2UuDoP6TgdfwqMlUlfyMRFYsRBzsiPBvTfcAyAWTFZ
 N7pAiQckBoZcBqM5l3fGiJ83mDiur9EqydmHziB5V0DPbV2EauXVkTLXXfixVOmnAe5Y
 AQyre8R4+Q46TcDInDoaum3cwHzJfC/SA06gUn+9Te2yIkl6n1uNHo3yCNKHfgSznMzo
 1Qug4zkQkbiXw6kwF/yQE9pC5OiiDWrSOrQUJU5vAOPbtdKVRGMtVrqTz3/F3+/gEUvi
 t5dOsNT2qEJIFvZZM9M8j/ZYGEymKAkzo27+oFRJKXMkTHkKEIChtW2MPHUH+MQSfEqZ
 1JZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=76DNRTjLhsE3p7nnzjMQtgUW12HTRpj69nbID7cdQWA=;
 b=6cagXHPyakiPqAnTZNcCh8gx7mYPXv4udBWRJzL87uADyS3/n5M1OxYxbAQ3sUQ7pw
 7MezbLrI7ufGCqMlowgeLyN2hbW+Eht3Zm6S1mbNZNAM3N5mYy7xOLMLDwS7649Pu95c
 GtsxeCUkMkbOR/A7q5K679T6q6FG7xeBihrDZx6SPs6C0RKjAYYUYRtdsEJPRjs6V4mn
 DDSHRtqCO+d5HwSVYwy43iBdNPs40dw8ThhK5uWQRvtO4KbgpECX4Mhg2KilstLkYTiz
 /G+YYsewH9I35by3pQS7uPVKHIwj/twx3D6ZuHsYuq/uE1qeV1Z9PpOYfuMutvt56RIB
 gWbQ==
X-Gm-Message-State: AO0yUKW2hG3+IxZBVFo9melE4GJNJxveYUwiURDjFBTCrYcylOVWSq0X
 /DokghEzZORy2HcEvtosejpKRIF7afYAEciJIclatw==
X-Google-Smtp-Source: AK7set+SRgiHdivWDUIKjDFpxboh9MmMtaq3KLGJe9vQh5z8rxtqGY3beWAoQGHjyUEpY2SSRemi5nf9hjfRc+cAtAE=
X-Received: by 2002:a17:902:f552:b0:198:a5da:bf6c with SMTP id
 h18-20020a170902f55200b00198a5dabf6cmr3317167plf.9.1675523132173; Sat, 04 Feb
 2023 07:05:32 -0800 (PST)
MIME-Version: 1.0
References: <20230204112502.2558739-1-mjt@msgid.tls.msk.ru>
In-Reply-To: <20230204112502.2558739-1-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 4 Feb 2023 15:05:21 +0000
Message-ID: <CAFEAcA-cgoe9gzACaob=jBkCTQNG-+ahh41t0cYML4NM_DfNZA@mail.gmail.com>
Subject: Re: [PATCH] configure: normalize riscv* cpu types too
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102b.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, 4 Feb 2023 at 11:26, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> For most CPU types out there, ./configure normalizes all
> variations into base form plus, optionally, variations,
> to find the proper arch-specific code.  In particular,
> it's possible to use
>    ./configure --cpu=$(uname -m)
> and it will figure out the right base cpu family out of
> that. But this does not work for riscv64 for example,
> since there's no similar normalisation for that one.

I don't think that's something we should be encouraging
users to do. The most common case should be "configure
correctly detects the host CPU type by probing the
compiler #defines, and the user does not need to specify".
The next most common thing should be "the user has some
special-case need to override this, and they know what
they want, and they specify the right value, in this
case "riscv".

We've put in some work to get configure away from its
old habit of falling back to "guess based on uname -m",
but that default code path is for the moment still there,
and so the "canonicalize host CPU name" code also is
still present, for:
 (1) the cases when you get into that default fallback
 (2) backwards-compatibility with users who are already
     passing --cpu=armv4l or whatever

But I don't think we should expand this legacy code
and encourage users to pass more odd stuff to --cpu.

We could probably deprecate-and-drop some of the
canonicalization handling for other host architectures.

thanks
-- PMM

