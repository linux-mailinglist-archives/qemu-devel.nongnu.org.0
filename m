Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0271750B8FB
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 15:47:05 +0200 (CEST)
Received: from localhost ([::1]:34640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhtcm-0005No-4l
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 09:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhtJX-0005bF-Ms
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:27:11 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134]:39932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhtJW-0000gF-6b
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 09:27:11 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2f7b90e8b37so7668457b3.6
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 06:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IdWiwCANOr3kWXg35Hw9clCVghVTjlR+KmWszE6Q8A4=;
 b=pkJbhrOefl/lTSMDUEoD5boWljw3oGhoS8E5nL1etbRCgEjN5UHkIWo3EwHrd1FZK0
 UQK+2WXHADYYww9/HK9CP/QI4yKjSDV5P+NaM811zbrPXaXCcTzIN7JcvW7Bc9To+kSj
 DjV08oBTxFiqlwAkvpqcdO93lQ7hP1VL2Zmg80WMrCYqEmuyeIUEsLbP395m9f1LoWe/
 Mjzqu07dcUzlSzWZ9/AWzwNWvYiInnMIM/9IJVwHlPKdpZUsvHuC6asZk8uqqJwUSHlT
 sppk28ThNJH5FZFfMladq4lL57fqeeVFnmgqYHQKMEeNOsXXUhsRWoq9w+yM5H85lRdp
 z3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IdWiwCANOr3kWXg35Hw9clCVghVTjlR+KmWszE6Q8A4=;
 b=wlsIzUTwg6xAfjZN+rEkMXimES1iXXOmSY7GlLqG0TbacRb8S5UQaZHaby4iwk0dx7
 CBJCcPztwl6qUUIMy2ZVZSYjwloNplhA7kPjVpg76bDue5YFZ57cyB/WmS9sHu9LI6RM
 +2fJRVZ9NQdmsQcZEAumMiGmQPCFmqZVtFgGMqg2Ji6fKOkyv8KFL4YEOgwvqAdWgyZq
 CD9cOwjLYVyQx1lRsd/cCUfvJlfW54hp926XWFq+7WDCsSbfwR00G+0VXVi8oDOkPUPE
 ZDuwLLR993CwR/LhY43UyC8h/P8Z/fXvrEZ10H9jy/PNGaSsJch1RZ143kzh4iPeC4bs
 5jfw==
X-Gm-Message-State: AOAM532VVLx6lGh0nDuqq7+YknZUi6Ryfa6hTWDPw9F8bS6HfN72F2RS
 qmKSB96/EtZvsPkEIv2+JZoQiByh4D4cEPZS/Ucpwg==
X-Google-Smtp-Source: ABdhPJwYp6cxKk/l0zEtztfz46D41WsiKw7fsEYwBTuBHEX0Y/q6DoJgGVXUwof7vlFAr+/acRqE6wihSMiDk+eB/ac=
X-Received: by 2002:a81:6642:0:b0:2eb:c364:b8e1 with SMTP id
 a63-20020a816642000000b002ebc364b8e1mr4641749ywc.64.1650634029298; Fri, 22
 Apr 2022 06:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220421151735.31996-1-richard.henderson@linaro.org>
 <20220421151735.31996-64-richard.henderson@linaro.org>
In-Reply-To: <20220421151735.31996-64-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 14:26:58 +0100
Message-ID: <CAFEAcA8PNFgu5yH37kjPvjaKNhgt_y6PzmQQwsSpzNjZS3ULTA@mail.gmail.com>
Subject: Re: [PATCH v7 63/64] tests/tcg/nios2: Add semihosting multiarch tests
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Apr 2022 at 17:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add runtime supporting the nios2-semi.c interface.
> Execute the hello and memory multiarch tests.
>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tests/tcg/nios2/semicall.h              |  25 +++
>  tests/tcg/nios2/10m50-ghrd.ld           |  59 +++++++
>  tests/tcg/nios2/Makefile.softmmu-target |  29 ++++
>  tests/tcg/nios2/boot.S                  | 218 ++++++++++++++++++++++++
>  tests/tcg/nios2/intr.S                  |  31 ++++
>  5 files changed, 362 insertions(+)
>  create mode 100644 tests/tcg/nios2/semicall.h
>  create mode 100644 tests/tcg/nios2/10m50-ghrd.ld
>  create mode 100644 tests/tcg/nios2/Makefile.softmmu-target
>  create mode 100644 tests/tcg/nios2/boot.S
>  create mode 100644 tests/tcg/nios2/intr.S

Most of these new files are missing the copyright/license comment header.

thanks
-- PMM

