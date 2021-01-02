Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 315C52E8877
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 21:23:40 +0100 (CET)
Received: from localhost ([::1]:35392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvnR5-0005jW-9R
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 15:23:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvnQI-0005Kc-DF
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:22:50 -0500
Received: from mail-il1-f178.google.com ([209.85.166.178]:34896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvnQG-0005Ul-SS
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:22:50 -0500
Received: by mail-il1-f178.google.com with SMTP id t9so21803147ilf.2
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:22:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SXEDjAEmgWVrQpX1F9g5lB5N4uAOUxescL0v87evbY0=;
 b=cCyvodS77b0xUzbc/Hv1YClOhgBlWh2noTEp2HX3XkgreXTCQkopsrw6Lneg0hI/3A
 kJScAWsyDdCpbRfWaJEkd9Cs8DafS5vKPguszDLFHZvxFh0j0MtvSvncLEfqqVwtOz5A
 O9KzfBcZrs/x5NPAR83jR3HfzMJDSU3qPoCqSUYfnnhlhGq+LP/fqV+9ZHPOOUcM25NM
 AKA2qSIL26CrntWJi2ExzpHTo2iBGOl15EIJrNmmPAtc9qhPJOCUvcBreh5kBRctL8Ak
 PF7/So7glJaXaNpCHV1aOPhNuX7cpgSDWWXAUugjjynzXzymocK6ePq2/dY7/zJrm5vO
 CVKQ==
X-Gm-Message-State: AOAM532PMRuOsGKyJMSO1Xr+t+3cfaSJ1J5NIOTYI8WidlnfW+1GNXbw
 ybRmkXac/CC/cG2UTNcRdEv6xFwCYvI=
X-Google-Smtp-Source: ABdhPJx8R8ZcYOvDVVLOdaEHyOWWi+0drlknk+jedHScZNmCTEC38+c9VFvrMBB/iNW6x4f04+k75g==
X-Received: by 2002:a92:d68f:: with SMTP id p15mr61854620iln.29.1609618967598; 
 Sat, 02 Jan 2021 12:22:47 -0800 (PST)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com.
 [209.85.166.45])
 by smtp.gmail.com with ESMTPSA id d18sm38134129ilo.49.2021.01.02.12.22.47
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jan 2021 12:22:47 -0800 (PST)
Received: by mail-io1-f45.google.com with SMTP id n4so21473824iow.12
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:22:47 -0800 (PST)
X-Received: by 2002:a02:b607:: with SMTP id h7mr57825633jam.120.1609618967140; 
 Sat, 02 Jan 2021 12:22:47 -0800 (PST)
MIME-Version: 1.0
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-42-richard.henderson@linaro.org>
In-Reply-To: <20201214140314.18544-42-richard.henderson@linaro.org>
From: Joelle van Dyne <j@getutm.app>
Date: Sat, 2 Jan 2021 12:22:35 -0800
X-Gmail-Original-Message-ID: <CA+E+eSDCehQQpsGxJO7jUnt=1jKhvzehHCXfrUNOAVWz49mG=Q@mail.gmail.com>
Message-ID: <CA+E+eSDCehQQpsGxJO7jUnt=1jKhvzehHCXfrUNOAVWz49mG=Q@mail.gmail.com>
Subject: Re: [PATCH v4 41/43] tcg: Remove TCG_TARGET_SUPPORT_MIRROR
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.178; envelope-from=osy86dev@gmail.com;
 helo=mail-il1-f178.google.com
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
> Now that all native tcg hosts support splitwx, remove the define.
> Replace the one use with a test for CONFIG_TCG_INTERPRETER.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/aarch64/tcg-target.h  |  1 -
>  tcg/arm/tcg-target.h      |  1 -
>  tcg/i386/tcg-target.h     |  1 -
>  tcg/mips/tcg-target.h     |  1 -
>  tcg/ppc/tcg-target.h      |  1 -
>  tcg/riscv/tcg-target.h    |  1 -
>  tcg/s390/tcg-target.h     |  1 -
>  tcg/sparc/tcg-target.h    |  1 -
>  tcg/tci/tcg-target.h      |  1 -
>  accel/tcg/translate-all.c | 16 +++++++++-------
>  10 files changed, 9 insertions(+), 16 deletions(-)

Reviewed-by: Joelle van Dyne <j@getutm.app>

