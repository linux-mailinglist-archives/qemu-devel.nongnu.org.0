Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57303570014
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 13:19:45 +0200 (CEST)
Received: from localhost ([::1]:38206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oArS4-0001jb-36
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 07:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anders.roxell@linaro.org>)
 id 1oArQB-0006Je-R0
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 07:17:47 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:47012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anders.roxell@linaro.org>)
 id 1oArPu-0005T0-II
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 07:17:47 -0400
Received: by mail-pl1-x633.google.com with SMTP id l12so4126249plk.13
 for <qemu-devel@nongnu.org>; Mon, 11 Jul 2022 04:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Q2gUroj1wYZHw0Na7ndJnXEPlpzhpMRIriQNm0MkpII=;
 b=aovM00XBMKBV32IdqDEXw3OVXn5r4XguPvJ31roXE+1GS9yl0w5zCTCNBBqdrogaYm
 rzSkUdrJtMhNZcoXy2wQ8rXM6redvte/doHsG/zjwTgnwUdexaINPrlFZQ7XPRrjRcgk
 sM0n5w1Du3UsdPuLDZqxLia2c1/HOSHYfPdaunVOqmlqj3Hl0/5qXYXDuuEWwqKNlzCk
 lemjrGVLcC+maiJ/WvSzK5p71qAb8QTjGZjiTlXM51MtHPiQjQPOdDrA+ym1NRZpK89A
 YX2qAjp7WuOJhCMltZje5JFCBW8WSEtIFbq7FVIZuQWPbDqgLs3ZqVsWza4GEBUioI2/
 q5iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Q2gUroj1wYZHw0Na7ndJnXEPlpzhpMRIriQNm0MkpII=;
 b=iVsX/NM1sc8MlWEjGoatDN4XGsxUAtxHinYt/paIIqslAj6NU3dnwxR+b/VhUjAFR2
 TY/sBqQggednSJj69bBzZBhQpOR3/5BYSQOxqaUDdWNN+ktMoMnyBVfgvVI4WYhCCnVe
 qrPz3MD5di4JrohbRwEZ4SFby3UePppCfHcCgLNhouKapH87WvTxRCZ9d4ayS908Q28+
 jwHYcGQnLi982v/3OeTwYPYITyhOk81Y7zeMQRzCtXDB9qEUiSC7qTgV2XePCeWP+VPe
 19GNdo9L1usxZOazIGIqzdnO1ZVMZoO60tGq50oX9DahZyr7KTz7m67JlYpjEM2RRNLC
 nziw==
X-Gm-Message-State: AJIora9nxs4nDYMZb3BzkS53iuNNYAnmaQwacoRSuKcXhTRhnlrvCLVp
 5UXIoxlHzj+Z2wOvT9FH2gcubdqPzpn6isROpEhmGg==
X-Google-Smtp-Source: AGRyM1t+WNhXIZULo0+/zc/28SnymvdvlkKYKCVvh+HRwKqdHAndBAyVxTZkuBp7c2OcKpdwMrPLeuLGS69Fxv074aU=
X-Received: by 2002:a17:903:120f:b0:15f:99f:9597 with SMTP id
 l15-20020a170903120f00b0015f099f9597mr17989401plh.45.1657538244941; Mon, 11
 Jul 2022 04:17:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220622123305.3971169-1-alex.bennee@linaro.org>
 <CAFEAcA_v+VM1kd=_D2Tm7DkkS=i+3k26aaM-YGjnTT6-zsPDxg@mail.gmail.com>
 <87bkukrbwz.fsf@linaro.org> <YrMv+9l1VUJJUKMS@redhat.com>
In-Reply-To: <YrMv+9l1VUJJUKMS@redhat.com>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Mon, 11 Jul 2022 13:17:14 +0200
Message-ID: <CADYN=9LNC+UXe8Wdx+BkSQWTNveACf__7tJhWph3-Zvybny4ew@mail.gmail.com>
Subject: Re: [RFC PATCH] gitlab: add a binary build to project registry
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, 
 Remi Duraffort <remi.duraffort@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=anders.roxell@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 22 Jun 2022 at 17:06, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Wed, Jun 22, 2022 at 03:43:54PM +0100, Alex Benn=C3=A9e wrote:
