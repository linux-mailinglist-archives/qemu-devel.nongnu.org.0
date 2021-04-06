Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC4F355CC2
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 22:15:04 +0200 (CEST)
Received: from localhost ([::1]:59658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTs6J-0006Rj-7v
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 16:15:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTs54-0005CJ-Oa
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 16:13:46 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:36352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lTs50-0003pC-Lw
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 16:13:46 -0400
Received: by mail-ej1-x629.google.com with SMTP id r9so1403543ejj.3
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 13:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q1CE0L8iAagFQnzgB3ZvWrCXrQHx8AiOplfJf6n0UlU=;
 b=av00uBcUCT75SQ4+8aWaiBAq6VLd6PWYK0xsYXxY5qKchMH5TCMygzd84sd8I9ot/1
 Zbj6jGl3X5+NTwYVfdNHyaKWMRLmBy3gY5vN8aGoi9P1d0iuvjOatdtH/ofWiWkSVE0U
 np7xlDVufbfd62GbHVJejd7OgWsucg4jq4oZlyovqDhzJXVwtKeiSvH0DE14wM+VUDXP
 kcGmqvLDR+XpsTqY2/EdMK5OnNd/1f1YAdLX9/HvShpgnokDm/TUfziP39lCzl4mxn0D
 55Qsu/iFSqcD4FmEGyd9kV+LCXkQmRM9tiWchyCnewcSMEU1q/UTRXgNj4vOrcYH1/q1
 khkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q1CE0L8iAagFQnzgB3ZvWrCXrQHx8AiOplfJf6n0UlU=;
 b=ASAFw6mFdJLxHcXw6+Rymr61Mnw7H/sngNWqlj0oAY+pLEm032r44cvMKd/Q3XDESX
 C6CF5gSXs4NWZSzBt46zZsqTBTMOHJQ3YUtTAnGbh25X+jCmYa6s1VVrmJiYLxNdBj3R
 mbA6y70u7m5/VkRAJp00tpsHzcU0LX+BErVNjbgNg1tp5clbBlRK/fK0b5Vy46uzllX4
 Heur8lSR9+IM8g6u9u//z7TUKK/4jvJHPPLFd2B5wLWQy6ewXRagPmkM8U3PbuWa7jW8
 sXDXLAT34vHI9+pkdT7FX9mTGL7stQYInVBDewzSQFTkEX82aXV5MZq20EcmtkAe9JVR
 jJUw==
X-Gm-Message-State: AOAM531c7wVc1osRDU9p6DK+gpVyHCX0pCK7u23FWQeNdfw1CpZzY7sE
 1KmjIeSHuC8j+utx5VjcSoBEI4ZaFne1QhisRvWe3Q==
X-Google-Smtp-Source: ABdhPJzIPJkfePQaC1hr6n7HBGKzdDBDwD2/UM/XDmp3pndrAnxdZrFsUQZ3dvWZe1slcY4IFDzKL+S5ekMsuUgu6K8=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr36868618ejc.250.1617740020761; 
 Tue, 06 Apr 2021 13:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <YGys2+lETQO5havV@work-vm>
 <55e804a2-c709-6b2e-699a-ef89f1941250@redhat.com>
 <BYAPR02MB488607AF20D2E0232C9BC0ACDE769@BYAPR02MB4886.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB488607AF20D2E0232C9BC0ACDE769@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Apr 2021 20:13:01 +0000
Message-ID: <CAFEAcA-w8zKQ2jwaP+Ha7pPA+9-gWW7EF6BPbzGbc-fFa882wQ@mail.gmail.com>
Subject: Re: dectree.py uses env python3 rather than configured python
To: Taylor Simpson <tsimpson@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: John Snow <jsnow@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 6 Apr 2021 at 20:49, Taylor Simpson <tsimpson@quicinc.com> wrote:
> On the other hand, isn't python3 standard for building qemu now?  This page
> https://wiki.qemu.org/Hosts/Linux#Required_additional_packages
> lists python3 as an additional required package for RHEL8.

Python 3 is required, but there's no guarantee that Python 3 will
be the executable "python3" on the path, as opposed to available
under some other name...

thanks
-- PMM

