Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 639E115A797
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Feb 2020 12:19:51 +0100 (CET)
Received: from localhost ([::1]:35978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j1q3a-0007QE-0N
	for lists+qemu-devel@lfdr.de; Wed, 12 Feb 2020 06:19:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43484)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1j1q2X-0006ib-Kn
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 06:18:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1j1q2W-00024A-Hn
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 06:18:45 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:48668
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1j1q2W-00023e-BE
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 06:18:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581506324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sHCOiCk1shu96TBgfuSoSEnJmXhBu3UDB/X0FaAfVi8=;
 b=GXLa+3YXhhnz7wiYyyweQXw1PCtVswNIoZCN4IQpUn9EIU3j1jf40DBeQcIyLeqFinRQr8
 ov0Yefyv5PAnxmvAYDNp9iUjGFY+yARNK/RzUQh8ge95iwqvMCR/eqyJhx8DyV/GHek5r+
 cOsR2TijHlx+cNuSreC5FPmua7NvzAs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-LZ8iKLCAPAGO2_GYTQ9MTw-1; Wed, 12 Feb 2020 06:18:39 -0500
X-MC-Unique: LZ8iKLCAPAGO2_GYTQ9MTw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C31C2DB60;
 Wed, 12 Feb 2020 11:18:38 +0000 (UTC)
Received: from localhost (unknown [10.36.118.42])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A2C9019C69;
 Wed, 12 Feb 2020 11:18:33 +0000 (UTC)
Date: Wed, 12 Feb 2020 11:18:32 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 2/4] virtio-scsi: default num_queues to -smp N
Message-ID: <20200212111832.GD464050@stefanha-x1.localdomain>
References: <20200124100159.736209-3-stefanha@redhat.com>
 <20200127141031.6e108839.cohuck@redhat.com>
 <20200129154438.GC157595@stefanha-x1.localdomain>
 <bc9680fc-c382-301f-a1fe-21740c918570@redhat.com>
 <20200130105235.GC176651@stefanha-x1.localdomain>
 <20200203102529.3op54zggtquoguuo@dritchie>
 <20200203105744.GD1922177@redhat.com>
 <20200203113949.hnjuqzkrqqwst54e@dritchie>
 <20200211162041.GA432724@stefanha-x1.localdomain>
 <20200211113108-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200211113108-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="C1iGAkRnbeBonpVg"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Sergio Lopez <slp@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--C1iGAkRnbeBonpVg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2020 at 11:31:17AM -0500, Michael S. Tsirkin wrote:
> On Tue, Feb 11, 2020 at 04:20:41PM +0000, Stefan Hajnoczi wrote:
> > On Mon, Feb 03, 2020 at 12:39:49PM +0100, Sergio Lopez wrote:
> > > On Mon, Feb 03, 2020 at 10:57:44AM +0000, Daniel P. Berrang=E9 wrote:
> > > > On Mon, Feb 03, 2020 at 11:25:29AM +0100, Sergio Lopez wrote:
> > > > > On Thu, Jan 30, 2020 at 10:52:35AM +0000, Stefan Hajnoczi wrote:
> > > > > > On Thu, Jan 30, 2020 at 01:29:16AM +0100, Paolo Bonzini wrote:
> > > > > > > On 29/01/20 16:44, Stefan Hajnoczi wrote:
> > > > > > > > On Mon, Jan 27, 2020 at 02:10:31PM +0100, Cornelia Huck wro=
te:
> > > > > > > >> On Fri, 24 Jan 2020 10:01:57 +0000
> > > > > > > >> Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > I will create a 32 vCPU guest with 100 virtio-blk devices and verify
> > that enabling multi-queue is successful.
>=20
> and that it's helpful for performance?

I may be a little while before the next revision of this patch series.
Testing reveals scalability problems when creating so many virtqueues
:).

I've measured boot time, memory consumption, and random read IOPS.  They
are all significantly worse (32 vCPUs, 24 GB RAM, 101 virtio-blk
devices, 32 queues/device).

Time to see what's going on and whether some general scalability
improvements are possible here before we enable multi-queue by default.

Stefan

--C1iGAkRnbeBonpVg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl5D3wcACgkQnKSrs4Gr
c8h+8QgAvY0Nfx4IDDcmHMAEfXo1jqhtFZ6DHg/a0L/rP7WHybR2JJ0O1sk8C6Dk
X6hctZm/AbxFWqkvt031Y9nmZ52+yyWsTjJq/NUve3tPMY/E1puyKMoqgDFPFQXB
Xxpfi1NqsFLgmPfSKUvVyuXf3dq54+Zr5yYo7HlRTOWCgeltqnakwmpMRNr9pYgO
PQH2t7ygcwFZTGpNsRrnXB0UG0e9Ayt4lfzfn9htV2PgqhlsXkzz2T9pIlPMyboZ
/weMBrcg9EfNXHhkFRkJirpHE0fIZXy0Rz/yFY2Bj0k7gFtvZn1uFotX7+Fm8i+j
i0jaE73hFYhKMTiUkbLrBxDsJC1NhQ==
=+J2u
-----END PGP SIGNATURE-----

--C1iGAkRnbeBonpVg--


