Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E96B821D4C3
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jul 2020 13:22:07 +0200 (CEST)
Received: from localhost ([::1]:50464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1juwX9-00024o-1Z
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 07:22:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1juwWL-0001e3-49
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 07:21:17 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31652
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1juwWJ-0008GU-Fx
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 07:21:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594639274;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ADTFAsF8qafvGNa0FatCrWYDWmkd8cy/xxcGG7VY9kI=;
 b=CcSAvQGrmPfMDbI5DVbnvhe8aJAyCsnsP30EZojs1dJEy027CEyvewBcF9aJ4X2g1hsItI
 et8888pB5u+v2f7NmC0d+VEjLm5jabPoB9BBIj3I6kTf7HshN39XfT1QzP7P05TuLd3INp
 3DohbtdiHRuy/sZeteEFvBjn8V3vqqA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-7rmPXet5Ph-7sqNeu_4WLg-1; Mon, 13 Jul 2020 07:21:10 -0400
X-MC-Unique: 7rmPXet5Ph-7sqNeu_4WLg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B038100AA21;
 Mon, 13 Jul 2020 11:21:08 +0000 (UTC)
Received: from localhost (ovpn-114-66.ams2.redhat.com [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD3F327CCC;
 Mon, 13 Jul 2020 11:21:01 +0000 (UTC)
Date: Mon, 13 Jul 2020 12:21:00 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v7 00/21] Initial support for multi-process qemu
Message-ID: <20200713112100.GG28639@stefanha-x1.localdomain>
References: <cover.1593273671.git.elena.ufimtseva@oracle.com>
 <20200702134042.GG152912@stefanha-x1.localdomain>
 <4316F79B-02ED-40D7-A1B2-7EA9D2EBA32A@oracle.com>
MIME-Version: 1.0
In-Reply-To: <4316F79B-02ED-40D7-A1B2-7EA9D2EBA32A@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="reI/iBAAp9kzkmX4"
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=stefanha@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 02:19:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, fam@euphon.net,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John G Johnson <john.g.johnson@oracle.com>, qemu-devel@nongnu.org,
 kraxel@redhat.com, quintela@redhat.com, "Michael S. Tsirkin" <mst@redhat.com>,
 armbru@redhat.com, kanth.ghatraju@oracle.com, felipe@nutanix.com,
 thuth@redhat.com, ehabkost@redhat.com, konrad.wilk@oracle.com,
 dgilbert@redhat.com, liran.alon@oracle.com, pbonzini@redhat.com,
 rth@twiddle.net, kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 ross.lagerwall@citrix.com, marcandre.lureau@gmail.com,
 thanos.makatos@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--reI/iBAAp9kzkmX4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 09, 2020 at 10:16:31AM -0400, Jag Raman wrote:
> > On Jul 2, 2020, at 9:40 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote=
:
> > On Sat, Jun 27, 2020 at 10:09:22AM -0700, elena.ufimtseva@oracle.com wr=
ote:
> > makes sense to me and I see how it forms the base on which
> > VFIO-over-socket and smaller remote program builds using Kconfig can be
> > developed.
> >=20
> > My main concern is that the object lifecycle has not been fully
> > implemented in the proxy and remote device. Error handling is
>=20
> Thank you for your feedback on. FWIW, we did check about the unrealize() =
path
> in the object lifecycle management. We noticed that the destructor for th=
e PCI
> devices (pci_qdev_unrealize()) is currently not invoking the instance spe=
cific
> destructor/unrealize functions. While this is not an excuse for not imple=
menting
> the unrealize functions, it currently doesn=E2=80=99t have an impact on t=
he hot unplug path.
>=20
> You=E2=80=99re correct, we should implement the unrealize/destructor for =
the Proxy & remote
> objects. We=E2=80=99ll also look into any background for why the PCI devi=
ces don=E2=80=99t call
> instance specific destructor.

PCIDeviceClass->exit() is invoked by pci_qdev_unrealize(). I'm not sure
why it's called "exit" instead of "unrealize" but PCI devices implement
it to perform clean-up.

Stefan

--reI/iBAAp9kzkmX4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl8MQ5wACgkQnKSrs4Gr
c8iNzwf/Yp6ntV83AuygifjwFA5GXpRLZaWf51hslcUWWU6Z3heGbKqEzj1cmnqC
KDPIp0Vc9YviwWZAgQv3zZrYudA4Gv6zQ1gqQkmfhm5gsIw7XTfR2Pg3yTUt/YbN
JP3rxwK5SKXSASmB2k9ekvPE9x3CBiL7B1dGS3dRLyoOoG/VECF2T2ka7Nieko3L
007T5P/9KUL7ZeBd1C3f+qdNy+d9JoV6Lj2069/ADvMp+pfmjkOIp+zioWa1w3Uu
eXRoT48DUuKFf41O1pyMXCCBtHFGuVvSjts5Jn/gB4h7nuE5mrcuSbRf3hkGAPGJ
r9vLpIBR5z8uHG4dG7qrkIR58gtNCg==
=gxB5
-----END PGP SIGNATURE-----

--reI/iBAAp9kzkmX4--


