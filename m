Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC215EE261
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 18:57:19 +0200 (CEST)
Received: from localhost ([::1]:38222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odaN5-0005nk-18
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 12:57:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odYfD-0005lS-Ld
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 11:07:57 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:34458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1odYfB-0004GK-Ra
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 11:07:55 -0400
Received: by mail-ed1-x52d.google.com with SMTP id z2so17692409edi.1
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 08:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=1OjADjcHIa5oye8m1Kk8lly43iT5jG2KQcsbRYzrMLE=;
 b=VMeXSwDOsAM/fSXB2WYeS3s1ll3hblGAwav9MJuQrD3Y9tKec+HITC2xyjZ+JXx3j+
 ghQeSFSVsJfEYAVI7EMeuYxfizlh6/qR8e6jVV7o7itP2NB6Q2Ag1AcI/Lhqa4APjHw9
 N7itTlihXLOCVtDnn6Db/1Sr8GQg56Bfl9ggJEvKzl/Ubvq8FPv8PGS1uRlv1SSnFJKh
 JuRrVYTiQmUsVMK4fIuzDktZeCha0cKEdThI/gboTQEioOloAHyKsWzT3ZcF50F4UXyj
 +tD92Xfr93QhrJgr6OcsZKvox5gRX1XrdsIydewt+GNyYkweRGXeAbjm18OsVZISgjLx
 ro+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=1OjADjcHIa5oye8m1Kk8lly43iT5jG2KQcsbRYzrMLE=;
 b=1bnVPDX2FqIwfAFg4Zwai6U1Wmjk7PhDlFzL+CDLwUxCthQLg+hXU8S9mnWxAAUQwF
 Af85UVYmkOGlRxHBnZVYMLYJ++bZpEHU5q81NOKC9TMeZTNp4gPsbrl8bZ6cJ/wH+XPP
 c5jeeq6y/iyMUGRc8JgiNhcl3OVsMqbYqiMMQWJBEzoBDq+IvJE3bDprmnEoDOA+ns2F
 EhO2ix6hJ1ZR8/4yrx1QGwV6AfsaEK3/dZQegofw9BSyjjpYNbjFMZ2Z3Krh4X8ENbR7
 a+HMzq3VF2+LJeN5MEGLWWopNbq/GO9rE64ua2NzzNGjOnBoeFXqNUGPArfpxlSVjs2u
 wOzA==
X-Gm-Message-State: ACrzQf2DABWLL+FcqbxlHKvvJJjxFm/cXW3zur5OiFaQgYXQIxVNVjZx
 wQt4Q3uD0ETcfBd/p/AzBn1hXopMKLNpouqMHuVZpA==
X-Google-Smtp-Source: AMsMyM5Q75QT+BOStfYNPXyGCddu1LGPRO5p34fWWrbW19DdRCkA3DQkvvJc2UYEw2ezyo4iWbC0qrm1jk/h70s08v4=
X-Received: by 2002:aa7:c610:0:b0:44e:9a0f:753a with SMTP id
 h16-20020aa7c610000000b0044e9a0f753amr33110984edq.140.1664377671911; Wed, 28
 Sep 2022 08:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <CAARzgwxcjppQuO65aFzyzNBaFvJer7JEWoJeALaoKON=3XAQhg@mail.gmail.com>
 <20220628060210-mutt-send-email-mst@kernel.org>
 <d7a7b28f-a665-2567-0fb6-e31e7ecbb5c8@redhat.com>
 <20220928052352-mutt-send-email-mst@kernel.org> <YzQVyj5ouhGshZ2+@redhat.com>
 <20220928061303-mutt-send-email-mst@kernel.org> <YzQfah9Iu/MB0Zh/@redhat.com>
 <20220928062623-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220928062623-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 28 Sep 2022 16:07:40 +0100
Message-ID: <CAFEAcA9r9-WRV+WL_cLf5oomRPj8xke9y=JyVshw4Ff1FY4P7Q@mail.gmail.com>
Subject: Re: Why we should avoid new submodules if possible
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 imammedo@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, 28 Sept 2022 at 15:29, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Sep 28, 2022 at 11:18:18AM +0100, Daniel P. Berrang=C3=A9 wrote:
> > On Wed, Sep 28, 2022 at 06:13:45AM -0400, Michael S. Tsirkin wrote:
> > > On Wed, Sep 28, 2022 at 10:37:14AM +0100, Daniel P. Berrang=C3=A9 wro=
te:
> > > > There's also the perenial problem that developers frequently send
> > > > patches that mistakenly include submodule changes, which is related=
 to the
> > > > way that 'git checkout' doesn't sync submodule state when switching=
 branches.
> > >
> > > Do you happen to know how exactly that happens?
> >
> > For any given branch the submodule is synced to a given git commit hash=
.
> > If the submodule checkout is not synced to the same commit hash it will
> > show as dirty, and if you git add this pending change, it'll record tha=
t
> > new submodule commit hash.  Seeing dirty state is common when you switc=
h
> > between branches, either side of a git master change that updated a
> > submodule.
> I see. It is interesting.
>
> So apparently what you want is ignore submodule
> changes, right? If yes this is close to what we want:
>
> git submodule update --checkout testsub
> git update-index --skip-worktree testsub
>
> A script checking out the submodule can just run this
> command.

The problem happens not when you check out the submodule, but when
you do basic not-submodule-related git operations like
"git checkout my-working-branch". The fix would be if git itself
automatically kept submodule state in sync with the main repo's
branch. But it doesn't, so the UI is a massive beartrap.

-- PMM

