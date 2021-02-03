Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3FC30DCCA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:31:44 +0100 (CET)
Received: from localhost ([::1]:37160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7JC3-0004fT-9r
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:31:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7J7u-00086h-Ke
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:27:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1l7J7s-0001RB-Q8
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:27:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612362444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zs+kXQ5ZCXlELRJk6Wgj5DJdNXtYGW/cDN1blphrfI0=;
 b=I/jtQQxcOqDRFypde1EcQBuz9QS/KFMZhzJrWpYa1D8hAPQFSw7dcDyYY0hRptceopLQOT
 xRiA90OfzkGwgLj61e+UsiRBKHMFKlczyjcIlBpZlwgQwVFxScJ5BVOteiRuP8kfXAvo95
 JFwoiAYlCmcD7lXIUjeIC1y3trRcP0w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-vACbptWYNRSnpUfQAXQZew-1; Wed, 03 Feb 2021 09:27:22 -0500
X-MC-Unique: vACbptWYNRSnpUfQAXQZew-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12A4010CE780;
 Wed,  3 Feb 2021 14:27:21 +0000 (UTC)
Received: from localhost (ovpn-115-141.ams2.redhat.com [10.36.115.141])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD6465D9E3;
 Wed,  3 Feb 2021 14:27:20 +0000 (UTC)
Date: Wed, 3 Feb 2021 14:27:19 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] virtiofsd: Add restart_syscall to the seccomp whitelist
Message-ID: <20210203142719.GA74271@stefanha-x1.localdomain>
References: <20210201193305.136390-1-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210201193305.136390-1-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
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
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 01, 2021 at 08:33:05PM +0100, Greg Kurz wrote:
> This is how linux restarts some system calls after SIGSTOP/SIGCONT.
> This is needed to avoid virtiofsd termination when resuming execution
> under GDB for example.
>=20
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>=20
> This has passed Travis and gitlab CI without errors.
>=20
>  tools/virtiofsd/passthrough_seccomp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmAasscACgkQnKSrs4Gr
c8j9XwgAlMURNb1fqav07zB9Hv5mPSHHJ3tp6mkh1AwCUevYtbcWql7OQj8nFSGm
P8ZcaGXWnXX1o7560DfgoanUnOnJpawt6/wpOJ36pm8SkPWK9woKYys7vrLJpFfq
H9+/qAqEle6OoDZVKtwpN5Z7iBfb92KazRvd8rnWN2BHGXqo//SPIrzMsQiRecql
u7uKQaZLyF52VasdR1lA/13SN4OeijV2OQOHxfk2oyPVtkldqp2B+KTNu7F14D8d
9HcgtIDVjvtoW45WbuLsCmdKh4v0AbuZWGi5mvKUUthGQUSnqMgoMrWVj1yF1Tng
85hwWOTiWJ96W3aGo9cr4HRC0yYb/w==
=KUG0
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--