> >
> > Peter Maydell <peter.maydell@linaro.org> writes:
> >
> > > On Wed, 22 Jun 2022 at 13:33, Alex Benn=C3=A9e <alex.bennee@linaro.or=
g> wrote:
> > >>
> > >> There have been requests from other projects such LKFT to have
> > >> "official" docker images with pre-built QEMU binaries. These could
> > >> then be consumed by downstream CI systems by pulling directly from t=
he
> > >> qemu-project container registry. The final image could then be run b=
y
> > >> doing:
> > >>
> > >>   docker run --rm -it \
> > >>     registry.gitlab.com/qemu-project/qemu/qemu/debian-amd64-binaries=
 \
> > >>     /opt/bin/qemu-system-aarch64 $ARGS
> > >>
> > >> To keep the build time down we skip user-mode, documents, plugins an=
d
> > >> a selection of the more esoteric hardware emulations. Even so it sti=
ll
> > >> takes over an hour to build and install everything.
> > >
> > >> This is very much an RFC for now as we have traditionally not provid=
ed
> > >> binaries for our users except for the slightly special case of
> > >> Windows. As currently structured this will rebuild the binaries on
> > >> every merge but we could change the generation rules to only trigger
> > >> for tagged or stable branch pushes. We also wouldn't be testing thes=
e
> > >> binaries so we are basically assuming they are OK by the nature of
> > >> being built from master which in theory never breaks.
> > >
> > > I'm a bit uncertain about providing "official" docker images
> > > or other pre-built binaries, because it might give the impression
> > > that these are OK to use with KVM, when in fact they won't necessaril=
y
> > > get security fixes in a timely manner, and almost all users of QEMU f=
or
> > > KVM purposes are better off with the distro QEMU.
> >
> > Do we have any sort of idea how long it takes from a CVE being fixed in
> > a distro kernel to the eventual merge of a patch in master?
> >
> > Anyway the main use case for this is emulation where we want to get new
> > features under -cpu max into the CI loops as soon as possible. I think
> > the LKFT guys are testing KVM as well though and again want to see new
> > KVM features as soon as possible.
> >
> > I'm not proposing these images are uploaded to docker.io so less likely
> > to be hit by the default:
> >
> >   docker run qemu:latest
> >
> > (they instead get 6 year old things packages by someone calling
> > themselves qemu: https://hub.docker.com/u/qemu)
>
> I guess I would question whether we really need to introduce ourselves
> as a dependancy of arbitrary downstream projects. We will have little
> insight into what other projects are doing with any containers we publish=
.
> This in turn means our scope for making changes to the containers over
> time is quite limited, unless we're willing to risk breaking those
> unknown projects' CI systems.
>
> Personally, I feel CI systems are already fragile enough that it is
> better to have a self contained system as much as possible. This is why,
> for example, libvirt's integration test suite builds QEMU from git
> itself. We get exact control over which QEMU features are built, and
> get to choose which distros we target too. It isn't hard for apps wanting
> to use QEMU to perform a build:
>
>   https://gitlab.com/libvirt/libvirt/-/blob/master/ci/integration-templat=
e.yml#L5
>
> Probably the hardest part here is understanding the build time package
> dependancies that are required to be installed, if you want to all QEMU
> features enabled. We could perhaps use lcitool to record the full set of
> build dependancies for each distro in git, so 3rd party CI can grab the
> package list and install it, and thus get the trivial build done. Even
> better if we publish the package list info in our docs too.
>
> I wonder why LKFT isn't building QEMU themselves in the way that they
> need already ?  Would be nice to know what their problems are, rather
> than just assume that a container build is the solution.

Right now we use QEMU from Debian, and we miss new
architectural feature's that gets into QEMU. Our plan is to do:
1. running the latest QEMU with all the new architectual feature's.
2. helping out finding regressions in QEMU and/or the kernel, when
    different kernels are booted with different QEMU versions.

If the hub.docker.com/u/qemu namespace could be used to store all the
different QEMU builds. With that we can get use of the latest architectural
feature's, also tri to find if the kernel regressed or if its QEMU that
regressed.

Cheers,
Anders

