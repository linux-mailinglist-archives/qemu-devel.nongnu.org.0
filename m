Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F17402930
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 14:50:18 +0200 (CEST)
Received: from localhost ([::1]:60116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNaYL-00048q-Qn
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 08:50:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNa9J-0006pG-Dy
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:24:25 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:50915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNa9H-0008BB-Mf
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:24:25 -0400
Received: by mail-wm1-x32c.google.com with SMTP id m2so6728114wmm.0
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 05:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aFq96+9PmPz87Q5l3UQxtJOGvgdLtlxoG7XCB75q980=;
 b=Ob+UeMEFUEmXliOnt24WR7B8V4iHrJtL4qNZtlY30y8r6vO20/L8UZ1J2RtnRD67vU
 1IXKvWGd81vnIJMixpsVPoWNYE57bMEwYVXsFJ8obOfr0L5WezdHPiB/XNcBWuJHHzjK
 ODj49ub99lJKvT4n8zuJagnHNQXIE4VB+P/3S8aXpW7Ter2ABLxrk12t6+Etb1/qYJpE
 3mYE0uvLxZ6WPYGwYtrR4IOtYBd/Wi1QEuX4/JnBr6c3JbzhViGtRuFnmABo/rGBFqW5
 Unq4qOScrnkY6SopWDY4yVre/3qUbVs0YXgBFhdOL+SOsotOB09bGPNxUpuOPOIRI3SK
 aOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aFq96+9PmPz87Q5l3UQxtJOGvgdLtlxoG7XCB75q980=;
 b=WHDI9D4Ex63KwXZpLIr0Xe1749gQ0rg76ONIaqWWlnQWJ6oNAOsHAi+GFaZ1ML0LqX
 dJhlhV3bFfDXgNZcGlkdLZiKDscG3v41BJYk/re1qcvg8Ltd0NxCTqKEiCP6F8J7Nt/q
 CqBMmL5Th00FkpOrWXCGwWcKAbkSV7a/ON+CtQwmh4j+KL9rFMH+lKsIQ9ZN6VOhk3wb
 HQ1G+Q2uTTWEIJJGVZ3JMMWfEmpreXqQtR1vvY2EVrsIMBJ+o6nAFj8CCZXVTm/9OHNf
 /OOCtyuSStRodhzIVBlTSR5u1r6jxOna03asjLh1VU7+oaPhUArAh92LEkOvrZY+zynA
 T/pw==
X-Gm-Message-State: AOAM532sWyTuxgJRWy3taZymSJmAc9IEZDzSLxEKCdFza4k37O4VdKal
 ou7/VWCY1+X2s6+PaTDZAuCPqiXHEfJBHBbvMkJ68g==
X-Google-Smtp-Source: ABdhPJx6bgOgi6MoaCBmXtVh3Turt3jTayfE+6mpILedqdI5B8+Mm6fL440lndHvMOSb9j1GPCMZ3x56xPBNIxkczJ8=
X-Received: by 2002:a7b:ce87:: with SMTP id q7mr3805603wmj.126.1631017461643; 
 Tue, 07 Sep 2021 05:24:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210907071349.116329-1-pbonzini@redhat.com>
In-Reply-To: <20210907071349.116329-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 13:23:32 +0100
Message-ID: <CAFEAcA84x-V8vyBQ95VKcPw=1p7pVXyywhpZWoysokyLLX_aGA@mail.gmail.com>
Subject: Re: [PULL v3 00/36] (Mostly) x86 changes for 2021-09-06
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

On Tue, 7 Sept 2021 at 08:16, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 935efca6c246c108253b0e4e51cc87648fc7ca10:
>
>   Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2021-09-06' into staging (2021-09-06 12:38:07 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 127c76bd1aa893122a22677b991c0f31ebef7f09:
>
>   doc: Add the SGX doc (2021-09-07 08:54:57 +0200)
>
> ----------------------------------------------------------------

Sorry to bounce this for a third time, but I only just noticed
this in the diffstat:

>  docs/intel-sgx.txt                       | 167 +++++++++++++++++++

No new .txt files in docs, please. All documentation from now
on needs to be in rst format and correctly integrated into
the right place in the manual structure.

thanks
-- PMM

