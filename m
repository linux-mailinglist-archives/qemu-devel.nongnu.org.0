Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C58B3230C3
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 19:31:00 +0100 (CET)
Received: from localhost ([::1]:35548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEcSZ-0006F0-8U
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 13:30:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lEcNd-0000ia-Pm
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:25:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lEcNb-0007Lr-Nh
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 13:25:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614104750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+svTnFcceiACHvEXiYQQdmB75gDbsFYliTb/VnaRgJc=;
 b=Knmd5umz9veEb/CmMmN4ju0h24PFWJWqKOP2XjD1CRQug3gG8r7Oi5KjQEcUsQ34scvqy8
 6MLmjMBxGc1Iy2a9YqDhGJjFlCHPPxoI39n/y+y7C0JCPPp5o0VEBadqq9sxSe8cH78Hy3
 /HNjjKIKCYxkT47SLfs2g2E1+d8daAA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-NJDRarf8MHux45p4jfCnrg-1; Tue, 23 Feb 2021 13:25:48 -0500
X-MC-Unique: NJDRarf8MHux45p4jfCnrg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC8AA192CC43;
 Tue, 23 Feb 2021 18:25:46 +0000 (UTC)
Received: from localhost (ovpn-114-28.rdu2.redhat.com [10.10.114.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A19BF5C277;
 Tue, 23 Feb 2021 18:25:43 +0000 (UTC)
Date: Tue, 23 Feb 2021 13:25:39 -0500
From: Cleber Rosa <crosa@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH v5 4/4] Jobs based on custom runners: add job definitions
 for QEMU's machines
Message-ID: <20210223182539.GH987581@amachine.somewhere>
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-5-crosa@redhat.com>
 <21f882ba-21db-2d45-0e74-be27e1119355@redhat.com>
 <YDUlozcbgzWfQetX@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YDUlozcbgzWfQetX@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dMyqICaxQaaUjrCL"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Erik Skultety <eskultet@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--dMyqICaxQaaUjrCL
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 23, 2021 at 03:56:19PM +0000, Daniel P. Berrang=E9 wrote:
>=20
> Urgh, well that's a big problem. We certainly don't want *anything* being
> placed on the custom runners without explicit opt-in, otherwise jobs run
> in the main repo have a different environment from when users run on thei=
r
> personal forks.
>=20
> IOW, we need anti-affinity against our custom runners really.
>

I'm assuming Phil missed that documentation, because that's a
non-issue, really.

Just unchecking the "Run untagged jobs" check box on the runner
configuration makes sure that the custom runners won't pickup any jobs
not *specifically* tagged for them.

Regards,
- Cleber.

--dMyqICaxQaaUjrCL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmA1SKIACgkQZX6NM6Xy
CfO8Xw//V9pQq3mXm8tHEYlQdTIYebElWNRrrLcd6DlZAiFXDYSV9wbbO+XPejQZ
y1Ub4bvo6m4udTzpNSkz1FeAxSGVFveUcjxohVlkA9zQ8P8hYATiKdCw8QGv2c2j
uZ4TcWDCstcd+5/xDLah6F9aouuNiqK6VOOARAoetkE2jVBwRVYBqAuuijcrFZLY
Hx2uE7kKksQWhvIsHYRfJrN/P1LEvjxmOTPA5PfV5qVM7yNKusgXiY6IIPEvGSWE
HoteC74dW9BYgk885bRY+kvv76itwOSuzG4Jd+sLt7xewlxb7w5T9DD1i86/n3Nu
JGb90NNNI7RxNKW3LH7OSwzpkMpj28715nYT9hLc9liWRm6aMqQm7vooHtJ6PV7G
2G8dEH+VkQZMcVJY9y8L/80ddZHmeqvwuTb5B2uoiVi7FMQGKcv/G7YGIeQD5UqI
4La/0qsrilNWqRJSaVOrG3ojl6nNNg77m0JqEoWxXeYpgvlqH6nnu88bsYSSxX7P
5rSbjhitFI9uJNLpgQ7MJ0zZNkVUUjE7yuN7/SP/fbu/wFwQxyGwvvm/n5OzfDvI
7GtWBI2g0c1c0qbpgIjqw7wl5/PQfdoek9opDa8Cp09DK3nnywZw/zioF6VjKGLn
tfX3V18XCFweVedXSVPlf5mbc2hZHqnwi3nOhN2bb0Bpu7yvQ4o=
=PsBm
-----END PGP SIGNATURE-----

--dMyqICaxQaaUjrCL--


