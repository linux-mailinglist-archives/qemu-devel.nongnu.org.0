Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEC641EE75
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 15:23:10 +0200 (CEST)
Received: from localhost ([::1]:48546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWIVJ-0004G0-Nb
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 09:23:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWISf-0001xi-5S
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 09:20:26 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWISV-0005N8-Ky
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 09:20:19 -0400
Received: by mail-wr1-x429.google.com with SMTP id s21so15437280wra.7
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 06:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bk0N0V39JIZnXSoqKBIMrqvZmmzqYkOMst2CI14/K+8=;
 b=DsWXIJvyyXeYsk6YDH+szvRkoLie8sNGoDbU3wDMLnFpXMBArMCQ/FVWPacPHQvyVG
 V0jnt3RYRbE0XJWsmejML4mBj38hIuBMo4hrtba/7RVEM9rXw/r9YnMfRjg8GTLZLT6P
 bt9MWC8ldMKkvUGA2/MI/nHUfgU8bIRZzKA3B+cwBliamGhED0NMj0fdw9P/O34lAAJl
 zvAfu2RP6lQkgEeNuMImPDCQo5RULT/MhMhtZHATDhajuphLdrdDzzD1vP9FWY0aRybx
 hHOGxLU++EodNV4y8DGrus39K7/scY8TRoxtUtNtqCHZvG3FhpmIjWxi0M/uXwcq2i7d
 Qjkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bk0N0V39JIZnXSoqKBIMrqvZmmzqYkOMst2CI14/K+8=;
 b=pu8113xGZ8yFnK7hlA9PQleTOC4sLfSAe0avsAa03Qzv2tGL06VZxGZ5bOql/G30m8
 E8FXUBjVxaJskvQsOK2BIyBgVWsUJKd7qOBDi1LP+n++PXxAakj+6BqmsW423ZCgpx7+
 2UGqXDIw9g/A/sxKmgCxWqnQ2HmJ1CrFHVTUe5gBZpUsz3AqFsIzap33Btl3zlSesxMl
 w2+M5+a6FE93lek3WI21yr+812Ub+TtEjPnLEB/3oD2eOgIfhiTBJTwY0WUzBFqhiUfe
 PGUiA7L+E8gqwLaVRoaOYRoc/n7OZKNAsZ/i/p9GeihsKdAvaRO3eFSKUhAIZAdAQdYH
 vbiw==
X-Gm-Message-State: AOAM531AZz8928JBHwB640XNv+fLaAzEij5t9F/a34cvznQ5I0MZ2Jvy
 MGL+QcoMIBWlr9DywWVJ2dbgae7MuIyt3MXTgfPrGA==
X-Google-Smtp-Source: ABdhPJzEAkXBy7hoj2dEU1B8raQQ7qQGubWJVJxkpgskpAoIVAfJQbDHv1693IgG+HeBSyjDch4BxsJ6//OEQSe41Ig=
X-Received: by 2002:adf:ab02:: with SMTP id q2mr1694105wrc.263.1633094410892; 
 Fri, 01 Oct 2021 06:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211001121943.1016447-1-thuth@redhat.com>
 <CAFEAcA_Vjvi8JvELyG1DghCoHbUR1fzodPoaU2n-QPcf9bGwCg@mail.gmail.com>
 <ee30cba8-9da1-eefa-0e91-3f5f85708348@redhat.com>
In-Reply-To: <ee30cba8-9da1-eefa-0e91-3f5f85708348@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Oct 2021 14:19:16 +0100
Message-ID: <CAFEAcA-QTiMhaGa+TVmfbGSC=FT0cqKyshvEunstZ1hy2FZfaw@mail.gmail.com>
Subject: Re: [PATCH] hw/ppc: Deprecate the ref405ep and taihu machines and the
 405 CPU models
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 1 Oct 2021 at 14:01, Thomas Huth <thuth@redhat.com> wrote:
>
> On 01/10/2021 14.46, Peter Maydell wrote:
> > On Fri, 1 Oct 2021 at 13:22, Thomas Huth <thuth@redhat.com> wrote:
> >>
> >> These machines need a firmware image called 'ppc405_rom.bin', and nobody
> >> seems to have such a firmware image left for testing, so the machines are
> >> currently unusable. There used to be support in U-Boot, but it has been
> >> removed a couple of year ago already.
> >> Thus let's mark these boards and the 405 CPU as deprecated now, so that we
> >> could remove them in a couple of releases (unless somebody speaks up and
> >> says that these are still usefull for them).
> >>
> >> Signed-off-by: Thomas Huth <thuth@redhat.com>
> >> ---
> >>   docs/about/deprecated.rst | 15 +++++++++++++++
> >>   hw/ppc/ppc405_boards.c    |  2 ++
> >>   2 files changed, 17 insertions(+)
> >>
> >> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> >> index 2f7db9a98d..27c03ef624 100644
> >> --- a/docs/about/deprecated.rst
> >> +++ b/docs/about/deprecated.rst
> >> @@ -238,6 +238,11 @@ The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
> >>   (the ISA has never been upstreamed to a compiler toolchain). Therefore
> >>   this CPU is also deprecated.
> >>
> >> +PPC 405 CPU models (since 6.2)
> >> +''''''''''''''''''''''''''''''
> >> +
> >> +The related boards ``ref405ep`` and ``taihu`` are marked as deprecated, too.
> >> +
> >
> > What is this "too" a reference to? The immediately preceding section
> > in the document is about the MIPS I7200 CPU model.
>
> It was meant as a reference to the machines below. I'll try to rephrase in v2.
> (As far as I can see, the 405 can only be used on these boards, it does not
> seem to be possible to use these CPU types on other boards)

OK. I think it's probably a good policy to make deprecation-notice
section text self-contained, because we're going to be regularly deleting
them, or moving them to removed-features.rst.

> > The not-being-deprecated sam460ex board also uses the ppc405 CPU
> > I think, so I don't think we can drop the CPU models.
>
> No, that board uses a 460exb CPU which is a slightly different kind of
> embedded PPC CPU, as far as I know.

Ah, right. I was confused because sam460ex.c calls ppc405_ebc_init(),
and so it came up from a quick grep for 'ppc405'.

If we want to deprecate the CPU models I think it would be useful
to list all the ones we're deprecating explicitly here (using the
names that the '-cpu' option accepts).

thanks
-- PMM

