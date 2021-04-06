Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB3F355A90
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 19:41:30 +0200 (CEST)
Received: from localhost ([::1]:43766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTphh-0001Ve-Ma
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 13:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTpfI-0000DI-R5
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:39:00 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:44754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTpeu-00059a-Pb
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:39:00 -0400
Received: by mail-ej1-x632.google.com with SMTP id e14so23237360ejz.11
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 10:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OdXIPwAKiW6hhAY0dr3OS6Usv9e+z5miiR6SirzjP9Q=;
 b=jF6ML0Y8ao6Kf9e5U9yTtUR4D0l7p0DWv73KCxWbCVmmjxHwHkwpRXs8rujOliJYty
 h451iok/NVZU4JF4kEtNMJtTdEFO3c+OLZkxJ2WSY+wPb8m+ZXaG0tyq8DyLzLHm/76r
 InxNqjy2QuC5vyqOXLykQeVWfcg0ZSHgbsdtP0poZtV2mHh9Ig4EMpTiM5PWdv9/+cPX
 LsJW1WDe0GOT8eG4WJYPZathubJTwF5jmsDpw9kFgI/oucyknV+pB1oGRlaICYzjGvmK
 BkJckR9V729/s3N2ziuBc9xhYQVjectRSJdNwFt7nh3/orLCxv4maGVWTA2UkJR2v1C/
 qUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OdXIPwAKiW6hhAY0dr3OS6Usv9e+z5miiR6SirzjP9Q=;
 b=CKUuxN0zoGeknUWOWF8dGglhs5L1syzi7jerSh70Tjh2mUBL/btYm3CmjbSoDhJYFO
 8sXTmmA2FUvM6UhRGsWYTkLdQHEnTzpH9AIaEqqveG6AXYuvhh4be070KD2ALzkBJ8uH
 ouKzaNiyXgftVUM+61eMEfl0YLyGQxcXRQBxxitA1xl+AoIW7+63iLq7OHsVwSBy9iwU
 MNHEA1flzTwVO6hDJn/T95Ta7+1tIugSxzBIEyjIviwZr/y/kCRzISZMeiBuUS4ddWJO
 X2TLrUhAOwEMQQJaQkwZkZudIcO8LNWa9ouUL2sf8YRIXsRacY4A//vHU6V3vuOXz+ji
 pq7Q==
X-Gm-Message-State: AOAM531n1JDtwG38cviyyy856cFi5y2lychSfoVrRxevfTduUVQyobeQ
 iRHHXH59OvqGay9iub2mChTlcREhMJI1hz/fkrdGjQ==
X-Google-Smtp-Source: ABdhPJyPtvW6q098I8wc6nda/KqlpLsczaXj+8/dnf1jMb/i3nyDK32fux5yjAg/Z25u2WneFH4DSgT7bB1QCicO9I0=
X-Received: by 2002:a17:906:c301:: with SMTP id
 s1mr34621724ejz.382.1617730713208; 
 Tue, 06 Apr 2021 10:38:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210406150041.28753-1-alex.bennee@linaro.org>
In-Reply-To: <20210406150041.28753-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Apr 2021 17:37:54 +0000
Message-ID: <CAFEAcA9c24M3NA8LzbDEUU==Y51LwRH5nR9bopiFNwQTwoE7cg@mail.gmail.com>
Subject: Re: [PULL 00/11] rc2 fixes (check-tcg, gitlab, gdbstub)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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

On Tue, 6 Apr 2021 at 16:00, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> The following changes since commit 109918d24a3bb9ed3d05beb34ea4ac6be443c1=
38:
>
>   Merge remote-tracking branch 'remotes/nvme/tags/nvme-fixes-for-6.0-pull=
-request' into staging (2021-04-05 22:15:38 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-6.0-rc2-fixes-060421-1
>
> for you to fetch changes up to a2e5bbf0c407a572d9b687adaecf9995f66b4cd9:
>
>   gitlab-ci.yml: Test the dtrace backend in one of the jobs (2021-04-06 1=
5:04:50 +0100)
>
> ----------------------------------------------------------------
> Testing updates:
>
>   - fix x86_64 cross compilers
>   - don't use registry for non-x86 containers
>   - add valid host types for given cross compile containers
>   - clean up i386 code16 test with explicit -no-pie
>   - relax sha1.py gdbstub test
>   - add more gdbstub documentation
>   - remove annoying warning on gitlab
>   - test dtrace backend in gitlab
>
> ----------------------------------------------------------------

The merge for this failed in gitlab CI with a weird state:

https://gitlab.com/qemu-project/qemu/-/pipelines/282228325

 * marked "failed"
 * but has a "cancel" button
 * has no "retry" button
 * has an "error" tag whose hover-over text reads "Pipeline job activity
   limit exceeded!"

Not being sure whether this is gitlab CI being flaky again or a problem
with something in the pullreq, I've not applied it for rc2; we can
figure out what happened and maybe try again for rc3.

thanks
-- PMM

