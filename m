Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E4D43D01F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 19:53:19 +0200 (CEST)
Received: from localhost ([::1]:39424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfn70-00033j-C7
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 13:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mflxK-0002QA-6u
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:39:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mflxH-0005j2-BZ
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 12:39:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635352750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AmyhvN9plPFyUn3Q2F03JWZvAZDePmoLRwiUKqykQb4=;
 b=aTq7Lp+/YFBV3e/vBA8tYcQkbHi0G5UHO95Klblav5cVTszEGTZB/FMzS7RUofrZYbA94P
 f5Shg0fjDmvi5g/L+2hxvhRKnKlBUdIpmRByNNNzA0O8Xm5deSV91pOKXntmUiFLLt8nlH
 aIpt7zLZiVXbDEwOqvc+WyybKpIU2ZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-SJY06EJ7Oym3Fsc2lQYGEA-1; Wed, 27 Oct 2021 12:39:09 -0400
X-MC-Unique: SJY06EJ7Oym3Fsc2lQYGEA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8453C8066F3;
 Wed, 27 Oct 2021 16:39:07 +0000 (UTC)
Received: from localhost (unknown [10.39.195.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D20160CA0;
 Wed, 27 Oct 2021 16:38:53 +0000 (UTC)
Date: Wed, 27 Oct 2021 17:38:52 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v3 09/12] vfio-user: handle PCI BAR accesses
Message-ID: <YXmAnCnCexaSrriM@stefanha-x1.localdomain>
References: <cover.1633929457.git.jag.raman@oracle.com>
 <346c432d523ac9fdf7e645f8193403385610b5f5.1633929457.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <346c432d523ac9fdf7e645f8193403385610b5f5.1633929457.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kI5JT0fZGmNdsZCH"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 swapnil.ingle@nutanix.com, john.levon@nutanix.com, philmd@redhat.com,
 qemu-devel@nongnu.org, alex.williamson@redhat.com, marcandre.lureau@gmail.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--kI5JT0fZGmNdsZCH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 11, 2021 at 01:31:14AM -0400, Jagannathan Raman wrote:
> Determine the BARs used by the PCI device and register handlers to
> manage the access to the same.
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/remote/vfio-user-obj.c | 90 +++++++++++++++++++++++++++++++++++++++
>  hw/remote/trace-events    |  3 ++
>  2 files changed, 93 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--kI5JT0fZGmNdsZCH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmF5gJwACgkQnKSrs4Gr
c8jL7AgAih1SfZGPr5IMM8VGpWPLooKmYot0GhBpd1xB5RSUX3s0u/IoWMi/aj2s
0AXoc7XfsYCx6T1WioVGb6oU3rFfTkun/uMALtsqmffJqALPqJRzRvHix2tKUfx0
UaU3oCbtcG5itBntoAJb4UoT9IfrIxhIJnhryMs238V2LnVe4VaGQB3SbJ0xGxKP
9DcgUPILZIxgNblb80S5OLGzdr2jrlaV3wjHZT96paWT1BYj6Fj+kt2PeKKuYSX+
2fyAQEWC0RCYwBWZs/vDXvWOOsfxu/YvLQKjKCEyWthi7vAnSzcj1PLDcxEWKE2p
lbLQhglL5fnnTjIHrEoNHDyMXuWxHw==
=rIrn
-----END PGP SIGNATURE-----

--kI5JT0fZGmNdsZCH--


