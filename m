Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6576EE7F1
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 21:00:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prNsi-00088L-0n; Tue, 25 Apr 2023 14:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1prNsf-00087r-2f
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 14:59:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1prNsc-0000yQ-8E
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 14:59:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682449148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MRJGowb7TeYXnU7J+U1K8Ha11N5YZseBZmfXOnDcA2U=;
 b=c08ZOO6JqJh7L/OMNg++79E2p4uSBf2nwGMoWuBz0BioQKh/IcUuOh+YekHEmojbbjYkoz
 UbzmTdpLQ5ioeuV+vPv54+JtcTPGJr6s5lZIbLco/DxT6tTLfxgYFC7QYCTHHg+FtjFyMv
 tDCzDWmYZEcZcfpl6HonTyr4qXwz4GI=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-GLjaJgysPZ-wNARl3vEwEw-1; Tue, 25 Apr 2023 14:59:06 -0400
X-MC-Unique: GLjaJgysPZ-wNARl3vEwEw-1
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-1a697b1a71aso68437405ad.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 11:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682449145; x=1685041145;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MRJGowb7TeYXnU7J+U1K8Ha11N5YZseBZmfXOnDcA2U=;
 b=j8ryn5bJoedQhxC8pLwrWWzEQHDu9NXAMoTRrVywxSvQOj7H7iKmzrONnKK4KpbsL0
 IqPCggip4JfJ9hm1Rk0GqxAwf941W9LrTlpCsnMBVxtBT9vSu3VPYX8zhohPgX0yBkTo
 8uKRAXh1ZLarGymEcLgPwMfOWnG6/PcsCFVUQx/oR2STMvabHLhSY+/Ex7SBcdDc6C5K
 lPUhriPK8KsiQeMJt+j4S28babes5XHreDkh9wvgLBqbLA7hK0FmWnCREi6j+78jHhZC
 DWXWFdtIyuSCVnslKbQ+/c9BYbRmyRzxehD8fTQLcIgzRJlMKROLbXNeHqqE7g8BMHCB
 X51Q==
X-Gm-Message-State: AAQBX9eVmcFb/k5q1jQtMl8YwF1BVM2D78UPfX6NbopDl2DpPf/+hOV2
 V8Y/mufJsCZjc5L2knuoi5TskuGlqMAiyYsmd9MJBg80Wx4y/zIMavfDSzkWIyZxkPcUDwv/JE7
 PnFBir4q2LxYF0uH43sE06FDD31o3Bp8=
X-Received: by 2002:a17:903:230a:b0:1a0:57dd:b340 with SMTP id
 d10-20020a170903230a00b001a057ddb340mr22294365plh.64.1682449144836; 
 Tue, 25 Apr 2023 11:59:04 -0700 (PDT)
X-Google-Smtp-Source: AKy350ba9OA93mE9jlXYxo3SFV4cJ3nsCxWBt7YOX1xg3O2KzpALzrTRDSY5G2P8Td+5juRV+8mYc1IlrzaGMFnc8Ks=
X-Received: by 2002:a17:903:230a:b0:1a0:57dd:b340 with SMTP id
 d10-20020a170903230a00b001a057ddb340mr22294344plh.64.1682449144365; Tue, 25
 Apr 2023 11:59:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230424200248.1183394-1-jsnow@redhat.com>
 <ZEgLNJ13fJf5RAI4@redhat.com>
 <CAFn=p-YNjRZnFUhFr7PfHWKGvRnRnF1mpTc7KvFr5eXBM0Lsxw@mail.gmail.com>
 <CAFn=p-ajvEJkCvv=Z0hG9A8tbf9cYz2eTTDRChwqbFWiMUzAPw@mail.gmail.com>
 <ZEgXo67oiOugfCn8@redhat.com>
In-Reply-To: <ZEgXo67oiOugfCn8@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 25 Apr 2023 14:58:53 -0400
Message-ID: <CAFn=p-bcuu8__gRfRtkMikZ=+N2e63yU2q1rkjaQNpTK_LYL=w@mail.gmail.com>
Subject: Re: [RFC PATCH v3 00/20] configure: create a python venv and ensure
 meson, sphinx
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Warner Losh <imp@bsdimp.com>, 
 Beraldo Leal <bleal@redhat.com>, Kyle Evans <kevans@freebsd.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Reinoud Zandijk <reinoud@netbsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Apr 25, 2023 at 2:10=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> On Tue, Apr 25, 2023 at 01:34:52PM -0400, John Snow wrote:
