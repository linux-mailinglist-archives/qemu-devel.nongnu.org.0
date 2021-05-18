Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C36387081
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 06:13:16 +0200 (CEST)
Received: from localhost ([::1]:33944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lir6Z-0004w6-4d
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 00:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lir3i-0007gg-QI
 for qemu-devel@nongnu.org; Tue, 18 May 2021 00:10:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lir3h-0003IV-28
 for qemu-devel@nongnu.org; Tue, 18 May 2021 00:10:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621311015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RGO2F6fz2jGrIZi96+OJOzHVr4+F0Jd3S8gXPLRk6sw=;
 b=Vp+yNgjRh+K8d0EMp9obdRhAA3JE+ho83sBeEeasPB5INHudT5vewguJMvD41o46KxXuY1
 NFulx4KaTYql1wDbs8E4yNHXnL2+br5QHjW4lobrEtdp8Lql8jhcjy/sEI3HQWugjacDZR
 M6hezYkFj3WghCmtPWrO4hczY+34hW4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-8JYseta2PNmjykFVJwVayA-1; Tue, 18 May 2021 00:10:13 -0400
X-MC-Unique: 8JYseta2PNmjykFVJwVayA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 278251005D53
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 04:10:12 +0000 (UTC)
Received: from localhost (ovpn-115-22.phx2.redhat.com [10.3.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E68D65B4B5;
 Tue, 18 May 2021 04:10:11 +0000 (UTC)
Date: Tue, 18 May 2021 00:08:55 -0400
From: Cleber Rosa <crosa@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 6/6] python/machine: disable warning for Popen in
 _launch()
Message-ID: <20210518040855.GE917386@amachine.somewhere>
References: <20210517184808.3562549-1-jsnow@redhat.com>
 <20210517184808.3562549-7-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210517184808.3562549-7-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kA1LkgxZ0NN7Mz3A"
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--kA1LkgxZ0NN7Mz3A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 02:48:08PM -0400, John Snow wrote:
> We handle this resource rather meticulously in
> shutdown/kill/wait/__exit__ et al, through the laborious mechanisms in
> _do_shutdown().
>=20
> Quiet this pylint warning here.
>=20
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine.py | 3 +++
>  1 file changed, 3 insertions(+)
>

Reviewed-by: Cleber Rosa <crosa@redhat.com>

--kA1LkgxZ0NN7Mz3A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeruW64tGuU1eD+m7ZX6NM6XyCfMFAmCjPdcACgkQZX6NM6Xy
CfNsvA//UaprmQN3IInAFVewEkrTIQlDsC8D5O6HiwngdTgg2rHopdFU24ceTojK
iTuc9cLdsaUOcXO9558y3JOO9JIoJDorG/vQreLXEwNin+TU9ewx+rXgJFM/t7jc
ruTzv2FZfU85Iop7bU2XiojjwqSeouO+1zwsuhzhbGoPsOppfdL5oY5iEHUBiPUm
lfdBQCwUKbhIrcn7Jef1b/3uUzZs4iXrhbqbGaThsv30RbVSzIK4tk2bjIVs+JPD
zZPtCZ1ItF6MbH3CYpjJOJ1+ANZCRbp8fKIi4lmdFyOuRyBQLM2HlQrw95gTcTCO
aMqwQ8tY5MvLxFRXBNZFf0qfhQPar9q40pHn0vteUSQ5OfRAFoz39ctngbQ22WQ9
PP71jgn88lDnX71o7gvb2ljFWBdmquKHEwMDgHavbZGtbejLl+m3OGOSE7QO8PLu
N9OtVOgA5ufh26mnnx5zBYVHVF+q7xrBjFEAT1HibIcCmoP2GUkfGpI0mlGVhdUX
F4bWdGST+uGgGol6nXMQlDWB8/rzzUbBYE2WM+Yt5UseqjSiKj0RZOPu+pJhjRJj
DpSh99V9ty+n0nBfmasImLSMnkGC2Bho8ibfbNKRWkD4BiDRRKJ7KQ2mLrRMweoI
J14i80KfzpCdgyb3cGXfptuoOHvn50Ub01NleK2TmObvxkNz8FE=
=Ch+Y
-----END PGP SIGNATURE-----

--kA1LkgxZ0NN7Mz3A--


