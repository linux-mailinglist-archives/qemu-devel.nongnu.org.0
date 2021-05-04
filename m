Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66337372D18
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 17:37:40 +0200 (CEST)
Received: from localhost ([::1]:42114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldx7D-0001Pg-FB
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 11:37:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ldwwb-00016l-Vk
 for qemu-devel@nongnu.org; Tue, 04 May 2021 11:26:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ldwwZ-0000hO-Ht
 for qemu-devel@nongnu.org; Tue, 04 May 2021 11:26:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620141996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WoyYPbT/4Utt0qIiex2GpYGIrdODyUDnc2nVMT/siQ4=;
 b=Av0aC1/4EvbVggQEZWCuQhz6NsnXz445XA3EmMbbMn9fIhwr07OuOoqn19sPPasRzivmvm
 hX5n/SoTYlMBTLRP7xJIcKP5sv1zFl+nquywkasiVYgL21IXM2s2eVzicW60OqtWanq6CF
 OIaJTXbGehGPdhWgRdC/v1RkjSxjmiA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-4nMbrjOpNuqiVNXIsttr6g-1; Tue, 04 May 2021 11:26:34 -0400
X-MC-Unique: 4nMbrjOpNuqiVNXIsttr6g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BEB11966323;
 Tue,  4 May 2021 15:26:33 +0000 (UTC)
Received: from localhost (ovpn-115-110.ams2.redhat.com [10.36.115.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E27A360C4A;
 Tue,  4 May 2021 15:26:29 +0000 (UTC)
Date: Tue, 4 May 2021 16:26:28 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 04/26] DAX: libvhost-user: Route slave message payload
Message-ID: <YJFnpIwjrbdo2LPn@stefanha-x1.localdomain>
References: <20210428110100.27757-1-dgilbert@redhat.com>
 <20210428110100.27757-5-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210428110100.27757-5-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="F71rP5MikdgOjNDk"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, vgoyal@redhat.com,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--F71rP5MikdgOjNDk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 28, 2021 at 12:00:38PM +0100, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> Route the uint64 payload from message replies on the slave back up
> through vu_process_message_reply and to the callers.
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  subprojects/libvhost-user/libvhost-user.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--F71rP5MikdgOjNDk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCRZ6QACgkQnKSrs4Gr
c8ifswgAgMDIRKx/euJ0SnqqG+CY/C6cO5s87C7O3k2SEnpq9y0eJdWVaJWO10Bk
VnKPx5AXC7oJXnwOnzxfcLAI4rlzkRY2vHNxPwAmFRRR0cUU8u8DffSVKAb8gveQ
gXIxMmURaLsd8jsKKYMLPngRy9D7us5E4731LceAKWnOh+YFSqeGom/rmgs8CFMM
PyFt5RDJyXzyzSTL67dBNLVfa3CwuQxtocDvMlCNDrKYhLN2pkibOsT4ZQs5Wezz
ZzddCVUwvyYokfn1TW+VIdTBsarh0R3p5dskD3lX5kXrnTjSFYKDUKpCr8Y7cW16
7cdAMEWC695FR/A9HfQ5jQd3v9QNPw==
=Jv90
-----END PGP SIGNATURE-----

--F71rP5MikdgOjNDk--


