Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86361445169
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 11:05:53 +0100 (CET)
Received: from localhost ([::1]:48298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miZd2-0001bl-9G
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 06:05:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1miZbW-0000nx-8B
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 06:04:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1miZbT-0007zn-SK
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 06:04:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636020253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s0csrDsTRgs8ZGfB9JAhxTv+cmD6DCSavMukyxDXyKc=;
 b=hCstb22RLMOVX7d6p2L4WSqByWGrG0XbOr0rIv1ak5hAenB5EMHkdtdslYq0DzsaNw4w/W
 q9v/jP838SZ0xxl/s4FO7Ikc/DRGuyX/CTqk906xzJ6IdOATgHVK6EDu7IKf53/aGq90HH
 YAyRHMmIHGh2yEvoNKkoaCUxHeXE7xY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-4U2tSiDeOHSZPg0cGla4yw-1; Thu, 04 Nov 2021 06:04:10 -0400
X-MC-Unique: 4U2tSiDeOHSZPg0cGla4yw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7DAFE5721F;
 Thu,  4 Nov 2021 10:04:09 +0000 (UTC)
Received: from localhost (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B315870F61;
 Thu,  4 Nov 2021 10:04:08 +0000 (UTC)
Date: Thu, 4 Nov 2021 10:04:07 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: Re: [PATCH v1] job.c: add missing notifier initialization
Message-ID: <YYOwF8EmSSu5X2T3@stefanha-x1.localdomain>
References: <20211103162155.791482-1-eesposit@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211103162155.791482-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="neIXiq7tLgQGd+Fx"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--neIXiq7tLgQGd+Fx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 03, 2021 at 12:21:55PM -0400, Emanuele Giuseppe Esposito wrote:
> It seems that on_idle list is not properly initialized like
> the other notifiers.
>=20
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>  job.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--neIXiq7tLgQGd+Fx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmGDsBYACgkQnKSrs4Gr
c8g/qggApkpU+TmRLvfkOmpoCfKe0qVKHK1MeDLQsaqTAylyeiHO9l0/RabEbV6c
9L+Di5jsZtlWr961EiDui/pYYhqRbYm59v7DJ17iakjwkB7Ev9o4DgYdgXWif+TI
BrbOXL8cIUJB23qcwAdrgVYSl963L/Ri/xXSF8dQ406likvlzaSpdcIkfxFmjR+h
M2iZM3cgKthwXfkc3t2tq+0UbuHBxhJ+ORv+vcbJaxYoz9ITU9nqoCR4jvkVtluz
RzyxVGIya1Lh+CA93ckG2WdcOBdR4o0NWSdoEt6BOKptSXBV4IyQemnh/pe3bJCr
T6i4zWvP5HL8fRwfLQiTasZuv1YzsQ==
=TCnz
-----END PGP SIGNATURE-----

--neIXiq7tLgQGd+Fx--


