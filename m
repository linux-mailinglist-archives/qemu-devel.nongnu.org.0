Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4ACC68B107
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 17:50:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOiCK-0006BY-NW; Sun, 05 Feb 2023 11:49:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pOiCE-0006B1-77
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 11:48:54 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pOiCC-0006Rh-EY
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 11:48:53 -0500
Received: by mail-pf1-x433.google.com with SMTP id ay1so6840347pfb.7
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 08:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mEum/A8EnsO2tKD4nrCeCerhxM9PlRDNcOuYvHVrZUQ=;
 b=dXmmYFnhbYACdSbEkYw4nZY18n5JkXt00Lv2fKBXdmn+2bDPe8jmkblM7ya49kjs+S
 fONKR2cQZgQ36viqNbwSrZoDtACiPDK9lNOfLkiLW9+Zl2d/5XAKNvhtCr75nxwQFkAF
 ohOu2/2tkT6xgzSmbBxf7vlvI5qVW7+IlNmaPwH9e1wkXY1O00jkfeM416DM0NjcrwLh
 GDfwCqh9kG4awXqGohvPNAwtUf9XxWt0E2N9kjzOgIWeq8X4tJVqmbbhLgEIbfSQFS4i
 U8gNcPmUNmlDKIG4QaTHgGiJQ6he/bC9GXTuLu8YZVsDeViNSe3jYE6J6x7xdLA+lC+7
 7P2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mEum/A8EnsO2tKD4nrCeCerhxM9PlRDNcOuYvHVrZUQ=;
 b=QNwNoYM9982GrWAhQbh8pk1jpiveUROWo8TVmYtua2f3OYozdXqwYWz6AnxhJg5mQy
 gptAex59t4CMbvvC0sOPdTEEOP53mVp4bgTa2ubdtuTMi+EQU+YU/C/1oc49b2VepYZ5
 yPp8gow2w+ZzOZfmDeAm5tPpoMsD1VJNbSFahJ15SSGZYr56/PxpN7fqa4gt9YacfLrD
 N0T/YlLWAx5lPMdhtiXHiCLKUTKtEv+aBErSbVZjhixDgEc+9CP85/1LSs487B4Rz+Ix
 cRrLGCQNKQQ/N/Y5wYv/KKNAHJ6seHvISwoiaxv78fbXGYPIBaQ37/HoKKiwMq7YLxTP
 y4PQ==
X-Gm-Message-State: AO0yUKW/cFsuzRez2ISlgR4oEROIzFaYtwuhkQteZpSUSfUydU44BH1H
 v5xAFJY/a5pbYoz0NT2ZXy9nD31j8wwrxkdrXxpP5Q==
X-Google-Smtp-Source: AK7set9x2ygCN2JSiWC4khy32noIzlkW6InEnc9x05z7mPSYB4xQGro6RvRHtg/CkE1EEqlCw/Z/iHTZpjtTbVbC5FM=
X-Received: by 2002:aa7:9686:0:b0:58d:ce70:4683 with SMTP id
 f6-20020aa79686000000b0058dce704683mr3673798pfk.39.1675615730499; Sun, 05 Feb
 2023 08:48:50 -0800 (PST)
MIME-Version: 1.0
References: <20230204163310.815536-1-richard.henderson@linaro.org>
In-Reply-To: <20230204163310.815536-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 5 Feb 2023 16:48:38 +0000
Message-ID: <CAFEAcA-f6MUXVUpn8hTCwaBBNbvRmWG-w0x8b6r8P1hS7=iHZw@mail.gmail.com>
Subject: Re: [PULL 00/40] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x433.google.com
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

On Sat, 4 Feb 2023 at 16:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 579510e196a544b42bd8bca9cc61688d4d1211ac:
>
>   Merge tag 'pull-monitor-2023-02-03-v2' of https://repo.or.cz/qemu/armbru into staging (2023-02-04 10:19:55 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230204
>
> for you to fetch changes up to a2495ede07498ee36b18b03e7038ba30c9871bb2:
>
>   tcg/aarch64: Fix patching of LDR in tb_target_set_jmp_target (2023-02-04 06:19:43 -1000)
>
> ----------------------------------------------------------------
> tcg: Add support for TCGv_i128 in parameters and returns.
> tcg: Add support for TCGv_i128 in cmpxchg.
> tcg: Test CPUJumpCache in tb_jmp_cache_clear_page
> tcg: Split out tcg_gen_nonatomic_cmpxchg_i{32,64}
> tcg/aarch64: Fix patching of LDR in tb_target_set_jmp_target
> target/arm: Use tcg_gen_atomic_cmpxchg_i128
> target/i386: Use tcg_gen_atomic_cmpxchg_i128
> target/i386: Use tcg_gen_nonatomic_cmpxchg_i{32,64}
> target/s390x: Use tcg_gen_atomic_cmpxchg_i128
> target/s390x: Use TCGv_i128 in passing and returning float128
> target/s390x: Implement CC_OP_NZ in gen_op_calc_cc
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

