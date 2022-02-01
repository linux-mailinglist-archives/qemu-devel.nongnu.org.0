Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1664A687D
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 00:26:01 +0100 (CET)
Received: from localhost ([::1]:39010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF2XA-00014x-Ji
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 18:26:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1nExzh-0007K0-4O
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:35:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sbrivio@redhat.com>)
 id 1nExzf-0002nA-33
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:35:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643740506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3GOq4wy4n8PvvFS7TEZoaXv6e72/bYrmCOFHVTnlvmI=;
 b=TyFUX0iyclZCYML30aUrmj9aTOtK43+u7Xo+EG+DIOChT0RmPfPNIouKUcM+4GJgDJuYqH
 LPujsKy33IBbNk+4uUZISWXiixFNfA0g1oOIUYNMC5O0hA11a+6WeRZyJPUNHHl/2pyIgr
 Lb6uMKo5OZLc96k7GtxKOAiWmGqyCIg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-_sTC8-YBOvGALwrBFCd55A-1; Tue, 01 Feb 2022 13:35:04 -0500
X-MC-Unique: _sTC8-YBOvGALwrBFCd55A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 371C41091DA7;
 Tue,  1 Feb 2022 18:35:03 +0000 (UTC)
Received: from maya.cloud.tilaa.com (unknown [10.40.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9ADD577459;
 Tue,  1 Feb 2022 18:35:02 +0000 (UTC)
Date: Tue, 1 Feb 2022 19:35:00 +0100
From: Stefano Brivio <sbrivio@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: "make check-acceptance" takes way too long
Message-ID: <20220201193500.3162e843@elisabeth>
In-Reply-To: <CA+bd_6Jnp846dL4FBUaduHGtnDJN29qQjSuS96V7aPS2iuqF0Q@mail.gmail.com>
References: <87zgnp4b32.fsf@dusky.pond.sub.org>
 <CAFEAcA_kxrCgyxWPFLw6VZ-rKx-res0C8L2BWRvfB81cR+keLg@mail.gmail.com>
 <875yqd6zib.fsf@linaro.org> <YerPk2ABMHQf/3QP@redhat.com>
 <20220125092011.dq2t4ryl632vrvsf@sirius.home.kraxel.org>
 <20220201073139.7896e10b@elisabeth> <Yfj4ERdAvmCF4ZzY@redhat.com>
 <20220201112720.4ac9b8df@elisabeth> <87wnieygjp.fsf@linaro.org>
 <CA+bd_6JF5iRKufxVa=6TEtR-eH65iiiG-oarWRHkavX-3E-p1Q@mail.gmail.com>
 <Yfldie06h92qxqf3@redhat.com>
 <CA+bd_6Jnp846dL4FBUaduHGtnDJN29qQjSuS96V7aPS2iuqF0Q@mail.gmail.com>
Organization: Red Hat
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sbrivio@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sbrivio@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1E?= =?UTF-8?B?YXVkw6k=?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Feb 2022 12:47:48 -0500
Cleber Rosa <crosa@redhat.com> wrote:

> On Tue, Feb 1, 2022 at 11:20 AM Daniel P. Berrang=C3=A9
> <berrange@redhat.com> wrote:
> >
> > On Tue, Feb 01, 2022 at 11:01:43AM -0500, Cleber Rosa wrote: =20
> > > On Tue, Feb 1, 2022 at 6:25 AM Alex Benn=C3=A9e
> > > <alex.bennee@linaro.org> wrote: =20
> > > >
> > > > We have up to now tried really hard as a project to avoid
> > > > building and hosting our own binaries to avoid theoretical* GPL
> > > > compliance issues. This is why we've ended up relying so much
> > > > on distros to build and host binaries we can use. Most QEMU
> > > > developers have their own personal zoo of kernels and
> > > > userspaces which they use for testing. I use custom kernels
> > > > with a buildroot user space in initramfs for example. We even
> > > > use the qemu advent calendar for a number of our avocado tests
> > > > but we basically push responsibility for GPL compliance to the
> > > > individual developers in that case.
> > > >
> > > > *theoretical in so far I suspect most people would be happy
> > > > with a reference to an upstream repo/commit and .config even if
> > > > that is not to the letter of the "offer of source code"
> > > > required for true compliance.=20
> > >
> > > Yes, it'd be fine (great, really!) if a lightweight distro (or
> > > kernels/initrd) were to
> > > be maintained and identified as an "official" QEMU pick.  Putting
> > > the binaries in the source tree though, brings all sorts of
> > > compliance issues. =20
> >
> > All that's really needed is to have the source + build recipes
> > in a separate git repo. A pipeline can build them periodically
> > and publish artifacts, which QEMU can then consume in its pipeline.
> > =20
>=20
> I get your point, but then to acquire the artifacts one needs to:
>=20
> 1. depend on the CI system to deploy the artifacts in subsequent job
> stages (a limitation IMO), OR
> 2. if outside the CI, implement a download/cache mechanism for those
> artifacts, which gets us back to the previous point, only with a
> different distro/kernel+initrd.
>=20
> With that, the value proposal has to be in the characteristics of
> distro/kernel+initrd itself. It has to have enough differentiation to
> justify the development/maintenance work, as opposed to using existing
> ones.
>=20
> FWIW, my non-scientific tests booting on my 3+ YO machine:
>=20
> * CirrOS x86_64+KVM: ~2 seconds
> * CirroOS aarch64+TCG: ~20 seconds
> * Fedora kernel+initrd aarch64+TCG
> (tests/avocado/boot_linux_console.py:BootLinuxConsole.test_aarch64_virt):
> ~1 second
>=20
> I would imagine that CirrOS aarch64+KVM on an adequate system would be
> similar to the CirrOS x86_64+KVM.  We can develop/maintain a slimmer
> distro, and/or set the default test workloads where they perform the
> best.  The development cost of the latter is quite small.  I've added
> a missing bit to the filtering capabilities in Avocado[1] and will
> send a proposal to QEMU along these lines.

I'm not sure how boot/download times compare (I haven't measured) with
CirrOS or Fedora, but when I recently needed a quick test on SPARC (TCG),
something along these lines worked quite reliably for me:

  wget https://bouncer.gentoo.org/fetch/root/all/releases/sparc/autobuilds/=
20220129T013513Z/install-sparc64-minimal-20220129T013513Z.iso
  wget https://bouncer.gentoo.org/fetch/root/all/releases/sparc/autobuilds/=
20220129T013513Z/stage3-sparc64-20220129T013513Z.tar.xz
  xz -d stage3-sparc64-20220129T013513Z.tar.xz
  virt-make-fs stage3-sparc64-20220129T013513Z.tar sparc.img
  qemu-system-sparc64 -m 2048 -cdrom ../install-sparc64-minimal-20220129T01=
3513Z.iso -boot d -hda sparc.img -net nic,model=3Dsunhme ...

...same approach worked easily with ppc and aarch64. I quickly
considered Alpine (smaller downloads), but it doesn't offer chroot
environments for as many architectures.

I guess the unique thing about "source-based" distributions is that
somewhat uncommon architectures are less likely to disappear because
of the burden of maintaining the full set of binary packages.

--=20
Stefano


