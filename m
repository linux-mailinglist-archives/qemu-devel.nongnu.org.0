Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA8E6D3959
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 19:07:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pj1AC-0002TZ-FQ; Sun, 02 Apr 2023 13:06:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1A8-0002TE-QQ
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:06:41 -0400
Received: from mout.web.de ([217.72.192.78])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1A7-0004YJ-5l
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:06:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1680455194; i=lukasstraub2@web.de;
 bh=Y9sy+Zvc8l399K1gf8uq6kzHYrDDTQ6yMy1kVT/nRNg=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=Db2+7nI/qH/Oi7t2IHwtvSK9TJj7zCPZZbqyz6Sz60dlp3N4zXQuaw38jU1NU6826
 vCjGhHndEY0FSsgMNuNCmVVHdtsN3Q22AjCPVycc6SRxsEGyKao0X+iDiznuswBaC2
 Qqck51UR/WqgqG1O2aHiBVr7KDagWYOvXcm0tGsY5yf3PZXcfHuAR0oeUa6r+2WY7A
 wpI/NeVGV0z3CSuQiFw43rwI1/AIC508ogdXerGaAx+U9SghkVEG5IZiiyiFpjfx72
 9OZzyoSqTurfc7QobDNoeYWtiqvR8a7pOOOdmtcMb5w3AdkmUeq63ZIJkqvvaJuML6
 oYOMR8EQCSAQw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.111]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M1rP8-1pgpIf40D2-002eGF; Sun, 02
 Apr 2023 19:06:34 +0200
Date: Sun, 2 Apr 2023 17:06:32 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini
 <pbonzini@redhat.com>
Subject: [PATCH 2/2] migration/ram.c: Fix migration with compress enabled
Message-ID: <20230402170632.44f2a749@gecko.fritz.box>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/t=mLKZePdfb9cD=IjrHhVMn";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:wwxaY+2X4tH0Z7vDND6u7hxb4O8Ww3qpnzurseRgZqnvKtf+oPm
 FTaxK1dn3WREffa3fpkNP5oV1KjUS0UbbCB8YYPUQ7U0roNZ27A1xso4MFoxTA3Q4G420S2
 ogNgwdglgjGg8NvfpfCrq+vt3yAr2jUyi9mWZ26n2elh60vlHwq0tzUhcwhiqWGF2v4Mh5I
 rD32e2fFGMAHCZIFTdMww==
UI-OutboundReport: notjunk:1;M01:P0:Mez4drqg3Q4=;tn/ItfBGJAoYH7fQRCHBwf5MZFd
 n8SMyiZ2V0aY3ldixIoHMcaGwxLo8cw1T2qCyb1y1yp3BqgT1Pet1q+IAUnpocGcDluh8h8l5
 6IOIdR8lH0cpEkLNEQPEnL6PStYSgJJf3LJpZuX807jXgq7fkd8VQiWP7/gyevXf4dldSqkrc
 vkspB7QltLwf/nMiD83a3t6FC6hzUSJP1yeZ8FClueUhEVuAw1vaAqGMaieRifCBp2zVv19NH
 6D9TOHt7RgKSAk6LhUMiDTnrmt73BRUw3gMzY4pRXReK2VsIqbFvpBKfDjjIL54xTIzcgc0eu
 kloTwnWS4vxh2WIy4J7xEOv+a9FHK2eBpMKvBfDS4X1ZV90r2mlgSeh4hyILQAK4N07YY9mBF
 yuGVctSygsrk9fMMFvBSd/dd91XBFbfvB4yNyg+qvyuQceBRUdzf1fI84LJnbWeUKZ5MdxrWK
 4A5shysPuLvyyYuRnRj59YNUuEmGsQ7iemLqYswmwl4OrtiV6Clm8QnoiDhuh7v6043E5X+sT
 O2iB0YxJePeTjaNZNuExTbbju4ZSg8E06PGNiNjDrKQpdjJQAEsfiA75/e+Uv6rBO0KOayybo
 VAkcv89eQhvMj90rIIK+M0vPgZ7P+SJihYBC8dAj3DXt2/KBA7M2/cbOuWNaJen7vNYaKbm4Z
 0fljgdOqldN9WNbxHTEiqkgeNnKvGBoIaYGDE3Ib79Xj4/mXI+9x4TITz1+G7WUYDLsv6g4xo
 3MW5K47lYBotrO4HYMjXw6hoREe/uu/5YyfrED2oILb1q9c2irXhdHGE7TyG9Jva0L1d1WkuY
 qIL1KSLv5Qoclkt/f0lTRGWyWRszs7ZJp/72q+0B9OL1IQzs5fdyqQg4AIHJtz0aC674IHDh/
 p7E3lATyvmZu/BqvT5zzMtQIekDcf/fcrRItuKlZhQ1JMgJ4cQdG/7pn3CcnGYOSK8xc99gnf
 DASUm/Vj081Q7y90deA2N2jxxiY=
