Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C3E1678EA
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Feb 2020 10:02:48 +0100 (CET)
Received: from localhost ([::1]:54146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j54Ct-0004dh-FV
	for lists+qemu-devel@lfdr.de; Fri, 21 Feb 2020 04:02:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55130)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1j54Bo-000476-RR
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 04:01:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1j54Bk-0005js-2D
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 04:01:40 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:50052
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1j54Bi-0005gx-To
 for qemu-devel@nongnu.org; Fri, 21 Feb 2020 04:01:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582275693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a1w5DrSIdzdtVyj1VherSLbZox/180MIIssZ4fPON6A=;
 b=O9lv9jK5HaDtAIvHIhmWPim5TX4zFEop9b+L2+eAxGUMTd9pki2NMW5SSjS2Yvg5+y8j2I
 wHyTn4+BdUV6BqbWoiUo7UZ/gByG0hMWBqKYUVm0rf58BQy6gJBKWOSEg1vGtUSM5RbnzQ
 VJIv5T1QMy+rkE//RylqM0KitmJIraw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-xmFBcatXPMW-HU6--2eJBg-1; Fri, 21 Feb 2020 04:01:31 -0500
X-MC-Unique: xmFBcatXPMW-HU6--2eJBg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EB571085989
 for <qemu-devel@nongnu.org>; Fri, 21 Feb 2020 09:01:30 +0000 (UTC)
Received: from localhost (ovpn-117-223.ams2.redhat.com [10.36.117.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A48E95DA81;
 Fri, 21 Feb 2020 09:01:29 +0000 (UTC)
Date: Fri, 21 Feb 2020 09:01:28 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] rcu_queue: add QSLIST functions
Message-ID: <20200221090128.GB1343391@stefanha-x1.localdomain>
References: <20200220103828.24525-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200220103828.24525-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="H1spWtNR+x+ondvy"
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--H1spWtNR+x+ondvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2020 at 11:38:28AM +0100, Paolo Bonzini wrote:
> QSLIST is the only family of lists for which we do not have RCU-friendly =
accessors,
> add them.
>=20
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  include/qemu/queue.h     | 15 +++++++++++--
>  include/qemu/rcu_queue.h | 47 ++++++++++++++++++++++++++++++++++++++++
>  tests/Makefile.include   |  2 ++
>  tests/test-rcu-list.c    | 16 ++++++++++++++
>  tests/test-rcu-slist.c   |  2 ++
>  5 files changed, 80 insertions(+), 2 deletions(-)
>  create mode 100644 tests/test-rcu-slist.c

I'll include this in the pull request that introduces O(1) BHs.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--H1spWtNR+x+ondvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl5PnGgACgkQnKSrs4Gr
c8iKtggAhFuxvzo33F3hEGzUwCpzQ0fCS8hlz/2AXxkmNdJfxrA+dmeYYfN6DEqn
wU/KsSOJs8nZd3gAYn1bReE9V+qCvG1KFauBqcTF4Qlm+Ht6UwgWipVVPWEYfI+N
4u4y85Msbh8252id8cT4EMsB6jjt1dEtsPFgUqoWMLNqLjOE/bO+umG0ODNyC3KL
rHvEoXjELyv9V0SjVrJ1EF6i9jLEnxCSA5ms2IgWlAUZJnT46IpLbX647+MQ5a2x
MDFqPzv3/V6E8bRfPM6r4U8Ww1R21AUkkKDP8rBQgmvgqZv/RHjJcmpVDfE997Cp
BRCjAGMceRsRudifICtTTE1ux4Pc6w==
=/IQv
-----END PGP SIGNATURE-----

--H1spWtNR+x+ondvy--


