Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3D169E1E6
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 15:04:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUTFp-0002Zk-Mu; Tue, 21 Feb 2023 09:04:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUTFm-0002XN-OH
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 09:04:22 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUTFj-0005Sf-Nu
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 09:04:21 -0500
Received: by mail-pl1-x631.google.com with SMTP id ky4so6302442plb.3
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 06:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dMCHSEToGt+Ojzu9FZ6Ys0NyeikJM8lfCpeS1Jz1DWA=;
 b=wY90jY0eO4mR2c0hgQSSt6CaxpaGFNSdigoJYDKmhi/mpFH4mw/0JI5KDKRqrNLmIB
 9Rr0+AYM3KQ+Lv0DTVyqoAI14lnt8RNC5Tu9DCJ39mulHPHQrXd8nu4mbdkgQ8N7nwjn
 vdfa29thqwVtjRA+0hHaGnRJPLd6WzFCvF0DIZ7fYFav6Hm7BTXQIGVlaqzqsRBH6+Lo
 ZjXkpsiwolx2MR3/mEbYFx9Xwn+i7ziBDLv8Xz9YCisGu8mTRZGjwkdIjiWvtii2oe/q
 eX9ERdzoaV6JoL9dsfVyKrrvX+UmnYH1Ietjz0lFT+Ygy9sw7jc2ntnDYK8UPJF/Li/N
 kn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dMCHSEToGt+Ojzu9FZ6Ys0NyeikJM8lfCpeS1Jz1DWA=;
 b=opV/36YB5yspGT483ArSjQrxnSo8jEDh9T81zLDeMWO3T/qJcVb2lTn2ZR7moY7Ddw
 GT//fuDfeUadlZU9j+W+Vok3/v44TuGvOG8ae/SfRKhBZyBEcioR9r11bIG0tEGsIaST
 jCY/FU0izVKJIrgFH4t/2o1aYt6ehqKTughA33C8Ms8uQOF9w5jOIzPt91R3ibaxW6p/
 DsmrS2PXUIfNod5TqxTodip5A48RHq8iyIf/oPrtRNbXYJfkO27ENbos7CAyzpUkuOfI
 hHYbgFufD7Bww8RPhOGGjxMELwIlePcd+aUnoFylr/ziOHmt/6ZKe5JEloBrf04CXjrd
 TU3w==
X-Gm-Message-State: AO0yUKX1JcAnWpAqskJUg/5A27YcvRrC64YSbQw6jTVC9/3DEtx2ay/3
 KGrRCC9rjSCobreqz32e32d/r+IWzcWNJdVplxF0iQ==
X-Google-Smtp-Source: AK7set8h7hsBVn8oowecXLfpNzJyW/oxUrUCJKu36ru/n9zqgdkogIEd5oNzLUFgdlpYIiESvfEv8QOLf9UHGF925QY=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1767173pjb.92.1676988256489; Tue, 21
 Feb 2023 06:04:16 -0800 (PST)
MIME-Version: 1.0
References: <20230220032338.5619-1-richard.henderson@linaro.org>
In-Reply-To: <20230220032338.5619-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 14:04:05 +0000
Message-ID: <CAFEAcA_89gi6r-fmPSohpho2fOMu_oh-kBG6oQO+6uC0mZR1TQ@mail.gmail.com>
Subject: Re: [PULL 0/7] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x631.google.com
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

On Mon, 20 Feb 2023 at 03:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The linux-user patches are on the tcg-ish side of user-only
> emulation, rather than the syscall-ish side, so queuing here.
> Solving the deadlock issue is quite important vs timeouts.

aarch64 host, aarch64 guest, segfault on bti-3 in tcg-tests:

https://gitlab.com/qemu-project/qemu/-/jobs/3806772144

TEST bti-3 on aarch64
Segmentation fault
make[1]: *** [Makefile:170: run-bti-3] Error 139

Might be a pre-existing intermittent :shrug:

-- PMM

