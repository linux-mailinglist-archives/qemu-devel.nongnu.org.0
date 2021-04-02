Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B203529F6
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 12:54:49 +0200 (CEST)
Received: from localhost ([::1]:35466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSHRw-00047f-Nm
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 06:54:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lSHQW-0003Ls-J1
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 06:53:20 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:33484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lSHQV-00020l-3X
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 06:53:20 -0400
Received: by mail-ed1-x536.google.com with SMTP id w18so5113049edc.0
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 03:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MkexkkyY5ycmEsulYBWc68OAUWd6GltXad6DFiPwqII=;
 b=kESPAjfmTKKWOJzXMh9SuBHdLf8J0NBywjbzvf5O9rFYg4FVAuFnxZyjUuX/zcYv9s
 QWsJL+bpvTjFDtwOCnx8pv+HtpedkM6RqStfqvoEetKThvZ9yoICmw3krmbewAV32hWK
 VY5eCX0dWInaoLQBW2k4falj0sCoFwx6JuBefC2XKVo9db36KU0VNWsVq1AXCf8lI9pu
 1bfxUhMUHRlVeea5mp+Z9luo64jTvoQyvgbYoMTkL1YHryj7KqnfR6q1MxBmRJhG8uOW
 nbosuqrmUl9XdGN/kT7trqQQWqvTzFAPsSC8K2VgQaIAIfebAu6eTAU6aRzZhFzq6yId
 Kb7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MkexkkyY5ycmEsulYBWc68OAUWd6GltXad6DFiPwqII=;
 b=WDPT1nwF8wVRAtMaCrpB804zd/Wa5UWIcQJT95srL92wO9M5ywZ+WgL1nB7Vl6z6dm
 xC1ecIc5b/OOdn0siKKKeFUI276PztSsnAB0JWcRX6UHTOimUx27MspgIbPlVD1lLrfI
 nBOI85GDxQUEsi6MhF0WpZvxIG+PgaRooeR3bIH+4RG7Iutz90/Af3jv+IEdgXxzdtzJ
 Jvjam71+CwcUCu1xLhI3tRwbGIHCnoqWSxSlC/M/91tIKgYSxb8MFLyq6O/c6TLBKldb
 OSI65jDKlYSi6Z2kcCq7wrnEPzMOB1bArWZM7Xtiv8F5OB3iqjd7TUA9qYo2MbOLrSDB
 qKHA==
X-Gm-Message-State: AOAM5320kkFHXun74hK5FbySSHMBlkRAAZ4INO3GnZahIp/jUes9ZDbd
 /elqwEhJJljDadcFzy1emCqRVAIQRwMGhlyIJ/migw==
X-Google-Smtp-Source: ABdhPJzKt3tcWz04mJffZ+a45E90jndOykB0XvVuFQuBCdzNZ2Y4HbMdbT2iU5tdOp+7P2SGu6aqUw/3hsiWthV28fc=
X-Received: by 2002:aa7:c804:: with SMTP id a4mr14498006edt.251.1617360797592; 
 Fri, 02 Apr 2021 03:53:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210401131220.3252320-1-thuth@redhat.com>
In-Reply-To: <20210401131220.3252320-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 Apr 2021 10:52:43 +0000
Message-ID: <CAFEAcA-urh5b7XvGoZrQd0QFRpODJMd_5me7GQ3skFmLo_xR+Q@mail.gmail.com>
Subject: Re: [PULL 00/13] Updates to MAINTAINERS, docs, and some small fixes
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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

On Thu, 1 Apr 2021 at 14:12, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter,
>
> the following changes since commit 6ee55e1d10c25c2f6bf5ce2084ad2327e17affa5:
>
>   Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.0-20210331' into staging (2021-03-31 13:14:18 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/thuth/qemu.git tags/pull-request-2021-04-01
>
> for you to fetch changes up to ca89d15f8e42f2e5eac5bd200af38fdbfb32e875:
>
>   device-crash-test: Ignore errors about a bus not being available (2021-04-01 14:28:39 +0200)
>
> ----------------------------------------------------------------
> * Updates for the MAINTAINERS file
> * Some small documentation updates
> * Some small misc fixes


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

