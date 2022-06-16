Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FC854D854
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 04:29:12 +0200 (CEST)
Received: from localhost ([::1]:34202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1fFu-00079j-Jp
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 22:29:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o1fEu-0006Tm-6Y
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 22:28:08 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:33491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o1fEs-0002iZ-O9
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 22:28:07 -0400
Received: by mail-pg1-x52c.google.com with SMTP id z14so38213pgh.0
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 19:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f46Fu32KvJfx+7+vGA6uPZ+Mhnjz+1k8za0Yp8siFjI=;
 b=RgV36tY1N+idLjGnY6orxq+astVtuhsYy1zAXeNSpWpoE+LSf715QUW/nAqEacCDfg
 RoFMsbMKK7p2Xj4InEXhwDppZHWatZqryKnAW4nguHtMzaSIPTrPV59IRCg2BHasmRo9
 dx04bjGcnYtWm+LFGI7AQ4peYhKhhhF03mmYjyaNqJbmCsb6j01WktHXJjRuHk62mFTr
 FBzLCYoH7JWJSlnB7nEWxdYJ0sU6/ENF5NXRNpfTYCrsnR1Ace06HUb3BSjCAkpgMiIb
 6qZaplHETihNHFtXtDyCd7DbmHWJmcKHWrHXbEeRuRIQulViUnuxBAD3YbK9MWHdDVsX
 n1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f46Fu32KvJfx+7+vGA6uPZ+Mhnjz+1k8za0Yp8siFjI=;
 b=wjyPckpMmwZQ9HszYO5E79EmET1U8VVucajiJIAfZhrZgLKV3F6B8Kbw9BUSAfUfF3
 AT1ZtVGjT1Uy/VPnQTfoM4ZzbKhqKX7c8vZLpXk4GDlJu48fHLr3u/wpLEdy7bGbM4U+
 r63WiEld1izyBryRTBDXuOVWAps0VBpJQtyCn04KgXMK+SXezQwjSIgsHcnUDvi1SfR4
 NRxOSG4sQiv+6mAG076e1+KoWutwnGtaa8yoIhXyq+F/kcmMPQyeCGLfqJrZ6erlPOHG
 Gww9cArcFV8zPUCLinPdNOn1aWwjBeVC1rqp+eIR10kz8VMOLxKyvgguhAPmqeLzbt2e
 x4nQ==
X-Gm-Message-State: AJIora/0ygc8sRlXgrmB4DkZQErfCJkLaQ7ypDvkQ2ZWJbKRCjkKR2A+
 WEOMCGvA2b+pXyTkCaEJHvIPgB5++qMt/j3V3tQ=
X-Google-Smtp-Source: AGRyM1tPBNxe3ajHEdE6GzuRezTibES9R+EUble38wpLV9T4WNcqWxvdf3pTEkPqtWPYoQ0GnDlQYzJ4SXeo4IJ5Mec=
X-Received: by 2002:a65:5385:0:b0:3fa:52e3:6468 with SMTP id
 x5-20020a655385000000b003fa52e36468mr2481827pgq.366.1655346484711; Wed, 15
 Jun 2022 19:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220604231004.49990-1-richard.henderson@linaro.org>
In-Reply-To: <20220604231004.49990-1-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 16 Jun 2022 12:27:38 +1000
Message-ID: <CAKmqyKPhcGOmGQiz-NO_wxTM+fH3tfkgY9sfn0KsBqjv-O5hvw@mail.gmail.com>
Subject: Re: [PATCH 0/3] target/riscv: Fix issue 1060
To: Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=alistair23@gmail.com; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jun 5, 2022 at 9:12 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This issue concerns the value of mtval for illegal
> instruction exceptions, and came with a great test case.
> The fix is just two lines, in the first patch, but
> I noticed some cleanups on the way.
>
>
> r~
>
>
> Richard Henderson (3):
>   target/riscv: Set env->bins in gen_exception_illegal
>   target/riscv: Remove generate_exception_mtval
>   target/riscv: Minimize the calls to decode_save_opc

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  target/riscv/translate.c                      | 31 +++++------
>  .../riscv/insn_trans/trans_privileged.c.inc   |  4 ++
>  target/riscv/insn_trans/trans_rvh.c.inc       |  2 +
>  target/riscv/insn_trans/trans_rvi.c.inc       |  2 +
>  tests/tcg/riscv64/Makefile.softmmu-target     | 21 ++++++++
>  tests/tcg/riscv64/issue1060.S                 | 53 +++++++++++++++++++
>  tests/tcg/riscv64/semihost.ld                 | 21 ++++++++
>  7 files changed, 116 insertions(+), 18 deletions(-)
>  create mode 100644 tests/tcg/riscv64/Makefile.softmmu-target
>  create mode 100644 tests/tcg/riscv64/issue1060.S
>  create mode 100644 tests/tcg/riscv64/semihost.ld
>
> --
> 2.34.1
>
>

