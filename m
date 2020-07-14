Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E91F21E5F4
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jul 2020 04:51:32 +0200 (CEST)
Received: from localhost ([::1]:49642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jvB2Z-0002VS-JO
	for lists+qemu-devel@lfdr.de; Mon, 13 Jul 2020 22:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1jvB1f-00020R-IY
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 22:50:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:60137
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1jvB1d-0008Uy-Ux
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 22:50:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594695032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6HJdoRYTxbgbLGEn/vtzAVrOqJDzDSDg7cohe8kS9QQ=;
 b=eizsSLL52XBae5cEKshP9ozxES27lNxRz5Y9hw8N8JB4OsGJQ7JsuX7eXrEeSbQcy+3YfP
 xpuv9rKSowTzPP0yyPUUKa+ajqDm+Ume/NmWVutges+oua2npk+og/p9AJAvp8r4HqhtCX
 APtSwHVVSgDlQ37NftIajzvA0mgOGeQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-2zl71xzlNEifyK7J2soqcw-1; Mon, 13 Jul 2020 22:50:30 -0400
X-MC-Unique: 2zl71xzlNEifyK7J2soqcw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BECD107ACCA;
 Tue, 14 Jul 2020 02:50:29 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-247.rdu2.redhat.com
 [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C97AD60BEC;
 Tue, 14 Jul 2020 02:50:25 +0000 (UTC)
Date: Mon, 13 Jul 2020 22:50:24 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v5 06/12] python/machine.py: Add a configurable timeout
 to shutdown()
Message-ID: <20200714025024.GB2983508@localhost.localdomain>
References: <20200710050649.32434-1-jsnow@redhat.com>
 <20200710050649.32434-7-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200710050649.32434-7-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DKU6Jbt7q3WqK7+M"
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=crosa@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 21:44:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--DKU6Jbt7q3WqK7+M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2020 at 01:06:43AM -0400, John Snow wrote:
> Three seconds is hardcoded. Use it as a default parameter instead, and us=
e that
> value for both waits that may occur in the function.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine.py | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--DKU6Jbt7q3WqK7+M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAl8NHW8ACgkQZX6NM6Xy
CfOvoA//fIvGp3C0UrYmJquGYW4KvnWlRnpKw4vvfu7s7BheIvew3xjTR9GPIAqs
aXr93TWkdAHinsRh0S2lYJp1l4ZcGzYA/mQkqeB6G4ahgFbT3Q+/dUCoKELhdYMx
Rki5EejAOjvAaEG50CPp3MyfdVTLowef5IWmebnj2K3bpCTg4jm0wqwXQQimk6Ii
iWOBlMlSg9Fhj8+vRtNwnBNxl1yZMMFMifD3QflYy6Iwn/CSImvtezBhOqAMNoLS
A/SGzagVu/6Z6mHTsdLkHW+uyC6Hq4rJhLer4CJZgQFkChPGvIPqh91yVP8ZrUl1
w7xP+9RDJ65hzcJzuxsPZVZdlhU0CyyGQKHGLvhJH9nwfsG9aw5p4ykR4W8bLogZ
CJEgCK+NMTz7+uTX+oMKM8ofqsOIUGjcUljnojGDa0tVR3+3S9ukaIFG8AvFTDzI
iLppLr30PtSxdRItZLg3orNv8KExrIli+a887C/CeqjhFrWMS9mPHeAClvoN+HTf
v0SnIPIswLxIvlqrsQtESfECVrICzkkRaizkNuG2qnbqY/giYE+G2MunyPOJ9yIk
TfpwsOMXqCHF7359Q9AhC4uje1xBo94HOYGRbLVgl3UkE8KoOEYaiQqXknGlbTU+
ME3g1w5hPP9NyuLGpEZpKPVuxreb6sOLQIWCQM1OzKm8TI4vmHI=
=1Lq9
-----END PGP SIGNATURE-----

--DKU6Jbt7q3WqK7+M--


