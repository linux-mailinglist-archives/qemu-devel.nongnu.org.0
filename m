Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 501AF38E990
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 16:48:56 +0200 (CEST)
Received: from localhost ([::1]:52124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llBt1-0008PR-2r
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 10:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llBrt-00070T-Ni
 for qemu-devel@nongnu.org; Mon, 24 May 2021 10:47:45 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:38741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1llBrq-0006mI-CU
 for qemu-devel@nongnu.org; Mon, 24 May 2021 10:47:45 -0400
Received: by mail-ej1-x62f.google.com with SMTP id i7so24373642ejc.5
 for <qemu-devel@nongnu.org>; Mon, 24 May 2021 07:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NnEZV7wWGWlABxHYT8ZhZPJKSOBpRftOMTziBnOfUo0=;
 b=u2eE6b4Q27MOlXEypIbeYb4jN1j+SF+7o4ztoC8zU63Kv8k8LWL9ggl/hUaS6RGjdV
 osbP6SM6lvYrLZOPpthDv7HL/NTQnyt9mB8YVppWUQiKEWppF4a4niAhns2LYUXM33Fb
 dkXvdaEtJNRCWo/ygRACfat6jCpcrL7Sgc39imCgLPZtRGIxbyS7m9kWrF4kaP4e4m0U
 OU2Tgih7LrMnvEELAUGFm40QFGmR9BHuIB4qxa1bxaCs0Lw62J5wpV5f5QJKBLLnD5y5
 5vz7XRNtU6nifWzjjamIscG69i3iBhdahHrWkK14BPigULut2VcO1cwUaxCXTfx7SjQ1
 isMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NnEZV7wWGWlABxHYT8ZhZPJKSOBpRftOMTziBnOfUo0=;
 b=An5TwZXpf0DEfmUt22+Z0p3R8BIGaICYAinVgyrB52xGtGKPtHyrvMqOGyd18+8oMv
 VEW39HYw0Mt+M7jRMHMGWpIk8dgDkp+exm5OvDO9KnORZY+Qyl0JyfzwWs5PCggfm4dx
 ToQd9mhsh/WyUpmLNi434rQJfUlukFYW+bliBtwaLRxNLQmpGiuVaTo1MLLkav5EqRW/
 /u52gxHKjeZ8o+pusARToHhE3WSGAA1spjNyFMgt3bfw4ysUjq8PZGmaCa1+2y47KL7G
 mnMQ4SdwYaXUWbuF7e5jTi+3ZZ+VC9CN0exA1M+fJzOO6xVhExu04E5MrS/YYCR2jeaJ
 Da/w==
X-Gm-Message-State: AOAM5337WqlihBr6dEJXNfWXU/YS3OHA5Vsw89d2yUA/iRVVfpe27V2C
 eaTdsYjlMY59Ge0JTQ9SDVRgQRPxrgFFpEBfzFXFpw==
X-Google-Smtp-Source: ABdhPJzOY4YFpXSLaSqCQI+mY4iqRfBe3Tp+vEpLsZcHKu6NtSsOE60Zs6PeTCY7Zm3R+nP752/0L4ZuY690ipYDWJE=
X-Received: by 2002:a17:906:b74f:: with SMTP id
 fx15mr23869874ejb.85.1621867659946; 
 Mon, 24 May 2021 07:47:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210521140334.16786-1-jcmvbkbc@gmail.com>
In-Reply-To: <20210521140334.16786-1-jcmvbkbc@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 May 2021 15:47:17 +0100
Message-ID: <CAFEAcA9BckaUvaYC0658HbNdJ-k29=2UYB=FW1-L4Om7qMUHVg@mail.gmail.com>
Subject: Re: [PULL 0/3] target/xtensa updates
To: Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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

On Fri, 21 May 2021 at 15:03, Max Filippov <jcmvbkbc@gmail.com> wrote:
>
> Hi Peter,
>
> please pull the following updates for the target/xtensa.
>
> The following changes since commit 972e848b53970d12cb2ca64687ef8ff797fb6236:
>
>   Merge remote-tracking branch 'remotes/cohuck-gitlab/tags/s390x-20210520-v2' into staging (2021-05-20 18:42:00 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/OSLL/qemu-xtensa.git tags/20210521-xtensa
>
> for you to fetch changes up to 583e6a5f55d4b02f04eda0cd70bf7b7701a08450:
>
>   target/xtensa: clean up unaligned access (2021-05-20 13:02:58 -0700)
>
> ----------------------------------------------------------------
> target/xtensa updates for v6.1:
>
> - don't generate extra EXCP_DEBUG on exception
> - fix l32ex access ring
> - clean up unaligned access
>
> ----------------------------------------------------------------



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

