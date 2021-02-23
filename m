Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E1D322DC0
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 16:45:31 +0100 (CET)
Received: from localhost ([::1]:55284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEZsQ-0001z1-2L
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 10:45:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEZr1-0001Ch-Na
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:44:03 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:34514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEZqz-0002Ix-QF
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:44:03 -0500
Received: by mail-ej1-x635.google.com with SMTP id hs11so35296189ejc.1
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 07:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JGOSUxtnl8PIyIN9cqgDLWNNc4gLKVUsaZCfu+FqSfo=;
 b=riTek29kiRbp8+ZasN+vL6JdynSNR/17Hef6HIXUnWpyl/upejwmW0+YMjpuo4AD4L
 5XRxfd4+HmvgPYIXg7ajC5eavzZWe3XqhTKY9E5LWdXNAw/R7aqjwKzK6iuSsdNG6ihi
 SoivhjKFfD1rvgujQqDfAPQKBmVGdO96nBHcX6tM3UAtwFF59pfqDkVwGeFk1gJrYqVW
 GzwDY2sLh7rzQxV4he75WJy4evwqa3yJsccRWtoDa+pIXu6uKYAMIEWnV0vm3dkLbwfi
 EAA0uPVzWt50ABtxe043DIINebZfNT+HgvyyJLIx4m90U+RfiWchs93qnM33Ld66Ezq0
 KnTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JGOSUxtnl8PIyIN9cqgDLWNNc4gLKVUsaZCfu+FqSfo=;
 b=A1Wh+SB0KzcGYm9VQvdMA+fUiEdK32N7azHID31LT+UnUEVh1e7IQT1qKS2OvM6LoQ
 fRR32mgMavsolQ/Inc53E3XbmDAWUpEQjxPahiqTAflLRjru7mbKx8npLuKDTyYv7rt1
 XoOO9OmD+5YRveNXPRZnyFsxWA49hGHiC5yH9DJzYMwvp3A2gVJuVsdkr8pbGTAPCY+e
 SAG3ffVInOXWh6LgtTsNk/4gnLESYBGmxACTs+E2/oRfuxD2PCMhxb2SJE8rfg6LjOSz
 ORuaH+2d1ar56u7Wj8mEAypqeq3Ulm/5SkT9Ge25er9f5m9NbWnh+pN37fkmUUVV+6VM
 zHGg==
X-Gm-Message-State: AOAM530VhsNitcEgjrFw48J1h7KSw4ixOnfaFLFgZVivDvU3pjHuCXig
 pDgJ0+AUNue4kcpvr+NoSj/ZWChNRw9sS54VQ9uG0A==
X-Google-Smtp-Source: ABdhPJwdntaqvrOuNbX7YJ4l+B4/KbfgaR0Ir/sn3SifbIOqSt4pMwd02D7OvbctOxt6IldXbbz08/MT4/57IgOtGQE=
X-Received: by 2002:a17:906:1ecc:: with SMTP id
 m12mr7725186ejj.4.1614095039821; 
 Tue, 23 Feb 2021 07:43:59 -0800 (PST)
MIME-Version: 1.0
References: <20210223145646.4129643-1-christian.ehrhardt@canonical.com>
In-Reply-To: <20210223145646.4129643-1-christian.ehrhardt@canonical.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Feb 2021 15:43:48 +0000
Message-ID: <CAFEAcA-LiCAK5EPCqwxOvJofhkoNpYs6UyrjrkOkYLTfJAxfmg@mail.gmail.com>
Subject: Re: [PATCH] disas: Fix build with glib2.0 >=2.67.3
To: Christian Ehrhardt <christian.ehrhardt@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Feb 2021 at 15:03, Christian Ehrhardt
<christian.ehrhardt@canonical.com> wrote:
>
> glib2.0 introduced a change in 2.67.3 and later which triggers an
> issue [1] for anyone including it's headers in a "extern C" context
> which a few files in disas/* do. An example of such an include chain
> and error look like:
>
> ../../disas/arm-a64.cc
> In file included from /usr/include/glib-2.0/glib/gmacros.h:241,
>                  from /usr/lib/x86_64-linux-gnu/glib-2.0/include/glibconf=
ig.h:9,
>                  from /usr/include/glib-2.0/glib/gtypes.h:32,
>                  from /usr/include/glib-2.0/glib/galloca.h:32,
>                  from /usr/include/glib-2.0/glib.h:30,
>                  from /<<BUILDDIR>>/qemu-5.2+dfsg/include/glib-compat.h:3=
2,
>                  from /<<BUILDDIR>>/qemu-5.2+dfsg/include/qemu/osdep.h:12=
6,
>                  from ../../disas/arm-a64.cc:21:
> /usr/include/c++/10/type_traits:56:3: error: template with C linkage
>    56 |   template<typename _Tp, _Tp __v>
>       |   ^~~~~~~~
> ../../disas/arm-a64.cc:20:1: note: =E2=80=98extern "C"=E2=80=99 linkage s=
tarted here
>    20 | extern "C" {
>       | ^~~~~~~~~~
>
> To fix that move the include of osdep.h out of that section. It was added
> already as C++ fixup by e78490c44: "disas/arm-a64.cc: Include osdep.h fir=
st".
>
> [1]: https://gitlab.gnome.org/GNOME/glib/-/issues/2331

I'm not convinced by this as a fix, though I'm happy to be corrected
by somebody with a fuller understanding of C++. glib.h may be supposed
to work as a C++ header, but osdep.h as a whole is definitely a C header,
so I think it ought to be inside 'extern C'; and it has to be
the first header included; and it happens to want to include glib.h.

Fixing glib.h seems like it would be nicer, assuming they haven't
already shipped this breakage. Failing that, does it work to do:

/*
 * glib.h expects to be included as a C++ header if we're
 * building a C++ file, but osdep.h and thus glib-compat.h are
 * C headers and should be inside an "extern C" block.
 */
#ifdef __cplusplus
extern "C++" {
#include <glib.h>
#if defined(G_OS_UNIX)
#include <glib-unix.h>
#endif
}

in include/glib-compat.h ?

thanks
-- PMM

