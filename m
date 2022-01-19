Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70104493E72
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 17:39:38 +0100 (CET)
Received: from localhost ([::1]:57814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nADzl-0006aB-GQ
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 11:39:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nADy2-0005As-KK
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 11:37:50 -0500
Received: from [2a00:1450:4864:20::336] (port=40848
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nADy0-0000fY-SU
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 11:37:50 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 25-20020a05600c231900b003497473a9c4so15386300wmo.5
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 08:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=G7SGl9lbu3mqAwWUO8zV/7eSHSdh/kqfii9SmW0Q5OY=;
 b=HTSfrc8QNnnyT+ZU932LOSk2L5C7Icd3p7mt3WK24OGNBjEg5BbJ9Ov4KS0uOoVYPu
 /AumE8M/agkQdyeJBqGpR4z8qfNe0QpF45zZ89XPN2RbVBI98FvehBOsIsOocw/L3cc7
 wxFI3lne9aktn6TR24eBLj9RdBOoQgg4beu5ZNYf2skJi2PeRDzE1+PiL6FFOkg860fF
 V11bjSnaCc+yVqkI/Fks7wClCAdgQ1S/EPvlwSI3ynl63NiJIGIpXqy4eSIkjzPtSW+X
 RXMtUtBEmWuf+L/CMfVY7sUX7WmGa0Wyt5cHWyuzAyl9pUyh0gzVguokXd253w5G2OPt
 AWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=G7SGl9lbu3mqAwWUO8zV/7eSHSdh/kqfii9SmW0Q5OY=;
 b=y9ldxfnOjqg1HX1JaG+BagnQDmruXp1k8EgUGyCkVst84U3jAmw6CtzWtWJAH+4ye1
 IgwuCkKCquIjFZkT9khYx+zFkmgTAaCzm59Q4LNlS9b72iL6Jv5UFRR+6ecLu7cP0iIZ
 jvViLD3hPLoGmycoRcegbUzcNnoFeXux7uwewSXSdjlEK9KDFwIwQgWbLMbuy+BxZBO+
 x2ZePnazIGH9Sz3bZzQj6TI53AMt3DMBEuml7Tl2B4tCsh5nVitWR8yS9h+qqYz7XyCB
 wWOPfb+CP//GEOKr4K4gtHf88JGHzrZYLpDydKXpxY7DQBWSTF/PYEFKXnnwf1q2ikxV
 lLzA==
X-Gm-Message-State: AOAM532azGvP06vgf+Mq5XvzJS3XDa2vvsnKiIRqU0cLshta0wNrSI6/
 y/XgOAm/GEs8ZFjtc8a8LJezSgQxn33QJ79upl40zQ==
X-Google-Smtp-Source: ABdhPJxRPYgbE56qaxGxAmfqpp7ZzC11/Orsol9wPi4yS4/iiMFrYDSQd21IHr6wQk56k2Lsf3+OyejDzDqEWTa+8W0=
X-Received: by 2002:a1c:f70d:: with SMTP id v13mr4391452wmh.133.1642610267095; 
 Wed, 19 Jan 2022 08:37:47 -0800 (PST)
MIME-Version: 1.0
References: <20220118190043.1427303-1-alex.bennee@linaro.org>
In-Reply-To: <20220118190043.1427303-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 19 Jan 2022 16:37:36 +0000
Message-ID: <CAFEAcA9NNcPtgmKnRGM0yGuytT6CM2Lei0hWY7Qs_Fuu4eLH7A@mail.gmail.com>
Subject: Re: [PULL v2 00/31] testing/next and other misc fixes
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 Jan 2022 at 19:00, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit 6621441db50d5bae7e34dbd04bf3c57a27a71b=
32:
>
>   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-openbios-20220=
115' into staging (2022-01-16 20:12:23 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-for-7.0-180122-2
>
> for you to fetch changes up to 3265d1fc77eb5da522accb37e50053dfdfda7e8f:
>
>   docker: include bison in debian-tricore-cross (2022-01-18 16:44:16 +000=
0)
>
> ----------------------------------------------------------------
> Various testing and other misc updates:
>
>   - fix compiler warnings with ui and sdl
>   - update QXL/spice dependancy
>   - skip I/O tests on Alpine
>   - update fedora image to latest version
>   - integrate lcitool and regenerate docker images
>   - favour CONFIG_LINUX_USER over CONFIG_LINUX
>   - add libfuse3 dependencies to docker images
>   - add dtb-kaslr-seed control knob to virt machine
>   - fix build breakage from HMP update
>   - update docs for C standard and suffix usage
>   - add more logging for debugging user hole finding
>   - expand reserve for brk() for static 64 bit programs
>   - fix bug with linux-user hole calculation
>   - avoid affecting flags when printing results in float tests
>   - add float reference files for ppc64
>   - update FreeBSD to 12.3
>   - add bison dependancy to tricore images
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

