Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5C750FB5B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 12:47:43 +0200 (CEST)
Received: from localhost ([::1]:47246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njIjO-0004Kr-RF
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 06:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njHxJ-0004NF-8i
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:58:01 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:40352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njHxH-00024j-NP
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:58:00 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2f7ca2ce255so76663017b3.7
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 02:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZyUI8xwqX4Qm5cLTTJbrzTQdQNI++B1QRHRh5X/89A8=;
 b=rEeXbuH+gHHinKR2bTOT3AYKZdNuqq5y3bJabTtOpPTMawBaFh4wUlxDlKHJc7klKR
 ACYrS63//j34VuezMfSAdnHUSEJvfIsfp8tvePI2NuAV4KbDSs8eF+fHmfGfAaBFUuNX
 05czWHC2aCS8CjJgKXSuVD6PPyvZIKnYd1OwiASU4eO0XMVfy4d5KQXb6SAuSOqyIvLE
 AvHAKotgtSsUQUWWvXOFHVUWaEz/EhnAF0fdRM0vPnAsgaxSqYl0BHl41SwsghnZUxfs
 vauFcHeRNJLqtgDwYoN/0Bw+1xxp5VtQMRphaVghlS7RxYz6bGFYECo/KdGFMo0qULTY
 7xtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZyUI8xwqX4Qm5cLTTJbrzTQdQNI++B1QRHRh5X/89A8=;
 b=JljneVQuzAsN1Dq0OiObIZ+81krkhHt7jbJAaunRH+JunJysq5h95lXuixzYjSu+j7
 2yb2YfxUVV5MApfZbaEP0PNWqhwNAOkPk190UqEm5ZMk2ji0ueH+EAjK8WeQrZNoBLaO
 TKbN2uutknYsM9+0tGgZiHZy0YZgX7gdEho3klMUpK43JJ8dD1kTraOiQEfKrVK8MDIt
 ilARfsRNmdoHjplVDSHRdC8lg8lOWvuv9ad151PAViT5rWeJOEc8K/2xGFkpeK2CVQKo
 /xjwnJKvF+LWYyL/uz5Rf9ExTkSkIc4rtfi+IJO0KTDnfDFPV4rqCj6d+96PYXLmY2H+
 F3NA==
X-Gm-Message-State: AOAM531TUZtuPPvwk7AzBZTdYgY82Xl5hJ5KVSHNOpfXqLkfK0OKqomt
 GXs18AhpFGcafsUGIlQcLCYo5VUZY8kLNtEvQnEDCw==
X-Google-Smtp-Source: ABdhPJwxNK/ncw7Zy2Z6+8LdonjF11g0ADEzjuQHmOZA8qaOpqMB9OewXLHVvBXkjPcKqwn93P/Ew+j6VFaZ5jqXwxw=
X-Received: by 2002:a81:ac57:0:b0:2f1:99ec:91a2 with SMTP id
 z23-20020a81ac57000000b002f199ec91a2mr20966282ywj.329.1650967078672; Tue, 26
 Apr 2022 02:57:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
 <20220422165238.1971496-68-richard.henderson@linaro.org>
In-Reply-To: <20220422165238.1971496-68-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Apr 2022 10:57:47 +0100
Message-ID: <CAFEAcA9tFVZzk6rdpaYODLJhJ--WtZMxQOqJQ_gRYFfuEvnntg@mail.gmail.com>
Subject: Re: [PATCH v8 67/68] tests/tcg/nios2: Add semihosting multiarch tests
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

On Fri, 22 Apr 2022 at 18:53, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Add runtime supporting the nios2-semi.c interface.
> Execute the hello and memory multiarch tests.
>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20220421151735.31996-64-richard.henderson@linaro.org>
> ---
>  tests/tcg/nios2/semicall.h              |  28 +++
>  tests/tcg/nios2/10m50-ghrd.ld           |  66 +++++++
>  tests/tcg/nios2/Makefile.softmmu-target |  32 ++++
>  tests/tcg/nios2/boot.S                  | 218 ++++++++++++++++++++++++
>  tests/tcg/nios2/intr.S                  |  31 ++++
>  5 files changed, 375 insertions(+)
>  create mode 100644 tests/tcg/nios2/semicall.h
>  create mode 100644 tests/tcg/nios2/10m50-ghrd.ld
>  create mode 100644 tests/tcg/nios2/Makefile.softmmu-target
>  create mode 100644 tests/tcg/nios2/boot.S
>  create mode 100644 tests/tcg/nios2/intr.S

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(I didn't check the details, but it's the right shape, and it's
only test code, so if it can execute the tests it's probably right.)

thanks
-- PMM

