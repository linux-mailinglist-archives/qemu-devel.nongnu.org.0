Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFC03138A4
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 16:56:41 +0100 (CET)
Received: from localhost ([::1]:55084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l98tz-0003At-Vw
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 10:56:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l92jU-0007Pi-2N
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 04:21:27 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:41461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l92j1-0005Db-NX
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 04:21:13 -0500
Received: by mail-ed1-x529.google.com with SMTP id s5so17206179edw.8
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 01:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BQO2IDIsOtI+x6NP4JOQZVMLHTrwCzxd0NGnNahlZoM=;
 b=uwbqyfMCL64qh41lgvbZkWXvgO4a0Tss9ebsStFnpuHCNUKm2bafBPKBQsAGigf8d/
 SkVXUe1KKVWgYxnppEWEgnmhN2oqN56BK60+897CKLfuxT06SGdrX0mD9qbiOlP2NqU8
 kRvuwaGntWwJIvN1130a7AcQn1OAdcshfgEUMzpKb6xXU6kYX3PL4ry+AZaROazXDsS9
 jD8rbHb/9N9naxi+zBf59qOHn23YGjaT1ECXoTdK0fpFnoE2LIBOxCpm+ZFoFX20A9zK
 PLdGb5RtwQvbRzpEo9jEZjA1wGTCbvJkwEN5CRoZ7JwR+ojtDBvCQizncskkcq01+nuA
 G9bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BQO2IDIsOtI+x6NP4JOQZVMLHTrwCzxd0NGnNahlZoM=;
 b=oVTDvcX7EwgX2632OH0wJbMtiXmF3TyUBwjOCpbRM14AmWIn1PLFl+QKOLgKJc9ZsF
 FHvK2Zb+maoLNf6+7Fu/u0+NrfNFySfc63VIOPpLgfD2so3sHpoaQJNEOYgvKbv75HfU
 IImZeq0Pjyq0q3sdd8eeHhlmq9t0AXHssjx1RGKvryiO7pGzLVdjtv/W6UHtf7cBNCBQ
 BYiu19a/cNhxyZhvtF0e7iQI73YuO1jOoaxFfY8DKNOl8ZGUVgiJmMEuRGtHG2djjzgK
 Pl++ZfaWoj/FWw0lUX7Ou3qrMB8V9/lUgtWzVNl+y5YJYkZTsSxNQzgUSsyLePYiLOMV
 fMaA==
X-Gm-Message-State: AOAM531Eup+xSi6sycg45zJ67s/QgdSRbHW3SjC6XJ8HLv6uT4uKGg8G
 hN8mJsE9SLqekWs6Y9XTcjA4QjGiIrXJZfz2kqSwqg==
X-Google-Smtp-Source: ABdhPJyFcKgBllkgalGm9/iCpbpQQT/aiRKuLe+Nr4KJ6ffiklqVQtRKRY/8eX7acJWnkAe5bMB1Xjj+hxN1sGdXL2Y=
X-Received: by 2002:a50:d307:: with SMTP id g7mr15307075edh.204.1612776043410; 
 Mon, 08 Feb 2021 01:20:43 -0800 (PST)
MIME-Version: 1.0
References: <20210204014509.882821-1-richard.henderson@linaro.org>
 <20210204014509.882821-64-richard.henderson@linaro.org>
 <9d107cb2-ee8c-2a89-e004-9996a647a060@weilnetz.de>
 <9f552075-1783-dc8b-f338-23e12a138ffd@linaro.org>
 <CAFEAcA9TtuWaFo3cg_Qhxkg8gRqBNBkuHkSAJ-Lbxzbp23iR+w@mail.gmail.com>
 <69d3bc09-aeb8-6a40-157e-bf0dc19c0035@linaro.org>
In-Reply-To: <69d3bc09-aeb8-6a40-157e-bf0dc19c0035@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 09:20:32 +0000
Message-ID: <CAFEAcA_=DZTRNvQsqT4dki1GTyAhL0RmhPoHG+OBw=W0yct0sg@mail.gmail.com>
Subject: Re: [PATCH v2 63/93] tcg/tci: Use ffi for calls
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 7 Feb 2021 at 20:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/7/21 11:52 AM, Peter Maydell wrote:
> > On Sun, 7 Feb 2021 at 17:41, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> On 2/7/21 8:25 AM, Stefan Weil wrote:
> >>>> +#include "qemu-common.h"
> >>>> +#include "tcg/tcg.h"           /* MAX_OPC_PARAM_IARGS */
> >>>> +#include "exec/cpu_ldst.h"
> >>>> +#include "tcg/tcg-op.h"
> >>>> +#include "qemu/compiler.h"
> >>>> +#include <ffi.h>
> >>>> +
> >>>
> >>>
> >>> ffi.h is not found on macOS with Homebrew.
> >>>
> >>> This can be fixed by using pkg-config to find the right compiler (and maybe
> >>> also linker) flags:
> >>>
> >>> % pkg-config --cflags libffi
> >>> -I/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/ffi
> >>> % pkg-config --libs libffi
> >>> -lffi
> >>
> >>
> >> Which is exactly what I do in the previous patch:
> >>
> >>
> >>> +++ b/meson.build
> >>> @@ -1901,7 +1901,14 @@ specific_ss.add(when: 'CONFIG_TCG', if_true: files(
> >>>    'tcg/tcg-op.c',
> >>>    'tcg/tcg.c',
> >>>  ))
> >>> -specific_ss.add(when: 'CONFIG_TCG_INTERPRETER', if_true: files('tcg/tci.c'))
> >>> +
> >>> +if get_option('tcg_interpreter')
> >>> +  libffi = dependency('libffi', version: '>=3.0',
> >>> +                      static: enable_static, method: 'pkg-config',
> >>> +                      required: true)
> >>> +  specific_ss.add(libffi)
> >>> +  specific_ss.add(files('tcg/tci.c'))
> >>> +endif
> >>
> >> Did you need a PKG_CONFIG_LIBDIR set for homebrew?
> >
> > Is this the "meson doesn't actually add the cflags everywhere it should"
> > bug again ?
>
> I guess so.  I realized after sending this reply that PKG_CONFIG_LIBDIR can't
> be the answer, since the original configure should have failed if pkg-config
> didn't find ffi.
>
> Was there a resolution to said meson bug?

There's a workaround involving adding the library to the dependencies
list in the right places -- commit 3eacf70bb5a83e4 did this for gnutls.
Paolo may be able to help further.

thanks
-- PMM

