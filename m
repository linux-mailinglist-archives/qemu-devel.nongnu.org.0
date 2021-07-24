Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A593D480D
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Jul 2021 16:06:30 +0200 (CEST)
Received: from localhost ([::1]:42644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7IIO-0003c9-DJ
	for lists+qemu-devel@lfdr.de; Sat, 24 Jul 2021 10:06:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7IHK-0002rD-QB
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 10:05:23 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:39634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m7IHJ-0008Tp-8h
 for qemu-devel@nongnu.org; Sat, 24 Jul 2021 10:05:22 -0400
Received: by mail-ej1-x635.google.com with SMTP id he41so8030824ejc.6
 for <qemu-devel@nongnu.org>; Sat, 24 Jul 2021 07:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3+ztrBwBQIJdViRfnBm7cKbkxWAQUyXafOWYJMdqKK8=;
 b=YyxHEiFYijQKUDV6L8NlEvHFH09huaotlELjpgBeuE/KUhR6CsrDIR2YIAlgi3ZT97
 RRlHRDLpL1LYbBtKpOYYQaHL7eYTSAhMDAGNppeuQz37PVMpn2YhUYUimZJNKsQgQZuN
 nbizKib1wdtqLSjFt+3oJz23n6dC4sgogjCjfcrTp/2h0X29kLTk7+zxOUOc+SRPbsk8
 CdptmL/pPp8OUreqqiYqgQ3c2QjP8ABPfSPLKCtLrUiZ+Wyvs3ATOQ25o/SfNrttj2cM
 afpq+yhO1/44ww04qm2LuvbVtqQZZMB2pWd6gEKqlUtoNqHQ5zRwkYcboI6yxpGL1yNM
 XKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3+ztrBwBQIJdViRfnBm7cKbkxWAQUyXafOWYJMdqKK8=;
 b=NHfcrX0hcYHzGWcRprkAH/02RVMDWphMhBBQJkDUyBljzlfmXBVaAUcI1OQ3Dp5Ksd
 kiSDD7B5TfkGkdA/E1+3cbIqrGjTEoSoI185lpRG7ihpcWUGO+hs6ocZsvAnrZyaGa5n
 G1A7FUg8gr1CZv+ywk0rXzVBX4VuZ43xaIsNsYzoQSzk+t1JL77SqqJh07FSgDy8zeOy
 QvBf8Navzm8Rg2pbTRKIhpbZwIJrt7gw/o8+FRkUjsdGRCMT3Z0I8AyeArKmrjNNah4v
 QAIqLzCaQMJW+TcMhVeLAAufNi6YL819C3ivHJgBQ3+m6pdZ4kKXkZY5y0x4j6O9RLa9
 MkRA==
X-Gm-Message-State: AOAM533Z0VlAmyx1CkLCVEh7INauz4tcy5zCaWa/+rTnV8OmEc1yxijj
 fRXgb5J9qREWi6qj8Jn452CSb5AEzOhfaA9a+XVHJQ==
X-Google-Smtp-Source: ABdhPJz6LJUmBYWgWlxKeYo6iysj3QCEKUotFAuGmswR3UmUbvP4T7P+giH5MTzxUKFrChpzMhsXHxkcQTWY0X/731s=
X-Received: by 2002:a17:907:3e02:: with SMTP id
 hp2mr9135351ejc.4.1627135519332; 
 Sat, 24 Jul 2021 07:05:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210722040535.3683543-1-stilor.ref@att.net>
 <20210722040535.3683543-1-stilor@att.net>
 <b55095dc-4500-2139-0e17-d1865e624fab@att.net>
In-Reply-To: <b55095dc-4500-2139-0e17-d1865e624fab@att.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 24 Jul 2021 15:04:37 +0100
Message-ID: <CAFEAcA_hdteZrNN6xS1xbBBTRiNLNh6HO0Y7de7iiMWGUdN8kg@mail.gmail.com>
Subject: Re: [PATCH] Makefile: ignore long options
To: Alexey Neyman <stilor@att.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 24 Jul 2021 at 07:16, Alexey Neyman <stilor@att.net> wrote:
>
> Patch ping...

Ccing Paolo as author of this bit of code...

> On 7/21/21 9:05 PM, Alexey Neyman wrote:
> > When searching for options like -n in MAKEFLAGS, current code may result
> > in a false positive match when make is invoked with long options like
> > --no-print-directory. This has been observed with certain versions of
> > host make (e.g. 3.82) while building the Qemu package in buildroot.
> >
> > Filter out such long options before searching for one-character options.
> >
> > Signed-off-by: Alexey Neyman <stilor@att.net>
> > ---
> >   Makefile | 8 +++++---
> >   1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 6c36330eef..401c623a65 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -129,9 +129,11 @@ endif
> >   # 4. Rules to bridge to other makefiles
> >
> >   ifneq ($(NINJA),)
> > -MAKE.n = $(findstring n,$(firstword $(MAKEFLAGS)))
> > -MAKE.k = $(findstring k,$(firstword $(MAKEFLAGS)))
> > -MAKE.q = $(findstring q,$(firstword $(MAKEFLAGS)))
> > +# Filter out long options to avoid flags like --no-print-directory which
> > +# may result in false positive match for MAKE.n
> > +MAKE.n = $(findstring n,$(firstword $(filter-out --%,$(MAKEFLAGS))))
> > +MAKE.k = $(findstring k,$(firstword $(filter-out --%,$(MAKEFLAGS))))
> > +MAKE.q = $(findstring q,$(firstword $(filter-out --%,$(MAKEFLAGS))))
> >   MAKE.nq = $(if $(word 2, $(MAKE.n) $(MAKE.q)),nq)
> >   NINJAFLAGS = $(if $V,-v) $(if $(MAKE.n), -n) $(if $(MAKE.k), -k0) \
> >           $(filter-out -j, $(lastword -j1 $(filter -l% -j%, $(MAKEFLAGS)))) \
>

-- PMM

