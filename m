Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F27340844
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 15:59:19 +0100 (CET)
Received: from localhost ([::1]:51372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMu7J-0004Vw-Rb
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 10:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMu62-0003lQ-5J
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 10:57:58 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:37814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMu60-0003nf-7s
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 10:57:57 -0400
Received: by mail-ed1-x536.google.com with SMTP id x21so7037545eds.4
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 07:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4L28hAsEt86QL8azB/6YxMmDIXZAXnHdQqU7ix/ZzQw=;
 b=swlVfkj6AT0NHhp4v/Xk1Lz5NzohRysO4grgSc8n7twO0q+aSnjmsN7RMa5UeUk0Fd
 rD/B3x54ww0B/fqj5Mn2OIe7ZdTMdPpMNdh6pjbY5fjgUhkWy+Lb/17or2XiN2yau6M0
 djX1BJ/jBQ8FjWZf5I3mJryu/hnBI54XuMTkUSxX/77omXNcp0IhxTuLPA13d4dboO2O
 JOo4BXg0sv3qSMZwpYCarvfO+9amI9k8DwE+NLWiDveelaJZ8XAP8rwDZdQ4Jhn7wK2u
 q/doiOEeTUdkoX/k5/fiAk8XKjFiD1vXBZsKmhxJEN1aM1XoyJNZLIhNQF9zXdmZ97w8
 zaig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4L28hAsEt86QL8azB/6YxMmDIXZAXnHdQqU7ix/ZzQw=;
 b=LRSxDwYZY2x+jGolgDzzeazpSKab9TnvMnAe+GyIbY34OdA63EjUxWZj1lnn/HAYeU
 G2f+iwTqqccnN+X49b2xs3TiTaJPPcJvUhYU+8nZB9dLDOTyqyph0HMoVEYCkIfheJ0q
 qf56qxga+IGYYQZIYNOcr6Go9oDCy4llJ5B8SUjSxgKZfW1oyZ6+PcBoyxFIRkwsnHpz
 6k7qI93NUSZ197nZS/Z5advKRDZBGHyATQAxS2zM+aawyyZGakUX47G2xiEfYuxvCkX9
 AK9mX6v0kZAdIrQtCqWIQievmgu70quCoQDNaVFUKLgX1yqntTFDZym9m+OniV3RzjSO
 eARg==
X-Gm-Message-State: AOAM533joiAT+dvYzFNjDuUmNAkrta2VjJTKobxpoL1gt6P5nM9iXhxD
 P6NKuihBu6zvYGkDk2jTv1B5j6OMvCEG6QGEHIdTFQ==
X-Google-Smtp-Source: ABdhPJwh818ZGK4JYctI0V3fJlMFGAq7RD4s5wnknL1X91djFIOeuqGUv7k1NRRNdmDE++dPbOoGnilqM56Dl0QCuwg=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr4092217edu.100.1616079474675; 
 Thu, 18 Mar 2021 07:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210317035242.24418-1-crosa@redhat.com>
In-Reply-To: <20210317035242.24418-1-crosa@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Mar 2021 14:57:30 +0000
Message-ID: <CAFEAcA9BBchVYhvSMNdHXVJwyFLpm9DnuXihU46YtAfbXoj0-A@mail.gmail.com>
Subject: Re: [PULL 0/5] Acceptance Tests and Python libs patches for 2021-03-16
To: Cleber Rosa <crosa@redhat.com>
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 17 Mar 2021 at 03:52, Cleber Rosa <crosa@redhat.com> wrote:
>
> The following changes since commit 5b7f5586d182b0cafb1f8d558992a14763e2953e:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/usb-20210315-pull-request=
> ' into staging (2021-03-16 13:17:54 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/cleber.gnu/qemu.git/ tags/python-next-pull-request
>
> for you to fetch changes up to affc55e761ea4c96b9b2de582d813787a317aeda:
>
>   tests/acceptance: linux-related tests fix (2021-03-16 22:24:44 -0400)
>
> ----------------------------------------------------------------
> Acceptance and Python Test Improvements
>
> Small collection of Acceptance and Python tests/improvements.
>
> GitLab CI pipeline: https://gitlab.com/cleber.gnu/qemu/-/pipelines/271670930
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

