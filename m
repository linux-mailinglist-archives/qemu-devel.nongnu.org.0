Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B206B5E95
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Mar 2023 18:18:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pb2q6-0007dO-Cb; Sat, 11 Mar 2023 12:17:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pb2q4-0007dE-Q4
 for qemu-devel@nongnu.org; Sat, 11 Mar 2023 12:17:00 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pb2q3-0001sq-5E
 for qemu-devel@nongnu.org; Sat, 11 Mar 2023 12:17:00 -0500
Received: by mail-pg1-x532.google.com with SMTP id s17so4786466pgv.4
 for <qemu-devel@nongnu.org>; Sat, 11 Mar 2023 09:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678555017;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=E/cvnx0M8KQYHY4wiCvCJMC37JjRbC9fED3iSfi0TTs=;
 b=M9kPn389dnpwsdr67fCNPw4EQQwRbBh+FyqBNrhCW0u8eYEAqbbwzg7Hfqad72en+1
 F8Gzw5lObaB7isFMtOGuyQXgcoSwpMWjM2UtFul+/rK0AJqSeyOKHbsiYbFcY5ZATqbU
 i+IlQJarWnLtmg8p+ZvFlQJ8sPywyitUmaaXDuyTgdJNyzYTTp6HjHhL5YTO6/k/ArfP
 Tb60wjNiJgbyKZj5d2FnCtg68WgSxUxRZ50/yWFii/ZMKrw8c3zpXQNlkQoi86Vsft3H
 6md+T4kIMgdVp7MEMrIHS3rRNzb2lprJXWX/HIfjBYSSdY0v5lMNy+WD+U0QnXRfSXlB
 TK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678555017;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E/cvnx0M8KQYHY4wiCvCJMC37JjRbC9fED3iSfi0TTs=;
 b=jgCLXkyi/ukRgYpxi3do+fmicC7BDXpmRpZhndvncHEtCCmfD1mOetfHO13rXkgoZU
 q+ke5Qa2ok19BN8l8LxHkq2ldjcgzQGyAhTtBOHywxEuAacwkWCRjVoG5ULtmlsVuQPr
 poyMfke/9wVcW0XO4wx6de0RA08zDC2YH0IDjPGqrOl3OjKK7yjgBdvlDerCtlYOkOfN
 CsGrMr0r2tpUPOjLYkR0SmQuGCEYAd1iy0F8ejLgj95h7sNVEmx/fCwQ1upsMu0ZI69E
 zHTRTcAWik908D6MEXfNrdUefxtZFpm2UYqM/aEU7Pxe8P4t6f81D9kquqMY8XVtzMSo
 mbDA==
X-Gm-Message-State: AO0yUKWEaYRoZiMjFy4Mu3FW0iyXkdRhnVif5OUtKDIRYcxCguoCKrFV
 V/puDjKxTIGt7eiuNE2HWMUwgBbNsHxZSaqgHFYfnQ==
X-Google-Smtp-Source: AK7set9WCdiS+LSxBySBSLJknuurHI5eGOrAvmbVCntjwxvXVJYVqzxfervnxYwhmQ/MrTueofdYoQD1KUI6piOxVpI=
X-Received: by 2002:a63:5508:0:b0:502:fd71:d58c with SMTP id
 j8-20020a635508000000b00502fd71d58cmr10494121pgb.9.1678555016855; Sat, 11 Mar
 2023 09:16:56 -0800 (PST)
MIME-Version: 1.0
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 11 Mar 2023 17:16:45 +0000
Message-ID: <CAFEAcA-u3VMdJF=UwN8VrXcvztvr9Zpa4qevBKrwCiS7CsHTJQ@mail.gmail.com>
Subject: Re: [PULL v2 00/91] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x532.google.com
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

On Thu, 9 Mar 2023 at 20:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 66a6aa8f9a56a6317e074b1f5e269fecdf4ad782:
>
>   Merge tag 'vfio-updates-20230307.1' of https://gitlab.com/alex.williamson/qemu into staging (2023-03-09 15:19:44 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230309
>
> for you to fetch changes up to 29fc660789547ceb5d6565e7fc39d8c1f65dd157:
>
>   tcg: Drop tcg_const_* (2023-03-09 11:55:56 -0800)
>
> ----------------------------------------------------------------
> accel/tcg: Fix NB_MMU_MODES to 16
> Balance of the target/ patchset which eliminates tcg_temp_free
> Balance of the target/ patchset which eliminates tcg_const
>
> ----------------------------------------------------------------

This seems to cause failures in the avocado-system-debian
job on various Arm boot tests. Failed on 3 retries of the
job, so it's not an intermittent:

https://gitlab.com/qemu-project/qemu/-/jobs/3913509263
https://gitlab.com/qemu-project/qemu/-/jobs/3913982271
https://gitlab.com/qemu-project/qemu/-/jobs/3916177988

-- PMM

