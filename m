Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8663312755
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 20:54:37 +0100 (CET)
Received: from localhost ([::1]:35104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8q8i-0003ar-At
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 14:54:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l8q7N-00032E-J0
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 14:53:13 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:34554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l8q7L-00026E-R7
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 14:53:13 -0500
Received: by mail-ej1-x62b.google.com with SMTP id hs11so21446525ejc.1
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 11:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rVZ4Lzb23G2lx+OAtK/km/Gjjp259+i4YrZ7LTXFhYY=;
 b=aG1J/z2J5A7BtgJFeMawf9lmGt33dwCm3Xewd7IxnuP/FNUk47ICF449XHiUGa3ace
 qjaX01sTJ86ZnGHbk7ax96kHEHLDdRXrs//oKyvfumDCVc4/kz03213xPl5IzpGRXQp+
 zFKlpMGf+d8sGzvDcN8AnAMn79ofDmksiQIgCzaAp2IQpRTjDlyJaEAdLLdvk+cqKR8p
 ks5VB6Bh8iYklXEohYtRTqlKTrHYK6WR+k1xYQK6KHs8cIVSrd2+ga4ruK+g4G+32uot
 3MhWr1GTXQQZulIonV1LQ9TcAqsaABoa+OzwlxsZ41dHm559a+uKxY1gpai5xcxbSdgs
 j4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rVZ4Lzb23G2lx+OAtK/km/Gjjp259+i4YrZ7LTXFhYY=;
 b=et/A/bzmD/+n4z/d8Prw2c/n+fBw4gbsg4B7PI8qeTWipFUogD34gP2H8dBJElkKAu
 ZBWvHeacruvGN8gRbrSZjO6LXb6huhvA5/OmWO+QI5QOr3hw1bVct1UwfQSMqIjASpiR
 Q3CAm4MF1Sxte+WicWaeNV9kUzTZEdFdWfzvO8TlXIhvTtlgvHjght3ZcKHQMJIMOf0I
 bWCA7HKLA1tJkiKnvH4bmx/pzQM8s+zHqG3LL+yxD27ZeUaiYsl3OytTg94fzVZGvbj+
 uoqtEhvg/qnqlW13c3r9yqPsq/0j7tqgjGIUAs7DXSyGl2y4FYo+gOceD2QnIjB42cfe
 TyPA==
X-Gm-Message-State: AOAM530qhSWKwqEJ8e86HufM4P2QB+5593oEe99v6MT43BvIB4hCGERy
 +0W47Y3OnGbcw+DqVxEsgmt2JhNECK8p/NuSzMBH8A==
X-Google-Smtp-Source: ABdhPJyGkRFx22PDyemYYiC5lxsBRcEJ5sx4SMpYHn+sY8oy2ryli4DuKHWa/spvs8sejwK9QfiUjjgdUyyZomdrjGg=
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr14257748ejd.250.1612727590009; 
 Sun, 07 Feb 2021 11:53:10 -0800 (PST)
MIME-Version: 1.0
References: <20210204014509.882821-1-richard.henderson@linaro.org>
 <20210204014509.882821-64-richard.henderson@linaro.org>
 <9d107cb2-ee8c-2a89-e004-9996a647a060@weilnetz.de>
 <9f552075-1783-dc8b-f338-23e12a138ffd@linaro.org>
In-Reply-To: <9f552075-1783-dc8b-f338-23e12a138ffd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 7 Feb 2021 19:52:58 +0000
Message-ID: <CAFEAcA9TtuWaFo3cg_Qhxkg8gRqBNBkuHkSAJ-Lbxzbp23iR+w@mail.gmail.com>
Subject: Re: [PATCH v2 63/93] tcg/tci: Use ffi for calls
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 7 Feb 2021 at 17:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/7/21 8:25 AM, Stefan Weil wrote:
> >> +#include "qemu-common.h"
> >> +#include "tcg/tcg.h"           /* MAX_OPC_PARAM_IARGS */
> >> +#include "exec/cpu_ldst.h"
> >> +#include "tcg/tcg-op.h"
> >> +#include "qemu/compiler.h"
> >> +#include <ffi.h>
> >> +
> >
> >
> > ffi.h is not found on macOS with Homebrew.
> >
> > This can be fixed by using pkg-config to find the right compiler (and maybe
> > also linker) flags:
> >
> > % pkg-config --cflags libffi
> > -I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/ffi
> > % pkg-config --libs libffi
> > -lffi
>
>
> Which is exactly what I do in the previous patch:
>
>
> > +++ b/meson.build
> > @@ -1901,7 +1901,14 @@ specific_ss.add(when: 'CONFIG_TCG', if_true: files(
> >    'tcg/tcg-op.c',
> >    'tcg/tcg.c',
> >  ))
> > -specific_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('tcg/tci.c'))
> > +
> > +if get_option('tcg_interpreter')
> > +  libffi = dependency('libffi', version: '>=3.0',
> > +                      static: enable_static, method: 'pkg-config',
> > +                      required: true)
> > +  specific_ss.add(libffi)
> > +  specific_ss.add(files('tcg/tci.c'))
> > +endif
>
> Did you need a PKG_CONFIG_LIBDIR set for homebrew?

Is this the "meson doesn't actually add the cflags everywhere it should"
bug again ?

thanks
-- PMM

