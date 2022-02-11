Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CF54B24F5
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 12:55:58 +0100 (CET)
Received: from localhost ([::1]:52070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIUWr-0001PF-Fu
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 06:55:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nIUTN-0000MD-03
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 06:52:21 -0500
Received: from [2a00:1450:4864:20::434] (port=41648
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nIUTK-0007WR-UN
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 06:52:20 -0500
Received: by mail-wr1-x434.google.com with SMTP id k1so14784162wrd.8
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 03:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wamW7hYAj2E7NHVJ2kYlcGI8TPeS64VluiCzCHS51oI=;
 b=xLNBooLr6KuTl6f/e1XHGlMiXJVdUJONyS0+8dMQ3IkYgfayel6eQkVAJTLxSWgvqi
 tOeleLrLTdFSC7GUtW+tfGbmwpiTOmTsWLCZDSAzwqZVzc39+KZOjy7Z4e7KRPgy59bk
 IHAnuxwLlD4GVvO8pcWKwN81SWn16kG52s/nYQB/geVBd+j/HZz3NDu8zaA9uhE5g2VX
 GIE33h5fWl1ilHcc2vlY+sz3Doc/vxobz01kcOaq+QyAnnPah8uHTufzXh4IyGyIdGcg
 3dWkLrbou1pRz9zGfEGS1Ug1Bxaf5pH3ABEkr7bSxr5g+McSVlLF512pBH5JtAQ6UpW+
 h7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wamW7hYAj2E7NHVJ2kYlcGI8TPeS64VluiCzCHS51oI=;
 b=xk9vTV6aj15McnTIEME8uo8bLb4i2hA8QD1QaGbeTrBxzcRgwWTsmpZsKSyMUax5Tb
 C5EKQzEm+FVGZMQhq0YzbRcwhb8xMInjIEcjB1+HNk6hgmqwOoyopUZU7ntgZnGsrPvL
 ne64/3oQBW/ZAFSj4iK41k5QagbtFJUBC10MdmpX/qRcU03AngOHCTucxbtnpFZgmxXW
 W5LUw2CE9R4Qqzf6G0sqTlmR4hkig3n7uzqQBBZGtE6qIIs68PJGLzBTtcItWO+IzvuY
 /C1N//R/NIdWcHxTnDBSsoEKH0fus1IZmYCtiNt9ayvxflOXpnoxCVytX5NbaUo7EEfp
 7Y0g==
X-Gm-Message-State: AOAM530mC0y9pV7feN7zxmsxvmLVeCKm76RVNoC8vQKsBtsjqAyexnf5
 PjbHecLhlW0/ufB1185UV61Rnfe/lFF6HRhhj+2kAQ==
X-Google-Smtp-Source: ABdhPJxbeCvTZjttlZl3PL4Kr5CseBKn9piBHnaBNLLOuO0a4qNPkAaphzqoOH5L2fJLw0HydLBRYpFiRRv51yywhio=
X-Received: by 2002:a5d:62c4:: with SMTP id o4mr1096694wrv.319.1644580337492; 
 Fri, 11 Feb 2022 03:52:17 -0800 (PST)
MIME-Version: 1.0
References: <20220210113021.3799514-1-alex.bennee@linaro.org>
 <20220210113021.3799514-2-alex.bennee@linaro.org>
 <8b6fca38-8a4e-af35-f202-86a5a3f98e47@amsat.org>
In-Reply-To: <8b6fca38-8a4e-af35-f202-86a5a3f98e47@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Feb 2022 11:52:06 +0000
Message-ID: <CAFEAcA-2=TD9FeOn9ZJLBmJJBfQhOKSTRWpOXEw0AVktWmE6vA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] semihosting/arm-compat: replace heuristic for
 softmmu SYS_HEAPINFO
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Keith Packard <keithp@keithp.com>, Andrew Strauss <astrauss11@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Feb 2022 at 11:48, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Hi Alex,
>
> On 10/2/22 12:30, Alex Benn=C3=A9e wrote:
> > The previous numbers were a guess at best and rather arbitrary without
> > taking into account anything that might be loaded. Instead of using
> > guesses based on the state of registers implement a new function that:
> >
> >   a) scans the MemoryRegions for the largest RAM block
> >   b) iterates through all "ROM" blobs looking for the biggest gap
> >
> > The "ROM" blobs include all code loaded via -kernel and the various
> > -device loader techniques.
> >
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Cc: Andrew Strauss <astrauss11@gmail.com>
> > Cc: Keith Packard <keithp@keithp.com>
> > Message-Id: <20210601090715.22330-1-alex.bennee@linaro.org>
>
> > +static LayoutInfo common_semi_find_bases(CPUState *cs)
> >   {
> > -    MemoryRegion *subregion;
> > +    FlatView *fv;
> > +    LayoutInfo info =3D { 0, 0, 0, 0 };
> > +
> > +    RCU_READ_LOCK_GUARD();
> > +
> > +    fv =3D address_space_to_flatview(cs->as);
>
> Why are we using the CPU view and not address_space_memory?

If you have a choice between "use the right view of an
address space" and "use the global address_space_memory",
it's better to prefer the former, I think. We use the
latter in lots of places, but it's not conceptually the
right way to think about how the memory system works IMHO.

-- PMM

