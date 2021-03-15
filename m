Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E079033B2C1
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 13:30:10 +0100 (CET)
Received: from localhost ([::1]:37466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLmMG-0004zF-Ls
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 08:30:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lLmDR-0007Tw-PQ
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 08:20:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lLmDM-0008BD-HR
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 08:20:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615810851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ne81MC4G0PaNIQKKt/LTErlW22jOoDUtUlxOyFZbj10=;
 b=XSCEEDBC5OP85r729c9HI3f614mLikGGOpw43lLtkNGLlVKdNem+JQC2jEJwlqD379XgwT
 M89GZJq3vx3GZxdOj8rRMWJ3/FxkUTtpPbkObx3dWGPjAv7egd64FzykyzAPG3U1+HfJID
 ucaDoaYzeQrqTU9fr4NDDWetrSManpU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-2Z9U0KnRP9WsLPjmhu_SlA-1; Mon, 15 Mar 2021 08:20:49 -0400
X-MC-Unique: 2Z9U0KnRP9WsLPjmhu_SlA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0964B107ACCD;
 Mon, 15 Mar 2021 12:20:48 +0000 (UTC)
Received: from localhost (ovpn-115-125.ams2.redhat.com [10.36.115.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D6ABC19D7C;
 Mon, 15 Mar 2021 12:20:40 +0000 (UTC)
Date: Mon, 15 Mar 2021 12:20:39 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2 6/7] vhost-user: Monitor slave channel in
 vhost_user_read()
Message-ID: <YE9RF+hA4lWKRjHq@stefanha-x1.localdomain>
References: <20210312092212.782255-1-groug@kaod.org>
 <20210312092212.782255-7-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210312092212.782255-7-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="37z4Rk9WiL0gM13E"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--37z4Rk9WiL0gM13E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2021 at 10:22:11AM +0100, Greg Kurz wrote:
> Now that everything is in place, have the nested event loop to monitor
> the slave channel. The source in the main event loop is destroyed and
> recreated to ensure any pending even for the slave channel that was
> previously detected is purged. This guarantees that the main loop
> wont invoke slave_read() based on an event that was already handled
> by the nested loop.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
> v2: - also monitor G_IO_HUP (Stefan)
>     - refactored the code a bit
> ---
>  hw/virtio/vhost-user.c | 35 ++++++++++++++++++++++++++++++++---
>  1 file changed, 32 insertions(+), 3 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--37z4Rk9WiL0gM13E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBPURcACgkQnKSrs4Gr
c8jSCQf/T0FMmov+/SbUqDeW3aEh4UIYkwecrnfB6jNfsY12rbWOg/07e9nlyPPP
flb2C1OtiQPQobqO9/BD7yHJ6LGUuED2LBnhn/IFXZOgEXXlGv0nkdHkfD9mcfIM
wDzqZsjdgLIPd9ArIjDxL4po5NTMrOZWkU5MKpgZMGs0taHA9gwc/UxnNXjZ8to0
KKX64Ef6+btKfZ/PPSu5kWmwjFU2Wk3skabOwVdW7FH7QYbABm95KIP3Cxr1FcmC
cMQJQP9yzDBXlbPAvCHkrACj2jd4RA8GC/MVFdT9HJJIcYVNaEiRrQandTqtVEJN
wkDaQZZb+VIclI0Ar25UAeANpgFCVQ==
=cMOl
-----END PGP SIGNATURE-----

--37z4Rk9WiL0gM13E--


