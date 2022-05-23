Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DACB753111C
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 15:34:34 +0200 (CEST)
Received: from localhost ([::1]:43650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt8Cg-0001zs-1P
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 09:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt8BK-0000dQ-9I
 for qemu-devel@nongnu.org; Mon, 23 May 2022 09:33:10 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:36950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt8BI-0008L8-JB
 for qemu-devel@nongnu.org; Mon, 23 May 2022 09:33:09 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2ff90e0937aso73360647b3.4
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 06:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SIupbZKH1pkg9WCLTCOQwWj+OIL2kXUr8gaH+BC23D4=;
 b=NBhERg1IkM2vbn3xcQxft0MsVRAMVex0+kFkCF6jq6B805w4jCWmf703mlTbyV2stu
 AJRvg+OvJIv9KcH7zM2OS/Ee3K2alZr+0eXhmwLnvAfkEWYb2E+yw6BBvWzoGt4ansxI
 QrbmZfcQn6MLRDI8otmtJwzMvhehtyUI0+MJ8gaXJcACMgW01YfcvixbDVurAvHLQb+E
 m9gTxw9RgbL9ma/JRH+tsZGQjygBmOJqRPgB56JElKImWjzSmYH54vhPKDiwln5ImQAU
 7Z0jqpfMncEFoBflPQ47XmNRoFpv596XDQ3x+eNKqiQl9JoUazyBZoDiC4yn6l6tN/BA
 FrZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SIupbZKH1pkg9WCLTCOQwWj+OIL2kXUr8gaH+BC23D4=;
 b=Il1XywSDTUDDUO3rPQ/7WTvr7aUJBi7F2FDhl1nF6Jxt7o4TdaK8ZaiiZkgSRyToXu
 ISFTJbEo+SJGmSUGitrSFTJkTJraFtQQQ0Dy2B7mpkBdesi5LjoTuI2wtlbtMCfcNvKX
 4yKEIV3MlIFoluiZZ5ApVz727q7AA9roEZ5C00qdpHpDUXVKT28Zfy9cpUW5Tmg+AIsK
 V4I6wK9RCRcJGSBtIRqdOrrWYradT+1hvoFSWr7uflnc8/FHQ14178/1/KzIK2Rwh7Ep
 ouCRGD0ahU5V1c+psZHjgMI4AOYZ9UIoTNt9xKksQC3sx9gtaOzfUXxM+BA5NRY8t0OG
 /Tnw==
X-Gm-Message-State: AOAM531Ab679xaxAvm3fVMnEIf7BedKDaY/ZsF+XK3XSx0cqkjUN3+W0
 rS182roFfnAGfjxODHmXqjPzZxMCVA93xYyJlHs4jg==
X-Google-Smtp-Source: ABdhPJxToz7Np0kxhsgaiNhTKrw7TGCbUoLOtdd68t7XDOcACHbIPYVIPnghq8f4M7aI4WD5/rQoUKzhM0O3+LcgxQM=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr23953557ywb.257.1653312787465; Mon, 23
 May 2022 06:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220521000400.454525-1-richard.henderson@linaro.org>
 <20220521000400.454525-37-richard.henderson@linaro.org>
In-Reply-To: <20220521000400.454525-37-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 May 2022 14:32:56 +0100
Message-ID: <CAFEAcA80XraBLoHUNQVm_d6T4G45o99MuYG+6Djk8zDG42863w@mail.gmail.com>
Subject: Re: [PATCH v3 36/49] gdbstub: Widen gdb_syscall_complete_cb return
 value
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 21 May 2022 at 01:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Always pass a uint64_t.  This resolves a FIXME in the
> m68k and nios2 semihosting that we've lost data.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/gdbstub.h        |  3 +--
>  gdbstub.c                     |  7 ++++---
>  semihosting/arm-compat-semi.c |  9 ++++-----
>  semihosting/console.c         |  7 +++----
>  semihosting/syscalls.c        |  2 +-
>  target/m68k/m68k-semi.c       | 10 +++-------
>  target/nios2/nios2-semi.c     |  8 +++-----
>  7 files changed, 19 insertions(+), 27 deletions(-)


> -typedef void (*gdb_syscall_complete_cb)(CPUState *cpu,
> -                                        target_ulong ret, target_ulong err);
> +typedef void (*gdb_syscall_complete_cb)(CPUState *cpu, uint64_t ret, int err);

Commit message says we're just changing the return value
handling, but the code also changes the type used for errno.

-- PMM

