Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD0BE33C8
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 15:18:51 +0200 (CEST)
Received: from localhost ([::1]:42300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNd0s-0005nb-6V
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 09:18:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50394)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iNcdJ-0004Fq-Go
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 08:54:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iNcdG-00071M-Ps
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 08:54:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21417
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iNcdG-000716-LP
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 08:54:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571921666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=59X5Zte38Cgzy7JMHUGFe9KOmVyhJUTAXgKbgIdm69k=;
 b=F6icXuxVIcgnr60PoyC37/dxb87Mf3tniED0ltkgJNhbQGGo2u0r9Wgf3420kxg7ffW9d4
 OvbSEbtCGrDf2ilMVTs6O6BUcR0bEnNHJkKr9Yc/BnuBJmCT2kZLZNmIUFBavXPI4kjdEd
 /G3l0CR5NxYRuxpEDSD8jDN3415aad8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-dXN9-o_uONivsNoRgWttMw-1; Thu, 24 Oct 2019 08:54:24 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17ACE5E4;
 Thu, 24 Oct 2019 12:54:23 +0000 (UTC)
Received: from work-vm (ovpn-117-248.ams2.redhat.com [10.36.117.248])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EAA01001B33;
 Thu, 24 Oct 2019 12:54:12 +0000 (UTC)
Date: Thu, 24 Oct 2019 13:54:10 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 00/30] virtiofs daemon (base)
Message-ID: <20191024125410.GE2877@work-vm>
References: <20191021105832.36574-1-dgilbert@redhat.com>
 <157166664425.24734.3489596262271351160@37313f22b938>
 <20191021143357.GB5837@work-vm>
 <20191024065826-mutt-send-email-mst@kernel.org>
 <20191024110708.GI3700@redhat.com> <20191024111439.GD2877@work-vm>
 <20191024071738-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20191024071738-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: dXN9-o_uONivsNoRgWttMw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, piaojun@huawei.com, stefanha@redhat.com,
 marcandre.lureau@redhat.com, eguan@linux.alibaba.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Michael S. Tsirkin (mst@redhat.com) wrote:
> On Thu, Oct 24, 2019 at 12:14:39PM +0100, Dr. David Alan Gilbert wrote:
> > * Daniel P. Berrang=E9 (berrange@redhat.com) wrote:
> > > On Thu, Oct 24, 2019 at 06:59:33AM -0400, Michael S. Tsirkin wrote:
> > > > On Mon, Oct 21, 2019 at 03:33:57PM +0100, Dr. David Alan Gilbert wr=
ote:
> > > > > * no-reply@patchew.org (no-reply@patchew.org) wrote:
> > > > > > Patchew URL: https://patchew.org/QEMU/20191021105832.36574-1-dg=
ilbert@redhat.com/
> > > > > >=20
> > > > > >=20
> > > > > >=20
> > > > > > Hi,
> > > > > >=20
> > > > > > This series seems to have some coding style problems. See outpu=
t below for
> > > > > > more information:
> > > > > >=20
> > > > > > Subject: [PATCH 00/30] virtiofs daemon (base)
> > > > > > Type: series
> > > > > > Message-id: 20191021105832.36574-1-dgilbert@redhat.com
> > > > > >=20
> > > > > > =3D=3D=3D TEST SCRIPT BEGIN =3D=3D=3D
> > > > > > #!/bin/bash
> > > > > > git rev-parse base > /dev/null || exit 0
> > > > > > git config --local diff.renamelimit 0
> > > > > > git config --local diff.renames True
> > > > > > git config --local diff.algorithm histogram
> > > > > > ./scripts/checkpatch.pl --mailback base..
> > > > >=20
> > > > > Expecting checkpatch to be broken here; most of the files
> > > > > follow FUSE's formatting.
> > > > >=20
> > > > > Dave
> > > >=20
> > > > I wonder what do others think about this.
> > > > One problem with such inconsistencies is that people tend to copy c=
ode
> > > > around, which tends to result in a mess.
> > >=20
> > > IIUC, most of this code is simpy copied as-is from the fuse or linux
> > > git repos. I'm wondering what the intention is for it long term ?
> > >=20
> > > For header files, I would have expected us to be able to compile agai=
nst
> > > the -devel package provided by the kernel or fuse packages. I can
> > > understand if we want to import the headers if the VSOCK additions to
> > > them are not yet widely available in distros though. If this is the c=
ase
> > > we should put a time limit on how long we'd keep these copied headers
> > > around for before dropping them. It would be fine to violate QEMU cod=
ing
> > > style in this case as its not code QEMU would "maintain" long term - =
just
> > > a read-only import.
> >=20
> > The headers are really two types;  one are external definitions, the
> > other are internal parts of libfuse.  I'd expect to keep the internal
> > parts long term; teh external parts hmm; where would we pull them in
> > externally from?
> >=20
> > > The source files though, we appear to then be modifying locally, whic=
h
> > > suggests they'll live in our repo forever. In this case I'd expect to
> > > have compliance with QEMU coding standards.
> >=20
> > OK.
> >=20
> > > I'm surprised we need to copy so much in from fuse though. Is there a
> > > case to be made for fuse to provide a library of APIs for people who
> > > are building fuse daemons to link against, instead of copy & fork ?
> >=20
> > libfuse *is* such a library; but it preserves ABI compliance; it's
> > intention is to be used to build filesystem implementations on top of -
> > and that's got a fairly good separation;  however changing the fuse
> > transport, and security models is much more invasive than it was
> > designed for.
> >=20
> > Dave
>=20
>=20
> I guess you did try to propose adding the functionality to the libfuse
> maintainer and got rejected? If not it's worth asking.

I looked at it; we started off thinking we'd merge much of it up there -
but there's at least two problems:

  a) Our libvhost-user isn't a separable library either - so we'd need
to copy it into libfuse which is just as big a problem.
  b) It's not additional interfaces, it's changes to existing APIs that
break A*B*I compatibility that are very hard to avoid when you're
changing the transport.

Also, we're not just changing the transport - if you look at the
security patchset we're inverting the security model and there's a bunch
of threading changes that you haven't got yet.

Dave

>=20
>=20
> > > Regards,
> > > Daniel
> > > --=20
> > > |: https://berrange.com      -o-    https://www.flickr.com/photos/dbe=
rrange :|
> > > |: https://libvirt.org         -o-            https://fstop138.berran=
ge.com :|
> > > |: https://entangle-photo.org    -o-    https://www.instagram.com/dbe=
rrange :|
> > --
> > Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


