Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BF155C03B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 12:34:11 +0200 (CEST)
Received: from localhost ([::1]:50478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o68Xq-0001Ai-Is
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 06:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o68U7-0006XS-Rw
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:30:19 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:41768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o68U5-0001z6-HU
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:30:19 -0400
Received: by mail-ed1-x534.google.com with SMTP id cf14so16894422edb.8
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 03:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QSc+jfDFweX5wWvK9edkW7IA+IJBs5k6ZYkc0eCc1DA=;
 b=jT/4u8bh6AkF6F2093KHWTIvMVNP6C81jOUOFCPz2pPzn7uqeacqvbw5xmx/Zq+uF2
 nyOeUXT2OSC6kqv27bOfzmUHXArYtDH/zpzBddzAVh8xoaiKPlxdmhRxVHP0GQPr8X84
 2Zkma9e3Syy6IGf1/haX0llC0eoei5lSOjMIjurFHv9kJW7L/yW3u4EdYpqEUelAtmM1
 DvanqqFPWTnMpBDOnpt06cC3xMfWg0h6K7XZAaa+IwcoG5gsrz7cMfILkK8HDWnXR0s8
 3i4Ks0aj0wN13X4oUttkUTsDcsCjBITMNVQVN1yZRnef5BMcB477duR6SXLCPl0PCHut
 XbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QSc+jfDFweX5wWvK9edkW7IA+IJBs5k6ZYkc0eCc1DA=;
 b=GakpMUDB18WnNB1Rcwka1fm0DUSNrVD9UPTZwnlh4uNlRo1Zm9BF8W0+NZKTu3wSjw
 mZLx8u89NnlabsmAkwL6u2Og4nqLeT13lwg6IsW+o579ghWESXboYUuY5CXfRMHlut8Q
 2wrb4cmUirDaom/TOFtjb3e5wqhGdONIqddFkme2C4lST+xkvO3TkplW5LMDzXjOxLKo
 Ncxic1Gj4ZqKxXG7/mDTe3JDwsIdSmrGWNqjP8N2aiXubJ1/llT/EMCImY+MTML3KAQj
 N4g0Ix0hJwxxv7dL3TYudhPXouOmuZR6jA7qU6ttYDJJON5AK00jI6MHyh36/xy08w9y
 4aRA==
X-Gm-Message-State: AJIora/v1BK5JdXP2Ppg2LxCM+30szV1w13hTwrSLXcT/2lKO6f9Sheg
 juHizh2dhSQn09t3lgW9WDXV2VYqPGxc/9cueVbR0w==
X-Google-Smtp-Source: AGRyM1tcRaOQymDi8WtKN3wJWZs6F3QAD+0AvK6+x3Tz1IcRkqyNyerz1Ovj+WOLiBD2GgiVonAZRARyO9ClScgcd40=
X-Received: by 2002:a05:6402:524d:b0:437:8d2e:c675 with SMTP id
 t13-20020a056402524d00b004378d2ec675mr14161584edd.65.1656412211514; Tue, 28
 Jun 2022 03:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAARzgwyWK2HNbz=9=uoA+DDTpnn2q3CRmYVyjLwfMs1wi24-LA@mail.gmail.com>
 <20220628024810-mutt-send-email-mst@kernel.org>
 <CAARzgww9KKx7fTw7WMMTb3PCQgdwJwS34X0jHhQ+41OrMWZazg@mail.gmail.com>
 <4e1c2a45-eb53-e210-1ce1-05837bf1e7c3@redhat.com>
 <20220628030749-mutt-send-email-mst@kernel.org>
 <7bf5976e-8277-7c78-f412-44f7be8754f4@redhat.com>
 <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <YrrUnfHwmu50JrJD@redhat.com>
In-Reply-To: <YrrUnfHwmu50JrJD@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 28 Jun 2022 16:00:00 +0530
Message-ID: <CAARzgwz5jKne-qqThoWij78ZjGiUfb0q1wPnc=Ch2agvJJn_Dg@mail.gmail.com>
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 John Snow <jsnow@redhat.com>, 
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::534;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x534.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Jun 28, 2022 at 3:45 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Tue, Jun 28, 2022 at 10:28:04AM +0200, Thomas Huth wrote:
> > On 28/06/2022 10.23, Daniel P. Berrang=C3=A9 wrote:
> > > On Tue, Jun 28, 2022 at 01:21:35PM +0530, Ani Sinha wrote:
> > > > On Tue, Jun 28, 2022 at 1:19 PM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
> > > > >
> > > > > On Tue, Jun 28, 2022 at 09:25:35AM +0200, Thomas Huth wrote:
> > > > > > On 28/06/2022 09.10, Michael S. Tsirkin wrote:
> > > > > > > On Tue, Jun 28, 2022 at 09:03:33AM +0200, Thomas Huth wrote:
> > > > > > > > > > > > > > No problem with that. So that's venv. But do we=
 need pip and pulling
> > > > > > > > > > > > > > packages from the net during testing?
> > > > > > > > > > > > >
> > > > > > > > > > > > > We do that too. See requirements.txt in tests/
> > > > > > > > > > > > > Following two are downloaded:
> > > > > > > > > > > > > avocado-framework=3D=3D88.1
> > > > > > > > > > > > > pycdlib=3D=3D1.11.0
> > > > > > > > > > > > >
> > > > > > > > > > > > > Also see this line in Makefie.include:
> > > > > > > > > > > > >
> > > > > > > > > > > > > $(call quiet-venv-pip,install -r $(TESTS_VENV_REQ=
))
> > > > > > > > > > > >
> > > > > > > > > > > > Right but that's avocado since it pulls lots of stu=
ff from
> > > > > > > > > > > > the net anyway.
> > > > > > > > > > > > Are the libraries in question not packaged on major=
 distros?
> > > > > > > > > > >
> > > > > > > > > > > Currently I only need this:
> > > > > > > > > > > https://github.com/python-tap/tappy
> > > > > > > > > > > which is the basic TAP processing library for python.
> > > > > > > > > > >
> > > > > > > > > > > It seems its only installed through pip:
> > > > > > > > > > > https://tappy.readthedocs.io/en/latest/
> > > > > > > > > > >
> > > > > > > > > > > I do not think this is packaged by default. It's such=
 a basic library
> > > > > > > > > > > for parsing test output that maybe we can keep this s=
omewhere within
> > > > > > > > > > > the python src tree? Not sure ...
> > > > > > > > > >
> > > > > > > > > > It's pretty small for sure. Another submodule?
> > > > > > > > >
> > > > > > > > > Unlike BITS, this one is likely going to be maintained fo=
r a while and
> > > > > > > > > will receive new releases through
> > > > > > > > > https://pypi.org/project/tap.py/
> > > > > > > > > so forking is OK but someone has to keep this updated.
> > > > > > > > >
> > > > > > > > > I am open to anything. Whatever feels right is fine to me=
.
> > > > > > > >
> > > > > > > > John Snow is currently working on the "Pythonification" of =
various QEMU
> > > > > > > > bits, I think you should loop him into this discussion, too=
.
> > > > > > > >
> > > > > > > >    Thomas
> > > > > > >
> > > > > > > submodule does not mean we fork necessarily. We could have
> > > > > > > all options: check for the module and use it if there, if not
> > > > > > > use one from system if not there install with pip ..
> > > > > > > But yea, I'm not sure what's best either.
> > > > > >
> > > > > > submodules create a dependency on an internet connection, too. =
So before you
> > > > > > add yet another submodule (which have a couple of other disadva=
ntages), I
> > > > > > think you could also directly use the venv here.
> > > > >
> > > > > Definitely not submodules.
> > > > >
> > > > > We need to get out of the mindset that submodules are needed for =
every new
> > > > > dependancy we add. Submodules are only appropriate if the externa=
l project
> > > > > is designed to be used as a copylib (eg the keycodemapdb tool), o=
r if we
> > > > > need to bundle in order to prevent a regression for previously de=
ployed
> > > > > QEMU installs where the dependancy is known not to exist on all o=
ur
> > > > > supported platforms.
> > > > >
> > > > > This does not apply in this case, because the proposed use of tap=
py is
> > > > > merely for a test case. Meson just needs to check if tappy exists=
 and if
> > > > > it does, then use it, otherwise skip the tests that need it. The =
user can
> > > > > arrange to install tappy, as they do with the majority of other d=
eps.
> > > > >
> > > > > If John's venv stuff is relevant, then we don't even need the mes=
on checks,
> > > > > just delegate to the venv setup.
> > > > >
> > > > > Regardless, no submodules are needed or desirable.
> > > >
> > > > What about keeping biosbits stuff? Source or pre-built.
> > >
> > > Shipping them as pre-built binaries in QEMU is not a viable option
> > > IMHO, especially for grub as a GPL'd project we need to be extremely
> > > clear about the exact corresponding source and build process for any
> > > binary.
> > >
> > > For this kind of thing I would generally expect the distro to provide
> > > packages that we consume. Looking at biosbits I see it is itself
> > > bundling a bunch more 3rd party projects, libffi, grub2, and includin=
g
> > > even an ancient version of python as a submodule.
> > >
> > > So bundling a pre-built biosbits in QEMU appears to mean that we're i=
n
> > > turn going to unexpectedly bundle a bunch of other 3rd party projects
> > > too, all with dubious license compliance. I don't think this looks li=
ke
> > > something we should have in qemu.git or qemu tarballs. It will also
> > > make it challenging for the distro to take biosbits at all, unless
> > > those 3rd party bundles can be eliminated in favour of using existing
> > > builds their have packaged for grub, python, libffi, etc.
> >
> > So if this depends on some third party binary bits, I think this is pre=
tty
> > similar to the tests in the avocado directory ... there we download thi=
rd
> > party binaries, too... Wouldn't it make sense to adapt your tests to th=
at
> > framework?
>
> Now that you mention it, avocado does feel like a more appropriate fit.
> IIUC the biosbits project appears to be effectively providing a custom
> guest OS ISO image. IOW this testing is quite biased towards being
> integration testing which is the target of avocado, while qtest is much
> more to the unit testing end of the spectrum.

This is more like unit testing than integration testing, now that you
mention it. It tests only the bios, very narrowly and does not involve
any OS at all.

This would avoid all the
> discussion and patches around introducing python to qtest
>
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

