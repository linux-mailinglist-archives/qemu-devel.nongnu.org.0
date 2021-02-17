Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C2531D42B
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 04:10:23 +0100 (CET)
Received: from localhost ([::1]:41008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCDEM-0003DU-HW
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 22:10:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCDDb-0002il-1Q
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 22:09:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lCDDZ-000887-KK
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 22:09:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613531372;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lr7xKH01u/ymU4m3fVn6P79BSHNa7tFEUXB2h/UmgSU=;
 b=GLPY90tlE9UgsR6EZtYmvsA++FHU/Fp/5WKwVwNe5nPkvMmPq1YMrdE9X305cYNftipNr6
 2vJHDkjWKG5qKa6+UynSUu3vVUJPWHYuoyI6qdK8S6Dy9z0ngm9wanxzDz3muUXP9Lj/tG
 ur3Npr5c1VAq8HIXBqjbKrb6Te30XwI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-iFgvPcQXNVa3Xy9FfxUxew-1; Tue, 16 Feb 2021 22:09:30 -0500
X-MC-Unique: iFgvPcQXNVa3Xy9FfxUxew-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F6C31005501;
 Wed, 17 Feb 2021 03:09:29 +0000 (UTC)
Received: from localhost.localdomain (ovpn-112-29.rdu2.redhat.com
 [10.10.112.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC4A719D6C;
 Wed, 17 Feb 2021 03:09:24 +0000 (UTC)
Date: Tue, 16 Feb 2021 22:09:22 -0500
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v4 10/24] python: move pylintrc into setup.cfg
Message-ID: <YCyI4vDADpKP6b34@localhost.localdomain>
References: <20210211185856.3975616-1-jsnow@redhat.com>
 <20210211185856.3975616-11-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210211185856.3975616-11-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DROKVTE/Nvw4I4oj"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--DROKVTE/Nvw4I4oj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 11, 2021 at 01:58:42PM -0500, John Snow wrote:
> Delete the empty settings now that it's sharing a home with settings for
> other tools.
>=20
> pylint can now be run from this folder as "pylint qemu".
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine/pylintrc | 58 ------------------------------------
>  python/setup.cfg             | 29 ++++++++++++++++++
>  2 files changed, 29 insertions(+), 58 deletions(-)
>  delete mode 100644 python/qemu/machine/pylintrc
>

Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>

--DROKVTE/Nvw4I4oj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmAsiOIACgkQZX6NM6Xy
CfPYuw/+MrpiD+qJ6xM80zNC6CD25MYyKOEPkPVJ2KAq14Ewc3uwRYDtdsBgAkEL
ZCOFLI8OHUpJcj0OGN6cbu8n1w0hLLUhpzdtPe4BfYswfjBWxnrAvgrRax+n5ef4
Ek1GRhQyGUSDzub8g+oVEaZ5+deD1msd+BQgTbgw2sH+/9PuXqhW2I79BjuotuOK
cgy4clKU78KgCYs6iv+CYkV4hru5TkvskHb5+pon1meeeS9P/NcRvbwFndULjB1k
cTNkH7cCCcT/kk66yZLTLk9JRcmB766DELDxXE+iKWNPkSVg5gpj76zogUrNiPEw
bC2bc9cUG8mdcwX4nXJH25ZoQHH+nFFkKGvsxbOekGapYYWAJ20J/YN2j/mDTtJX
LtR69DvrLoH0l/8/h3SUqw88pXBw18Jezq4KGBg60xFurIrSCl7+zx3Fl+O6d1ME
rArGpC2EHjdDzpclbBsLqEB4e5LxwRt1YjHELljQwphY7JMZAhjZdFKz04lhFbYi
P2PS39Jv9Zqu0I79h3k7dCuAOqeLPuAvZM9vB0g/uCSiHqAIDeZ4AuKd1cQff501
rkJBz/3Vw+rDwPbhPJcwZP9K6dxzqbdvHs0RQo8jW+z7Pzw0r6FdSUgXnnb4qIxu
kNyBogUp7rpVWtdDcL4pLvMN3VVuzmkwmcUJEa8mQE58tP86Xqg=
=rFu1
-----END PGP SIGNATURE-----

--DROKVTE/Nvw4I4oj--


