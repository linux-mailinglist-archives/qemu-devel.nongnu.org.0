Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D9A20F85A
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jun 2020 17:32:20 +0200 (CEST)
Received: from localhost ([::1]:60568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqIF9-0001jf-Ic
	for lists+qemu-devel@lfdr.de; Tue, 30 Jun 2020 11:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jqICU-0007dT-PV
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 11:29:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21910
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1jqICT-00014j-1n
 for qemu-devel@nongnu.org; Tue, 30 Jun 2020 11:29:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593530972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z2jaRCRHJ4TEDq0PeV8oqlYTe/jXLj1lVJhcPwNBA0I=;
 b=K9e83fFOFhHn/8WLEhxcNIbUkICt21IYFz2mjSkf3oV7faX25vY67NJPkBWruO8qL93Aq3
 TWnZO9croErXFZ/6x4tqaiTs6rhYgsYK/0c8IASkIrvj5Qp2vzvCucjJu9LIKpR9m9mWYw
 rGtCpZ7des8d2e1TBHGNWXBZdySwG7Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-3TGkbpTvPcaj20Z6Lf6TTg-1; Tue, 30 Jun 2020 11:29:30 -0400
X-MC-Unique: 3TGkbpTvPcaj20Z6Lf6TTg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C69FC8015CE;
 Tue, 30 Jun 2020 15:29:27 +0000 (UTC)
Received: from localhost (ovpn-115-106.ams2.redhat.com [10.36.115.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5EAB11A835;
 Tue, 30 Jun 2020 15:29:21 +0000 (UTC)
Date: Tue, 30 Jun 2020 16:29:20 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: elena.ufimtseva@oracle.com
Subject: Re: [PATCH v7 05/21] multi-process: add qio channel function to
 transmit
Message-ID: <20200630152920.GE109906@stefanha-x1.localdomain>
References: <cover.1593273671.git.elena.ufimtseva@oracle.com>
 <cb545beadb8584feabcb5c8a0eabcda4ef4becd9.1593273671.git.elena.ufimtseva@oracle.com>
MIME-Version: 1.0
In-Reply-To: <cb545beadb8584feabcb5c8a0eabcda4ef4becd9.1593273671.git.elena.ufimtseva@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ytoMbUMiTKPMT3hY"
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=stefanha@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 00:34:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: fam@euphon.net, john.g.johnson@oracle.com, swapnil.ingle@nutanix.com,
 mst@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com, jag.raman@oracle.com,
 quintela@redhat.com, armbru@redhat.com, kanth.ghatraju@oracle.com,
 felipe@nutanix.com, thuth@redhat.com, ehabkost@redhat.com,
 konrad.wilk@oracle.com, dgilbert@redhat.com, liran.alon@oracle.com,
 thanos.makatos@nutanix.com, rth@twiddle.net, kwolf@redhat.com,
 berrange@redhat.com, mreitz@redhat.com, ross.lagerwall@citrix.com,
 marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--ytoMbUMiTKPMT3hY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 27, 2020 at 10:09:27AM -0700, elena.ufimtseva@oracle.com wrote:
> From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>=20
> The entire array of the memory regions and file handlers.
> Will be used in the next patch.
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  include/io/channel.h | 24 +++++++++++++++++++++++
>  io/channel.c         | 45 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 69 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--ytoMbUMiTKPMT3hY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl77Wk8ACgkQnKSrs4Gr
c8hqxwf/Wg+yptfHeQPn7+/DQJNrl7to+wCq7rEGSmPcHDK774x+OLgFBc1vBsND
/J66QHMOy75DcagNdupsXjNaItqsHYxxMmlCXzbbY+w8IPHNpI7QWuJvYo6T53WA
q2BF8jVBwLZr7L0xAGefTF35+09E0g4k9kkluOWZZtgXpWe+H9DLNAwirZ+Y6Rw2
pvKSVWXySNMFO3BTm5iKiDewb2CPPFuU2KJ4YSVB2t+F/Ukbcd1KVziuiLTr0LbM
C+DR3YNeAbhv452p0swe7HoOgJ7oNphKzKcZ0d8HsnaVTbv+Xctia3dnS4y0B0GG
8T+dRAUK6aKLSFFeOPD9+CtYfO1HuQ==
=Dlg1
-----END PGP SIGNATURE-----

--ytoMbUMiTKPMT3hY--


