Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB0938707E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 06:11:52 +0200 (CEST)
Received: from localhost ([::1]:56288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lir5D-0000tq-G6
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 00:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lir3Y-0007QX-JY
 for qemu-devel@nongnu.org; Tue, 18 May 2021 00:10:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lir3V-00038q-DM
 for qemu-devel@nongnu.org; Tue, 18 May 2021 00:10:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621311003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qGo+Neu9gu6rnnOAUX8Ahoxmoc10d/9u8Xa8PQmkUsE=;
 b=KUa1k4kBdylgRW4BmB2mDs9fYTPgKnV19DUDHG53U2byljNnL4w8iEqGyTGc2SddgK/3Hc
 1/AZ96amtO/+P5YWuF0vH9vyV+6LYjEZP016KIAgMF2D5SUi0s+Q5xIgB/38S9SzfbhruR
 2INSxVaiXLqMgivhT8ddvU2k2IyzMIY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-wNBWjR7oMhWveBgbVedQww-1; Tue, 18 May 2021 00:09:57 -0400
X-MC-Unique: wNBWjR7oMhWveBgbVedQww-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EB8C180FD6B
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 04:09:56 +0000 (UTC)
Received: from localhost (ovpn-115-22.phx2.redhat.com [10.3.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 394BD5C239;
 Tue, 18 May 2021 04:09:53 +0000 (UTC)
Date: Mon, 17 May 2021 23:33:13 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 2/6] python/machine: use subprocess.DEVNULL instead of
 open(os.path.devnull)
Message-ID: <20210518033313.GA917386@amachine.somewhere>
References: <20210517184808.3562549-1-jsnow@redhat.com>
 <20210517184808.3562549-3-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210517184808.3562549-3-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 02:48:04PM -0400, John Snow wrote:
> One less file resource to manage, and it helps quiet some pylint >=3D
> 2.8.0 warnings about not using a with-context manager for the open call.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  python/qemu/machine.py | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCjNXcACgkQZX6NM6Xy
CfO+ARAAoh6i5dkuD3ol6PLUNSXqt7mr4f2N0+sGJfKKu5wg2o6lnV0ADxlJvlcK
Oo3/0VzmV2W9BwoqF7+o/t4l2Tu+zRe4rT6JIebInuIHrt3mmVHpcz28pgfCC2uA
GhbUGLmq+CJ150WDtLnOP2dWbvtVdUUgnO+BpPGZOkP90SUoh3btJryfQZGtMGIR
ot2oJuk9xcYKcfZXlAeCtNfk/LgJbTn3bv4anuDbHsfdSpJgu25u95thuoyyMHG/
Nyx0VXuPFzOYBc+JeyMl9dPY+YAQiBMyF6catYG0iXovpmXXbAX4rcSl0dW3De/3
+PuT1W4kUG10cvTazYvizJLotM39Uw8TkbpJh05l2JR1sJFzjmImHcCikVRd3f6W
mZ3oI1j+CpSU40C4xDTpoRB1rtIQ1JQwE1Cl9E1g0094nBl8BYDdkmM8TyuLDHGQ
5Q9wLybwZEhC/y9n7SNYP7jlgxNPBBFZdxkKPVvXD00RM6sjaKGI2BE/khBVFjxu
9FR5S1uS1/oQQW0zew3FHE1o5ecfnMRFy86mx5xgc3mE8TACDuvLiYlSYO/UcQN9
FjlFxgXm7/LLoGSO7Dk+Zyta1prxuLRa3sUd7ljifZZSQ23EQLIYoigWBMp8L/Bw
Nsuh4NuBJN/oeiz3OuDVsibKdk2dwtZotpxH4/Y+MBezX/EP9hw=
=SEoV
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--


