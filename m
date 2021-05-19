Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F9D3892B4
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 17:32:13 +0200 (CEST)
Received: from localhost ([::1]:48008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljOBA-0006SI-Cr
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 11:32:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ljO8p-0004sd-UX
 for qemu-devel@nongnu.org; Wed, 19 May 2021 11:29:48 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:34695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ljO8l-0006H9-2S
 for qemu-devel@nongnu.org; Wed, 19 May 2021 11:29:47 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso3508358wmc.1
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 08:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=HyQWRijrvel77pD1mKq9H/wT3MnpT+t3mChxCUUCDCg=;
 b=J6HVjNSZacHzSoanGh2QgmqLmwhdiklTlm2Od/BUgvck0Rxp0mmoMUQeZHKLV0ouoe
 k3nM2vSCW/cGtn2yn9uIYiwQadSt4cFQFmXGWDKKvDE/Kz+khI1cgaJ3V6JmymbZM3rJ
 9tsElbXzwNeC4h766i4qfOcLnKu5TjlzgMsayAe5V6HJ/TRBdenNorE99dpZAeNXqt3R
 ORE+iTqPWvyTQElL9GNLcVhvyu0+EHTFxS8nDwgpfhCc7bScxi/P2ehuk4tun+X3M3zF
 TG0y/U1sZzttNYXa++RM1YodljYMdd4rjwxyBJtcDl56qaCAHZWmr/jW6tn2n7hwbP39
 HGiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=HyQWRijrvel77pD1mKq9H/wT3MnpT+t3mChxCUUCDCg=;
 b=Mjzs1gWh+rrnWdCltTvjlubAuwGdecfCB8U4AWLE07eTba1rFhb1A0NSL53qsynEAC
 qAhrZhZpy0ei40U3TADbs8j5AozexUCsak04/mYgKZpCW0ILfsnytF6rMGu/7z5wd7/K
 C6B4BxmgosBpYpp2n2yyIfuVdopduMQWaYEaRPBhXx227EPV58ENJonQwtrmOHzz+Bwt
 CcSJpGWX75PFVTUjFdWEX7IHk/0/8wHq13QEfCRLVVlT8v2NW3OUjQUIqU6xV2YRv8te
 qiPIkhT5BrdAOXmgpkeChI+B+Mn2giFWnNWZ8OnVx7J3fZ9/tWP1eeGW0B3MNtFwPCWu
 CHqA==
X-Gm-Message-State: AOAM533Gpv9TsTutJrJNrGsx2mrSEX99c66EGE7KVdpX4TZEbwvnx8yz
 WWJCAqiaeV0tXTMH2TOXs5pofgzeMRrBwA==
X-Google-Smtp-Source: ABdhPJyHCwTExsRI3I8HN67b8nC9pmlT+ubNnvACcd6uXMhiQp+31P7Q2sDODjG2sfVnekbGCHTgdA==
X-Received: by 2002:a7b:c005:: with SMTP id c5mr12336755wmb.113.1621438176564; 
 Wed, 19 May 2021 08:29:36 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id q27sm23592673wrz.79.2021.05.19.08.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 08:29:35 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B3CE61FF7E;
 Wed, 19 May 2021 16:29:34 +0100 (BST)
References: <20210518084139.97957-1-pbonzini@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/3] Small CI improvements
Date: Wed, 19 May 2021 16:28:45 +0100
In-reply-to: <20210518084139.97957-1-pbonzini@redhat.com>
Message-ID: <87lf8ad9nl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> Patch 1 adjusts cirrus-ci to also test installation, and thus
> entitlement application on macOS.
>
> Patch 2 and 3 tweak the number of jobs during "make".

Hmm this seemed to time out a load and fail with some exit codes:

  https://gitlab.com/stsquad/qemu/-/pipelines/304979329/failures

>
> Paolo Bonzini (3):
>   cirrus-ci: test installation
>   ci: do not use #processors+1 jobs, #processors is enough
>   ci: add -j to all "make" jobs
>
>  .cirrus.yml    | 22 ++++++++++++----------
>  .gitlab-ci.yml | 10 +++++-----
>  .travis.yml    | 10 +++++-----
>  3 files changed, 22 insertions(+), 20 deletions(-)


--=20
Alex Benn=C3=A9e

