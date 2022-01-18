Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B92949242E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 11:59:11 +0100 (CET)
Received: from localhost ([::1]:55740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9mCj-0006aX-Vc
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 05:59:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9m9Y-00052S-Lv
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 05:55:57 -0500
Received: from [2a00:1450:4864:20::332] (port=52818
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9m9W-0003bn-MF
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 05:55:51 -0500
Received: by mail-wm1-x332.google.com with SMTP id v123so26724604wme.2
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 02:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MN7bLWAytmp+YZGRHKRLWgxeVaw2m0GTrIymcb+PxLk=;
 b=CkwzxlGrzhF3No7NulZ1mgcvZbTzLzIe6yf2nsEyVhpbnvnn7CIluego1ey6tCBmdK
 BjdCLa0iLvJ9ll8T8glYANrGzEjfX0fTqgdDtLHdRDyDnpCzzV+d86QhGSF/UixqEC4m
 RHhCz1MCRb/qWHsUQ7F5ms4r6YPzcGoCur1PWtrx5hW/ro9Gi5OATc+boHGxRb2nXcYc
 0+2aIq/f6MGEgzj+nMExEPm/S+oN9zTEn8EXKF7yStYINA/qTKA33Q/2W89cCx0X69iS
 N9hBG5M0Gr02kKL9qs5YI2W5/lUCEfXINsvswLSj3xdt7f4H6krmaOqQa0Kf40bVQ3ol
 9WTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MN7bLWAytmp+YZGRHKRLWgxeVaw2m0GTrIymcb+PxLk=;
 b=aRsvfAWUJU6pgjsg1JXXdJu3H7mBdIuHHJjYX72VzZ4Fx5YyP8TV1YPpS4E0ZUS6cB
 7BdZ6jctiB1Bm02Q0uUaon9AmlRE/28XkYFI87B5iIqM6a3Add8rO7AmHwnTA56MvXlA
 yLjcC711A469FFUdhtebnwSFXRZFm0b+4iWawPDDiE6jPHxhVgT3/G2fpydf7Y3ls7Xn
 Wq4SMJlb/aTwMHANeaDuwk0GonZ9Lg23fOJBA3kGHYcF+zPZiA8+mx1kGNSNln+u2X6g
 ZlCzT+HVArWepUCsjvMqqlVu1hw+M0uxy2zwnKB1vfA0gtN+/LmLr701NOyICnUiGZ4z
 Pr+Q==
X-Gm-Message-State: AOAM533Qo5beKd0a8fXlCqNQUkT4mVN0wFZZK1aBPsgtnu0abqT2srvi
 9YNcTtwL6RogPD+qJh+RkUAu7VjLGEZb2HkFqkVIXw==
X-Google-Smtp-Source: ABdhPJzK1iC4E95YZbhr7yG2krHrdlurkBc3iR3t880YvUdSyvH90/BuNZvx6ipF/4jIUl9W5p96L4zpDxAJzCE+FlU=
X-Received: by 2002:adf:ee0e:: with SMTP id y14mr23923572wrn.172.1642503347722; 
 Tue, 18 Jan 2022 02:55:47 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA-UKdcTROB7e3jO1qe=WCbuHRuX5WN7HZF2CcdMsmAt=g@mail.gmail.com>
 <YeU/YCUI59f33PBh@redhat.com>
 <CAFn=p-YDo8tTQ1Y8HgtQuCDv3i5EdFEX8-2BAjs-7L5q_b4=Gg@mail.gmail.com>
 <CAFEAcA_uBfCyJVq24p1jt5gaRmcMCZsjXae4y69QZ5dXpYX_Pg@mail.gmail.com>
 <CAFn=p-Zba+Ge6EckjRzkKsH4vU18RkspBaJvpSVE9H6gEU=r+Q@mail.gmail.com>
In-Reply-To: <CAFn=p-Zba+Ge6EckjRzkKsH4vU18RkspBaJvpSVE9H6gEU=r+Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jan 2022 10:55:36 +0000
Message-ID: <CAFEAcA_pO7XwstjX8vBhj4RECifQLbC-+3eR4g9Cc9XtjNCLxQ@mail.gmail.com>
Subject: Re: iotest 040, 041, intermittent failure in netbsd VM
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 17 Jan 2022 at 23:09, John Snow <jsnow@redhat.com> wrote:
> Well, today I learned that:
>
> (1) vm-build-XXX targets use your host system's QEMU to run that VM
> (2) my QMP library cannot talk to QEMU 2.11.

Whoops, I hadn't realised I was running with that ancient a QEMU.
For the scripted runs I set the PATH to include a 5.0 QEMU, but
this by-hand command-line invocation of 'make' didn't do that, so
it got the ancient system QEMU.

-- PMM