> > On Tue, Apr 25, 2023, 1:22 PM John Snow <jsnow@redhat.com> wrote:
> >
> > >
> > >
> > > On Tue, Apr 25, 2023, 1:17 PM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com>
> > > wrote:
> > >
> > >> On Mon, Apr 24, 2023 at 04:02:28PM -0400, John Snow wrote:
> > >> > GitLab CI: https://gitlab.com/jsnow/qemu/-/pipelines/846869409
> > >> >            (All green, except Python self-tests, see below)
> > >> >
> > >> > This patch series creates a mandatory python virtual environment
> > >> > ("venv") during configure time and uses it to ensure the availabil=
ity of
> > >> > meson and sphinx.
> > >> >
> > >> > See https://www.qemu.org/2023/03/24/python/ for details. The summa=
ry is
> > >> > that the goal of this series is to ensure that the `python` used t=
o run
> > >> > meson is the same `python` used to run Sphinx, tests, and any buil=
d-time
> > >> > python scripting we have. As it stands, meson and sphinx (and thei=
r
> > >> > extensions) *may* run in a different python environment than the o=
ne
> > >> > configured and chosen by the user at configure/build time.
> > >> >
> > >> > The effective change of this series is that QEMU will now
> > >> > unconditionally create a venv at configure-time and will ensure th=
at
> > >> > meson (and sphinx, if docs are enabled) are available through that=
 venv.
