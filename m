Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C903C3F80
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 23:24:03 +0200 (CEST)
Received: from localhost ([::1]:41048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2gvi-0005Sz-Sb
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 17:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2gsc-0000wE-Ub
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:20:50 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:43636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2gsb-000631-0E
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:20:50 -0400
Received: by mail-ed1-x532.google.com with SMTP id l26so15960246eda.10
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 14:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LpZV3fun63v2eOatoraszDgm/Jvu1rtiTMMVxKPews4=;
 b=wRizJfPVD8yOcXE9GL737pfukGwztFM7GuI/B+3Zpg7I3FPwdbBm6Yc1luTKsd07SD
 Lmm8TOaffph2c3AHXIwJi7El366ss3g6Uhzp7qRLo2ROlz9LUeN3ulX4x9oMSw8gTfaT
 YY1D1KpvnNO1uNOq+2KOUIjdQyqBlaY0ubKk4Lfw0zkGKsAsD0uHORCnFNqtNkAyDOLB
 sRUq87dHDL60BXNo3IQMItYnCj4lfVLMtrSSdFSIj0gCYe7YyPUk+agoTigLkvgGFNYu
 qKgeooEF4/Hh+Mv5G26HZ/1ZT6CIvPY033LBWtWRZOxMvcm+G0lAF1PFkX5tMAnomWE7
 H4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LpZV3fun63v2eOatoraszDgm/Jvu1rtiTMMVxKPews4=;
 b=Puz5fcVNf+G1gktVbvBD2dJUt/43T0XNzY71YoY3yF+bAxIThQNfKEVBwom54tv9xM
 mXS4vl7iAWS/vieBFC6xJjACZ+PnVHCroN0ein3wE8SimO5Scy51nSXN/jG+3Fr2b3vh
 6w7yDwz8MwDdcYzdmWYr7fnGJ8WYwUZHozD+zm4xlK9exjB+Y4OCI1MY32wHeP/Iaq32
 pKoolobqgT8SD6USWS/547Cx3zsycBwq2m7+wXfzk8V0PhabQ1xWTXqTHr+cmdQ5SmKt
 n3LfK8LASxziDJh8H5SlKlD4u72p+JrGZV8ccvcwGFis2CgKklG+Sm6NsiNCTWSQGMaL
 8AdQ==
X-Gm-Message-State: AOAM53335rEL+nEvGvOEXdSJfnaPL/y2ZTCIIwLFrNGrw1jiY+VLjMIo
 pr59GhC4WmZMCbLeSgiUD1oPXF9IpH02q30xNJqp6Ah2BSCg3g==
X-Google-Smtp-Source: ABdhPJxFiBLELVmQaiK+Zr7hVQqkw6rMOWs2Kqfr9HTK/O9G1Ar9fWDAGov/hqiXKeo37ipe/+IAsr76wS+TvRpevPM=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr59366726edt.100.1626038447404; 
 Sun, 11 Jul 2021 14:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210709202824.578187-1-laurent@vivier.eu>
In-Reply-To: <20210709202824.578187-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 11 Jul 2021 22:20:08 +0100
Message-ID: <CAFEAcA-W0CJzxnNT8XfYRxNqhOoPzwpi0Kc8j4qqtS+u=Ek9aA@mail.gmail.com>
Subject: Re: [PULL 0/9] Trivial branch for 6.1 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 9 Jul 2021 at 21:32, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 05de778b5b8ab0b402996769117b88c7ea5c7c61:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-07-09 14:30:01 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-for-6.1-pull-request
>
> for you to fetch changes up to e28ffe90fde5702aa8716ac2fa1b4116cdcc9e61:
>
>   util/guest-random: Fix size arg to tail memcpy (2021-07-09 18:42:46 +0200)
>
> ----------------------------------------------------------------
> Trivial patches pull request 20210709
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

