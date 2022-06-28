Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7313455C068
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 12:52:18 +0200 (CEST)
Received: from localhost ([::1]:49572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o68pN-00050k-EE
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 06:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o68n7-0003Fa-9N
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:50:01 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:36367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o68n5-0005du-8w
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 06:49:57 -0400
Received: by mail-ed1-x529.google.com with SMTP id e2so16993153edv.3
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 03:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZF5hQu/X3iRMvhkwKgavCiWqvurAsXzzA/k6sdF4YwY=;
 b=stAY/Tgb8lwGgiheCuPjKkohLV46Ufz1KPIAfXfaEFiG0LvreggQrcUfaKmSPypHt8
 ps7Op1hQR0+6PYmSuvPC05y/uEyWD9kWhzajkFMIPv4Sah+R3RKWrtvQB451J9onzuJM
 X63sQ5/IOjXNdLVP8vXSAnX57ZkbsvH7bQEFrD0KwaE4eNrzIf683VxwUAuXZTwvqfJ1
 MnGI+L8S49P3v1hjYHma938iogqX92tgfjmJbipz9H+qlSztrWBwJOQFPjCf6XEBEFdh
 DC422mMIN/geWeyF5whZBBrm5FaEuK51iywcgFHN6bC1Zo4/N7/YT1rKh3bgSGEBy/nF
 weug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZF5hQu/X3iRMvhkwKgavCiWqvurAsXzzA/k6sdF4YwY=;
 b=q6JLq6t0Bx9XfMTdvELwjBqURzC4JV/3RPtb+06oklxQcDIzOrkWk03HY4sK+Nxeeu
 +tulhXPAi1uqbBshSG4bCuFT3HfL1pQMsPvLz0IDJHPyNnIOk3lszrsgSbGt+OfyVfDb
 TvY9CI6PWYSCKSlDry1fy6BLdYxO94OIoFvvigPthoti+8Qs7NWKPn7ca1rMAZKmqTCh
 NOtwkdWFo0aIW3YORRDSuwb50JzRmSdmz6Uh8gWnRRE2tTMM84BmPxwE8Qt3keLm9BqL
 qcGluYQqghaSJQzVb01PGeib8MkUFaYopQUhvAyHEZichGOL0RP2aeCZ/jpX3Opmc13z
 4opA==
X-Gm-Message-State: AJIora++mivKG17YBMMqa9IE16MKeXRKv9QqfoBL2zYQUFNepnNR+TO0
 FYsgjvNmdtbhXusfSYUDu75z6Qt0Izk4rI70fIUwWg==
X-Google-Smtp-Source: AGRyM1vSchmJWJd3oQsSB1S5xRtmY/g0dzWlsYFv09dRsvbNUnNt7X5Q1r89gFM9nK6ZB6fA3U5FBZQzN19SMuoYicY=
X-Received: by 2002:a05:6402:4302:b0:437:7990:992e with SMTP id
 m2-20020a056402430200b004377990992emr18050138edc.194.1656413393641; Tue, 28
 Jun 2022 03:49:53 -0700 (PDT)
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
 <CAARzgwz5jKne-qqThoWij78ZjGiUfb0q1wPnc=Ch2agvJJn_Dg@mail.gmail.com>
In-Reply-To: <CAARzgwz5jKne-qqThoWij78ZjGiUfb0q1wPnc=Ch2agvJJn_Dg@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 28 Jun 2022 16:19:42 +0530
Message-ID: <CAARzgwz3p5NwyWCyidFsoE0FT8Q84Sz2+OUVtDP0Fb7nrqDmug@mail.gmail.com>
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 John Snow <jsnow@redhat.com>, 
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::529;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x529.google.com
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

On Tue, Jun 28, 2022 at 4:00 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> On Tue, Jun 28, 2022 at 3:45 PM Daniel P. Berrang=C3=A9 <berrange@redhat.=
com> wrote:
> >
> > On Tue, Jun 28, 2022 at 10:28:04AM +0200, Thomas Huth wrote:
> > > On 28/06/2022 10.23, Daniel P. Berrang=C3=A9 wrote:
> > > > On Tue, Jun 28, 2022 at 01:21:35PM +0530, Ani Sinha wrote:
> > > > > On Tue, Jun 28, 2022 at 1:19 PM Daniel P. Berrang=C3=A9 <berrange=
@redhat.com> wrote:
> > > > > >
> > > > > > On Tue, Jun 28, 2022 at 09:25:35AM +0200, Thomas Huth wrote:
> > > > > > > On 28/06/2022 09.10, Michael S. Tsirkin wrote:
> > > > > > > > On Tue, Jun 28, 2022 at 09:03:33AM +0200, Thomas Huth wrote=
:
> > > > > > > > > > > > > > > No problem with that. So that's venv. But do =
we need pip and pulling
> > > > > > > > > > > > > > > packages from the net during testing?
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > We do that too. See requirements.txt in tests/
> > > > > > > > > > > > > > Following two are downloaded:
> > > > > > > > > > > > > > avocado-framework=3D=3D88.1
> > > > > > > > > > > > > > pycdlib=3D=3D1.11.0
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > Also see this line in Makefie.include:
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > $(call quiet-venv-pip,install -r $(TESTS_VENV_R=
EQ))
> > > > > > > > > > > > >
> > > > > > > > > > > > > Right but that's avocado since it pulls lots of s=
tuff from
> > > > > > > > > > > > > the net anyway.
> > > > > > > > > > > > > Are the libraries in question not packaged on maj=
or distros?
> > > > > > > > > > > >
> > > > > > > > > > > > Currently I only need this:
> > > > > > > > > > > > https://github.com/python-tap/tappy
> > > > > > > > > > > > which is the basic TAP processing library for pytho=
n.
> > > > > > > > > > > >
> > > > > > > > > > > > It seems its only installed through pip:
> > > > > > > > > > > > https://tappy.readthedocs.io/en/latest/
> > > > > > > > > > > >
> > > > > > > > > > > > I do not think this is packaged by default. It's su=
ch a basic library
> > > > > > > > > > > > for parsing test output that maybe we can keep this=
 somewhere within
> > > > > > > > > > > > the python src tree? Not sure ...
> > > > > > > > > > >
> > > > > > > > > > > It's pretty small for sure. Another submodule?
> > > > > > > > > >
> > > > > > > > > > Unlike BITS, this one is likely going to be maintained =
for a while and
> > > > > > > > > > will receive new releases through
> > > > > > > > > > https://pypi.org/project/tap.py/
> > > > > > > > > > so forking is OK but someone has to keep this updated.
> > > > > > > > > >
> > > > > > > > > > I am open to anything. Whatever feels right is fine to =
me.
> > > > > > > > >
> > > > > > > > > John Snow is currently working on the "Pythonification" o=
f various QEMU
> > > > > > > > > bits, I think you should loop him into this discussion, t=
oo.
> > > > > > > > >
> > > > > > > > >    Thomas
> > > > > > > >
> > > > > > > > submodule does not mean we fork necessarily. We could have
> > > > > > > > all options: check for the module and use it if there, if n=
ot
> > > > > > > > use one from system if not there install with pip ..
> > > > > > > > But yea, I'm not sure what's best either.
> > > > > > >
> > > > > > > submodules create a dependency on an internet connection, too=
. So before you
> > > > > > > add yet another submodule (which have a couple of other disad=
vantages), I
> > > > > > > think you could also directly use the venv here.
> > > > > >
> > > > > > Definitely not submodules.
> > > > > >
> > > > > > We need to get out of the mindset that submodules are needed fo=
r every new
> > > > > > dependancy we add. Submodules are only appropriate if the exter=
nal project
> > > > > > is designed to be used as a copylib (eg the keycodemapdb tool),=
 or if we
> > > > > > need to bundle in order to prevent a regression for previously =
deployed
> > > > > > QEMU installs where the dependancy is known not to exist on all=
 our
> > > > > > supported platforms.
> > > > > >
> > > > > > This does not apply in this case, because the proposed use of t=
appy is
> > > > > > merely for a test case. Meson just needs to check if tappy exis=
ts and if
> > > > > > it does, then use it, otherwise skip the tests that need it. Th=
e user can
> > > > > > arrange to install tappy, as they do with the majority of other=
 deps.
> > > > > >
> > > > > > If John's venv stuff is relevant, then we don't even need the m=
eson checks,
> > > > > > just delegate to the venv setup.
> > > > > >
> > > > > > Regardless, no submodules are needed or desirable.
> > > > >
> > > > > What about keeping biosbits stuff? Source or pre-built.
> > > >
> > > > Shipping them as pre-built binaries in QEMU is not a viable option
> > > > IMHO, especially for grub as a GPL'd project we need to be extremel=
y
> > > > clear about the exact corresponding source and build process for an=
y
> > > > binary.
> > > >
> > > > For this kind of thing I would generally expect the distro to provi=
de
> > > > packages that we consume. Looking at biosbits I see it is itself
> > > > bundling a bunch more 3rd party projects, libffi, grub2, and includ=
ing
> > > > even an ancient version of python as a submodule.
> > > >
> > > > So bundling a pre-built biosbits in QEMU appears to mean that we're=
 in
> > > > turn going to unexpectedly bundle a bunch of other 3rd party projec=
ts
> > > > too, all with dubious license compliance. I don't think this looks =
like
> > > > something we should have in qemu.git or qemu tarballs. It will also
> > > > make it challenging for the distro to take biosbits at all, unless
> > > > those 3rd party bundles can be eliminated in favour of using existi=
ng
> > > > builds their have packaged for grub, python, libffi, etc.
> > >
> > > So if this depends on some third party binary bits, I think this is p=
retty
> > > similar to the tests in the avocado directory ... there we download t=
hird
> > > party binaries, too... Wouldn't it make sense to adapt your tests to =
that
> > > framework?
> >
> > Now that you mention it, avocado does feel like a more appropriate fit.
> > IIUC the biosbits project appears to be effectively providing a custom
> > guest OS ISO image. IOW this testing is quite biased towards being
> > integration testing which is the target of avocado, while qtest is much
> > more to the unit testing end of the spectrum.
>
> This is more like unit testing than integration testing, now that you
> mention it. It tests only the bios, very narrowly and does not involve
> any OS at all.

Another thing to consider is that integration testing is further down
the line? Not for once when submitting patches on acpi have I run
them. However, every time I have run make check to make sure
bios-tables-test passes and I am not breaking anything. It's much more
useful to have this kind of thing part of make check before patch
submitters can quickly check for failures either in bios-tables-test
or in bits. Also its lot easier to add new acpi/smbios tests as a part
of this when bios-tables-test and this one are closer together.

>
> This would avoid all the
> > discussion and patches around introducing python to qtest
> >
> > With regards,
> > Daniel
> > --
> > |: https://berrange.com      -o-    https://www.flickr.com/photos/dberr=
ange :|
> > |: https://libvirt.org         -o-            https://fstop138.berrange=
.com :|
> > |: https://entangle-photo.org    -o-    https://www.instagram.com/dberr=
ange :|
> >

