Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E7655C061
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 12:46:56 +0200 (CEST)
Received: from localhost ([::1]:44244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o68kC-0001DJ-2V
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 06:46:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o68i0-0008OQ-QE
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:44:40 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:34694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o68hz-0004fG-6b
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:44:40 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id i15so21587378ybp.1
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 03:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cNcGVkikA/Ag9kwOEDlL/3XLn1GeD9DJedwjjOB79sw=;
 b=PGasteOldNhGW95ze3T3/lrwmFW+wXH/1c3IkYrZ/wKBebHx4feJfne6vHswaLJXu9
 97PSKIEurozsPkEl1RYkefuGLJqEeD+aRnpDQygeyL7x4s6JaJgl1kx4pS3wHy1maRRG
 Pz7LRhFIr2ly1xbk3ecu/l8XwgjM9K2D7f9glparafCPTsm5ghSgEshx/3vpbMdQ8xfr
 7i8tJ6dcBN9eqrBrDWAZYNJKdOmIxdD9tikzCkon4KYm7up89Yt3mp46RCQ2GqtuwQaE
 XqESt4tsNHX24Bh8++aQn2AnruupIV8cepuqfMVHVNKEfmQRbCtfsGSX4qZO4u+w5sYY
 KbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cNcGVkikA/Ag9kwOEDlL/3XLn1GeD9DJedwjjOB79sw=;
 b=ezVgd5nXsBBnjU6Udkore+HV4uw/oU5iV156WEADnqb5STPxaDDH7EbA1PYCHL4wIp
 Op4djpDKJLOjGyR3i8I5A5QbWhb90i9LdF8ixhuML0XjzARTtGTWnTW6VI9Ufht2b+VV
 W7Pgc8gMx3R+67t1ALm49YDe77U4Dlc6w2H8XRD+eru6W1nlAMpqfmge4VrGM8gX8fyd
 6EYZgsaNiRp8dGj7bvME2XZGYXSDZfb3ruwf2RAg/RzsFlh47Ty9fLjf4pKCXDGGa/bE
 YmD00rC+BCdBZD4jknvpiEP7hM8orofWCpECH1l16VRrJRA3NVceULqf5mvm/jQQVJkY
 O7yw==
X-Gm-Message-State: AJIora8/2EBrv3Rt5PnrqmcPoUn1KJdtFLNSfLlxewCIVnQEh/ZFZb0t
 qv95Kso+Re5eM8Auh3hXwYGQioHCcwQ2feDpNzfk4g==
X-Google-Smtp-Source: AGRyM1tscbjNsrZe/r19sIL3NPj3mxnVF/lAmo6lZNwNVlCb796NTIVySgNBxpgpM6XNOKQ2qJ+77KLv6oHzE2lGP2w=
X-Received: by 2002:a5b:e87:0:b0:66d:4669:9871 with SMTP id
 z7-20020a5b0e87000000b0066d46699871mr354810ybr.288.1656413076698; Tue, 28 Jun
 2022 03:44:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220628030749-mutt-send-email-mst@kernel.org>
 <7bf5976e-8277-7c78-f412-44f7be8754f4@redhat.com>
 <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
 <20220628060210-mutt-send-email-mst@kernel.org>
 <d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com>
 <20220628062551-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220628062551-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jun 2022 11:43:58 +0100
Message-ID: <CAFEAcA985ardY5zWkrZYgWjj+tdVNUnRcaBUChGFX0-o99cjQA@mail.gmail.com>
Subject: Re: Why we should avoid new submodules if possible
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Ani Sinha <ani@anisinha.ca>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 John Snow <jsnow@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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

On Tue, 28 Jun 2022 at 11:38, Michael S. Tsirkin <mst@redhat.com> wrote:
> On Tue, Jun 28, 2022 at 12:21:39PM +0200, Thomas Huth wrote:
> > - we include the submodule content in our release tarballs, so people get
> > the impression that hte submodule content is part of the QEMU sources. This
> > has two disadvantages:
> >  * We already got bug reports for the code in the submodule,
> >    where people did not understand that they should report that
> >    rather to the original project instead (i.e. you ship it - you
> >    own it)
> >  * People get the impression that QEMU is a huge monster
> >    application if they count the number of code lines, run
> >    their code scanner tools on the tarball contents, etc.
> >    Remember "nemu", for example, where one of the main complaints
> >    was that QEMU has too many lines of code?
>
> I think we can skip the checkout in the tarball if we like.
> If people want to run the test they can checkout then.

For tarballs and submodules, we want to provide the code in the
cases where we're providing binary blobs, and for where it's
required to build QEMU proper.

Overall I think that the approach we use today for providing
guest binaries (submodules with the code, pre-built blobs checked
into git) is creaking at the seams and often awkward for downstream
distros (who want to rebuild the binaries anyway).

Plus submodules in general in git work really badly and awkwardly,
and I'd rather we didn't add them unless we really must.

We already have an approach for "tests that use binaries" --
the avocado test suites. Is that something we could use in this
case ?

thanks
-- PMM

