Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7672A3E08CD
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 21:28:02 +0200 (CEST)
Received: from localhost ([::1]:58272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBMYa-0003OT-WF
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 15:28:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1mBMXb-0002ii-56
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 15:26:59 -0400
Received: from mout.web.de ([212.227.15.3]:47019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1mBMXY-0001AK-VZ
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 15:26:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1628105209;
 bh=8EEPpVjM0AndmxcfkYrypMVyCVvu7/qREydgEtXQOdQ=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=C90DSwdYU4zguBcDBf4kODOtGCviRdVGyx9ZDkCEbj3MeQY/gm5BSMnCYF41EE2M0
 Z3BxoHVAe6FPWlPLaWwpfBNlj2pdbkz+ASoSzismouI+a2qoLlPmDfz1CrYlh+O3g1
 OXgTnvWyYFa+YFcT/3FpzMb4HrHp8NTWGYhmLIoY=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from gecko.fritz.box ([94.134.180.254]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MDMzC-1mKgSl2xDa-00ArOq; Wed, 04
 Aug 2021 21:26:49 +0200
Date: Wed, 4 Aug 2021 21:26:32 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH for 6.1] multifd: Unconditionally unregister yank function
Message-ID: <20210804212632.77221bcf@gecko.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/O419erVF9FBj2LDalI5BPoW";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:xspzGkQx+qDWuLinIPr5xN5OWikSqYAKnHDCeHhyttlJepICaSB
 1ItNu3fyaaYPjvYxbJEFmlJoIPU+vuyG+yqUqaKSulG5L/V08DUqihfovzzAkOPkwPX23SB
 dG6qGxyUpinMjeZNJWr6zJJc0HjtLKRUvPEa1Obfhe+VO6OyfA1zeJ8NC7reOV02FAZi/aH
 QHzA2tUf7J3FQnW6+2iWw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JCDZUe/UxI0=:D7nO5rRUPIRvKlzV2CvOc5
 iaDLHjQagA6FWa/T5H+XZU/f5hN+1zOvrKK9Y2+pJB/hLogPNpkv17rh+S3tBYB6Dhipz0Erv
 /pkjM1rM+2yyxtbQQ5ZcSn2cPlD390rS/ARSUxWFA7Dx7tn4ItxktEtQEMbbWOg4zTerxw6DG
 DSXp19TMPt8lt13gCHcbSMouFkTkpB1FcxgliiY3zocbHqjtHt/Y0zF1L7ipyU2GTvjGNrYLI
 rDhXG+HbGOabgdWXcE/xnLfs7F+KM2C7D6CngtEBbaUXXnYbz9XZUZI/eXZqf0B3mDdBL8aND
 AzvEW44eCaiuOFl66nWLVg+ntQ+EZgodZETCZnDsFrzsdi2P725QbCFf2SQ1leoayXOk3ZEMh
 VjyZlTnT3RC7ao3zjcHaa4wAhoEzNJYzhQe/AhlI16lwNKVEFdTXuGx3muDzGAgCDoGcv0YPP
 1+WcBwwPJ+k40LulRCr9UKG6eCjPvL9zkU6fj+xQh1nYzTn5kNAL1wURDBmIfG+lI0lkxMJr9
 nr4H4pRJqz2tPYlW7vwUNEpmQmK9ub+kqldTD+QAdSVF0nrPOFqWKA3Lh7yAC/xPQf9CmKZUm
 Tc8hZA2Pnv5fDfWEwKrMOl1gKl8mGcBjpEQH2vsUpFv7AN0rOccZRPfOtUYwEXxq4WOq+elQ6
 blP7mrB+vMj+/k7E9OG/wAvustUrv8s19KvHbdsFnDsKc5FiTEEar8DygTiLrHpvg9zBZqXai
 uX77zFKg9TT799od030GrA3TYPsBRVDhoU+C92XhQAnapqFWNcOrJZD8solnZCWXRmushsl3n
 KDOK2TgxIEphgbeNCDa/UeNyRcknC/SNOnCFtd+0z8EN6DgXIz9KwHNLVp7W3I0tdYkV2Af9f
 3UJYF7Cuczvy67ja65sAa8vD7k/LQv1Nr2OOLfmndyUjBNp8rnuFP4Ux41S0zACJwE0aYARsE
 n7P4f62tDNBDwVjqRpKabFaFDmwOlRUvMdZTg9VKzmCbsoLAUR8mOOG6awBLKibUXjuoH1XCP
 pWNBK/zK+1Xqb6UJIimwYwU82m9aWLe9GHIpt+lQ6amjqAHUymiOCbAp08BkLRmn/tO+4nQVr
 77ea5Qczg+aqBemunotkUjIX/i7owQCOXfc8tumzvMiFmR3wfcXPLxrXIRQ3TeOfHwwEabfkh
 dwbs8=
Received-SPF: pass client-ip=212.227.15.3; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/O419erVF9FBj2LDalI5BPoW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Unconditionally unregister yank function in multifd_load_cleanup().
If it is not unregistered here, it will leak and cause a crash
in yank_unregister_instance(). Now if the ioc is still in use
afterwards, it will only lead to qemu not being able to recover
from a hang related to that ioc.

After checking the code, i am pretty sure that ref is always 1
when arriving here. So all this currently does is remove the
unneeded check.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---

This is similar to Peter Xu's=20
39675ffffb3394d44b880d083a214c5e44786170
"migration: Move the yank unregister of channel_close out"
in that it removes the "OBJECT(p->c)->ref =3D=3D 1" hack. So it
makes sense for 6.1 so these patches are together.

 migration/multifd.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 377da78f5b..a37805e17e 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -987,10 +987,7 @@ int multifd_load_cleanup(Error **errp)
     for (i =3D 0; i < migrate_multifd_channels(); i++) {
         MultiFDRecvParams *p =3D &multifd_recv_state->params[i];
=20
-        if (OBJECT(p->c)->ref =3D=3D 1) {
-            migration_ioc_unregister_yank(p->c);
-        }
-
+        migration_ioc_unregister_yank(p->c);
         object_unref(OBJECT(p->c));
         p->c =3D NULL;
         qemu_mutex_destroy(&p->mutex);
--=20
2.32.0

--Sig_/O419erVF9FBj2LDalI5BPoW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmEK6egACgkQNasLKJxd
sljSLQ//dvUsSlySGQuMIt38XqHA2PySsJqmYUzEWtreFk6tNx/i77czjwaPgYRY
2NniCiwASzTWLy1dvYyGVxqdKh95EoEud63E2JYSUd7PYEXwHJ9A8UiG+Ba7f0RR
F4PWId89WrCTy+9PMCOtGWqMvU72LeMy95WJ2JeS43idOYJPzNCIFEqoHyfiwnTT
yhAueAflLh/n6mVmaRFe3rciPaR9gc0EJ/3LqdajOR+Bi7lXTBn8K3R6jbZirgEd
pfoouWscWm+Nu4IuIupgizmWKo+6oGUP90tzzkkIqY7n7kBlGUqtW2YGUAJofkDv
W33LdK9wbQ4G6ATipCtlwe39KO7bhsrZlyGQKq4KftrQOma3jaq16hNbfgplQY8A
HEyX7oVIXWvVWeKxfZPd8eUcUSJlUoHcpvJpGedwG5DgNyV48cG/UVCThxy/6TQb
4sJVtYWvSmNPB7LFswNmdblh0hJ/p14KuCrDnWy5Awv/o7tILeTw86t/zBxE8QYa
6CrJGhzjY4RCUr7fhetHe/jYfwviiUs/ChEMV0+mJkojskTfQ3sXgAKlA+OTaUPo
EkahwZaZiD2QWUXexCSuYth+B/YSsOa/cpBcSyVsK6Pj1Fty8XHSV1dj3emniRm4
WVRnAadkLYaAWKKLxJrxoJs45t/BsxfUZcyUKx7QAl1fHQDAAEE=
=FB+X
-----END PGP SIGNATURE-----

--Sig_/O419erVF9FBj2LDalI5BPoW--

