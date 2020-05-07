Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCFF1C9991
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 20:46:34 +0200 (CEST)
Received: from localhost ([::1]:60148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWlXV-0004Lc-CN
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 14:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jWlWE-0003pi-KJ
 for qemu-devel@nongnu.org; Thu, 07 May 2020 14:45:14 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:39873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jWlWD-0004nO-FU
 for qemu-devel@nongnu.org; Thu, 07 May 2020 14:45:14 -0400
Received: by mail-ot1-x343.google.com with SMTP id m13so5404662otf.6
 for <qemu-devel@nongnu.org>; Thu, 07 May 2020 11:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QBqOqthBmFj92HUYJs43lRCNmJ9GMsggfESI0U6T6V4=;
 b=mQkdJmVe4H2IJLdOwlfeLawNYnHBqgNnCSL8ClNAHLxpTvR80e5xg/K54ryR/EXLem
 utjXYbzTtScdWT9XruH00yvkOZUtg4n6WYAsOTgodfZOCBzYaEtnVmEUHZpFTHiuFgTF
 c6MAIftPUVBVLLRTwB4d2h/upnDl5BidQIRNg1gwVqtdpl53zHlfukmBzOG1+9JrpKz1
 VwbZMAoSLA3SUcr6A3S4CfIDRDhZHM8Sh2Xhy5oYlB2TLlZHpA8fUNIcadDTL4JNwKao
 TI85PwVlBfomm/P9c+2tvg4YHo/JfYPqfJnbp/UWZqEK68DgHS8YcrmBTNpkdmhyHiTs
 6STg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QBqOqthBmFj92HUYJs43lRCNmJ9GMsggfESI0U6T6V4=;
 b=f2Ps7nCGcfrPS1kLhpfHgMsp9/4XeqNtxtx/ljoBGGLByXF0WLkzXGTMK0xPykIkll
 KNBKIpQrjV5TMSKOD9HARQhq7+TFnSVsBcDx5uuoSckwEHDc1cxfv3CUI+JauRB6vvlY
 EG6cLxFWsGjFoJdm2HzdgaTM2dou0CJNrLjOSq59YiKOwLi0zexDwCjbc//iAa/tgNPV
 YJALvQwfC/zEr90tPGbPbKQpBvk/GuVyEv4zKKw8y/dUpnCd9bx1k1zgt18nn/cWXqJn
 rgWA9N3jPf5jYnhZ5EG6IqTfzc1QHyC+FQlVM+xUx3kgKLrvwvetlClB0YPYPHPl7WxU
 /szQ==
X-Gm-Message-State: AGi0PuYVM+hiNHL+KM2I6dOEvdgzsNwo//W7hntgwvidTEfBS5Y0qn9n
 wc+bwxKWA6GDDCY+PTjcrP2F3l1yW9g+RRknlpt8CA==
X-Google-Smtp-Source: APiQypLODy/gjgg6lGsO1P8klypNKLLiM2g2GDXeDzVpJ4ah0/IRj7wUH7UQ0OqNVoCOtnVLbl8sYGqeuJ2rDkW7Vh4=
X-Received: by 2002:a05:6830:22dc:: with SMTP id
 q28mr11078887otc.221.1588877112004; 
 Thu, 07 May 2020 11:45:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200507162235.1790-1-philmd@redhat.com>
 <874ksr615d.fsf@linaro.org>
In-Reply-To: <874ksr615d.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 May 2020 19:45:01 +0100
Message-ID: <CAFEAcA800Lhgqa6gOWmA5M2D3+Xj0hYcJw9Tkget4yvW5fFs+A@mail.gmail.com>
Subject: Re: [PATCH] tests/acceptance/boot_linux: Skip slow Aarch64 'virt'
 machine TCG test
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 7 May 2020 at 19:38, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>
> > The BootLinuxAarch64.test_virt_tcg is reported to take >7min to run.
> > Add a possibility to users to skip this particular test, by setting
> > the AVOCADO_SKIP_SLOW_TESTS environment variable:
> >
> >   $ AVOCADO_SKIP_SLOW_TESTS=3Dplease make check-acceptance
> >   ...
> >     (05/88) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_t=
cg: SKIP: Test takes >7min
> >   ...
>
> 7m =3D 420s - I'm seeing:
>
>   hyperfine "./tests/venv/bin/avocado run ./tests/acceptance/boot_linux.p=
y:BootLinuxAarch64.test_virt_tcg"
>   Benchmark #1: ./tests/venv/bin/avocado run ./tests/acceptance/boot_linu=
x.py:BootLinuxAarch64.test_virt_tcg
>     Time (mean =C2=B1 =CF=83):     162.179 s =C2=B1  3.138 s    [User: 20=
4.726 s, System: 9.663 s]
>     Range (min =E2=80=A6 max):   158.651 s =E2=80=A6 170.036 s    10 runs
>
> Is this on very slow hardware?

Intel(R) Xeon(R) W-2145 CPU @ 3.70GHz 16-core
clang sanitizer build, which probably slows it down a bit.

But even 200 seconds is an order of magnitude slower than any
of the other tests that check-acceptance runs. I think we
should be aiming for tests here to be ~30 seconds at most,
or the whole thing will take forever by the time we have
decent coverage of most machines.

thanks
-- PMM

