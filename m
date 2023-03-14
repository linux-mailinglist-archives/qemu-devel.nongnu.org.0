Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D30C6B983D
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 15:45:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc5di-0005Uk-4q; Tue, 14 Mar 2023 10:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pc5da-0005Tf-8Q
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 10:28:27 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pc5dW-0003Wh-9t
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 10:28:25 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 qa18-20020a17090b4fd200b0023750b675f5so20553975pjb.3
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 07:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678804100;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+IQvOUkBfYWq+jIIkK1Hgmff1AE4D6mq72WCCJQF3Ro=;
 b=xKB/F83LFITVndrvuG+x/HwosBGJNv/l0JmvrRR2vT2WWgaIUor8Q7bRUKaq7R/oUc
 5/A6RO/2EgfNCI6UeLPzdiVUODBjtgikT4rjNHtYxwsA15M5U/PUip6aPYtfzIuBhT0n
 cjEaO4/dXzwRsKunHjePSncK5/AAHwUDb7ciZ01oD/Rv/TeyAZatCyWQR1Lgnp7mi59+
 LxSCv0v1LR9rJmBwiQ8IDzSow//KvuYJJi2Onx2OhzlLSalYhmEc2D4KRfwWaomAm8YN
 VEI0LLTjjwDQ2SKZnR8oskv85OydoSvzHdMvTxgMt9Q1svP1UVAZ6fVt036zfY8LDJ61
 mcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678804100;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+IQvOUkBfYWq+jIIkK1Hgmff1AE4D6mq72WCCJQF3Ro=;
 b=3jwZhUXeeUcLbM+FONcuCdFCe+7Eu0+NUpMy8u1FGNu+OH8He8+DAUMks/tsd0brZt
 9WX5WMjsVAODtPKRVT5Wqn/H0WkMe2rzqe0EAQx+JrSzQSBbgEMrebrAIApNpuReG1Wx
 36NnKSQ5+uSY/CzizqMpFCU5uDjbs9NbGTSVPSHPtHFGrrx4tYqB4lOFfcjEw1spwX22
 OXehRNKumdlXW8NFYTENjOq9xw5eGeP/K49eNycSUwbjy33VGLdcAhbtIaF3pQIZegjD
 Otr6Faw6jiDuCxyiPy0+YyeqXtNUBOTvmKKRdW9ysD74tSkhMhAFRgs5JLPvb3CbB7lw
 pu/w==
X-Gm-Message-State: AO0yUKUEpUjoW5TLQD0Jczt8gTos5f6i1dTZUNAyP8xh19ASj4SLHG6X
 aE3Jj7PjA7xO0UJFX7vmgaA+cIHYCKNoAXxnqe0MFg==
X-Google-Smtp-Source: AK7set+iqeSZbSRyIbgQtpHnaf1OV1CTC4iTXlDxY6HOjxYJJ3ppG5y/qsh5TkEmr6XrCHl7+tpQNEFfwMUd6fptqKc=
X-Received: by 2002:a17:90b:1015:b0:23d:32f9:93f8 with SMTP id
 gm21-20020a17090b101500b0023d32f993f8mr1152502pjb.0.1678804099819; Tue, 14
 Mar 2023 07:28:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230313185903.400351-1-richard.henderson@linaro.org>
In-Reply-To: <20230313185903.400351-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Mar 2023 14:28:08 +0000
Message-ID: <CAFEAcA_ajhOgS7YyMw0W=ZbpmM1f1cvQ7J3ooWQXfKa+XVrTgw@mail.gmail.com>
Subject: Re: [PULL v3 00/91] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1032.google.com
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

On Mon, 13 Mar 2023 at 18:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Version 3 fixes a rebase error from v2 affecting ARM BFC insn.
>
>
> r~
>
>
> The following changes since commit 29c8a9e31a982874ce4e2c15f2bf82d5f8dc3517:
>
>   Merge tag 'linux-user-for-8.0-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2023-03-12 10:57:00 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230313
>
> for you to fetch changes up to 0c8b6b9a6383e2e37ff3d1d12b40c58b7ed36c1c:
>
>   tcg: Drop tcg_const_* (2023-03-13 07:03:39 -0700)
>
> ----------------------------------------------------------------
> accel/tcg: Fix NB_MMU_MODES to 16
> Balance of the target/ patchset which eliminates tcg_temp_free
> Balance of the target/ patchset which eliminates tcg_const


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

