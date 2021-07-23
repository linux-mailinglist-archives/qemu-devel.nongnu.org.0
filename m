Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3383D3CDD
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 17:54:14 +0200 (CEST)
Received: from localhost ([::1]:41920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6xV7-0003J1-Ae
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 11:54:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6xTq-0002Ba-Ax
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 11:52:55 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:46769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6xTo-0001yr-Oe
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 11:52:54 -0400
Received: by mail-ed1-x52e.google.com with SMTP id k15so2286169edq.13
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 08:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6HYceS/9YWhaPLJo2T63+HkDYQ/ITu5QlXVFuLuviQ4=;
 b=LVBzJq8ic2LN/+AtbWWX6T9zCHlhUMFQB246E0DHRUfrWx4af1yDnd6kgNmyFwom4w
 L0YvmuNMVDVDUljJpgEVO/NwtPFDZpgZLe6R/3ca2F/fC4Z1kXKuESlpV2cC8Aaec1+M
 GQzKfPsv3+0PcNLjtm5sxtukl57YdTptq3nGgX3PViEBRnDpuP6fyISzDpXsTmqcatk2
 CLt6j+gmUVaLLU4hQaG0PAkYdVbYPgYhhqwJSyda+UaTAEtRLRlKwUVICMarj5z7+bCy
 0ULH2R7ZTI2JzsKIjUi8utW8s8hscmoVDBEAej/Jkfzvxv53g0qwuoHSEs5bd2I+9f7H
 +tLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6HYceS/9YWhaPLJo2T63+HkDYQ/ITu5QlXVFuLuviQ4=;
 b=Uh+be3bQKCJ1nkNsz9Fti2XQz27zms+USM0wh1ODr1NwP+X9Ct4ESqv8s2ZKc1ShVx
 Z0Ex/lrItXvc9PGx7j5P9cUwB7OzNQzPar+Sug3MSkYO//IUL+LOr4uxEuzx4ostXdSo
 RcL8ANJIEWZJLDe83oUNe0os93eM8IoO/9wkDyu4A3wCOlYdh8UPrVPfpO7n1s969eqz
 l9vDxASg7QFVbwsNstP2RveVXxf+Znk1hCvZF3bJHdJJh05Pu+U3AsNPedNVtw2zy0Ja
 WKx13ZM9cdwZX4BvFSQAA9WdiOKmVF9JpITJ6TJ+5QjOlWmWqwd72fiTFXg9L8JfbNID
 k4Xw==
X-Gm-Message-State: AOAM532VPwNiWeJh/rU2oPsB7urTgrmZrepHAmDQAXIIYOmHFIl38InK
 7LZp4wZkseBK1u4cla3aY3YD4cEF0tV1nc9fkFgtCg==
X-Google-Smtp-Source: ABdhPJxwSqFLY6I9sazgTxAH2Y6sBX0cBM3geJsY2sXSF7fTE48YQCfXB+yCQd/rk+9vEHizjyfm3ozFYSxdC52/0kU=
X-Received: by 2002:aa7:c6d4:: with SMTP id b20mr6345003eds.204.1627055570396; 
 Fri, 23 Jul 2021 08:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210723100137.978910-1-pbonzini@redhat.com>
In-Reply-To: <20210723100137.978910-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Jul 2021 16:52:08 +0100
Message-ID: <CAFEAcA9oS3PNysRTDcOA=Kww-_8ouJiG-5+CRqd4otiVWtrvRA@mail.gmail.com>
Subject: Re: [PULL 0/2] QAPI/QOM bugfix for QEMU 6.1
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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

On Fri, 23 Jul 2021 at 11:04, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 143c2e0432859826c9e8d5b2baa307355f1a5332:
>
>   Merge remote-tracking branch 'remotes/maxreitz/tags/pull-block-2021-07-19' into staging (2021-07-19 19:06:05 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream-qapi
>
> for you to fetch changes up to 2f164a6c5e4a9e24a6d33fcd680f322dcf53a44e:
>
>   qom: use correct field name when getting/setting alias properties (2021-07-23 11:57:15 +0200)
>
> ----------------------------------------------------------------
> Fix for QOM alias properties (e.g. -M pflash0).
>
> ----------------------------------------------------------------
> Paolo Bonzini (2):
>       qapi: introduce forwarding visitor
>       qom: use correct field name when getting/setting alias properties

Hi -- could you check whether this failed gitlab job for
build-oss-fuzz is valid or just another flaky CI issue, please?

https://gitlab.com/qemu-project/qemu/-/jobs/1448031475

The backtrace showing the leaks seems to be in the new test case
added in this pull, so my guess is it's real...

thanks
-- PMM

