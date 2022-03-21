Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1154E24EB
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 12:03:32 +0100 (CET)
Received: from localhost ([::1]:35680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWFox-00069V-4H
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 07:03:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWFnE-0005Q3-2d
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 07:01:44 -0400
Received: from [2607:f8b0:4864:20::b2d] (port=35670
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nWFnC-0001Yz-7L
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 07:01:43 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id o5so27326042ybe.2
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 04:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wSSpsBPzZ/r1Fvi1opWUkoYVj1/KYSwGLAnzHX5rzfo=;
 b=Hsg1/7u44OeZF7mhQctS+T7oLe68JRhryofiGArLXzSXyPYa0ixQSkjE/F42a4ZeSS
 +yIdFFJ7Q7rBY/x9/cBhKMqepcaZ3UMrPu2Z0dqqM4hTgZxlf8lVqmMby7TOcdZ/HSfD
 FspwwGJu3+XRBqlWfeOW2kZ4Bf0OHxRh/cU3kyqCZlIx7AGngS2uOVe0uNOSIJ012HOd
 qTs7Qhb5s8AgD5j/DGndBxhYK6oN/bfUjS5tdWQn/1W5hGpT4Vku0Lx6d39yv6+BDj6v
 iA+joVrY1t87u1JLYqlGYiLh45TVz8k6dls592T3+p1H0s4yBTYHv/MlCOkP8u61Eu9O
 ls8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wSSpsBPzZ/r1Fvi1opWUkoYVj1/KYSwGLAnzHX5rzfo=;
 b=vapao/FSWpj6ewr1798daK21BSeWk2jJOAEkXDqnv3fjsJlzDVIOlc+oZQX7EvfODq
 OVE5u9zH1bDhmv0h4IlIgmPRmamA2JtvWiJaLnKEgrf4w2DksE4/yibdkN3rRXEl5fD2
 7L4k37FQXocEHO1HNKIadpJwO2xF5lB0dNsFclRGrvPDDCbZabiW8MVD+oc/bB/W/UNS
 3uT5UvTauuibd5uo0BIvbDz+h0R/ZcyZtgStJguuVw+NmvdGWYYrHctNxLLaCj2iEQCO
 RLJVrZIujpG6KtYSS0SyRT5zxiKRFOUjdeBhXIGHZQmpgks6zmz43qGwXNH/gwmSsfz+
 vZYA==
X-Gm-Message-State: AOAM530F6vl2fy1oWKcnrP9qQClp2V7g0kb/OXlRzouh/LBvx+JvWb7W
 SE3JB4CsG7u7TXerFxl8SKFU9P+IURwg1a4Iu0R+OQ==
X-Google-Smtp-Source: ABdhPJxpYqgzAcKX4NU5qwXeakDH4Ep8o23PpGtU/nl1PXadGalcu9ucOIDSnRBfEYMvnrMYSOqfhCIrEC5xbJVIfuM=
X-Received: by 2002:a05:6902:83:b0:61a:709b:d841 with SMTP id
 h3-20020a056902008300b0061a709bd841mr20315924ybs.140.1647860500833; Mon, 21
 Mar 2022 04:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220314104943.513593-1-kchamart@redhat.com>
 <20220314104943.513593-3-kchamart@redhat.com>
 <31ae45f5-e9ce-f905-ea4f-c5d869ecc72b@redhat.com> <YjC4Bmr3s96TzYTv@paraplu>
 <CAFEAcA9vqS+2Tou1iK7hqmFXnvsXxABmYW9EQRjGnKKAp=k_xQ@mail.gmail.com>
 <YjhLeU8sIIMAwUK+@paraplu>
In-Reply-To: <YjhLeU8sIIMAwUK+@paraplu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Mar 2022 11:01:28 +0000
Message-ID: <CAFEAcA9swaArGjwxGUsX3n7pkQMLsK6aA=T37kC_RhbrNM4dBg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] docs: rSTify MailingLists wiki; move it to QEMU Git
To: Kashyap Chamarthy <kchamart@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: pbonzini@redhat.com, Thomas Huth <thuth@redhat.com>, eblake@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Mar 2022 at 09:55, Kashyap Chamarthy <kchamart@redhat.com> wrote:
>
> On Tue, Mar 15, 2022 at 04:12:50PM +0000, Peter Maydell wrote:
> > On Tue, 15 Mar 2022 at 16:00, Kashyap Chamarthy <kchamart@redhat.com> wrote:
> > >
> > > On Tue, Mar 15, 2022 at 02:25:05PM +0100, Thomas Huth wrote:
> > > > On 14/03/2022 11.49, Kashyap Chamarthy wrote:
> > >
> > > [...]
> > >
> > > > At least the "users" mailing list is not related to development, so maybe
> > > > this should rather go into docs/about/ instead?
> > >
> > > Yeah, makes sense.  I wonder if should create a new doc in docs/about/
> > > for user-lists, as none of the existing docs fit the bill:
> > >
> > >     build-platforms.rst  deprecated.rst  index.rst license.rst
> > >     removed-features.rst
> >
> > Yes, I think that about/ should have a document something like
> > "Contacting the project" or "Support", which could tell users about not just
> > the user-facing mailing lists but also where to file bugs, and so on.
> >
> > In fact, it should probably look rather like the
> > https://www.qemu.org/support/ page...
>
> Heh, thanks, I missed that page.  So, if I parsed you right, you're
> implying, given the above qemu-web page, there's no need for a separate
> about/support.rst doc.

I think there is some merit in the documentation being standalone,
even if it does mean a bit of duplication with the website.

-- PMM

