Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F4255BFCD
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 11:34:49 +0200 (CEST)
Received: from localhost ([::1]:36660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o67cO-0007SG-Ox
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 05:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o66h4-0007rG-Dg
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 04:35:34 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:43950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1o66h2-0005m4-Aj
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 04:35:34 -0400
Received: by mail-ej1-x62d.google.com with SMTP id u15so24177752ejc.10
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 01:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HjAnGlVeHlBLWPB+K2RhicRNjA5pdQWoc3S5qTM8vG4=;
 b=u3aOHW/Z/770SP9fStzhZ14ojHlf/xo1Zyzc8zp+IqqN+u3u1652zwac7iCw9p9Sxf
 v3toFNou9dBBxDpSfyvi8cBZos2C7n4feu/1oLoXxpoV13oM9S8F1ijkMY/1CTAwApsF
 PdKj1c8KsJtEcrcUpSu4NWZvf59smFF6cWNBG0ZSgd1YuIWqracpLjW0epGNxa4oS/L5
 kmLDQzMtGWHMrFYl+skLu/rz10p/mfOX1lHpZn++cnWf5YWCGCFoN7Z0a1sbU8uPKujS
 +xDB1Gsb2LsQHRBIOaf0pQjgaA370KmgRTPAZev/XCoLQUdxcPW+4MHGNVPgifiMQpUD
 3qlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HjAnGlVeHlBLWPB+K2RhicRNjA5pdQWoc3S5qTM8vG4=;
 b=m/VfqQJSB6RiLzEqaE/nZR7P5ts/tuaaDjfzjiz3FGKHxUhgG/y8qXgXe+Rbjx+LCl
 8MhUBspIax4yU4xkv9A4CHYHh0W1ByZ35jJWKwatqsTyM1kiMyKHCMgTRvfE0xVEweEb
 4NsrBpB6uofi3oLI9DvdysIfcm10nYoQDlcfM9wuansY9dgkT9KpXNznyZskHA1IsY8/
 aeBRHvin3hZ4eP0V3+4/rUMwp/PSnxkIXmFu9gP90VcapRLXRfw42CWlHrRnPYgwoNej
 Nk9NbDq6Zbu7IAkZA8H5tzqHiWcw28rsHu7tg3VNWVh/iryARHZAY0hXWqNA/yQdVde8
 4Rgg==
X-Gm-Message-State: AJIora8B0rR7WB6xjXlFux+UHnhudNJmJhCwuIx6W92JjV+Edeq3ExNn
 u6lGdyXXuU5/rJQ9qJHaI9C788Tl3Z3lVYKE6PTj7A==
X-Google-Smtp-Source: AGRyM1sGgkcYAgNXwHoHYQu3BC365ogI+3W52i9w9oJqInejSx+Rak2pD16kjWqYjSMdlP1yGF0eKJuW8hhyRQnL6N0=
X-Received: by 2002:a17:906:b795:b0:722:e662:cffe with SMTP id
 dt21-20020a170906b79500b00722e662cffemr16774270ejb.121.1656405330726; Tue, 28
 Jun 2022 01:35:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAARzgwwf_WRWzbwPorpa-4XN7T6f6D7CRo70+07Z8LgZO+5Spg@mail.gmail.com>
 <20220628021757-mutt-send-email-mst@kernel.org>
 <CAARzgwyWK2HNbz=9=uoA+DDTpnn2q3CRmYVyjLwfMs1wi24-LA@mail.gmail.com>
 <20220628024810-mutt-send-email-mst@kernel.org>
 <CAARzgww9KKx7fTw7WMMTb3PCQgdwJwS34X0jHhQ+41OrMWZazg@mail.gmail.com>
 <4e1c2a45-eb53-e210-1ce1-05837bf1e7c3@redhat.com>
 <20220628030749-mutt-send-email-mst@kernel.org>
 <7bf5976e-8277-7c78-f412-44f7be8754f4@redhat.com>
 <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
In-Reply-To: <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 28 Jun 2022 14:05:19 +0530
Message-ID: <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 imammedo@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::62d;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x62d.google.com
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

On Tue, Jun 28, 2022 at 1:58 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 28/06/2022 10.23, Daniel P. Berrang=C3=A9 wrote:
> > On Tue, Jun 28, 2022 at 01:21:35PM +0530, Ani Sinha wrote:
> >> On Tue, Jun 28, 2022 at 1:19 PM Daniel P. Berrang=C3=A9 <berrange@redh=
at.com> wrote:
> >>>
> >>> On Tue, Jun 28, 2022 at 09:25:35AM +0200, Thomas Huth wrote:
> >>>> On 28/06/2022 09.10, Michael S. Tsirkin wrote:
> >>>>> On Tue, Jun 28, 2022 at 09:03:33AM +0200, Thomas Huth wrote:
> >>>>>>>>>>>> No problem with that. So that's venv. But do we need pip and=
 pulling
> >>>>>>>>>>>> packages from the net during testing?
> >>>>>>>>>>>
> >>>>>>>>>>> We do that too. See requirements.txt in tests/
> >>>>>>>>>>> Following two are downloaded:
> >>>>>>>>>>> avocado-framework=3D=3D88.1
> >>>>>>>>>>> pycdlib=3D=3D1.11.0
> >>>>>>>>>>>
> >>>>>>>>>>> Also see this line in Makefie.include:
> >>>>>>>>>>>
> >>>>>>>>>>> $(call quiet-venv-pip,install -r $(TESTS_VENV_REQ))
> >>>>>>>>>>
> >>>>>>>>>> Right but that's avocado since it pulls lots of stuff from
> >>>>>>>>>> the net anyway.
> >>>>>>>>>> Are the libraries in question not packaged on major distros?
> >>>>>>>>>
> >>>>>>>>> Currently I only need this:
> >>>>>>>>> https://github.com/python-tap/tappy
> >>>>>>>>> which is the basic TAP processing library for python.
> >>>>>>>>>
> >>>>>>>>> It seems its only installed through pip:
> >>>>>>>>> https://tappy.readthedocs.io/en/latest/
> >>>>>>>>>
> >>>>>>>>> I do not think this is packaged by default. It's such a basic l=
ibrary
> >>>>>>>>> for parsing test output that maybe we can keep this somewhere w=
ithin
> >>>>>>>>> the python src tree? Not sure ...
> >>>>>>>>
> >>>>>>>> It's pretty small for sure. Another submodule?
> >>>>>>>
> >>>>>>> Unlike BITS, this one is likely going to be maintained for a whil=
e and
> >>>>>>> will receive new releases through
> >>>>>>> https://pypi.org/project/tap.py/
> >>>>>>> so forking is OK but someone has to keep this updated.
> >>>>>>>
> >>>>>>> I am open to anything. Whatever feels right is fine to me.
> >>>>>>
> >>>>>> John Snow is currently working on the "Pythonification" of various=
 QEMU
> >>>>>> bits, I think you should loop him into this discussion, too.
> >>>>>>
> >>>>>>    Thomas
> >>>>>
> >>>>> submodule does not mean we fork necessarily. We could have
> >>>>> all options: check for the module and use it if there, if not
> >>>>> use one from system if not there install with pip ..
> >>>>> But yea, I'm not sure what's best either.
> >>>>
> >>>> submodules create a dependency on an internet connection, too. So be=
fore you
> >>>> add yet another submodule (which have a couple of other disadvantage=
s), I
> >>>> think you could also directly use the venv here.
> >>>
> >>> Definitely not submodules.
> >>>
> >>> We need to get out of the mindset that submodules are needed for ever=
y new
> >>> dependancy we add. Submodules are only appropriate if the external pr=
oject
> >>> is designed to be used as a copylib (eg the keycodemapdb tool), or if=
 we
> >>> need to bundle in order to prevent a regression for previously deploy=
ed
> >>> QEMU installs where the dependancy is known not to exist on all our
> >>> supported platforms.
> >>>
> >>> This does not apply in this case, because the proposed use of tappy i=
s
> >>> merely for a test case. Meson just needs to check if tappy exists and=
 if
> >>> it does, then use it, otherwise skip the tests that need it. The user=
 can
> >>> arrange to install tappy, as they do with the majority of other deps.
> >>>
> >>> If John's venv stuff is relevant, then we don't even need the meson c=
hecks,
> >>> just delegate to the venv setup.
> >>>
> >>> Regardless, no submodules are needed or desirable.
> >>
> >> What about keeping biosbits stuff? Source or pre-built.
> >
> > Shipping them as pre-built binaries in QEMU is not a viable option
> > IMHO, especially for grub as a GPL'd project we need to be extremely
> > clear about the exact corresponding source and build process for any
> > binary.
> >
> > For this kind of thing I would generally expect the distro to provide
> > packages that we consume. Looking at biosbits I see it is itself
> > bundling a bunch more 3rd party projects, libffi, grub2, and including
> > even an ancient version of python as a submodule.
> >
> > So bundling a pre-built biosbits in QEMU appears to mean that we're in
> > turn going to unexpectedly bundle a bunch of other 3rd party projects
> > too, all with dubious license compliance. I don't think this looks like
> > something we should have in qemu.git or qemu tarballs. It will also
> > make it challenging for the distro to take biosbits at all, unless
> > those 3rd party bundles can be eliminated in favour of using existing
> > builds their have packaged for grub, python, libffi, etc.
>
> So if this depends on some third party binary bits, I think this is prett=
y
> similar to the tests in the avocado directory ... there we download third
> party binaries, too... Wouldn't it make sense to adapt your tests to that
> framework?

I do not want to bring in the whole avocado framework because it would
unnecessarily make things complicated. I just need the qemu machine
python library and that is enough. For downloading third party stuff,
we can simply wget things from somewhere.

>
>   Thomas
>

