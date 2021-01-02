Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3E92E8879
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 21:25:28 +0100 (CET)
Received: from localhost ([::1]:39930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvnSp-0007cc-Vb
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 15:25:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvnRr-0006gL-7j
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:24:27 -0500
Received: from mail-il1-f179.google.com ([209.85.166.179]:33851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvnRp-00060Q-NX
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:24:26 -0500
Received: by mail-il1-f179.google.com with SMTP id x15so21782602ilq.1
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:24:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X1q5v6m2YHzK74c0wOww/jRY65BlVFz1USDmOejz6x8=;
 b=iPqr9ReTKDfL1/MO/H42Kgp4nQdIHkUbdEEFgpG9e9dxHa7w3aHPurCZtE1UwoRxLy
 hh6lTSUYQm1DTNYcsBDRhPPnch+QhBgrX0TfbECtPVMrH3ILRxNzSFoA5avVcidTocIS
 GSBut5BhJqvp3B3kRhog3H0lByaFRn5TtiYIqGmta+kq29TQJjd9u7RJs8zqTJH3Nvym
 z+D+iJgM2n3atsGwuNlCBefHQiX2jy7KjGNDr7gM74oYmqIElnKt6CX2E6UXuG+t+dXa
 Hc/yW4mG6LsZIxdFuOBhP96mTYxfhODE64XRm2UIb72/PLT/kC+ca49f+EAUOPGn37sG
 rWOw==
X-Gm-Message-State: AOAM530wa+AwINHZfJVMQQ6SHORq/Y2VsD+wKOvsA/zq1qBeLom3DPw3
 sd6dy7gUeY6aLFTjpltw/jnQM7tWoY0=
X-Google-Smtp-Source: ABdhPJxaLlDwc8IWW3A8O+2AzU0FLOrikBvF1/4c78zOMskVQpNbmP9d3dq6deilLocoEv97F0mFvQ==
X-Received: by 2002:a92:c942:: with SMTP id i2mr63781237ilq.227.1609619064908; 
 Sat, 02 Jan 2021 12:24:24 -0800 (PST)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com.
 [209.85.166.47])
 by smtp.gmail.com with ESMTPSA id r12sm32471028ile.59.2021.01.02.12.24.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jan 2021 12:24:24 -0800 (PST)
Received: by mail-io1-f47.google.com with SMTP id d9so21490456iob.6
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:24:24 -0800 (PST)
X-Received: by 2002:a05:6638:5b2:: with SMTP id
 b18mr56512469jar.69.1609619064538; 
 Sat, 02 Jan 2021 12:24:24 -0800 (PST)
MIME-Version: 1.0
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-44-richard.henderson@linaro.org>
In-Reply-To: <20201214140314.18544-44-richard.henderson@linaro.org>
From: Joelle van Dyne <j@getutm.app>
Date: Sat, 2 Jan 2021 12:24:12 -0800
X-Gmail-Original-Message-ID: <CA+E+eSCYZLhDEb4bEaxGsyRdTV1fNR+7ekgGriRgF0RZup9mbQ@mail.gmail.com>
Message-ID: <CA+E+eSCYZLhDEb4bEaxGsyRdTV1fNR+7ekgGriRgF0RZup9mbQ@mail.gmail.com>
Subject: Re: [PATCH v4 43/43] tcg: Constify TCGLabelQemuLdst.raddr
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.179; envelope-from=osy86dev@gmail.com;
 helo=mail-il1-f179.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, Dec 14, 2020 at 6:03 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Now that all native tcg hosts support splitwx,
> make this pointer const.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/aarch64/tcg-target.c.inc | 3 +--
>  tcg/arm/tcg-target.c.inc     | 3 +--
>  tcg/i386/tcg-target.c.inc    | 3 +--
>  tcg/mips/tcg-target.c.inc    | 3 +--
>  tcg/ppc/tcg-target.c.inc     | 3 +--
>  tcg/riscv/tcg-target.c.inc   | 3 +--
>  tcg/s390/tcg-target.c.inc    | 3 +--
>  tcg/tcg-ldst.c.inc           | 2 +-
>  8 files changed, 8 insertions(+), 15 deletions(-)

Reviewed-by: Joelle van Dyne <j@getutm.app>

