Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FA73CBBA5
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 20:06:47 +0200 (CEST)
Received: from localhost ([::1]:42848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4SEY-0004uM-7W
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 14:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4SDN-00043m-UR
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 14:05:33 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:36537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4SDM-0002co-7J
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 14:05:33 -0400
Received: by mail-ej1-x62a.google.com with SMTP id nd37so16453186ejc.3
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 11:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mzJcLSO3oI64p7YapPNKHobbwxKaU+dpFGSywWKYU7w=;
 b=i6IXkz2PTdbREL0JpYB2IIaRdceBLan1Mc//IfDTJMcsWspDfF/j31rmN8U+jIFWW8
 0FwcH9Kdpcg/sn54jN+dsOJZ8gLOupjDrGnXz7D92whrKctbWiHIriABGotIMxVUnjdh
 iirCJUG8ew3zYDiG+OJP1xsktyJead5ZUfG3PCdXoXn5AbqukhRHRZAcBvDx/st0w52m
 ecimJ/GQpSz+2yGWpRooz1metts+lKNXDX9IqppL3L3qgKlkCwDbLo087ZGNA6aaetFc
 bWzOwEWZA7qNDJuX6YVBnOvVTYVHMECl3wGi3ICDs/iXpBRc1WA9tcnMs864lFhxUxgI
 Xmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mzJcLSO3oI64p7YapPNKHobbwxKaU+dpFGSywWKYU7w=;
 b=ESs2qTHGBd/8SSCoj0NHhbRPJ8JxwUQQz4jtUrAmOK2yZNMy9se6Jdoe7PwMHHaPkG
 tR6WvAf9B2J+HRoFBKL5E2MLP9pPbTeR17FYxaNsniENnFoW8fyzPqhUMSdGWOYDQp68
 M/Has2KW/50fDqXU5JOsgY53FVTC2SvSN+OIc2zXkvgAEeqz82vrbYSj0SgPlgKWCThR
 5PFo1Ah+1vku1WL+1HsjTH7E4h50LXNPHy1hRwOPdHnvzEE+XuadjKjO2aPFZzaxh961
 XZA8VH/bNF2puHW0B52jDD+5LSJIG5CXwf6qxMxlenmz5NcvAmJ59XfaZmtTSPB9tjhH
 Yskg==
X-Gm-Message-State: AOAM533A7CYmOY6Ywt28T2lr052wnixWtE0hkmFBDAKSISMX498qLpMt
 W4BWRwMZ/gJc7WAz6HtTNCaRlAOyESL9vKuyXIzgLQ==
X-Google-Smtp-Source: ABdhPJx+ZQKtfKAwhEkqptyTXtX5+P5vliapIdLFo6NoBhcfTmO06QJ3BVbKAHSCYTRevf1VJvTN7CgsFsDiiHynNHk=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr12849333ejy.407.1626458730561; 
 Fri, 16 Jul 2021 11:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7rcp_5vmoL1xFr6rVUzbyb2LyxyndOrxKMsyvgkqq_EX=hOg@mail.gmail.com>
 <CAFEAcA_jBPwqHCyCAq6yJPfHtwV-h2xdNARX=GTe6gn1Cao97Q@mail.gmail.com>
 <CAK7rcp99ZiRw1zVMAGAO6t=yaDuZyNPwToRd1x34JzEvNHtj2w@mail.gmail.com>
 <CAFEAcA8dcouHz=UnDyksZ17fsGom4r=ciHu7oX-f3gDjnCX54Q@mail.gmail.com>
 <CAK7rcp_S5Z5M3bDum3f_ppequ47PaYHs0Gp=LST5jnF_VsCkuA@mail.gmail.com>
 <CAK7rcp9uNpQcFepqMugg6qv2LWMY5O=TPBDp7uKAUs0whjmrbQ@mail.gmail.com>
 <CAFEAcA8rGR9=f9Nt+Z0FeFR_m77OvC4SrmJ91+fU5NjR4ATcKg@mail.gmail.com>
 <CAK7rcp-dc7d=4M6STfuWV9=pFTmO_0ST1Cd=7mLBmnxLsp-+NQ@mail.gmail.com>
In-Reply-To: <CAK7rcp-dc7d=4M6STfuWV9=pFTmO_0ST1Cd=7mLBmnxLsp-+NQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Jul 2021 19:04:50 +0100
Message-ID: <CAFEAcA-riRg8A1mosMHjnD=tKAA_PMe2VGcinBO=YViDqJc7qQ@mail.gmail.com>
Subject: Re: QEMU System and User targets
To: Kenneth Adam Miller <kennethadammiller@gmail.com>
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

On Fri, 16 Jul 2021 at 18:50, Kenneth Adam Miller
<kennethadammiller@gmail.com> wrote:
> There's a lot of files and I don't want to muddy up the discussion with t=
oo many details.

If you don't provide details, you get vague answers. Your choice :-)

> And for sure, this is not a problem with the upstream qemu. I'm working o=
n adding a target, and this is just what I'm experiencing. As for my target=
, it has includes that correspond to finds within sub-directories of qemu c=
omponents, and I just mean that the include directives are only the file na=
me (no path prefix), but such file can be found only in folders other than =
the include directory. One example is qemu.h; it is in linux-user. You can =
get the compilation to find exactly just that file, but it includes other f=
iles, and it isn't reasonable to edit anything outside of my own architectu=
re implementation. I'm wondering if perhaps anything that makes an include =
to linux-user would need to be moved into the user target source set, becau=
se currently it is in the shared.

The broad-strokes answer is "your code in target/whatever should generally
not be including files that are neither in include/ nor in target/whatever"=
.
If you find yourself doing that you've probably structured something wrong
(otherwise other targets would also have run into this).

For linux-user/qemu.h in particular, the top level meson.build does
add linux-user/ to the include path, but only for when it is building
files for the linux-user targets. (It makes no sense to include that header
file into code built for system emulation.)

Of the 4 targets that #include "qemu.h" in target/whatever code, 3 of them
(m68k, nios2, arm) do it only for their semihosting .c file, and there
the #include "qemu.h" is inside an #ifdef CONFIG_USER_ONLY. (Semihosting
is a bit of an odd thing which works differently for usermode and
system emulation mode, which is why it needs this linux-user header.)
The 4th is hexagon, and that is a bug in the hexagon code which is only
going unnoticed because hexagon currently supports only the linux-user
target and not system emulation.

thanks
-- PMM

