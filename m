Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A79F11FD
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Nov 2019 10:20:58 +0100 (CET)
Received: from localhost ([::1]:54322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSHUn-000620-OC
	for lists+qemu-devel@lfdr.de; Wed, 06 Nov 2019 04:20:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54623)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1iSHTA-0004eL-J5
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 04:19:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1iSHT9-0000f2-KC
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 04:19:16 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28491
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1iSHT9-0000ek-EM
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 04:19:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573031955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cNNA/NMwTK2lxLXtFl/veFIwfAebCvfbBHOuOtTAZBA=;
 b=Mqqg57K+ZnUiGtQshUhk4WTijompjdTtzlxzenIcCpG22PihXa24c1D5QO1YDhNT8OSNuL
 PhVO+F1znXjRtvk1zPGgEzadjXtCfhqe7qK+mf3PvTaIPdgpRR9gEVlbGRJWMeO7PTZeMb
 8Dh9RKBUiOg8nbIbOXbNNKJhaCIKzcc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-9uulW-w6PcSUnzrMSnqfrw-1; Wed, 06 Nov 2019 04:19:11 -0500
X-MC-Unique: 9uulW-w6PcSUnzrMSnqfrw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 489191800D53;
 Wed,  6 Nov 2019 09:19:10 +0000 (UTC)
Received: from localhost (ovpn-116-171.ams2.redhat.com [10.36.116.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 655A35D9CD;
 Wed,  6 Nov 2019 09:19:05 +0000 (UTC)
Date: Wed, 6 Nov 2019 10:19:03 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Denis Plotnikov <dplotnikov@virtuozzo.com>
Subject: Re: [PATCH v1 1/4] virtio: protect non-modern devices from too big
 virtqueue size setting
Message-ID: <20191106091903.GG189998@stefanha-x1.localdomain>
References: <20191105161105.19016-1-dplotnikov@virtuozzo.com>
 <20191105161105.19016-2-dplotnikov@virtuozzo.com>
 <20191105155357-mutt-send-email-mst@kernel.org>
 <c14296e6-0557-d643-722a-531e3c2f01de@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <c14296e6-0557-d643-722a-531e3c2f01de@virtuozzo.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MiFvc8Vo6wRSORdP"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: "fam@euphon.net" <fam@euphon.net>, "kwolf@redhat.com" <kwolf@redhat.com>,
 Denis Lunev <den@virtuozzo.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--MiFvc8Vo6wRSORdP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 06, 2019 at 07:46:31AM +0000, Denis Plotnikov wrote:
> Could I ask why one want to the check=20
> whether accessing through the modern interface and how it could be checke=
d?

BTW the VERSION_1 check I mentioned won't work in .realize() since
feature negotiation happens later at guest run-time.

Stefan

--MiFvc8Vo6wRSORdP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl3CkAcACgkQnKSrs4Gr
c8gS4QgAv4ncVbEiBUhIRzstdr9VXG/kNGf3IMDxZVupN96GRnlyOcCRdIYMa1pq
ZUHz4ErWU0h+YbovGRZGFf3nx/Z9Euq3VyuhXbyW+fBk50Q2pzW0TQJhETGAvVS/
S5XbvMXPXbzhPFIzU/N4/irHJDn34kWuoS3OLJyWpj9Nh4D8dAIkODCfjn/tQaPC
WycirUqz6lfUK72VrpmSsTGYypNHnjF7xSC1E8bll0jfSR0vRizpmA0MWcJxq6a1
P+3ch0iAWraajoFQlir3xchBpflfUBQ3c+8eZWu91EEE84Y7Cx7zCQaPmiRV/1CM
FgE2Ysc3gqEgwmyPpmAGI8eRLPsUjw==
=oCDh
-----END PGP SIGNATURE-----

--MiFvc8Vo6wRSORdP--


