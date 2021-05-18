Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA25E387080
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 06:13:15 +0200 (CEST)
Received: from localhost ([::1]:33914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lir6Y-0004v1-Vb
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 00:13:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lir3b-0007To-5c
 for qemu-devel@nongnu.org; Tue, 18 May 2021 00:10:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lir3Z-0003Ds-PL
 for qemu-devel@nongnu.org; Tue, 18 May 2021 00:10:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621311009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2TngKJAnt0ij9RVZKywvn+/Q5tlpGpyD4mIbymY/4Tk=;
 b=IrNN6p8gMHy/PQGA0dJOsLF/YwqxE9TizNXFxplPLD8E6A/wu0mJiABjyZxV6yOqv3tuB6
 tHwUmBN5l5vF7Z6wMMXexFAoEPm5fIltAP1gQ+X51tp9WegD+vmv2np2ER8cudHz72uUY8
 /2fADu/WtKKQL3aAjrx1gKMPrMUs9cY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-gLd4eVUjNlq8EjKRCxEF5g-1; Tue, 18 May 2021 00:10:06 -0400
X-MC-Unique: gLd4eVUjNlq8EjKRCxEF5g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 071DC801106
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 04:10:06 +0000 (UTC)
Received: from localhost (ovpn-115-22.phx2.redhat.com [10.3.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 67D295E26F;
 Tue, 18 May 2021 04:10:01 +0000 (UTC)
Date: Mon, 17 May 2021 23:50:00 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 4/6] python/console_socket: Add a pylint ignore
Message-ID: <20210518035000.GC917386@amachine.somewhere>
References: <20210517184808.3562549-1-jsnow@redhat.com>
 <20210517184808.3562549-5-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210517184808.3562549-5-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VywGB/WGlW4DM4P8"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--VywGB/WGlW4DM4P8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 02:48:06PM -0400, John Snow wrote:
> We manage cleaning up this resource ourselves. Pylint should shush.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/console_socket.py | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--VywGB/WGlW4DM4P8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCjOWgACgkQZX6NM6Xy
CfPRAg//WvREmbnH9yInhyebwJGsiwSNvtFLPE0GatXzGQkk+Wlqv6Trn3tdr1k4
McGqlO0zfe0Uq9q6TZgVDsV8TtXl8uLlFKWH9MzWNPuLndOIXYYhLlLKAeln5j3R
2afpLkhKdrSPd/LaWtxEPZulWb/lA+xTUqmbPll87z7VIFNnB5QqLiYnKXqTXzZo
/t3HtBP3CbyxjxQHCXQN78LZItZQ/lDFF9KfJ71PL56YSLRsB6aLIFaTeqWsOBWN
8JYy6YshzCR8yMX3wYYRLXfDvPS1IR4TgBMhovN5Ne3CipQVQYr70Vsr/rJwL7Xn
38KpFOtLgx/w2+8gPKRXcSbO+1nPWgKcXn0vRni52ZENYbxsNR1oy1lGodYF3+YL
ozStn4KH53CIXTCPMWSQUI6YJ40gNCXhDR/0PTl7S0N/cfdyoA/GFwPaQmGCWNWE
OHGa9I7G91xxj+X/KAZhj4aL3fZCotW2UlODeBEuED22vxJECOaLfWEGrXJjxd6/
4PJ6RwqxP6X/aTstbz2FhIADkZvKhibLw/Pj6SGKQ4wov/sxD+DLX0mGzlYBZYBZ
PuWBfrJM9zFAjkdDl9enIg4eH6jXcQP6AqdHxPYEH4kfi+3vHCUonAgkUFMu/H4N
gj8uazX3oqJRBx0GTyMqqchnAIWTm55pWIhwJnpPd7TADEDOqqU=
=AoWJ
-----END PGP SIGNATURE-----

--VywGB/WGlW4DM4P8--


