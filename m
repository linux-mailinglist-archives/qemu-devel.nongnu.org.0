Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25187319350
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 20:47:09 +0100 (CET)
Received: from localhost ([::1]:51278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAHvf-0005VD-Rl
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 14:47:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAHWx-0005wg-U1
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:21:35 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:45087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lAHWw-0004dp-4P
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:21:35 -0500
Received: by mail-ej1-x62d.google.com with SMTP id b9so11715391ejy.12
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 11:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ciCteZihh+vypElhB38QwYOFaayY7TinZ0tFmoRAY7k=;
 b=yupCbxN17xyE62G6Xow8Xmb+CSmd63YrCqMMrNuoQ3lNTf+iYu2zW8H00q7Fyr4RLU
 MOgovYq7MvmijHVaQvFwaLSM1/GCVFOfLUPD17uME5M6noL6bkaJg66kO9qqmQohSUsV
 gJOT9m+DUjwZdDuzExlVCWC5RQkw8fENl2eicKjx9Ju4tyYj5IAJdJCfqP0XalcNBs+3
 K0GYEd5Z2knm0NQyZvPj4Wx5+7gOMbtowEth4TftC60OHSPFXGta6hXuB3b0G6TVgDcp
 VB49hkW1lOwA+Qq8HR38CvM4xAcmHgNgpqyBMUuXzQMMcs31zuteQ4I29X+DfldrXJMx
 bAtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ciCteZihh+vypElhB38QwYOFaayY7TinZ0tFmoRAY7k=;
 b=RB7e1gzuADZY88pgyika86jX8eKfVKXzWTzADQl+vcpl2eXmWT6WGbexXEACuZbVe2
 /XCzOqW1sDzLxH8ChiQmbHX223uOXA8qIIf45U6/FuHMPobJLMrrKZo6m1OAjcSs2bMk
 EYuFHCVucz79tf2aMWmNM3UE7+XtZ0IACDhArYW8qTghocLhgSfteedC8CRMyx8t/2eQ
 lLxUkP99KRtaaW5bJLHBespt/0cqC7UBOztgvuoXTk9Kq50OCFIoDI5P6ptfYfbwFSp9
 YXHoLdLMtJbVKDDN9DmLfR1cBKEM/3rojWmKWUDuNnWu24nlb2DJr21PmFFuC8AyO85+
 Ifqw==
X-Gm-Message-State: AOAM533kMWNKQbo4ZQUwYqnKv3MGKL5u+xxWcDvWzRGM4yYFHWFGjkj+
 SnA3d9uqqvHWbR64jZ5N5WPG0T9UaUI/9j9Xu/6d4oEjYOk=
X-Google-Smtp-Source: ABdhPJzKENIVVYxyYcYQFpfLRPOuiZDciYmEqvEizL4RP4na62nBLVQurODKEkmIl3smkOW6fry5tYGc70QfcXNAuRQ=
X-Received: by 2002:a17:906:b4a:: with SMTP id
 v10mr9641939ejg.382.1613071292330; 
 Thu, 11 Feb 2021 11:21:32 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8z=vQ9E6hNKUuzk2EgH8Dpkxo=3YbnQ5iX0DYCQDr6bg@mail.gmail.com>
 <CAFEAcA_S81bnYVcNENW9bFApAc-Ob1uKQncsGPmyFD034p2FOA@mail.gmail.com>
 <20210211172541.GA2316309@localhost.localdomain>
 <CAFEAcA-3M_CaNEiZHohH-RdxYP1Cn=5s+UXYTYE1e7YhoN2+tg@mail.gmail.com>
 <20210211184710.GA2323314@localhost.localdomain>
In-Reply-To: <20210211184710.GA2323314@localhost.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Feb 2021 19:21:20 +0000
Message-ID: <CAFEAcA8twaP2=MGZh1OOHO8EFAVmQYM26i+QN6y26kaVfTNnwQ@mail.gmail.com>
Subject: Re: runaway avocado
To: Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Feb 2021 at 18:47, Cleber Rosa <crosa@redhat.com> wrote:
> On Thu, Feb 11, 2021 at 05:37:20PM +0000, Peter Maydell wrote:
> > I wonder if we could have avocado run all our acceptance cases
> > under a 'ulimit -f' setting that restricts the amount of disk
> > space they can use? That would restrict the damage that could
> > be done by any runaways. A CPU usage limit might also be good.

> To me that sounds a lot like Linux cgroups.

...except that ulimits are a well-established mechanism that
is straightforward, works for any user and is cross-platform
for most Unixes, whereas cgroups are complicated, Linux specific,
and AIUI require root access to set them up and configure them.

> We can have a script setting up a cgroup as part of a
> gitlab-ci.{yml,d} job for the jobs that will run on the non-shared
> GitLab runners (such as the s390 and aarch64 machines owned by the
> QEMU project).
>
> Does this sound like a solution?

We want a solution that works for anybody running
"make check-acceptance" in any situation, not just for
the CI runners.

thanks
-- PMM

