Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E516735481D
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 23:17:07 +0200 (CEST)
Received: from localhost ([::1]:33896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTWao-0006Bw-Ha
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 17:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTWZS-0005YJ-Aa
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 17:15:42 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:37517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTWZQ-0004Jv-0c
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 17:15:41 -0400
Received: by mail-ed1-x536.google.com with SMTP id x21so14003160eds.4
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 14:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IwqNiZd8MwNuQMxsLUOL26q+G9kwC+OypmTaeZb7iE8=;
 b=b1H5asq+NqaElB8Cb1MRFubueFqiONGl5WuATRFYPnDW0LJ1gpsMl83siAn6jKt8la
 9RPgFFxlVD0IXWZC0LMjIdCbRF79dO/EiLs91QWI58cHKLKI54qRsnExD3wqcXoe+mGG
 aRcnlN62TBirVRbnvdsKRwYFUXjBpnKcrKgFnJ1vNIf99K0VzQ4UbUvCU+V8Yx+gbZSK
 MMgazMEkNYA4ycToA5av+GT+IIosW+Bks6ItuZLT/n1hJK7G6I82OtXGWyhj2xMySOfO
 B+Dn7pgpekwLXlF2yOspj6D+N1sZ3rXDciwQWkMm7z9Py/D2lQ+cf8i0yI7h/MI8lvkZ
 +eXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IwqNiZd8MwNuQMxsLUOL26q+G9kwC+OypmTaeZb7iE8=;
 b=AUa24jeLSjQyuwhjq/JofAMQFvnqdd2LWJHF8e92g+wn38ItS86DRk/GjDyFc5ov7G
 Iti/GipTNyS6e136JxZQavUbXnFugUA4c3R1ddSKVbE++nhNOXxHaVr61w9cf3ujr0f6
 VTA28JrqCPHOOwDOswXMpDV/khwc1VXfs5U00ZqoXJ90jL8Cij5BSnQ4r4PlXsWM64vf
 GHWfbIM7rbc30+b6nsV+3zITuGJ/G+FTTrx70ARLq4MOChxIr0DV2SAcYGNtYdr3ooCq
 BRb0Y9eA0c/06XCvbcYEQ3wq+zm8GXdUcpRxaLaIE7zSvfntnqX+qBl4WwQDawqDK2yv
 KkFA==
X-Gm-Message-State: AOAM531Ldi8IxVI0rjEk6GIHrMUjx+RgcF+/QIht5qqGA9HypqfMQ7IP
 WIldpFMFuOUaBOt5zwyB2lzHLZve7UsSgqe69O48vw==
X-Google-Smtp-Source: ABdhPJwaP6aIcFODLqrEO8gz3oF3kBnkapUw1mrsLiqHLdbOJCkgfOXao+tSDkxfY8Faeyd0ezKkdACpIJn0H6JHKCI=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr33107455edu.100.1617657334642; 
 Mon, 05 Apr 2021 14:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210405144017.20193-1-richard.henderson@linaro.org>
In-Reply-To: <20210405144017.20193-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Apr 2021 21:14:56 +0000
Message-ID: <CAFEAcA-_CBoU0Q5+=n5n0FoZnF0XbbNWwy6g0P-y+trXGKLx1g@mail.gmail.com>
Subject: Re: [PULL for-6.0 0/2] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 5 Apr 2021 at 15:40, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Folding in a target/alpha patch since both queues
> are singletons this time.
>
>
> r~
>
>
> The following changes since commit 25d75c99b2e5941c67049ee776efdb226414f4c6:
>
>   Merge remote-tracking branch 'remotes/xtensa/tags/20210403-xtensa' into staging (2021-04-04 21:48:45 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20210405
>
> for you to fetch changes up to ef951ee33fba780dd6c2b7f8ff25c84c3f87a6b8:
>
>   target/alpha: fix icount handling for timer instructions (2021-04-05 07:32:56 -0700)
>
> ----------------------------------------------------------------
> tcg/mips tlb lookup fix
> target/alpha icount fix


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

