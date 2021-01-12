Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F343A2F2EC4
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 13:13:48 +0100 (CET)
Received: from localhost ([::1]:50112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzIYW-0007Yh-3A
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 07:13:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzIWF-0005tk-6S
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 07:11:27 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kzIWD-0007eM-45
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 07:11:26 -0500
Received: by mail-wr1-x432.google.com with SMTP id 91so2244892wrj.7
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=XQ0lH4pPYtfqCnOQSKNWwtca85VYCKtcSmp07hITzs8=;
 b=BRK8AbhXCLtP3cF6RMR1BkhCjpdywdWroczVpYDjOmnSIOwoysD0d3sSOaDeAVc1Pj
 UDj1DQ7sVqiivKzw06ALAaMuzo8LP3OQ45lFzmKVp7BrD3s61N/PTzAapQR3hHvMHkV0
 BSNJ32S/2N7K++S+d9AA2Vd0RlpVayoaOpEYC0yidDKtNR2JmPWGqWHb21g2RaCf5Ku+
 fdwiJeXnmZ3r5JbQBMTzart3MVOh4z+wCKI2KwDN1nQM0pZ6qeG3Tecmtb0PewPon+A4
 JV+bs4Ngbc0tHvKs2yJ6u1Sv4WIaYEn8BjUh0U7l0julo/+cSo+TiaPdiLp+kCAWdcI/
 cWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=XQ0lH4pPYtfqCnOQSKNWwtca85VYCKtcSmp07hITzs8=;
 b=LTbAhaGqfhuoSv/wOJY5a12CikEw61pK+iHvfkDj+fTHmi9OiP97qmb0QbHrWK/y+B
 vL3L+HktPw7aklAiB0GNPmxy9dnibre+Gy9UVlEDiIs0q0fzFe+U7VHiq5EeRaAD2yCC
 aa+i7CSQoi2BQkCfRnbsjCqwDDUn1kozJ9cR/t81mki9LJHmVbPGefZuIV+KUwGQ1wQP
 USoxDJTjnr+CRv4Gaad6cO9U+RfxZRWGpzIqGsDZUBF1GL2j1T+I6OVGv6woO9oarY0V
 hsWEKC41wSKqB9t4JzvuqPYu4QL6IH4KBys0nfgn7Wxk30ybCgMenb96it2D8pKHt3YF
 Orgg==
X-Gm-Message-State: AOAM532ImQfO+yZVCC4xRYoo7HDahhwhk/h3pQ9FgfUuZJFXw0rEn21i
 Q5y+aEIndhA82h/6nyz8WsfHAg==
X-Google-Smtp-Source: ABdhPJzmkcLEMpDRWeoLpmCuZVsbuztST1g5q4knfHXPFEnphtAjdoDz3BuUuNGokDLOcwd1X/JShA==
X-Received: by 2002:a05:6000:1565:: with SMTP id
 5mr1901412wrz.109.1610453482560; 
 Tue, 12 Jan 2021 04:11:22 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l7sm3615309wme.4.2021.01.12.04.11.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 04:11:21 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9A1081FF7E;
 Tue, 12 Jan 2021 12:11:20 +0000 (GMT)
References: <1610080146-14968-1-git-send-email-tsimpson@quicinc.com>
 <1610080146-14968-32-git-send-email-tsimpson@quicinc.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Taylor Simpson <tsimpson@quicinc.com>
Subject: Re: [PATCH v6 31/35] Hexagon (tests/tcg/hexagon) TCG tests
Date: Tue, 12 Jan 2021 12:04:19 +0000
In-reply-to: <1610080146-14968-32-git-send-email-tsimpson@quicinc.com>
Message-ID: <87y2gymk2f.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, laurent@vivier.eu, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Taylor Simpson <tsimpson@quicinc.com> writes:

> Modify tests/tcg/configure.sh
> Add reference files to tests/tcg/hexagon
> Add Hexagon-specific tests
>
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  tests/tcg/hexagon/atomics.c        | 122 ++++++
>  tests/tcg/hexagon/clrtnew.c        |  56 +++
>  tests/tcg/hexagon/dual_stores.c    |  60 +++
>  tests/tcg/hexagon/fpstuff.c        | 370 ++++++++++++++++++
>  tests/tcg/hexagon/mem_noshuf.c     | 328 ++++++++++++++++
>  tests/tcg/hexagon/misc.c           | 360 +++++++++++++++++
>  tests/tcg/hexagon/preg_alias.c     | 106 +++++
>  tests/tcg/hexagon/pthread_cancel.c |  43 +++
>  tests/tcg/configure.sh             |   4 +-
>  tests/tcg/hexagon/Makefile.target  |  48 +++

Could you split this patch up please. I would say:

 1: configure.sh, Makefilefile.target with multiarch tests (and float
 ref files)
 2. atomics/loadstore/mem tests
 3. additional fp tests

BTW is there enough support for a bare metal system emulation test? You
would need a minimal boot.S and a library function for outputting
characters to some device and an exit which can set the return code.

<snip>

> +++ b/tests/tcg/hexagon/pthread_cancel.c
> @@ -0,0 +1,43 @@
> +/*
> + *  Copyright(c) 2019-2020 Qualcomm Innovation Center, Inc. All Rights R=
eserved.
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License
> + *  along with this program; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <stdio.h>
> +#include <unistd.h>
> +#include <pthread.h>
> +
> +static void *func(void *arg)
> +{
> +    sleep(3);
> +    return 0;
> +}
> +
> +int main()
> +{
> +    int err =3D 0;
> +    pthread_t thread;
> +    void *res;
> +
> +    pthread_create(&thread, 0, func, NULL);
> +    pthread_cancel(thread);
> +    pthread_join(thread, &res);
> +    if (res !=3D PTHREAD_CANCELED) {
> +        err++;
> +    }
> +
> +    puts(err =3D=3D 0 ? "PASS" : "FAIL");
> +    return err =3D=3D 0 ? 0 : -1;
> +}

This seems like it could be a multiarch test unless the othread cancel
semantics for Hexagon/Linux are very different.

<snip>

--=20
Alex Benn=C3=A9e

