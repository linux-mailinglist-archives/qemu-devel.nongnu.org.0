Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FDF2F9F0F
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 13:06:35 +0100 (CET)
Received: from localhost ([::1]:44094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1TIn-0001EL-0O
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 07:06:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1TGN-0000DP-98
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 07:04:04 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:35674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1TGD-0006AG-Ir
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 07:04:02 -0500
Received: by mail-ed1-x530.google.com with SMTP id u19so17303050edx.2
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 04:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/wyUQ1WB7+0dZ2c02C5Y19LYt30m6p55ELFNNDFUfo0=;
 b=V7eqlOmflx6Hjr3Mk8/CZf8/wJG/kOdmnSYmT2xzLEDS5VlxiyiInwBIjRae9Ilrbv
 +hUKDHeh1OX0F49ut/UNf11371pm08xnRD+PJ12VEVD/Ani0RFrkUq4fnRBbsQqHFH/J
 hgDMtnYqybhiDu7Eh9YF9tCgfohY2uVr4N+fY1iuQ4B9uQmVoGIURVbghT4Yb9w7F4VA
 jRub3pXxpCxl8wUxcXrisJPzl8KdB8nTESRnctWsNdi2z7orU5F9R/8KeI9XlsR8L2Dn
 7rnUVxKVuSPi277stSZ4WMDpSZ7PYOTFaa9pQhg4st0QJRucLrz/tDR+4ZxsD9sWjOUe
 3gzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/wyUQ1WB7+0dZ2c02C5Y19LYt30m6p55ELFNNDFUfo0=;
 b=t4jeM3NAA5fh1JuOz7q62JAf9Sd+xU5z1rVRsp7yr+tANsk/OrIJ/WdQwe+5TmdcCk
 j2JBXXVvI5NKUYuNKzrANWa47NmjpWuReyTrPbZfLttzTcPy80ZC/0Wd/1jG9KKgTxY3
 5CHfXQafR0cSbeh24Lqq79bDByyMPwEcD2Yha3dWmlBonjtalBr1N+hGMGY1dZDiV5do
 pHrNf1P29FRU9EMeBSQq+PhKJr8cJE6mlKS/iVTQzp3oY7zix1ax6XkJoCw/nmxyVeb7
 TX8hvOjC9LxY7uQgMbV/WGmL7MBbzC+PK1R/A2+gix+Et/0jIB3oN1aiN6IDcLIetruo
 pgYg==
X-Gm-Message-State: AOAM530AJlHAzbt4LeGKs3cW2zZnBFiG66aLorKdEeJ3H+xwEm+3SBVi
 6pjnLOIthngkFB/NfIuDYC/mEp2EaShFOObPpAXQdA==
X-Google-Smtp-Source: ABdhPJwg5Br7IEt+Zf4PuuVUvfd6Y5SbBpD4d7/+W3KqitwfoHtVVHYXzf8Do9MC2TQRx95LL4Qmtof3ZnSPGFtuII8=
X-Received: by 2002:aa7:c88a:: with SMTP id p10mr17103307eds.204.1610971430740; 
 Mon, 18 Jan 2021 04:03:50 -0800 (PST)
MIME-Version: 1.0
References: <20210117215403.2277103-1-alistair.francis@wdc.com>
In-Reply-To: <20210117215403.2277103-1-alistair.francis@wdc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jan 2021 12:03:39 +0000
Message-ID: <CAFEAcA8joExf3krBSXEacPOUbwgQNRPHnJFAVFdBrfkmapWS_w@mail.gmail.com>
Subject: Re: [PULL 00/12] riscv-to-apply queue
To: Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sun, 17 Jan 2021 at 21:54, Alistair Francis <alistair.francis@wdc.com> wrote:
>
> The following changes since commit 825a215c003cd028e26c7d19aa5049d957345f43:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/audio-20210115-pull-request' into staging (2021-01-15 22:21:21 +0000)
>
> are available in the Git repository at:
>
>   git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20210117-3
>
> for you to fetch changes up to a8259b53230782f5e0a0d66013655c4ed5d71b7e:
>
>   riscv: Pass RISCVHartArrayState by pointer (2021-01-16 14:34:46 -0800)
>
> ----------------------------------------------------------------
> First RISC-V PR for 6.0
>
> This PR:
>  - Fixes some issues with the m25p80
>  - Improves GDB support for RISC-V
>  - Fixes some Linux boot issues, specifiaclly 32-bit boot failures
>  - Enforces PMP exceptions correctly
>  - Fixes some Coverity issues
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

