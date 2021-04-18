Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A06593636A5
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 18:35:12 +0200 (CEST)
Received: from localhost ([::1]:50554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYAO7-0004BH-MV
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 12:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYAKs-0002Re-4Z
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:31:50 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:37583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lYAKq-0004Ox-4V
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:31:49 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 t14-20020a05600c198eb029012eeb3edfaeso6851732wmq.2
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 09:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=FWuTv7jJ1Hq7Vh9TcFxxTb47Brey9aNGVhLlnjxY4iI=;
 b=i0r0Z2UQ02gMJUbt5RqZLRvYLMB7P0JKfd1z+nXlmyxJMUls+XlmahUwDiLfgDy0Sa
 lS2r5wvNyzrKF4x4xjSuO8xxm7MQRdrUINsDTNmOPaTJTQNqqKaGvasv3Szg7vGZyzPl
 9iYvXZ/eaiXkyh/ZvW+A4haK1E0DXajoNjGAjbZHUku0Tljxtj3bJnAd8eOuu4tTUkAf
 sFaNxxgOwUigzV9bWLZkWTDt/EyLEr1hc/f8TnnEaIf5OGTqkBKAX1C6GH9cuoCPWAen
 hgXf8GmJdnta0g+OUvfz426qKR/MVh8IZUxLGb9xX9X8DLraQULNm7KoevFaYuoXab6F
 otDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=FWuTv7jJ1Hq7Vh9TcFxxTb47Brey9aNGVhLlnjxY4iI=;
 b=uh6l/3HjrWQ4lDcIrj2i6IybFG/8NCht61S3OIInFG6tC6VysV9leZuuSM/0x+ixuc
 kvrNUvM7lgLfMmFnvAJTJLZLL2hg0BD+HHBeuHleQ70wSFZCBk87mJ7kQAJ4Ax7vl0wU
 15gq++Xth1dTrxFFIW6G0orNCv30qNnk8xwFGccI7k7bWR98qxg7Xkw7pfX5vK5vbe/L
 lBPw/t2Zm2iMFCUZkFGd8Os5Kf0xRLVV6PuZkF4Aev/1mEDrl5oRJ07vaZQMxzD3UTXX
 BaT2ROJC5yysvdKl91sCTBIF0ea2ZUjmPlnQYNErisObbD1liso+xOxGJyhGYrY5Svzf
 3o8Q==
X-Gm-Message-State: AOAM5300qs4KcHunmclOv/2eNrlN3FCdJKtK6I1UZSBwK+MDR3/YbdT/
 9gLIEPDHiM492qpfj2vbHmdu4A==
X-Google-Smtp-Source: ABdhPJxj0OLimV0LFth6ClEyeSOoiRj8FsNzc90Hiby8+tXLStsz4rwloeBIIcoBR/ZSP0aLnYlORQ==
X-Received: by 2002:a7b:cc11:: with SMTP id f17mr6485700wmh.159.1618763505999; 
 Sun, 18 Apr 2021 09:31:45 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b12sm20587019wrn.18.2021.04.18.09.31.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 09:31:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1640A1FF7E;
 Sun, 18 Apr 2021 17:31:44 +0100 (BST)
References: <20210417194205.17057-1-peter.maydell@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/7] queue of proposed rc4 fixes
Date: Sun, 18 Apr 2021 17:31:00 +0100
In-reply-to: <20210417194205.17057-1-peter.maydell@linaro.org>
Message-ID: <87tuo38sgg.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> This pullreq contains fixes for the remaining "not fixed yet" issues
> in the 6.0 Planning page:
>  * Fix compile failures of C++ files with new glib headers
>  * mps3-an547: Use correct Cortex-M55 CPU and don't disable its FPU
>  * accel/tcg: Fix assertion failure executing from non-RAM with -icount
>
> None of these are 100% rc4-worthy on their own, but taken all together
> I think they justify rolling another release candidate.

If you are rolling it would be nice to include:

  checkpatch: Fix use of uninitialized value
  Message-Id: <161786467973.295167.5612704777283969903.stgit@bahia.lan>

just to avoid the messy warning in the CI checkpatch check.

>
> thanks
> -- PMM
>
> The following changes since commit 8fe9f1f891eff4e37f82622b7480ee748bf4af=
74:
>
>   Update version for v6.0.0-rc3 release (2021-04-14 22:06:18 +0100)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-ar=
m-20210417
>
> for you to fetch changes up to 277aed998ac2cd3649bf0e13b22f47769519eb61:
>
>   accel/tcg: avoid re-translating one-shot instructions (2021-04-17 18:51=
:14 +0100)
>
> ----------------------------------------------------------------
> Fixes for rc4:
>  * Fix compile failures of C++ files with new glib headers
>  * mps3-an547: Use correct Cortex-M55 CPU and don't disable its FPU
>  * accel/tcg: Fix assertion failure executing from non-RAM with -icount
>
> ----------------------------------------------------------------
> Alex Benn=C3=A9e (2):
>       target/arm: drop CF_LAST_IO/dc->condjump check
>       accel/tcg: avoid re-translating one-shot instructions
>
> Paolo Bonzini (2):
>       osdep: include glib-compat.h before other QEMU headers
>       osdep: protect qemu/osdep.h with extern "C"
>
> Peter Maydell (3):
>       include/qemu/osdep.h: Move system includes to top
>       hw/arm/armsse: Give SSE-300 its own Property array
>       hw/arm/armsse: Make SSE-300 use Cortex-M55
>
>  include/qemu/compiler.h   |  6 ++++++
>  include/qemu/osdep.h      | 38 +++++++++++++++++++++++++++++---------
>  accel/tcg/translate-all.c |  2 +-
>  hw/arm/armsse.c           | 24 +++++++++++++++++++-----
>  target/arm/translate.c    |  5 -----
>  disas/arm-a64.cc          |  2 +-
>  disas/nanomips.cpp        |  2 +-
>  7 files changed, 57 insertions(+), 22 deletions(-)


--=20
Alex Benn=C3=A9e

