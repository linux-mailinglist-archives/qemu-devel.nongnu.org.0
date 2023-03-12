Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5774D6B68E4
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 18:43:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbPiA-00049F-61; Sun, 12 Mar 2023 13:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pbPhz-00048i-3U
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 13:42:11 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pbPhw-00013p-2o
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 13:42:10 -0400
Received: by mail-pg1-x52c.google.com with SMTP id p6so5720349pga.0
 for <qemu-devel@nongnu.org>; Sun, 12 Mar 2023 10:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678642926;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0wqL5N04d+Rk0mzDJgomR/W3wBjatARZDEh+Btxpf1o=;
 b=S7S7bj0qgm+NGp9ABsYNNtlsLtZUF98qfKbsCbCFFyYTj+wDGgSG2tP0jqQT1uA74y
 cSvc8R7eEusv6rhEWfewY0ZkjLc14QAYLvEI++OqWTLCMPyZz0KSjln45nPSn/NGt67v
 CkARb5n2ChxBEdArM8MEs98ZOV1+OOPikxt1qS3j1n76CVpJ6Qf12xMHSZ81AtR4d4TZ
 k3pGjKgMsk+4MBV+mKKC6h1g/aSnldM6uuFPdutF8kyJePhUhGCjQV0uqVVrd6gF8prb
 x1oYpMAWSJ5vhoq4m23irJzcUmJV2BFTMLq/Z05USYS43w7HgJaARScqnZQBnYPZRVeJ
 PFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678642926;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0wqL5N04d+Rk0mzDJgomR/W3wBjatARZDEh+Btxpf1o=;
 b=ZT1j/U2tBynYuD80+SoPzR6eG/87G2gb/NBmIBm7s4EMrctlpvCpdr1qzk8numm/f4
 TGO9XV/CEhUzye73vbcqXRC0of2HM8/gBcf2d9inw9ij1oR7nQzNJq7r7OsMs0Jc7tvI
 vCk9qMOQgtspzCvo2eF3zmwbtGBYcHZH95n+WRBA2hnNUGZhPp9QZqPoBx2FFnIjNAhN
 2n+GqRpUX3YDvlDI+4AvkXO/jsiCHbsf3zlEYmBjkfd0ZxPlG6HbyWup52Sv7TXyw7WK
 UpatfFjUJwWjZ1rQ+Z+oTpd5qq6vKjyz218T7HkQfMXWGIWn5j/Ya8Nvqff2rx2/yfiA
 Y28A==
X-Gm-Message-State: AO0yUKWy8QOieQyHlhe/PiNMCKkXwqtUq1DfwTsfShVLyPAcvro4IWGK
 6gVhNt3obayP/gy44AGdeaRSSdPuvp8Faayzhv6XkA==
X-Google-Smtp-Source: AK7set9l9wsb6vXRJji3IxmfIQQiuF66vOSJMa3NurTVFge8YbWP18wO5BeaeKwt7FcWzv1YwBaaoqInC2q+n+x/UEc=
X-Received: by 2002:a65:6944:0:b0:502:ecb9:4f23 with SMTP id
 w4-20020a656944000000b00502ecb94f23mr2711330pgq.5.1678642925997; Sun, 12 Mar
 2023 10:42:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230310175529.240379-1-kwolf@redhat.com>
In-Reply-To: <20230310175529.240379-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 12 Mar 2023 17:41:54 +0000
Message-ID: <CAFEAcA9MJZnNy4OacSpJvy4wyaQUecMtPwRUK0fnXEEgmM6PoQ@mail.gmail.com>
Subject: Re: [PULL 0/3] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52c.google.com
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

On Fri, 10 Mar 2023 at 17:55, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit ee59483267de29056b5b2ee2421ef3844e5c9932:
>
>   Merge tag 'qemu-openbios-20230307' of https://github.com/mcayland/qemu into staging (2023-03-09 16:55:03 +0000)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to ecf8191314798391b1df80bcb829c0ead4f8acc9:
>
>   qed: remove spurious BDRV_POLL_WHILE() (2023-03-10 15:14:46 +0100)
>
> ----------------------------------------------------------------
> Block layer patches
>
> - fuse: Fix fallocate(PUNCH_HOLE) to zero out the range
> - qed: remove spurious BDRV_POLL_WHILE()
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