Received-SPF: pass client-ip=217.72.192.78; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--Sig_/t=mLKZePdfb9cD=IjrHhVMn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Since ec6f3ab9, migration with compress enabled was broken, because
the compress threads use a dummy QEMUFile which just acts as a
buffer and that commit accidentally changed it to use the outgoing
migration channel instead.

Fix this by using the dummy file again in the compress threads.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/ram.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 96e8a19a58..9d1817ab7b 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -688,12 +688,11 @@ exit:
  * @offset: offset inside the block for the page
  *          in the lower bits, it contains flags
  */
-static size_t save_page_header(PageSearchStatus *pss, RAMBlock *block,
-                               ram_addr_t offset)
+static size_t save_page_header(PageSearchStatus *pss, QEMUFile *f,
+                               RAMBlock *block, ram_addr_t offset)
 {
     size_t size, len;
     bool same_block =3D (block =3D=3D pss->last_sent_block);
-    QEMUFile *f =3D pss->pss_channel;
=20
     if (same_block) {
         offset |=3D RAM_SAVE_FLAG_CONTINUE;
@@ -867,7 +866,7 @@ static int save_xbzrle_page(RAMState *rs, PageSearchSta=
tus *pss,
     }
=20
     /* Send XBZRLE based compressed page */
-    bytes_xbzrle =3D save_page_header(pss, block,
+    bytes_xbzrle =3D save_page_header(pss, pss->pss_channel, block,
                                     offset | RAM_SAVE_FLAG_XBZRLE);
     qemu_put_byte(file, ENCODING_FLAG_XBZRLE);
     qemu_put_be16(file, encoded_len);
@@ -1302,15 +1301,14 @@ void ram_release_page(const char *rbname, uint64_t =
offset)
  * @block: block that contains the page we want to send
  * @offset: offset inside the block for the page
  */
-static int save_zero_page_to_file(PageSearchStatus *pss,
+static int save_zero_page_to_file(PageSearchStatus *pss, QEMUFile *file,
                                   RAMBlock *block, ram_addr_t offset)
 {
     uint8_t *p =3D block->host + offset;
-    QEMUFile *file =3D pss->pss_channel;
     int len =3D 0;
=20
     if (buffer_is_zero(p, TARGET_PAGE_SIZE)) {
-        len +=3D save_page_header(pss, block, offset | RAM_SAVE_FLAG_ZERO);
+        len +=3D save_page_header(pss, file, block, offset | RAM_SAVE_FLAG=
_ZERO);
         qemu_put_byte(file, 0);
         len +=3D 1;
         ram_release_page(block->idstr, offset);
@@ -1327,10 +1325,10 @@ static int save_zero_page_to_file(PageSearchStatus =
*pss,
  * @block: block that contains the page we want to send
  * @offset: offset inside the block for the page
  */
-static int save_zero_page(PageSearchStatus *pss, RAMBlock *block,
+static int save_zero_page(PageSearchStatus *pss, QEMUFile *f, RAMBlock *bl=
ock,
                           ram_addr_t offset)
 {
-    int len =3D save_zero_page_to_file(pss, block, offset);
+    int len =3D save_zero_page_to_file(pss, f, block, offset);
=20
     if (len) {
         stat64_add(&ram_atomic_counters.duplicate, 1);
@@ -1394,7 +1392,7 @@ static int save_normal_page(PageSearchStatus *pss, RA=
MBlock *block,
 {
     QEMUFile *file =3D pss->pss_channel;
=20
-    ram_transferred_add(save_page_header(pss, block,
+    ram_transferred_add(save_page_header(pss, pss->pss_channel, block,
                                          offset | RAM_SAVE_FLAG_PAGE));
     if (async) {
         qemu_put_buffer_async(file, buf, TARGET_PAGE_SIZE,
@@ -1473,11 +1471,11 @@ static bool do_compress_ram_page(QEMUFile *f, z_str=
eam *stream, RAMBlock *block,
     uint8_t *p =3D block->host + offset;
     int ret;
=20
-    if (save_zero_page_to_file(pss, block, offset)) {
+    if (save_zero_page_to_file(pss, f, block, offset)) {
         return true;
     }
=20
-    save_page_header(pss, block, offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
+    save_page_header(pss, f, block, offset | RAM_SAVE_FLAG_COMPRESS_PAGE);
=20
     /*
      * copy it to a internal buffer to avoid it being modified by VM
@@ -2355,7 +2353,7 @@ static int ram_save_target_page_legacy(RAMState *rs, =
PageSearchStatus *pss)
         return 1;
     }
=20
-    res =3D save_zero_page(pss, block, offset);
+    res =3D save_zero_page(pss, pss->pss_channel, block, offset);
     if (res > 0) {
         /* Must let xbzrle know, otherwise a previous (now 0'd) cached
          * page would be stale
--=20
2.30.2

--Sig_/t=mLKZePdfb9cD=IjrHhVMn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmQpthgACgkQNasLKJxd
slg+fhAAoJca+QLR9Y3EiNCil2Ew1F+AHbDnWKGvhWTv3a/hdPPETW312Z2F84FZ
c7hkaUSS1NpmFAXaBfd1T9CsZeqn+9QUgXC8mu7sKLp3SydFX3KFGW5HcLYiClKj
71uZuIJiCAeQ1oNagL02ahLfRKLhSjxfmUSNAPvlo4AE3yJJ32MWPCQup5ExFv1F
tj0X8fMA0S4EdBMJ8NR+HSeHzjMN26L6CMtTFiM07tU9nxZRfaS6uFjTNl9BvH+g
L/n4/LYlX5tQ7Gr/s/zGdSatNKgA4bYAD2bZxYQb2QxSrZwJx2mZDDplFlDYTxlY
rzLgqbQ4w75ksE92hmeQp3CobqXqyvrYt/RPm7ajSZMONojdqKnyGwtKHFTdi+dD
X72H5zfj1Fmsq0TqlwEaJsVPXtzjbMsSEoTL7P6KDndw+kxNeuUKu4tNjhs/0BpV
BncCwpt81HpVp5gWA/ur9ghP62ppfhFjLfPZ4w5CBmdLFy92aL7ZHjMt3zgos2ji
boPP6MJi6T86tLWb4DTQutAArc0Uh7s2OkbRVfgK7kDybN4kVud/zowDR25C9we6
EBzfpgf3NmLq1tUZQm2cFuiiJybRub/sji2afoXuzXavhJdzxyZFWgCk8o9YprqW
KDmBk+xTNkGm0TMtGosUR81JKiPlOXXVQcWM65rDfFi30EPAGLs=
=A63u
-----END PGP SIGNATURE-----

--Sig_/t=mLKZePdfb9cD=IjrHhVMn--

