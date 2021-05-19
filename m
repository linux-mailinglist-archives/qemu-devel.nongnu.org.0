Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B6E38924C
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 17:11:39 +0200 (CEST)
Received: from localhost ([::1]:59520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljNrF-0001W2-Km
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 11:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljNq4-0000dR-Tb
 for qemu-devel@nongnu.org; Wed, 19 May 2021 11:10:25 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:42497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljNq0-0007xV-In
 for qemu-devel@nongnu.org; Wed, 19 May 2021 11:10:24 -0400
Received: by mail-ej1-x62a.google.com with SMTP id lg14so20464883ejb.9
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 08:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YdX0hE/DJv9dgs4mJyriF3s6ACw4znp/SPBhNRp11sc=;
 b=IE2oeereopJZHq7RVKiaXBkse2yPTXkT79z679Bh5UF4lPlKZE/BrA1+Mn0hWfE9ah
 q4KjDHz4SIrzaMcYd1MnwNUEGRsGrceuSt2oIS5dOnqPMW4YDZCwFW+5m+beTLKGGsWp
 geX2yoCGQapDuLiaCFTk47YO2p9QJSd3GH6hrxK3m/S96uW9cLUqTW6E+Ziuxb2Nz7XD
 KRUgdSe+de34JVzYBHDpsImmOSPBTQwBbuqjJv/4ujskyE6UWj8Y/HJxrb4OqQBTpPu0
 2kCheWrWtreYlVQ1tb79Bukm+yIr/bMXSWhRrpWcLXpDncQN6B/EXIqGCeiAmkzE1t3N
 U+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YdX0hE/DJv9dgs4mJyriF3s6ACw4znp/SPBhNRp11sc=;
 b=mIfQ/JWYUK3ed4FRjWrWspNI+YG4dmtL/k/RThgzNbu7pxra/y0VNH8S7MzDdVXBDc
 pueTWRMAKy4zkxyh0yhIAPbi0kKlPTZk/XJFdQw2T1RbShrFwMAqqMVne8cCoYqDAUS4
 nfxbfIFhfWZKBoH+WS5NFM3YkXhRFokqrEl3m6X1TZZdBSiF1JItv2/IpqWKrwP4stup
 qdoruNTYWayYMkbUGe2SHijOPU/lSro2FBa/UvX3Met1UJKJ4iTfCASvdowW3oKlSNIr
 uNoy3JvuzWgsVtPIIRFXB5pnWwWWOto0v77jMDpq0ZU6JkDp7lrD5MnjQ2nQX2sgMXfz
 sIWg==
X-Gm-Message-State: AOAM531W8+WrKGyEeCy72KwIDwzlpeQF1B7njSDVvf38sMTi0DTJkv8a
 /zc8GYhe+qRLIhaQtUjCgFE9aWaOsI/FcBQVyUXHRw==
X-Google-Smtp-Source: ABdhPJzzHb9/xLDKUcwn5b3mLeVCNwevVXSzOp0Uw78S7EL/uaVIz+pZDPbkK/R/bPQTuU+lGdclWr/RTD+gs/UaAIk=
X-Received: by 2002:a17:906:bcd6:: with SMTP id
 lw22mr13451733ejb.250.1621437017745; 
 Wed, 19 May 2021 08:10:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210518090720.21915-1-alex.bennee@linaro.org>
In-Reply-To: <20210518090720.21915-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 19 May 2021 16:09:59 +0100
Message-ID: <CAFEAcA_biNmALCd9hkCiRXWOiiKv9hPhHFH9=Yt1PMVCTF+kNg@mail.gmail.com>
Subject: Re: [PULL v2 00/29] testing and plugin updates
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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

On Tue, 18 May 2021 at 10:07, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit 367196caa07ac31443bc360145cc10fbef4fdf=
92:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6=
.1-pull-request' into staging (2021-05-17 16:44:47 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-testing-and-plugin-update=
s-180521-2
>
> for you to fetch changes up to b1aa4de12e846e0ad18969ee823c19b66d8d4d8f:
>
>   configure: use cc, not host_cc to set cross_cc for build arch (2021-05-=
18 09:36:21 +0100)
>
> ----------------------------------------------------------------
> testing and plugin updates:
>
>   - various fixes for binfmt_misc docker images
>   - add hexagon check-tcg support docker image
>   - add tricore check-tcg support
>   - refactor ppc docker images
>   - add missing ppc64le tests
>   - don't use host_cc for test fallback
>   - check-tcg configure.sh tweaks for cross compile/clang
>   - fix some memory leaks in plugins
>
> ----------------------------------------------------------------

This fails the 'build-user-hexagon' job in gitlab:

https://gitlab.com/qemu-project/qemu/-/jobs/1276171518

"ERROR: Cannot find Ninja" seems likely to be the main issue...


thanks
-- PMM