> > >> >
> > >> > Some important points as a pre-emptive "FAQ":
> > >> >
> > >> > - This venv is unconditionally created and lives at {build_dir}/py=
venv.
> > >> >
> > >> > - The python interpreter used by this venv is always the one ident=
ified
> > >> >   by configure. (Which in turn is always the one specified by --py=
thon
> > >> >   or $PYTHON)
> > >> >
> > >> > - *almost* all python scripts in qemu.git executed as part of the =
build
> > >> >   system, meson, sphinx, avocado tests, vm tests or CI are always
> > >> >   executed within this venv.
> > >> >
> > >> >   (iotests are not yet integrated; I plan to tackle this separatel=
y as a
> > >> >   follow-up in order to have a more tightly focused scope on that
> > >> >   series.)
> > >> >
> > >> > - It remains possible to build and test fully offline.
> > >> >   (In most cases, you just need meson and sphinx from your distro'=
s
> > >> repo.)
> > >> >
> > >> > - Distribution packaged 'meson' and 'sphinx' are still utilized wh=
enever
> > >> >   possible as the highest preference.
> > >> >
> > >> > - Vendored versions of e.g. 'meson' are always preferred to PyPI
> > >> >   versions for speed, repeatability and ensuring tarball builds wo=
rk
> > >> >   as-is offline.
> > >> >
> > >> >   (Sphinx will not be vendored, just like it already isn't.)
> > >> >
> > >> > - Missing dependencies, when possible, are fetched and installed
> > >> >   on-demand automatically to make developer environments "just wor=
k".
> > >> >
> > >> > - Works for Python 3.7 and up, on Fedora, OpenSuSE, Red Hat, CentO=
S,
> > >> >   Alpine, Debian, Ubuntu, NetBSD, OpenBSD, and hopefully everywher=
e
> > >> >
> > >> > - No new dependencies (...for most platforms. Debian and NetBSD ge=
t an
> > >> >   asterisk.)
> > >> >
> > >> > - The meson git submodule is unused after this series and can be
> > >> removed.
> > >> >
> > >> > For reviewers, here's how the series is broken up:
> > >> >
> > >> > Patch 1 is a testing pre-req. Note that even with this patch,
> > >> > 'check-python-minreqs' and 'check-python-tox' CI jobs will both st=
ill
> > >> > fail on origin/master because this series requires 3.7+, but
> > >> > origin/master is currently still 3.6+.
> > >> >
> > >> > - python: update pylint configuration
> > >> >
> > >> > Patches 2-8 add the mkvenv script. The first patch checks in the b=
arest
> > >> > essentials, and each subsequent patch adds a workaround or feature=
 one
> > >> > at a time.
> > >> >
> > >> > - python: add mkvenv.py
> > >> > - mkvenv: add console script entry point generation
> > >> > - mkvenv: Add better error message for missing pyexapt module
> > >> > - mkvenv: generate console entry shims from inside the venv
> > >> > - mkvenv: work around broken pip installations on Debian 10
> > >> > - mkvenv: add nested venv workaround
> > >> > - mkvenv: add ensure subcommand
> > >> >
> > >> > Patches 9-11 modify our testing configuration to add new dependenc=
ies as
> > >> > needed.
> > >> >
> > >> > - tests/docker: add python3-venv dependency
> > >> > - tests/vm: Configure netbsd to use Python 3.10
> > >> > - tests/vm: add py310-expat to NetBSD
> > >> >
> > >> > Patch 12 changes how we package release tarballs.
> > >> >
> > >> > - scripts/make-release: download meson=3D=3D0.61.5 .whl
> > >> >
> > >> > Patches 13-16 wire mkvenv into configure and tests.
> > >> >
> > >> > - configure: create a python venv unconditionally
> > >> > - configure: use 'mkvenv ensure meson' to bootstrap meson
> > >> > - configure: add --enable-pypi and --disable-pypi
> > >> > - tests: Use configure-provided pyvenv for tests
> > >> >
> > >> > Patches 17-20 delegate Sphinx bootstrapping to mkvenv. Some of the=
se
> > >> > changes could be folded earlier in the series (like the diagnose()
> > >> > patch), but I'm keeping it separate for review for now.
> > >> >
> > >> > - configure: move --enable-docs and --disable-docs back to configu=
re
> > >> > - mkvenv: add diagnose() method for ensure() failures
> > >> > - configure: use --diagnose option with meson ensure
> > >> > - configure: bootstrap sphinx with mkvenv
> > >>
> > >> I'm not sure this last bit is working.
> > >>
> > >> I uninstalled meson and python3-sphinx from my F38 host and ran
> > >> configure --target-list=3Dx86_64-softmmu and got this:
> > >>
> > >> $ ./configure --target-list=3Dx86_64-softmmu
> > >> Using './build' as the directory for build output
> > >> python determined to be '/usr/bin/python3'
> > >> python version: Python 3.11.3
> > >> MKVENV pyvenv
> > >> Configured python as
> > >> '/home/berrange/src/virt/qemu/build/pyvenv/bin/python3 -B'
> > >> MKVENV ensure meson>=3D0.61.5
> > >> WARNING: Skipping
> > >> /usr/lib/python3.11/site-packages/virt_firmware-1.5-py3.11.egg-info =
due to
> > >> invalid metadata entry 'name'
> > >> WARNING: Skipping
> > >> /usr/lib/python3.11/site-packages/virt_firmware-1.5-py3.11.egg-info =
due to
> > >> invalid metadata entry 'name'
> > >> WARNING: Location 'file:///home/berrange/src/virt/qemu/python/wheels=
' is
> > >> ignored: it is neither a file nor a directory.
> > >> ERROR: Could not find a version that satisfies the requirement
> > >> meson>=3D0.61.5 (from versions: none)
> > >> ERROR: No matching distribution found for meson>=3D0.61.5
> > >> WARNING: Skipping
> > >> /usr/lib/python3.11/site-packages/virt_firmware-1.5-py3.11.egg-info =
due to
> > >> invalid metadata entry 'name'
> > >> WARNING: Skipping
> > >> /usr/lib/python3.11/site-packages/virt_firmware-1.5-py3.11.egg-info =
due to
> > >> invalid metadata entry 'name'
> > >> WARNING: Skipping
> > >> /usr/lib/python3.11/site-packages/virt_firmware-1.5-py3.11.egg-info =
due to
> > >> invalid metadata entry 'name'
> > >> MKVENV ensure sphinx>=3D1.6.0
> > >> WARNING: Skipping
> > >> /usr/lib/python3.11/site-packages/virt_firmware-1.5-py3.11.egg-info =
due to
> > >> invalid metadata entry 'name'
> > >> WARNING: Skipping
> > >> /usr/lib/python3.11/site-packages/virt_firmware-1.5-py3.11.egg-info =
due to
> > >> invalid metadata entry 'name'
> > >> ERROR: Could not find a version that satisfies the requirement
> > >> sphinx>=3D1.6.0 (from versions: none)
> > >> ERROR: No matching distribution found for sphinx>=3D1.6.0
> > >>
> > >> *** Ouch! ***
> > >>
> > >> Could not ensure availability of 'sphinx>=3D1.6.0':
> > >>  =E2=80=A2 Python package 'sphinx' was not found nor installed.
> > >>  =E2=80=A2 No local package directory was searched.
> > >>  =E2=80=A2 mkvenv was configured to operate offline and did not chec=
k PyPI.
> > >>
> > >>
> > >> Sphinx not found/usable, disabling docs.
> > >> MKVENV ok!
> > >>
> > >>
> > >>
> > >> It says mkvenv was configured to run offline, but I didn't do
> > >> anything. I thought the intention was for developers it would
> > >> live download from PyPI ?
> > >>
> > >
> > > Ah. So... with enable pypi being the default and with docs set to "au=
to",
> > > I actually fall back to not installing sphinx from pypi *by default*.=
 It
> > > tries to locate it on your system and will enable docs if it can, but=
 it
> > > doesn't try too hard and doesn't get upset if it fails.
> > >
> >
> > (Though all of those errors and warnings sure are noisy for meaning "we
> > couldn't find an optional package". mkvenv just doesn't distinguish bet=
ween
> > optional and required right now so it just leaves it to the caller to
> > interpret. Any suggestions for improving this?)
> >
> >
> > > Try passing --enable-docs to convince the build system you'd really
> > > definitely like docs, and it'll force the pypi access.
> > >
> >
> > I can make it try PyPI in this double-default case too, I was just bein=
g
> > very conservative about when we tried PyPI - this solution is fairly
> > reluctant by design to do it.
> >
> > If we all agree that it shouldn't be so reluctant, and anyone who doesn=
t
> > want it at all should just pass --disable-pypi, I can make that change
> > easily.
> >
> > I wonder if I should make an "auto" setting for the pypi access which
> > represents this behavior ("only if I have to"), and make "enable" more
> > aggressive (consult pypi even for optional features.)
> >
> > I was just being conservative on the first pass. Trying to strike a bal=
ance
> > between convenience, speed, and least surprise.
>
> How about having --enable-pypi never|auto|force with the following
> semantics for --enable-docs + --enable-pypi
>
>
>   * docs=3Dno   - pypi never used
>
>   * docs=3Dauto + pypi=3Dnever  =3D> docs only enable if sphinx is alread=
y
>                                installed locally, otherwise disabled
>
>   * docs=3Dauto + pypi=3Dauto  =3D> docs enable if sphinx is already
>                               installed locally, or can download from
>                               pypi as fallback
>

As long as this doesn't cause needless trouble for existing configure
invocations baked into scripts and the like. It's a bit more
aggressive about enabling docs than we have been in the past, but
maybe that's not a bad thing.

>   * docs=3Dauto + pypi=3Dforce  =3D> always download sphinx from pypi
>

So if you already have Sphinx, this should perform an upgrade to the
latest version?

>
>   * docs=3Dyes + pypi=3Dnever  =3D> ERROR if sphinx is not already
>                               installed locally
>
>   * docs=3Dyes + pypi=3Dauto  =3D> docs enable if sphinx is already
>                              installed locally, or can download from
>                              pypi as fallback
>
>   * docs=3Dyes + pypi=3Dforce  =3D> always download sphinx from pypi

Yeah, there's room for settings like these, and the above mostly makes
sense to me.

Paolo and I had written up a more elaborate set of flags at one point
under the premise of integrating testing, too -- for instance,
pre-loading the testing dependencies for iotests (local qemu package,
qemu.qmp, etc) or for avocado tests (avocado-framework and other deps
needed for those tests). I wanted to try and check in a "minimum
viable" version of this patch set first close to the 8.1 tree opening
to iron out any bugs in the core feature and then I'd work to expand
the flags and capability of the system as differential patches.

So, I think changing --enable-pypi too much is beyond the scope of the
current patchset, but it's on my mind for what will follow almost
immediately after it. With that in mind, we can brainstorm a little
here and throw some darts at the wall:

The version of flags we originally came up with was this:

--python=3D... # runtime used to create venv
--enable-pip-groups=3Dtesting,devel,avocado,meson,sphinx
--enable-pip=3Dnow  # install all python deps now
--enable-pip=3Don-demand  # install qemu.git/meson/sphinx, delay the rest
--enable-pip=3Dno    # offline
--{enable,disable}-isolated-venv # let venv use system/distro if disable

I may have pulled us in a slightly different direction with the
version of the patches I actually sent here today, but the key ideas
here were:

- The ability to opt into or out of different package groups at
configure-time. meson is always required, docs/sphinx is optional, and
the other three groups are testing related. (testing: iotests and
qemu.qmp, devel: python self-tests, avocado: avocado tests.)
- The ability to decide when packages get installed to the venv;
either at configure time ("now") or as-needed ("on-demand") or
functionally never ("no")
- The ability to enable or disable venv isolation (turning on or off
system packages).

I think I abandoned the idea of configuring the venv isolation and
have it set to "always off". We may revisit this later, but I think
for this series it's fine to have glossed over it.
I also skipped over the idea of having package installation being
"now", "on-demand" or "no" -- this patch-set more or less is using a
hybrid of "now" and "on-demand" where meson and sphinx are "now" but
avocado is "on-demand". Unifying that discrepancy can occur in
subsequent patches as it closely resembles what we had in 8.0 and
earlier.
I also didn't implement configurable package groups at all yet. meson
and sphinx are just implicitly selected; everything else is not yet
thoroughly integrated.

The testing portions of this -- avocado, qemu.qmp, and python
self-tests -- are not as integrated as the build portions, sphinx and
meson. That will likely be the focus of my next patchset when I move
to integrate iotests and actually set about the work of finally
dropping the qemu.qmp package from the qemu.git source tree.

I guess before I spend *too* much time writing that series (for the
fourth time...!) I wanted to try and solidify the basics here to give
me a nice solid foundation.

--js

>
>
>
> So eg distros could use pypi=3Dnever, devs would use pypi=3Dauto mostly,
> while CI might use pypi=3Dforce to test specific versions indepenant
> of distros ?
>

Sounds reasonable in general, I think, but I have some questions about
what 'force' does, exactly.

> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


