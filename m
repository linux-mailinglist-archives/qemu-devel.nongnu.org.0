Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A49872AB9B0
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 14:12:00 +0100 (CET)
Received: from localhost ([::1]:39584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kc6xj-0005Vi-9U
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 08:11:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kc6wg-0004wO-LR
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 08:10:54 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:42287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kc6wZ-0007NG-SB
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 08:10:54 -0500
Received: by mail-ej1-x644.google.com with SMTP id i19so12149204ejx.9
 for <qemu-devel@nongnu.org>; Mon, 09 Nov 2020 05:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ftFoZ+uZmH3wDSM3hDnWljMNS89Iorvh0uGunD681GM=;
 b=H8bkzlaTQcQD5pQxoqyqJPXgTDZTWRPzn2atdCKdyQg/3R9CkrSy7xTEuh2dWR2b6D
 qjbQNyTkcydSSNwJElzGpLejJTo6VkUnrcqfItKK29fXzpmIY0WugiNQqVTDkXfSgp12
 qQHEd9ru0lQBmIirbM6e1v712B5IrMKBa8oqjXz4eYSYShr9viRkUNOdR/zikuDdcZvK
 yD0jQ+Rnd4zSraQk+2R4GyCHIJSbUg9ci8vkvpEjGwpmT29XDKJ5xWeKrgA7DPvTlb8l
 Wi3ts68iwcG9vGtALFc44Fc+C0ZaVt4Y0Gc3fqFB2CW9z5ozzcW/RahIiYzuLkWCYV+c
 AO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ftFoZ+uZmH3wDSM3hDnWljMNS89Iorvh0uGunD681GM=;
 b=fMk8yHkaFF/eYsA/7e6bcX/WvYbx0K6QU/3GF0wc4uKqx4ch47+pMjsCQcHpEJ9AMC
 B05i9c9kiy5G2KWWMJmXRwCpECy6WehcIPFcKecaahHuOif+OB3ZLHvgsqaJENjkkfws
 bsJOYNipVqa1hBGGAwWeJOl9njXSQ4R+31d+DPcGITD44D0EsXcZQ4Zykgl2fXGYhbGH
 Xd4QHO4IscqZFSXsr1VC9XgEwpS1N/EwPG9o4+5+p6SpUtHAq5UrQCBBrO8Rq1148BK4
 g38DWwFtUUDWg3bWuQFMAO/DNe0dlGdc0Ki++6pJbtXGAxcCH1++wIa6yKaQb2iA+ce4
 Spag==
X-Gm-Message-State: AOAM533ay4dYdz96FcEYF7JygMZBpfG48kOnJTWLkNTtr5bvNUG33pJV
 dOmhd0WiKy4tsAnK6Y3PLXEt5+/m/untANNrGmFxbQ==
X-Google-Smtp-Source: ABdhPJxMMwP28LUWtSWVVRKnGjIGgCfgMby6BeyRIil9rPc3d67rUow16uEwC4ypGIVHHyToldNqKpGGrkHhrTLImjw=
X-Received: by 2002:a17:906:7254:: with SMTP id
 n20mr14192338ejk.382.1604927445937; 
 Mon, 09 Nov 2020 05:10:45 -0800 (PST)
MIME-Version: 1.0
References: <20201104165254.24822-1-alex.bennee@linaro.org>
In-Reply-To: <20201104165254.24822-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Nov 2020 13:10:34 +0000
Message-ID: <CAFEAcA8vjXHFEripcd69F++j7V_ZHkK8Y+RJ7WN942JbJ3JCpQ@mail.gmail.com>
Subject: Re: [PATCH v2] docs: add some notes on the sbsa-ref machine
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Graeme Gregory <graeme@nuviainc.com>,
 Shashi Mallela <shashi.mallela@linaro.org>, Leif Lindholm <leif@nuviainc.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 4 Nov 2020 at 16:53, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> We should at least document what this machine is about.
>
> Reviewed-by: Graeme Gregory <graeme@nuviainc.com>
> Cc: Leif Lindholm <leif@nuviainc.com>
> Cc: Shashi Mallela <shashi.mallela@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> ---
> v2
>   - reworded command line bit as per Leif
>   - s/cortex-a57 cpus/AArch64 CPUs/
>   - dropped the trailing .'s
> ---
>  docs/system/arm/sbsa.rst   | 32 ++++++++++++++++++++++++++++++++

This filename...

> --- a/docs/system/target-arm.rst
> +++ b/docs/system/target-arm.rst
> @@ -79,6 +79,7 @@ undocumented; you can get a complete list by running
>     arm/mps2
>     arm/musca
>     arm/realview
> +   arm/sbsa-ref

...doesn't match the name you used here, so the docs don't
build. I've fixed this nit in target-arm.next.

-- PMM

