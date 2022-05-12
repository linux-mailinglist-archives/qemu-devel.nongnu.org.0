Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FC05252B1
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 18:35:57 +0200 (CEST)
Received: from localhost ([::1]:40610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npBnA-0006vF-EQ
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 12:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npBK7-0003yL-PS
 for qemu-devel@nongnu.org; Thu, 12 May 2022 12:05:58 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:40400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1npBK5-0000KH-UF
 for qemu-devel@nongnu.org; Thu, 12 May 2022 12:05:55 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2f7ca2ce255so61901167b3.7
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 09:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w3ZhTh+pukXFY1lS6X8WpsUAFUiVeSRYCbrGDK+nJEo=;
 b=Ucg5zX8DMZ9beKPYE6tAqRBZSpTH9OQ/jjHZkh8c6px77CXWt8wbDJ3F/6/8FBqZKa
 +NEcsfy/UrbpE19nf4qqwKqJ3F0GeLbyRhGWm5Pl/uMwS8jBbQHUxkssIG8/pHuDY9rL
 Q2IOkZH2F+3FMJFzTtMK3QKqG4xLZz7nANRuCbYT4xHVk7INQY8VsESGwY7R9f3DSDhc
 XwLTPomkGtF1xo5FY9hKTLe3XNnf/QIh8NmTyHeWdQTpP6fkOA7C4ViWexmny08PsDKm
 SZO481uV6V8XfqYVSN2UA7Ysp7jUf9LBauvFHr69cwFBKOIHQP4fP/lC/FHJFZ6Ue+6O
 GXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w3ZhTh+pukXFY1lS6X8WpsUAFUiVeSRYCbrGDK+nJEo=;
 b=h1ttGneB+9SENh3Pw12baTVkBK9RlfQKJw5emcwLSloND1o/xzWbG8WtGghjrKm1NO
 2+fzTCm1tXLilfNkWWCQI/AaOJIwU3nRE2MlbfJLfDb11UTlacLdiYMykTe4tYPp49fE
 8XGTj5Mo7B6t5rj1hREITkoRd2oGSEN3QaSBGrxAfsMr90Liz9WiIl03LU2s/BgndYkH
 96WXtj4Qi7NvbEQ6nS5YvyA8PLzAkBC6mbXzPPEsF6QOvYFDdMMiHw3fvBEkQ1N7cbd4
 2CNY86ZnzYAtvwxva1tVRunxbqhsjHFwBbrJsUhOyaFbExIxUFGfo7ixSlShYKWXlQRt
 SmOA==
X-Gm-Message-State: AOAM533uuj2F2VK1ISh1wUTDucAIOJ7MahxJYTVOhqKUoL+jLlMbYYhk
 I9pX9CFpGphVv7il0OVMBkmdm2QRtiJb8v4pQqlH+A==
X-Google-Smtp-Source: ABdhPJxXwcS5sBYnouKGHHJ0djkqhWyR9YT+CJvyaoQtDd4sizjeiDdOu3nHH//LamHmjyfaK2uJ/aj+iKXFuuRuZrE=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr817862ywb.257.1652371552846; Thu, 12 May
 2022 09:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200305165149.618-1-eric.auger@redhat.com>
 <20200305165149.618-11-eric.auger@redhat.com>
 <CAFEAcA8pC4RQ3oVVVzG4NA8fBkhzspxD+DyZB+UCn7u1aPSP5A@mail.gmail.com>
 <52bdff5a-f33a-c76b-0e04-b20970e3ec1d@redhat.com>
In-Reply-To: <52bdff5a-f33a-c76b-0e04-b20970e3ec1d@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 May 2022 17:05:41 +0100
Message-ID: <CAFEAcA_2kLcL4j9Dgv5QfWw5d2shK1GBrGXFMffWKgfVguWgqw@mail.gmail.com>
Subject: Re: [PATCH v5 10/10] test: tpm-tis: Add Sysbus TPM-TIS device test
To: eric.auger@redhat.com
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 12 May 2022 at 16:59, Eric Auger <eric.auger@redhat.com> wrote:
>
> Hi Peter,
>
> On 5/12/22 15:08, Peter Maydell wrote:
> > On Thu, 5 Mar 2020 at 16:52, Eric Auger <eric.auger@redhat.com> wrote:
> >> The tests themselves are the same as the ISA device ones.
> >> Only the main() changes as the "tpm-tis-device" device gets
> >> instantiated. Also the base address of the device is not
> >> 0xFED40000 anymore but matches the base address of the
> >> ARM virt platform bus.
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> > Hi Eric; the commit adding this test is from back in 2020, but I've
> > just noticed something a bit odd about it:
> >
> >> +    args = g_strdup_printf(
> >> +        "-machine virt,gic-version=max -accel tcg "
> >> +        "-chardev socket,id=chr,path=%s "
> >> +        "-tpmdev emulator,id=dev,chardev=chr "
> >> +        "-device tpm-tis-device,tpmdev=dev",
> >> +        test.addr->u.q_unix.path);
> > This 'virt' command line doesn't specify a CPU type, so it
> > will end up running with a Cortex-A15 (32-bit). Was
> > that intended? Also, it will get a GICv3, which is a
> > definitely odd combination with an A15, which was a GICv2 CPU...
> no it is not intended. I guess it should include "-cpu max" too
> as arm-cpu-features.c does?

Seems like a reasonable thing to set, yes.

> > I noticed this because I have some recent GICv3 patches which
> > end up asserting if the GICv3 and a non-GICv3 CPU are used together,
> > and this test case triggers them. Since the user can also cause
> > an assert with that kind of command line I'm going to rework them
> > (either to make the virt board fail cleanly or else to make the
> > GICv3 code do something plausible even if the real hardware CPU
> > nominally didn't have a GICv3). But maybe we should make this
> > test case not use a non-standard combination anyway? (The meson
> > conversion seems to have resulted in this test being run under
> > qemu-system-arm as well, incidentally, so I guess we would want
> > it to specify either 'a 64 bit CPU and GICv3' or 'a 32 bit
> > CPU and GICv2' accordingly. Or limit the test to aarch64...)
> limiting the test to aarch64 may be enough?

Mmm, if running the test under 'qemu-system-arm' isn't giving
us interesting extra coverage we might as well save the CI cycles.

-- PMM

