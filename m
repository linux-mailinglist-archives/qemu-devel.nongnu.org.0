Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEA51606CD
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Feb 2020 22:48:05 +0100 (CET)
Received: from localhost ([::1]:37002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3Rll-0005a1-0U
	for lists+qemu-devel@lfdr.de; Sun, 16 Feb 2020 16:48:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48111)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jtomko@redhat.com>) id 1j3Rk1-0004I9-9a
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 16:46:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jtomko@redhat.com>) id 1j3Rk0-0000Db-8X
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 16:46:17 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:32577
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jtomko@redhat.com>) id 1j3Rk0-0000Cb-4T
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 16:46:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581889575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rcj9TNNa0o9Jz4C1YyDYqtxQS0LXQLB7phM+yJcpPzs=;
 b=gBJNRxekbOQQ9AMkFoB1jFfpp3Rmb+vHLSp4bPPw5uUJRS4XX0519in7idou4uZD6oL3T0
 gMzJMkSHTlnN0YQUZC20Kz1meXGlLDW3qu1o/2yqak+nBFxKwmms/XYf12Ba7aawUQUHJO
 jd+KnUJls0dRsPeDuq0Fm6OypK8iqVo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-FnxH6yflMUuSEJEG5W3WCQ-1; Sun, 16 Feb 2020 16:46:10 -0500
X-MC-Unique: FnxH6yflMUuSEJEG5W3WCQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73AF41857340;
 Sun, 16 Feb 2020 21:46:09 +0000 (UTC)
Received: from lpt (ovpn-200-18.brq.redhat.com [10.40.200.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0222D90F54;
 Sun, 16 Feb 2020 21:46:06 +0000 (UTC)
Date: Sun, 16 Feb 2020 22:46:03 +0100
From: =?iso-8859-1?B?SuFu?= Tomko <jtomko@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 3/7] commit: Fix argument order for
 block_job_error_action()
Message-ID: <20200216214603.GG745061@lpt>
References: <20200214200812.28180-1-kwolf@redhat.com>
 <20200214200812.28180-4-kwolf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200214200812.28180-4-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+sHJum3is6Tsg7/J"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: pkrempa@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, nsoffer@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--+sHJum3is6Tsg7/J
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2020 at 09:08:08PM +0100, Kevin Wolf wrote:
>The block_job_error_action() error call in the commit job gives the
>on_err and is_read arguments in the wrong order. Fix this.
>
>(Of course, hard-coded is_read =3D false is wrong, too, but that's a
>separate problem for a separate patch.)
>
>Signed-off-by: Kevin Wolf <kwolf@redhat.com>
>---
> block/commit.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: J=E1n Tomko <jtomko@redhat.com>

Jano

--+sHJum3is6Tsg7/J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEQeJGMrnL0ADuclbP+YPwO/Mat50FAl5JuBsACgkQ+YPwO/Ma
t52Wmwf/XK4FH6wQwXcklVWsAI5MXCk+ANLQblrxEBKtrJWXV2lmn9iq9bmKShVv
qQ6cFzik6KYEleRSmhcXUalsSn6TqmPAck5l8jTltFbhs2XKA+56iYuV21dtcS4D
DUD3j5RU+x71NkhNW5c7Wihu4VgSLR+oXpdkjC7f8WoGdyAkZdEKd++cy/FcFU/m
4PM+DtuivAHTSz7awi5MN/y9tMpWLrpfhTffoJDEGFlXBMQP7qX/PYvY3MQ3AXlg
2xvky51amfLCLZ8f8k5xYbxjukw11eEwGAqBpILPUfuth+T9owAJJ/ZXI8BlZWRN
ESIsCqymE1i5uUk/WlqbNFcNrLL2lg==
=/ptT
-----END PGP SIGNATURE-----

--+sHJum3is6Tsg7/J--


