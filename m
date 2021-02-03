Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A5F30DFAC
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 17:26:21 +0100 (CET)
Received: from localhost ([::1]:57514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Kyy-0000Qf-8q
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 11:26:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7Kvl-0007FX-BI
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:23:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7Kvh-0002cp-CB
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:22:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612369375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1fEYSQ2I2arsQkfYSAXQzfRGYZc3+J9e8Z2j5YAdUfI=;
 b=UEgItIeXgndm7ACsE8maJSy98lMc9zvcyrcxzeMBCAjbRcE284551VDk8mQ83RPdiF6ozi
 rMy2pTeMhTQfsV52IQ9ucuVmEdvYSxWdiuYbYJtcDsJaxqCcDPDvrr3X4ZPrntwqu34Jfd
 cW5uoz0nvptp866oKZ5/udKnzRXQ+5A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-1VXhJjIJNueXNEXkcN58Yg-1; Wed, 03 Feb 2021 11:22:50 -0500
X-MC-Unique: 1VXhJjIJNueXNEXkcN58Yg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACFC11934111
 for <qemu-devel@nongnu.org>; Wed,  3 Feb 2021 16:22:49 +0000 (UTC)
Received: from localhost (ovpn-115-141.ams2.redhat.com [10.36.115.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 519B06E406;
 Wed,  3 Feb 2021 16:22:46 +0000 (UTC)
Date: Wed, 3 Feb 2021 16:22:45 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 8/8] trace/simple: add st_init_group
Message-ID: <20210203162245.GE241524@stefanha-x1.localdomain>
References: <20210121125028.3247190-1-kraxel@redhat.com>
 <20210121125028.3247190-9-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210121125028.3247190-9-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="47eKBCiAZYFK5l32"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--47eKBCiAZYFK5l32
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 21, 2021 at 01:50:28PM +0100, Gerd Hoffmann wrote:
> Add helper function and call it for each trace event group added.
> Makes sure that events added at module load time are initialized
> properly.
>=20
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  trace/simple.h  |  1 +
>  trace/control.c |  4 ++++
>  trace/simple.c  | 12 ++++++++++++
>  3 files changed, 17 insertions(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--47eKBCiAZYFK5l32
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAazdUACgkQnKSrs4Gr
c8jGeQgAvYnwKUclq2hk4TCY0e42UeVMP6YOu9v+Pl922sC/CDsbIUmWpBb6BCLx
/qJYU/kO4zX9Rncp3092AavmbTjPUv7q6NE2jKgkinYWzA4z2sZggOLd0axNO/YM
XQtzBDPB0CXVivrUddWRkQQvQmLFZnVStk8c89iK3ZwxeMSjEIde1Wdzau99CwFG
jSY5a4qrT3CTu38OLMlMW3V8utrOuK0x3q+8/706oCDvbi7Yp67jsYDrXv+rC2u5
19pRiubIcS5hhkhFsdxS8zZ3isxa94bGbF9PFuXw68pQ0BciPh9uXWynw/4tkXwJ
euDqOzRL11PD4EVT/qoCSve9NY8jdw==
=PVlA
-----END PGP SIGNATURE-----

--47eKBCiAZYFK5l32--


