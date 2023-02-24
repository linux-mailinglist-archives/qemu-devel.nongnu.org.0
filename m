Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 132296A1CAD
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 14:07:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVXlg-0000GO-Jc; Fri, 24 Feb 2023 08:05:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVXle-0000G6-JP
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 08:05:42 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVXlc-00056M-Uz
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 08:05:42 -0500
Received: by mail-pl1-x635.google.com with SMTP id i10so7785551plr.9
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 05:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=E2+0ffYUsy1JRS3Kw8JnHSDxVCeNSaCEMIPsH4R7P9U=;
 b=N/Yt1BPe/EyK6B2bHDwWMNBF57yEPgH/pBaM9gcQEuc9rmR1g9Ce8jNsVPEF50UwjZ
 /gkssoedLjnjaUXniYIvLIdkSunUEm7CvCJZyWVLxbKn++QnrYHArSUQLhchCqBqIvbo
 JPDL26HQRSdSrNoQIQ+LdYvl6MbMHkJ/6ILK91TYM/9WU19XIDCSYEtURXwekfxbx2vG
 pjvQZU7zJdvJvVQrxjzeh0xJKeMlkmyCeP0TeWK45CVNcEkUkw3ZhxhQfQ1pofpV2/LX
 nQN3sKwbomyh0w6VIUQyr24NBUV3W6M091GxZLMsF/e3zgFFC1RQOFRlrdq4+jWrcuR6
 heyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E2+0ffYUsy1JRS3Kw8JnHSDxVCeNSaCEMIPsH4R7P9U=;
 b=MC6+krhdmlIDbLjCxr61ZAvGYeEPMfz6AxoPgHGU2qIRiek7tiy0jHLhIFYmzMPQnq
 HrrRbQKtKArNS8ZQKd1egtcMTcm98bo6xCyFydWjPg9+tWWk4Jj/2jRS1e6lG6dyTBNG
 VxU/oJ3AZ6B3FDi0Au7m6a93fA5FdOgGUrRcHMTjwdF/3yuAXoxyEoIx3KlPCHa5DQn4
 vPyThLoTIWX2aXyUrahXlzvvW1V9noZteLwSWPivTMNIDOGgvpzHfCIcv5j15wotzghK
 6RjN8zcZ4F5y9kWiOCjLf0qgssecgT0H73gDRWsHRTWrD5+JP1wws4DRy8rDkjH5wbhq
 FgRA==
X-Gm-Message-State: AO0yUKWcnuTgJ/GPxi91aje8QawksE2ZJoE4RFv5k9ZyWkD2KseucRY/
 dkvZaTKQBoIGH2R4xcIIaKG8ebQjfO3EP2YtX/F9rQ==
X-Google-Smtp-Source: AK7set8cwH6c5+XsqJfmMdL6Qzj9OV9LQbOrStA+eJ3YeFwuGYtRojnnfLJfz8AlmwVtctQ9flLkLRi3EidLC/giiDA=
X-Received: by 2002:a17:90b:3c08:b0:237:ae7c:1595 with SMTP id
 pb8-20020a17090b3c0800b00237ae7c1595mr124676pjb.2.1677243939175; Fri, 24 Feb
 2023 05:05:39 -0800 (PST)
MIME-Version: 1.0
References: <20230222020023.904232-1-richard.henderson@linaro.org>
 <CAFEAcA_=fpkexhW9F9PyMNcVbg5nM_ecOCwH=FvJVq68n7Zm7g@mail.gmail.com>
In-Reply-To: <CAFEAcA_=fpkexhW9F9PyMNcVbg5nM_ecOCwH=FvJVq68n7Zm7g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 13:05:28 +0000
Message-ID: <CAFEAcA8jxu_sCU_VhzXwzPY0EFTq+BJtXfbVK5PiH2_qnRK4=A@mail.gmail.com>
Subject: Re: [PULL v2 0/8] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x635.google.com
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

On Fri, 24 Feb 2023 at 12:46, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 22 Feb 2023 at 02:00, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > The following changes since commit 79b677d658d3d35e1e776826ac4abb28cdce69b8:
> >
> >   Merge tag 'net-pull-request' of https://github.com/jasowang/qemu into staging (2023-02-21 11:28:31 +0000)
> >
> > are available in the Git repository at:
> >
> >   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230221
> >
> > for you to fetch changes up to dbd672c87f19949bb62bfb1fb3a97b9729fd7560:
> >
> >   sysemu/os-win32: fix setjmp/longjmp on windows-arm64 (2023-02-21 13:45:48 -1000)
> >
> > ----------------------------------------------------------------
> > tcg: Allow first half of insn in ram, and second half in mmio
> > linux-user/sparc: SIGILL for unknown trap vectors
> > linux-user/microblaze: SIGILL for privileged insns
> > linux-user: Fix deadlock while exiting due to signal
> > target/microblaze: Add gdbstub xml
> > util: Adjust cacheflush for windows-arm64
> > include/sysemu/os-win32: Adjust setjmp/longjmp for windows-arm64
> >
>
>
>
> Applied to target-arm.next, thanks.

Whoops, wrong canned reply again. Try this one:

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

