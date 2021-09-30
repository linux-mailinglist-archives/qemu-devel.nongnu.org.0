Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 711A041DCF6
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:06:32 +0200 (CEST)
Received: from localhost ([::1]:41670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVxdm-00016o-F6
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:06:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxbK-0007TM-EB
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:03:58 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxbH-0005b0-5i
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:03:58 -0400
Received: by mail-wr1-x431.google.com with SMTP id m22so5162671wrb.0
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 08:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4IMqn/S+jWC16ZJwHPW3w8YoJyL04xzRvbZjc4oXW4s=;
 b=bzNN4PsWPT8+YT68k/uBx2+/eDFPml11GJsnSNYPHJpwf7yZsAvdtLfSrmjJBcwMKo
 oZMxUS7rstKsR8Z5DcBog9xt4XWODhe+rltehURMnzIAFtRTpd8FpadiKLFpqg1wWsJX
 OUzMLVLa+TPe9YyFuHvPRB6TuazeuXYQJR418z/wKZ3dw9OszAYqaP2HkHt/I9LBwZq7
 JOhKv5mkrSMeNSHZhsgDvPZs4H6ZshGqprfFp84rBBIYyIdCnKi5nqoEarTyu6iKA9RW
 1yGJWfyb0E+c2K0wQpw8ggQHNsGerQWfafyiYrE2TvVBfT6hABr+ZH1d77h9yJXo3TaA
 t/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4IMqn/S+jWC16ZJwHPW3w8YoJyL04xzRvbZjc4oXW4s=;
 b=pn9TyXGQ+aZ0o3smtSeNbtasDdRWP+kExq1ol6LFF7aR08JNS1lmt0+vkKAo3pvkws
 a294rGcPE5n2c9F3ysgpomLpm2Cm6vrUoM7V3UChnaPkM3FQ2nxxHWtaMV/wa5eNP1Cf
 rdcQU406Z8Fa7KRdDGen1UaGKTXNXYOYvD+yCvkFc6+V7HKedAi07TEzAQpqFcnJEzfg
 HZlZHrfl1efOht3C/udDWf7Ss3UI9fbaLAEbAs0LKI+zWdD2qYIKYNiWO+5PQT/zooQ+
 sUOW80wPSdHSeMfsItR9DhGNVVCauA72Ltx/k5O6NrH/7QA/mwfuCzU3SaX2LCglogJS
 jsdg==
X-Gm-Message-State: AOAM531xgNvK5cWJboNKcPnMOFQFKdT4SPvC4uI+UDHeP3gqJ8DNzvuE
 6XKUZ8/kKN2qPMy1BUW6uc6c31mO7C4ZSxnXuFCnRw==
X-Google-Smtp-Source: ABdhPJzJryMo+9pYNtDJHlcUNH1vG9obQ1iO5mNKgVdDXAqTxnK/rktMiVFrs11XHdxS9bEYIXGkkPq1mEPoZQosuqo=
X-Received: by 2002:adf:a18d:: with SMTP id u13mr6699556wru.275.1633014231372; 
 Thu, 30 Sep 2021 08:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210930133250.181156-1-pbonzini@redhat.com>
 <20210930133250.181156-2-pbonzini@redhat.com>
 <CAFEAcA_BPE47ibbkobDsa2qH3yTOKd_iU3YjR4t452wN-PzDaQ@mail.gmail.com>
 <YVXPAI5RfPvpavnA@redhat.com>
In-Reply-To: <YVXPAI5RfPvpavnA@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Sep 2021 16:02:57 +0100
Message-ID: <CAFEAcA-odLHfjLRv7+a6h2e5xYb2Lac_SofcFZ78z0cLsX4FLQ@mail.gmail.com>
Subject: Re: [PATCH 1/7] docs: name included files ".rst.inc"
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

On Thu, 30 Sept 2021 at 15:51, Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Thu, Sep 30, 2021 at 03:47:46PM +0100, Peter Maydell wrote:
> > On Thu, 30 Sept 2021 at 14:33, Paolo Bonzini <pbonzini@redhat.com> wrot=
e:
> > >
> > > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> >
> > > --- a/docs/devel/ci.rst
> > > +++ b/docs/devel/ci.rst
> > > @@ -8,6 +8,6 @@ found at::
> > >
> > >     https://wiki.qemu.org/Testing/CI
> > >
> > > -.. include:: ci-definitions.rst
> > > -.. include:: ci-jobs.rst
> > > -.. include:: ci-runners.rst
> > > +.. include:: ci-definitions.rst.inc
> > > +.. include:: ci-jobs.rst.inc
> > > +.. include:: ci-runners.rst.inc
> >
> > Why are these includes anyway? I think we should either make them
> > proper separate documents (pulled in via a toctree), or just fold
> > the whole thing into a single file if we think it should only be
> > one page. I think it's probably better to reserve the include
> > directive for places where we really do need to textually pull in
> > another file, ie where we have the same text in several documents.
>
> When editting them I find myself getting lost in the rst file. Each
> of them is covering an essentially self-contained topic, so while
> it makes sense for the rendered page to be all one, for editors it
> is nicer for them to be separate.

I think if there's so much text that you get lost when editing it
it's also likely that readers will get lost while reading it.
Mostly I distrust the Sphinx include directive, though...

-- PMM

