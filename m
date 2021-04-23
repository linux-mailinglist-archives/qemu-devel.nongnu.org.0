Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE01D369889
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 19:38:51 +0200 (CEST)
Received: from localhost ([::1]:38392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZzlS-0000YV-Pi
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 13:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phrdina@redhat.com>)
 id 1lZzjK-0008Aa-MJ
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:36:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phrdina@redhat.com>)
 id 1lZzjH-00050v-M7
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:36:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619199391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=16fSZu/6Y7d0/47uc3LgKlzAbsA8/iHGTAPorLmCjWM=;
 b=TF7O3KQu5/PwFRpGqJvDvcQGUzCj+bHOmu6xolDbK+Lu/Djlhx6MNwifPJ9Lr668lh+PxE
 k8HYjh/xVTYoGShEME7SwJ+so25PDh3GgvlDLWyzmTDO0h2oU9VNKcxK3Ya4wl92Cetk4p
 /lTm2p3G+M7kQV82ziw2l2TuQo48O+k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-FcpfgfjkOyy0PnLuXa-mkQ-1; Fri, 23 Apr 2021 13:36:28 -0400
X-MC-Unique: FcpfgfjkOyy0PnLuXa-mkQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4C0F5137;
 Fri, 23 Apr 2021 17:36:27 +0000 (UTC)
Received: from antique-laptop (unknown [10.40.195.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 29AE35D6D1;
 Fri, 23 Apr 2021 17:36:25 +0000 (UTC)
Date: Fri, 23 Apr 2021 19:36:23 +0200
From: Pavel Hrdina <phrdina@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: firmware selection for SEV-ES
Message-ID: <YIMFl41sU0X5V+Ig@antique-laptop>
References: <6af8c5c7-6166-7f83-9ff0-4c24460577e2@redhat.com>
 <YIARw09TcakElBco@antique-laptop>
 <0b5d799c-6290-5585-599e-4c4f37af6202@redhat.com>
 <0cf69e7e-d159-6b68-0046-5449b0241634@redhat.com>
 <YIKiE+USYmCjQeSR@antique-laptop>
 <e5978a49-00a6-6350-0e06-6aab6de4c9a5@redhat.com>
 <YILFNu1R8LcZRF48@antique-laptop>
 <17cd75db-98bf-7bf1-bc5b-cd71e62507ec@redhat.com>
MIME-Version: 1.0
In-Reply-To: <17cd75db-98bf-7bf1-bc5b-cd71e62507ec@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=phrdina@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="BfAO89P11E+JLqv/"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=phrdina@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--BfAO89P11E+JLqv/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2021 at 03:06:49PM +0200, Laszlo Ersek wrote:
> On 04/23/21 15:01, Pavel Hrdina wrote:
> > On Fri, Apr 23, 2021 at 02:34:02PM +0200, Laszlo Ersek wrote:
> >> On 04/23/21 12:31, Pavel Hrdina wrote:
> >>> On Fri, Apr 23, 2021 at 10:16:24AM +0200, Michal Privoznik wrote:
> >>>> On 4/22/21 4:13 PM, Laszlo Ersek wrote:
> >>>>> On 04/21/21 13:51, Pavel Hrdina wrote:
> >>
> >>>>> Should we file a libvirtd Feature Request (where?) for recognizing =
the
> >>>>> @amd-sev-es feature flag?
> >>>>
> >>>> Yes, we should. We can use RedHat bugzilla for that. Laszlo - do you=
 want to
> >>>> do it yourself or shall I help you with that?
> >>>
> >>> This BZ looks like it's already tracking support for amd-sev-es [1].
> >>>
> >>> Pavel.
> >>>
> >>> [1] <https://bugzilla.redhat.com/show_bug.cgi?id=3D1895035>
> >>
> >> That's a private RHBZ that tracks SEV-ES for a product that is differe=
nt
> >> from "libvirt upstream".
> >=20
> > I didn't notice that's a private RHBZ, thanks for pointing it out.
> >=20
> > For upstream libvirt we no longer use RHBZ to track RFEs/BZs, we use
> > gitlab issues so if we want to track the work in upstream as well I can
> > create a new issue.
>=20
> Heh, I suspected I was missing something there :) Yes, please, if you or
> Michal could create a new issue in gitlab, that would be great.

I've created a new libvirt issue [1], hopefully the description makes
sense. :)

Pavel

[1] <https://gitlab.com/libvirt/libvirt/-/issues/156>

--BfAO89P11E+JLqv/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEcbzs91ho/coWWY7aUi1kczAH4YwFAmCDBZcACgkQUi1kczAH
4YziGw//RYJxDkDPVr+R8uzTQ/1k1FPMCEJteBuLpxF2UNN5NmCcq8P35cmiTPY3
yNUq185DWjaqFPJmId6cgvLiGUFTfwZPvjntqvR2Jc7bQNPbQHeWJ84xHIGXMHCS
V7ShnIr4bgnm5Ca/MNNoRf5itVGKGsUdYb+qCxQSUhbzaqecYrW8EeHxahqUgP7/
fxkvK3FOLBnBi7qnIeAZyUslGH6SkIPdPcR9nPhuWZ2S7hUGcSHv0SNbgxUA8r4d
/E238DHZqbf/sp7GWcx7w7nEAPoBJgA0Fmk+u2WU0Ef5n/zIw7YZRvvfVlaXXxLI
9xee064L5S3CHqT+9VOPodssobSaZ3daXM+EGX8k+vRQpRkLtdHQOGOXdqStaTiN
YNXD0xlD7lrsO5CISQhAT0gLxPVvmmsAeFfX75EMJVfUtSQ6EH5WV2gih6GFUnsH
qaTxKXLHBdgdn+5gxXSnaS9/UIBh2EGmnSBXwQu1EL0NJbB2jKAVrOM4Tii4Ekha
IZtNxpDT+30IxoWmrhcCp+ZJTNO5h3nvDZ7nbPeiQ5/S0Gk4f0IMOp85yzACf4/z
NvTpMG7RX40weMwnauCm/LeWtiT/QMcZ+CcXU2umSsAghqNG1HKO1SVvhxJw3B/8
3NAf5UwaG1UXZ9AOa5nqGi8N29fW/D9Uf01aRVh7obOgiJQGSek=
=pDHb
-----END PGP SIGNATURE-----

--BfAO89P11E+JLqv/--


