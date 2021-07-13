Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC223C6DA5
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 11:39:21 +0200 (CEST)
Received: from localhost ([::1]:49394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Esq-0006gz-8y
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 05:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m3Er7-0004mC-5w
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 05:37:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1m3Er5-0005Em-FD
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 05:37:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626169050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=it6nM0iF7koh3EMA7FXN3eVf57VsIKnjsjicOcJLfM8=;
 b=FpocKuLO11X/MD8Wpo8pigF+yHC/yZchPAVehgphuj0fgSxbmkxdgGzYwvxyzsht0bt0EF
 rU/CwIIeOPE+Xdy9ZrB85PvM2EaY6/4MTxjtzpd7zTLENqWpB1TY7bAImTRpExFy7k9yFx
 eO8/wHIMyJ4PzQ9Twk9IlHT/pJ8jRjI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-3arSOKjpPhe0hSFdoFPcnQ-1; Tue, 13 Jul 2021 05:37:27 -0400
X-MC-Unique: 3arSOKjpPhe0hSFdoFPcnQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12645802C80;
 Tue, 13 Jul 2021 09:37:25 +0000 (UTC)
Received: from localhost (ovpn-113-192.ams2.redhat.com [10.36.113.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 454F95D9CA;
 Tue, 13 Jul 2021 09:37:24 +0000 (UTC)
Date: Tue, 13 Jul 2021 10:37:23 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Christoph Hellwig <hch@infradead.org>,
 Padmakar Kalghatgi <p.kalghatgi@samsung.com>, its@irrelevant.dk
Subject: Re: [RFC PATCH 1/2] hw/nvme: add mi device
Message-ID: <YO1e01ex1yOvy0SB@stefanha-x1.localdomain>
References: <CGME20210709135651epcas5p1c544dec5377413bfa4b2eeab6ee43f26@epcas5p1.samsung.com>
 <20210709135545.GA11148@test-zns>
 <YOwhf59Xb/9IkZ9K@stefanha-x1.localdomain>
 <YO0k9JFO93EMaFIj@infradead.org>
MIME-Version: 1.0
In-Reply-To: <YO0k9JFO93EMaFIj@infradead.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="FJ3AFhudtxOv0ink"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: fam@euphon.net, kwolf@redhat.com, jg123.choi@samsung.com,
 qemu-block@nongnu.org, k.jensen@samsung.com, d.palani@samsung.com,
 qemu-devel@nongnu.org, linux-nvme@lists.infradead.org, mreitz@redhat.com,
 u.kishore@samsung.com, kbusch@kernel.org, javier.gonz@samsung.com,
 prakash.v@samsung.com, mohit.kap@samsung.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--FJ3AFhudtxOv0ink
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 13, 2021 at 06:30:28AM +0100, Christoph Hellwig wrote:
On Tue, Jul 13, 2021 at 06:30:28AM +0100, Christoph Hellwig wrote:
> On Mon, Jul 12, 2021 at 12:03:27PM +0100, Stefan Hajnoczi wrote:
> > Why did you decide to implement -device nvme-mi as a device on
> > TYPE_NVME_BUS? If the NVMe spec somehow requires this then I'm surprise=
d
> > that there's no NVMe bus interface (callbacks). It seems like this coul=
d
> > just as easily be a property of an NVMe controller -device
> > nvme,mi=3Don|off or -device nvme-subsys,mi=3Don|off? I'm probably just =
not
> > familiar enough with MI and NVMe architecture...
>=20
> I'm too far away from qemu these days to understand what TYPE_NVME_BUS
> is.  Bt NVMe-MI has tree possible transports:
>=20
>  1) out of band through smbus.  This seems something that could be
>     trivially modelled in qemu
>  2) out of band over MCTP / PCIe VDM.
>  3) in band using NVMe admin commands that pass through MI commands

Thanks for explaining!

Common NVMe-MI code can be shared by -device nvme-mi-smbus, in-band NVMe
MI commands (part of -device nvme), a vsock transport, etc. This patch
has nvme_mi_admin_command() as the entry point to common MI code, so not
much needs to be done to achieve this.

My question about why -device nvme-mi was because this "device" doesn't
implement any bus interface (callbacks). The bus effectively just serves
as an owner of this device. The guest does not access the device via the
bus. So I'm not sure a -device is appropriate, it's an usual device.

If the device is kept, please name it -device nvme-mi-vsock so it's
clear this is the NVMe-MI vsock transport. I think the device could be
dropped and instead an -device nvme,mi-vsock=3Don|off property could be
added to enable the MI vsock transport on a specific NVMe controller.
This raises the question of whether the port number should be
configurable so multiple vsock Management Endpoints can coexist.

I don't have time to explore the architectural model, but here's the
link in case anyone wants to think through all the options for NVMe MI
Management Endpoints and how QEMU should model them:
"1.4 NVM Subsystem Architectural Model"
https://nvmexpress.org/wp-content/uploads/NVM-Express-Management-Interface-=
1.2-2021.06.02-Ratified.pdf

Stefan

--FJ3AFhudtxOv0ink
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmDtXtMACgkQnKSrs4Gr
c8inEQf/U6sSy1v1hoDbepdDfWRZaQqji0O3DrFd0KLoR342ayiCqDhuFpxXTtI/
iIYgOwTEOgq75oa99+5kO+U++Z+U6fcRGnlIqDpt1eekJEYP9YC0i8k1iaRJnkyf
HSuUqZnZ1JGiNoZehu94Cc0h3+e4gKq18I1P/fuwiSQGTecSUCxG+OqAiaCE+9IL
HxRSjqTCZ5J8P/DZ9RqbHuhLvbqDqwdP9z2ECcks0iqRdiQTg9aTbMSWbNEY7+1J
QGquZTO1i/ZClSD0cytLjbGA2oy/2nGlQDPoaFG2RlF4Q4oyW6eaFdI9DOFRXX44
DVABjgPOEnmHLffsU79r+ovVU8L4Ig==
=2984
-----END PGP SIGNATURE-----

--FJ3AFhudtxOv0ink--


