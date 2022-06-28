Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6145E55BF92
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 10:44:16 +0200 (CEST)
Received: from localhost ([::1]:59288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o66pT-0000ls-E2
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 04:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o660l-0007BW-Gz
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 03:51:51 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:46712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o660j-0007NZ-3M
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 03:51:51 -0400
Received: by mail-ed1-x52f.google.com with SMTP id z7so16283901edm.13
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 00:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=U0zve/JZ0GvmHVhedCfkdGgkf2/TOPZ6/7dwbIYEkvg=;
 b=QXYavIf8N8tqthTWqMM7a7Ymx6m8J20Xa2wxUNpMK2+/uK6PY5GnMMS3H4AmtsJZYJ
 Vt06qczjisaDbwKiBFhpNEKWUO4ZO5WI127fSPcn9X9LjPDdQL73CWPLyPBYot6SSuKM
 RKEv9Kpb/VgDIPTBkK8m+nTuCs8btD0KL48WZ10/3jhlf2R1l0PD41NpGm6sH5/jbi3G
 7PZbNEOGgrDiBUKESPoZ3T4OPbnem693Tyhxza0u41OIz692Icx65AZNKY6UAB7L7Mk5
 jOdPCt5BQ+NjZPZX9FsoFu+Sv/XNXktbnz2Qdt2s4d16xq0rMivB6y4RWWNKTlKwOqud
 VLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=U0zve/JZ0GvmHVhedCfkdGgkf2/TOPZ6/7dwbIYEkvg=;
 b=46KSmU0/fkOK7hvVWsiLCe+D3lZ6ioaPi9GLN4CW41rBryeKH0Yv4m2kqmaZ/iUKJV
 gpJPLpgl7HGROZ6cuA9dtLBYuMzYnJTWL0xMQwj8k2uDwnGiFdUIrWaST/LeTl86ZNCw
 em+utWcLShptx3Hb+v/CDgsjzo5R0yS5DEJZJWIlaRsdNJD3FpjOylxcn8rM9a1Il8jO
 6Oe50j88iu7rZ7Ti0Yr2vYcAyBgOF3BK/UBrqbS4YNmxXNQ6oiUkAwb0MsEVVF9n/mN3
 mOXAN16pND7AJZasFhZ1uRXYv2GCQnV1a5cT5QSIYIqBJP50aedigJP9Omn6lQ8gxBqN
 ZdiQ==
X-Gm-Message-State: AJIora9pj5YOOg0kJLDrwoxrOCWQGcPrcYYQqeY0Uv/pXxOYBIMCn/ke
 z8MjEwGT+W+iWzaaFmQS3O7yJAUmvUlWwjar5SNvNg==
X-Google-Smtp-Source: AGRyM1vuxGvj50bNeGUZWmk0dQD+EtCIsNfs34s4MlEKjIojVxzXmefZ+Dk+sTAp2BxF7iZrnab2IVdZUHC5YY23QsM=
X-Received: by 2002:a05:6402:1d4b:b0:435:cac5:1957 with SMTP id
 dz11-20020a0564021d4b00b00435cac51957mr21375187edb.109.1656402706594; Tue, 28
 Jun 2022 00:51:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAARzgwznJUrO-7kjZ+58qj=UG6V9wojP=ZfW7FePyvb6GxdNtA@mail.gmail.com>
 <20220628020017-mutt-send-email-mst@kernel.org>
 <CAARzgwwf_WRWzbwPorpa-4XN7T6f6D7CRo70+07Z8LgZO+5Spg@mail.gmail.com>
 <20220628021757-mutt-send-email-mst@kernel.org>
 <CAARzgwyWK2HNbz=9=uoA+DDTpnn2q3CRmYVyjLwfMs1wi24-LA@mail.gmail.com>
 <20220628024810-mutt-send-email-mst@kernel.org>
 <CAARzgww9KKx7fTw7WMMTb3PCQgdwJwS34X0jHhQ+41OrMWZazg@mail.gmail.com>
 <4e1c2a45-eb53-e210-1ce1-05837bf1e7c3@redhat.com>
 <20220628030749-mutt-send-email-mst@kernel.org>
 <7bf5976e-8277-7c78-f412-44f7be8754f4@redhat.com>
 <YrqyWhu8ThAcUGI4@redhat.com>
In-Reply-To: <YrqyWhu8ThAcUGI4@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 28 Jun 2022 13:21:35 +0530
Message-ID: <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 John Snow <jsnow@redhat.com>, 
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::52f;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52f.google.com
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

On Tue, Jun 28, 2022 at 1:19 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Tue, Jun 28, 2022 at 09:25:35AM +0200, Thomas Huth wrote:
> > On 28/06/2022 09.10, Michael S. Tsirkin wrote:
> > > On Tue, Jun 28, 2022 at 09:03:33AM +0200, Thomas Huth wrote:
> > > > > > > > > > No problem with that. So that's venv. But do we need pi=
p and pulling
> > > > > > > > > > packages from the net during testing?
> > > > > > > > >
> > > > > > > > > We do that too. See requirements.txt in tests/
> > > > > > > > > Following two are downloaded:
> > > > > > > > > avocado-framework=3D=3D88.1
> > > > > > > > > pycdlib=3D=3D1.11.0
> > > > > > > > >
> > > > > > > > > Also see this line in Makefie.include:
> > > > > > > > >
> > > > > > > > > $(call quiet-venv-pip,install -r $(TESTS_VENV_REQ))
> > > > > > > >
> > > > > > > > Right but that's avocado since it pulls lots of stuff from
> > > > > > > > the net anyway.
> > > > > > > > Are the libraries in question not packaged on major distros=
?
> > > > > > >
> > > > > > > Currently I only need this:
> > > > > > > https://github.com/python-tap/tappy
> > > > > > > which is the basic TAP processing library for python.
> > > > > > >
> > > > > > > It seems its only installed through pip:
> > > > > > > https://tappy.readthedocs.io/en/latest/
> > > > > > >
> > > > > > > I do not think this is packaged by default. It's such a basic=
 library
> > > > > > > for parsing test output that maybe we can keep this somewhere=
 within
> > > > > > > the python src tree? Not sure ...
> > > > > >
> > > > > > It's pretty small for sure. Another submodule?
> > > > >
> > > > > Unlike BITS, this one is likely going to be maintained for a whil=
e and
> > > > > will receive new releases through
> > > > > https://pypi.org/project/tap.py/
> > > > > so forking is OK but someone has to keep this updated.
> > > > >
> > > > > I am open to anything. Whatever feels right is fine to me.
> > > >
> > > > John Snow is currently working on the "Pythonification" of various =
QEMU
> > > > bits, I think you should loop him into this discussion, too.
> > > >
> > > >   Thomas
> > >
> > > submodule does not mean we fork necessarily. We could have
> > > all options: check for the module and use it if there, if not
> > > use one from system if not there install with pip ..
> > > But yea, I'm not sure what's best either.
> >
> > submodules create a dependency on an internet connection, too. So befor=
e you
> > add yet another submodule (which have a couple of other disadvantages),=
 I
> > think you could also directly use the venv here.
>
> Definitely not submodules.
>
> We need to get out of the mindset that submodules are needed for every ne=
w
> dependancy we add. Submodules are only appropriate if the external projec=
t
> is designed to be used as a copylib (eg the keycodemapdb tool), or if we
> need to bundle in order to prevent a regression for previously deployed
> QEMU installs where the dependancy is known not to exist on all our
> supported platforms.
>
> This does not apply in this case, because the proposed use of tappy is
> merely for a test case. Meson just needs to check if tappy exists and if
> it does, then use it, otherwise skip the tests that need it. The user can
> arrange to install tappy, as they do with the majority of other deps.
>
> If John's venv stuff is relevant, then we don't even need the meson check=
s,
> just delegate to the venv setup.
>
> Regardless, no submodules are needed or desirable.

What about keeping biosbits stuff? Source or pre-built.


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

