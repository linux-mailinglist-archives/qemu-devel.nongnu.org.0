Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F22472920F2
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 03:53:14 +0200 (CEST)
Received: from localhost ([::1]:34994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUKMM-0004fQ-1D
	for lists+qemu-devel@lfdr.de; Sun, 18 Oct 2020 21:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kUKDX-0004Mw-2N
 for qemu-devel@nongnu.org; Sun, 18 Oct 2020 21:44:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kUKDT-0000Vs-HS
 for qemu-devel@nongnu.org; Sun, 18 Oct 2020 21:44:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603071840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KQ8jSgO1keelI0bP3ymMEQzb0g29jL70IrNRwGHjvi4=;
 b=ZEWCuZd17OOXNiXY/dKPxuww0gJvaXik5TwK5CH9R7sKzvfgVlgyiUhs8x9zSlv1E2OZst
 M+sjzYcPLf++WTjPFl9hI65RkXY4XqLR+/VXBmdoeSRCuBsfOqN/pqNP0sIC+6qPbl8U4B
 aF83vQ/niaaWtmr2bPqSKrejILLuVSE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-86mqxtTxPVKdlv_-RU0kng-1; Sun, 18 Oct 2020 21:43:57 -0400
X-MC-Unique: 86mqxtTxPVKdlv_-RU0kng-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4698C802B5D;
 Mon, 19 Oct 2020 01:43:56 +0000 (UTC)
Received: from localhost.localdomain (ovpn-119-55.rdu2.redhat.com
 [10.10.119.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8922A10013DB;
 Mon, 19 Oct 2020 01:43:51 +0000 (UTC)
Date: Sun, 18 Oct 2020 21:43:49 -0400
From: Cleber Rosa <crosa@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v3 2/4] Jobs based on custom runners: build environment
 docs and playbook
Message-ID: <20201019014349.GA1524996@localhost.localdomain>
References: <20201014052140.1146924-1-crosa@redhat.com>
 <20201014052140.1146924-3-crosa@redhat.com>
 <20201014173009.GU115189@redhat.com>
 <20201014185952.GA1196177@localhost.localdomain>
 <20201014191947.GB1196177@localhost.localdomain>
 <20201015082940.GA163620@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201015082940.GA163620@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/18 21:44:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2020 at 09:29:40AM +0100, Daniel P. Berrang=E9 wrote:
> On Wed, Oct 14, 2020 at 03:19:47PM -0400, Cleber Rosa wrote:
> > On Wed, Oct 14, 2020 at 02:59:58PM -0400, Cleber Rosa wrote:
> > > On Wed, Oct 14, 2020 at 06:30:09PM +0100, Daniel P. Berrang=E9 wrote:
> > > >=20
> > > > This needs updating to add meson, and with Paolo's series today you
> > > > might as well go ahead and add ninja-build immediately too
> > > >
> >=20
> > I replied too quickly, but allow me to get this right: meson is *not*
> > included in the dockerfiles (and other similar configurations), and
> > all setups I found rely on the submodule.  Are suggesting to add meson
> > and diverge from the dockerfiles?
>=20
> Doh, right, I forgot that we use the submodule for now, since we need
> such a new meson. So ignore this...
>=20
> > > > https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg04025.html
> > > >
> >=20
> > ^ I'll add meson according to this, of course.
>=20
> Just ninja is needed
>

Right, I meant ninja there!

Thanks,
- Cleber.

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAl+M71IACgkQZX6NM6Xy
CfObDg//YuJ40VLkKzU+H0w8nL1awE3c6J34XMq+lDmHxYxjwTkYlsgeZAWS8B6A
h+TrxVD1srDSq30zwr8A9On6RJxjIeft0bDHiTJfQ4WYpYDuNUaxgU82Svln4n7s
5GPGeY1zYN3rngq3tNondzwcH3wqeVfVTbLmva2F0we4y/Z1Jn260YjHjhGerYKK
tW7/2tSxIn+nt8L3p/0xTQdkwLrQD0ylPqff86qyxByid7j7ldi58TJrOj2gH/bH
gXLpnFxPOzUHMXbOi1ECrWsTqciH4PbGzfm5I0En+yI7yXZFMP7dRs5FbylNt3E9
nc64JKEDhQRZH/morTw0vczSyfQqH97e52qznMbjGX+ZjIocYhYet6RonrypdLoJ
LPepa78UzBAHjv+9JmObuixNetXMTjAf+7pYhvg6vJAFqcSUBd6UsQQUn6bWXkOK
tCQ3w/HETgJpavxtIsTifbdsopnwAs3mfvm0DUVSgbc2Qv+sr+sLsoOXdiWygTI5
GO3ar0JRla+8lAR+AWM7hQ3TClccKaob16NpD4QRIubFxKVIK7befvpe5RDB2yNj
PUL7w6Vuf8S+CGLtLPNDjabBG220MG2VVmsRDlgpaAxPZHoXi6RfzfRu9FOKxuPy
Eub5ah6mpbEdohLuWQ6ZnS+z59KvX3r3+f0vlgLpliJhWVyyg2Y=
=GsH4
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--


