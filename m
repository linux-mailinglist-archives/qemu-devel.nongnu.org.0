Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 700CD3187BC
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 11:08:31 +0100 (CET)
Received: from localhost ([::1]:55064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA8ti-0006fu-Hc
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 05:08:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lA8qq-0005ZI-JK
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:05:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lA8qp-0002pb-26
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 05:05:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613037930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JlfRXQZkgaT3d53+rhYybAJe3YZG9WAbuvcJQEYLq+w=;
 b=VD+J/NjipAKQA2C2G2ToRaOYowJnflUTuDHkxkDqUcd0iJ9ruTU2JW9H5uHlNvjqqadqeW
 w81Xqv7EeDSyJ93uhv/djlpHOgYjt2H7hW99Xl04FbneAzAmGE2TsPeVd9kQ7xjU3ldELi
 vB79Inv22B9cjz/WlkVdwge+Dj67s/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-UOetNa2vMJK8gsTqDWWgag-1; Thu, 11 Feb 2021 05:05:27 -0500
X-MC-Unique: UOetNa2vMJK8gsTqDWWgag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFC86107ACC7
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 10:05:26 +0000 (UTC)
Received: from localhost (ovpn-115-9.ams2.redhat.com [10.36.115.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 929A96F43F;
 Thu, 11 Feb 2021 10:05:17 +0000 (UTC)
Date: Thu, 11 Feb 2021 10:05:16 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 02/24] DAX: libvhost-user: Route slave message payload
Message-ID: <20210211100516.GC247031@stefanha-x1.localdomain>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-3-dgilbert@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209190224.62827-3-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RIYY1s2vRbPFwWeW"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 vgoyal@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--RIYY1s2vRbPFwWeW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 09, 2021 at 07:02:02PM +0000, Dr. David Alan Gilbert (git) wrot=
e:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>=20
> Route the uint64 payload from message replies on the slave back up
> through vu_process_message_reply and to the callers.
>=20
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  subprojects/libvhost-user/libvhost-user.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--RIYY1s2vRbPFwWeW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAlAVwACgkQnKSrs4Gr
c8huKAf9HKzk9xXP/UcXfbQAV1aNDTTJVbYZHXfGUnGzQyIwFjntanmaZ4tiavQR
Q8ppS9nZLiYcQosKG0NECS0Nx57iai4hfj3YjHPedLT0mt6AcHcZs05JVgPt9rVA
PnYwJ9uJtjoi1WcaVc0P362/G30HPistjhl3Q7ee15glpiCYbcz83g8lcAbzqVyR
UIDE5XlUKMozpWC/HVXxPpr0wXS2dzQDPhwGBy9xWy7XSylwqLsn9tRUpXIHgAXH
a9ZadkwUhnWx87Rhq4njmXjRKRWR3wFhQeMC2xvw/gkC5mbkhVhQDBIwq2UO2voG
psFi/k6EiRU2WrliLC0CPh+6bIu7vQ==
=egj8
-----END PGP SIGNATURE-----

--RIYY1s2vRbPFwWeW--


