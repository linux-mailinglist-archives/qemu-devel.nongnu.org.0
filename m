Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 369BA6D3993
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Apr 2023 19:57:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pj1wZ-0006oT-QZ; Sun, 02 Apr 2023 13:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1wU-0006n7-Ku
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:56:39 -0400
Received: from mout.web.de ([217.72.192.78])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1pj1wT-000442-6E
 for qemu-devel@nongnu.org; Sun, 02 Apr 2023 13:56:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1680458193; i=lukasstraub2@web.de;
 bh=k64E8thNSVxnLjVte7TZElBP4kSPwtJup2zBMDdaP2k=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=q/39LIWSos0GKsysQh/FHdoHlvku/9LN+C3DOERIHW24z/RLWvNQH5+OBXrBh/E+h
 ptOoMuxd963mCggE2x9PoUYBLquh2eiFZys6hv1iVHhQrVbTDJTsqNyClK6J3ortOo
 UK6Z4+HEs3saJVQZfGJmyrAb6/3NiUy07a886YEXteaISan8mEAP6RkbqnW5+SrL62
 TglRkyABdFKqWLu1TNYJIfKiH0LTzMSFBNivLVCvUdYM55ukWgNEppHwhoZ9o/aS8Z
 DkhE/x95FACwPoONVkxuldZLZvdQpF0vWExSUKU9X5EGeIatSAoWWZYvzbA0WnmluH
 0zNPdecEev6yQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.111]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MeDQj-1qJTDq0vhv-00atb1; Sun, 02
 Apr 2023 19:56:33 +0200
Date: Sun, 2 Apr 2023 17:56:32 +0000
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PATCH 09/14] ram.c: Remove whitespace (squash with previous patch)
Message-ID: <8faee1623c20f0aa44b3abc4432c3b94f15b8a91.1680457764.git.lukasstraub2@web.de>
In-Reply-To: <cover.1680457764.git.lukasstraub2@web.de>
References: <cover.1680457764.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/w8CM6tw1+v7TBt81qTs3w8_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:zPzPMwuqsh9rXYFAyA6stN2oBEtsBFHKCNRECa/mzaYWTmq+Ik+
 c5YLQoJLFGcMeawdPJV2Ouv+K6rpAAFNeY6XQNv4HjwBPDURrjN2BsKOn1FTZPiHScFrCdF
 KHaCRoR28WDUCZ9D5HLs3ukmW/BA5h9Z30eNd5iJhrMt0egv7NCBZw6vw1RXanipAulA2KY
 2TMgJzhzzt5YFkMY5OF+w==
UI-OutboundReport: notjunk:1;M01:P0:VQNWhqnhwzc=;IPu5JpvWA0FI27VWHMYcrFvv2DB
 HF+0+Lwb4z/HI5fSldrS6RRBJxJ1SgAMwM5zk9gP5mz0HFb+awRGxoniOV3UCBRq6yTYFiE6d
 Bvjs3pPrG4I+wxxi0ylEaOciHjvBnWLLvc5bOoZqKb8DXgD9LfkW/1PvKY5eyX6YQtfWJFJQj
 U16h5Bw1RsvQ8OXJYJAY6b/VSrk+e3Doz3zrVpOslDBKuY4Z+IUjhQ3e1GBEE6EQa/tHDyuF3
 xhTym0ND2oj8GOxErgRaXc0Bxrtv1os1ft9MwgqHwPkgvBB2tk5VCGCul6UoUfK2GfWI6Y9FA
 YmK+OTiyMN3tKBza63OAbG4jXuHD1G7odqdDkqEKqwyEvw6zCwCaLXo9I2f1g0Yvhbw7oH7Tc
 thTu0NHh3fpWTPaRDyt3RFFC1vAytvUbuKX5RcUKjgDq3yYJv96rmEK2uZGuMmZPTrd4dVImf
 jAIpHKJvfWxHVY20BGgAcNQBNp8RlWdp54EsGzCS0ahGweGsPoXu4p9Hg0ovuIPbDM9nQPkR/
 KVCjeTS9EWO8KH8lrx8h5UPZ1O+cvHuI2FSyOAImDKmtAcrqJfKA88j2kbEC3EYq/zssvd45g
 CokGAvEg5U4VRh5Ansi5Y7lYi3RXeupJSH7wcTiNQafuOMGP2coh6Mfl32KTAxDrbgIUo2MFs
 vxq9OfXy7xZ8/2CP7DLsD3NBCsU21fvFyGhAtLb64lL36+PCb4PwApo2BWojm4rBJQ83TDnT9
 9NuVhXY7QSNJm10cba/JVTqZ1OShgTA+FBs6inKuv0Z8g0AyGdY2WAXo8ESDrM5IxqUgDEZNL
 0ESPODGs2F4f/zL9Izp4/COhrbDbd+5Nf+EQMyagDx13Vn1SOJXExFlU+BnDKc7RHBSQsC6ko
 73zOa1w+LtygOZ/mylSYy7xR7NUwdJnhu3kjsdjUv6cQlbBSH0ExwxR+1IJ/mR6Yyz22Wf7os
 nPtzMaSwsKTxzV7dFj/3cWfB62E=
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

--Sig_/w8CM6tw1+v7TBt81qTs3w8_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/ram.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 114901241e..31b9b0b9ec 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -530,24 +530,6 @@ static bool pss_overlap(PageSearchStatus *pss1, PageSe=
archStatus *pss2)
         (pss1->host_page_start =3D=3D pss2->host_page_start);
 }

-
-
-
-
-/* split */
-
-
-
-
-
-
-
-/* split */
-
-
-
-
-
 /**
  * save_page_header: write page header to wire
  *
--
2.30.2


--Sig_/w8CM6tw1+v7TBt81qTs3w8_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmQpwdAACgkQNasLKJxd
sliBaQ/+I/b2tZoMhEqv5siF1Cn9el3DouZaf4R9hImkuS/Ni99b0vyloVCYS2+G
0bCfryi4uTeVL14DPKNd5frohwUNAhRY5ZNFd+05wHiHL1gU2S2J6Q0iezJrG/t3
pQz1O7pkWSq7D2QnNo1jofE0QYI2BmCBE3z/HHqkuEdDL95ytGGdAWkJz4jZgtYU
0PZoCDU6DIhJ+3rvodwC6gQ8XUxdaM8OSVfXLaj7FofyZamwGPgGCGNoO+SFXbkT
AdPYhADhYs4hw5djlbN9qaqZjlY5NiYtxzSUH4YsVTG6tcv9QAZxyOHNDx0GrvPf
JsOrZhrug7kHpVYepKX7WJ3LVQVOzvJD/M3+XzjrGPRlZKVNdySzxq89TYohZbPD
vyWBedkPmWWHWDjJJ7nqECUWWc95sY9k/a1Vlu0LPr+EbRlVpYe4oBLy1PJtHhls
DI/hUqtDEVQZt/AdbLIjXC0gGApsjgFlr59W/JyEKppclLMiGXdvA34R/jNDquR+
IrHAVNl7Qj7VdM9o0Roo8tQEqwyE/yhqO25wxCUGg8KP+u5LCiSUTAK/s072KgoR
Vk9J4ytXCO0gtfEhKBZsPtlYq/QbZ4f31S2+tv7Jd7RiRq26XK/7lffm9y/V1JXf
4xe7ZUHeoSILmPYYvF/NyIrCoKiCE5nreCF+kVh982p0Bile/GE=
=1+eK
-----END PGP SIGNATURE-----

--Sig_/w8CM6tw1+v7TBt81qTs3w8_--

