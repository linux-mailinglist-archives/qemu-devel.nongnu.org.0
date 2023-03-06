Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E7A6AC23D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:06:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBTN-0004OK-Vr; Mon, 06 Mar 2023 09:05:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZBTH-0004Na-Um
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:05:47 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZBTG-0007M7-AM
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:05:47 -0500
Received: by mail-pl1-x62e.google.com with SMTP id v11so10403890plz.8
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 06:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678111545;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cX/K+zEsFs8Ku3GiZPLqNZX1iVp9wqgwX7YjzXrPjbc=;
 b=g/WbxQ2ASibEdwFDbS4UTkBSNw2XNzyhF94VnMbC9n2LKfEYp0L3ktSZikusd28kRU
 h7sqlKWnTD+srala9KmDAAJrf2raugpvVgTw1SL54gnsphK93jvTXJjPK0cAoSqR9JT6
 IA5DbvqzhL8u3YyZMm2LjbroPJduloFCV13LzI63uvv8QV/XO5coe4RlVmULA1Q/HaTr
 qNMI+k23zPDuQRtzLyOaYIgEagvAqQHWNu+kp+JFirxgxeYsAcb6Pp/rHRQ13ZSj61Wo
 feGJMn2EPQKvr4dJWtTVprLYs3D7cgCHSwwuE2vz4PPvb6N4xgWqGvCrEF297QuaG2WQ
 PTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678111545;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cX/K+zEsFs8Ku3GiZPLqNZX1iVp9wqgwX7YjzXrPjbc=;
 b=dnEA1JLH2UDO+ORz6e3Fa6mMqwjz7aW6omTYK42Oic9Gl4t5D0QsYvsd6XLb9uzYP3
 K6NGEb2H3IoyryjoOlMtkOM7tB9u6LwCy11ueK5//LCZqqvJwI8zwG/UsEjTNMDh9X1b
 /toqjXmxW3IwmDX6P8zDwbtR5ONa0jwvgm+5pNJLPWEfD8DJp0cQ880vwHTh8nDcmFt5
 lutNrkxIJXAxU+H6d3duFrkCEJPEcEWJ3KqcZA/DXVMOgVSDjcAnDjMRKo/YW9AzeGoz
 fMS4O3JHOqxCFh6v6NlvbpgV3ULrmxu8t1FYZbDAXs0uKS/HLg1qN57iqUsSBaPmyCAu
 SRuQ==
X-Gm-Message-State: AO0yUKXsBmsqnJQdhOjOA4Lx4Pjfc+KmCKtvkRUQgQiflpU6vVnPHoGs
 wpoWVf3rm6zrxFr7svP6n53si/5wokFFgi13godFiAekkOTlpwDb
X-Google-Smtp-Source: AK7set9AuQNBWjiImnl0YDzAIcUib5UBaJC6YPXbuuGjDOmxtnjFaUQCqpyKfp7GETV5nxpnqog3hcc1uoVK4hjVqFI=
X-Received: by 2002:a17:902:a3c6:b0:19b:8cbb:30fe with SMTP id
 q6-20020a170902a3c600b0019b8cbb30femr4273959plb.13.1678111544865; Mon, 06 Mar
 2023 06:05:44 -0800 (PST)
MIME-Version: 1.0
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2023 14:05:33 +0000
Message-ID: <CAFEAcA-zhvOA+XQ362arCL3WosSm4OjxKNHEUb1b5ua2XVRRzQ@mail.gmail.com>
Subject: Re: [PULL 00/84] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62e.google.com
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

On Mon, 6 Mar 2023 at 00:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 2946e1af2704bf6584f57d4e3aec49d1d5f3ecc0:
>
>   configure: Disable thread-safety warnings on macOS (2023-03-04 14:03:46 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230305
>
> for you to fetch changes up to b6611d8d5c265c138a4a0cc36a2c02d84a768976:
>
>   target/xtensa: Avoid tcg_const_i32 (2023-03-05 13:47:25 -0800)
>
> ----------------------------------------------------------------
> tcg: Merge two sequential labels
> accel/tcg: Retain prot flags from tlb_fill
> accel/tcg: Honor TLB_DISCARD_WRITE in atomic_mmu_lookup
> accel/tcg: Honor TLB_WATCHPOINTS in atomic_mmu_lookup
> target/sparc: Use tlb_set_page_full
> include/qemu/cpuid: Introduce xgetbv_low
> tcg/i386: Mark Win64 call-saved vector regs as reserved
> tcg: Decode the operand to INDEX_op_mb in dumps
>
> Portion of the target/ patchset which eliminates use of tcg_temp_free*
> Portion of the target/ patchset which eliminates use of tcg_const*
>
> ----------------------------------------------------------------

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

