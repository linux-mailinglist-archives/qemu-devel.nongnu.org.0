Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7512E5090C8
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 21:54:15 +0200 (CEST)
Received: from localhost ([::1]:38874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhGP0-0003lf-J4
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 15:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhFwO-0005tF-V0
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:24:41 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:42917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhFwM-0004Py-OA
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 15:24:40 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id p65so4675722ybp.9
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 12:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6QnCp7s5TAfHx/fjg0yOfJlJk1IPDAIRJ2VTwMwdcps=;
 b=szebIxfY5tNO8N1rVtr2fI2cZyLQuuRxWoTV6kVeIv34hfoRy9u2BUEBtNZwX9toR0
 RCevBsAGSPTVSildhDXiQrNotBEjh6zQEz0jSXSYe8M5OsDhuu1fccLnxXjsKCBhlYKN
 6pVGM+TGndopUybogbvATXM/PhmHgC21ekwrYroYN+vTExKyyQsZpafU1GluGXVhD25+
 bcUAko9RnGxZFl0ImJIOV1LZ5DEG5LGXr7nyX4/h9sgTZDehkI2H57YKNGLQOEC/Qh+p
 AHh2M/iI2XKaAtU6Y1/D13ApQ9+MRvyeRJ5/Nx8820nPogNyQQOAaitKxra0sI9p1aim
 n7ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6QnCp7s5TAfHx/fjg0yOfJlJk1IPDAIRJ2VTwMwdcps=;
 b=fke//U2WVxqik0cnyQ4XQYVUCtxMDaZgvL1KODblmjGSn6fL74m6x+F3N+fuAZ+LLl
 8xrV04j1XCvUVffE8djehBXovClcGENjseBGbWRu76uIU1N86GHqnYUmHFGeD8MA6xAT
 3c+dBptHGNVN9zkbk0MvuPawrKpbd4pD8KohHV07wT3ic1UhyuAvIBjlJlmwQvsjgPcw
 kUF0FM6d29gkTl1Hbuo0lwzI4B/DXlDf/zhUKzt7Pwy9F7QRWThd8yloaw+jUcqfhk2l
 jhkvUVj4GLA1Fvthfn2sQfxw4Aa9z30SNeo0CFOUyOlQDqYgZBf7ELpKQGpvrY3WV1F9
 Txtw==
X-Gm-Message-State: AOAM533XgQVb8DNH2cw/nZwGy9nnKlg7Eghay/insf1Ul5JHvacdIqYk
 s+Bo8H8aSxppkjSbe/vtbeEsZdw6007kaVqiivbJZg==
X-Google-Smtp-Source: ABdhPJwKmaKdksNnk3kWKdD6J1a3xbIIFyYvyWgNYQIoWNhA4xctKK7lGXgBCFsqYeMeYuWuROrHx32bEmz7LzUhqhg=
X-Received: by 2002:a25:3b55:0:b0:641:bd5:e3fa with SMTP id
 i82-20020a253b55000000b006410bd5e3famr21360135yba.193.1650482677568; Wed, 20
 Apr 2022 12:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220418191100.270334-1-leandro.lupori@eldorado.org.br>
 <20220418191100.270334-2-leandro.lupori@eldorado.org.br>
 <CAFEAcA8YzC-gFCv73S-5uxPvcUP=9TFP50xsi44L8Gm-B4ZScg@mail.gmail.com>
 <5a99283a-8d7c-e6d5-30fd-b148a2b59ead@eldorado.org.br>
In-Reply-To: <5a99283a-8d7c-e6d5-30fd-b148a2b59ead@eldorado.org.br>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Apr 2022 20:24:26 +0100
Message-ID: <CAFEAcA-ex4dJM18WzR2TMme6iB-VCNGaYnkSNECMWLV+ADrS+w@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/5] ppc64: Add semihosting support
To: Leandro Lupori <leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, pbonzini@redhat.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Apr 2022 at 19:20, Leandro Lupori
<leandro.lupori@eldorado.org.br> wrote:
>
> On 4/19/22 06:26, Peter Maydell wrote:
> > On Mon, 18 Apr 2022 at 20:15, Leandro Lupori
> > <leandro.lupori@eldorado.org.br> wrote:
> >>
> >> Add semihosting support for PPC64. This implementation is
> >> based on the standard for ARM semihosting version 2.0, as
> >> implemented by QEMU and documented in
> >>
> >>      https://github.com/ARM-software/abi-aa/releases
> >>
> >> The PPC64 specific differences are the following:
> >>
> >> Semihosting Trap Instruction: sc 7
> >> Operation Number Register: r3
> >> Parameter Register: r4
> >> Return Register: r3
> >> Data block field size: 64 bits
> >
> > Where is the independent specification which defines that
> > this is the ABI for PPC semihosting? You should provide the
> > URL for that in a comment somewhere.
> >
>
> AFAIK, there is no official PPC semihosting specification. Would it be
> ok to just document it somewhere else, e.g. GitHub, as an unofficial
> specification?

I'm going to push back on this in the same way I did for
the RISC-V folks. If this is an official PPC semihosting
specification, intended to be supported by multiple
different pieces of software, it needs to have an
independent spec document somewhere (even if that
spec document just cross-refers to the Arm spec for
most of the detail). If this is an ad-hoc "add this
thing for PPC in a purely QEMU-specific way" patchset,
then no, we shouldn't implement it.

Semihosting is an ABI, and when QEMU implements an ABI
it should be because it's an external pre-existing one.

thanks
-- PMM

