Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D586E8E8C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:49:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQu0-0007c1-W3; Thu, 20 Apr 2023 05:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppQtv-0007Qt-3g
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:48:27 -0400
Received: from mout.web.de ([212.227.15.14])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukasstraub2@web.de>)
 id 1ppQts-00084f-Fh
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:48:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681984098; i=lukasstraub2@web.de;
 bh=YroYbJOy5NFzUwYNflZa/C0S/1laMdwdzrpEmu6bYX0=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=as+Bc6pXP8hF3suvBxBd1Yv1Cw1W43ltWhiJLznuyQd9zhfyv4umrjK+jbAhsStWU
 vvEfglXCq/ThSw4lCWO/uAsZtj7Vuv3oaQtPl313ssVai6Zb94rP2L5gCawmw9k3SC
 8kIzDFUhvRKMYrpAt/aXpIRPDgfRgC/FZ/F8HBnO4Z3UKEv2ZcjrIP0Ry1ltXVMMOl
 4O3Bs27W+eESfK5Oo6FHxpk+AgTTEkDj7KLl7SGizfboSxO+7poJYtOEMTeNLNXF2p
 xuE0I8HLIk3hyNq1IAh8VSxJzO7PcrNs2w8uZN3L2dyXhz1FU/17DISbV/5RqqO/LG
 39oq3zFnFAFOA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from gecko.fritz.box ([82.207.254.123]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MCogm-1pyGaQ2jZ2-008vMa; Thu, 20
 Apr 2023 11:48:18 +0200
Date: Thu, 20 Apr 2023 11:48:17 +0200
From: Lukas Straub <lukasstraub2@web.de>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2 08/13] ram.c: Introduce whitespace (squash with next patch)
Message-ID: <ba5ece76ede6ef45d982b08d223f2a6c22345d27.1681983401.git.lukasstraub2@web.de>
In-Reply-To: <cover.1681983401.git.lukasstraub2@web.de>
References: <cover.1681983401.git.lukasstraub2@web.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RY_lY_XodF=gayUNjo9NMq7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-Provags-ID: V03:K1:e+yRir1HNVw4KLruiSp0BKoStcoktBM0DsFRScdfE9RO1OfwZ4y
 yOTqyVsAo+l/dGKzc60Xnb5qMYRQzQZQiPaF43Z3G724RWfmkxmxoujq4WOOAB7o/hrpeBA
 YF1GA967wJw9V8gs4DMNOkoiWsa30Tpfb4ImGuz8ltC3Kv1+82HvmiibSTX1xMT7VwjpIWE
 jLMQIGSoygF9vTuxGX56g==
UI-OutboundReport: notjunk:1;M01:P0:bey7fd+HshQ=;8p7hMsmDtBBlQK7i54Oi2l9fJBo
 3E0i4Sdy0jq/OFVi38Uf3ma2xw0YrzAvjyU8Vn/SRFrKocykI3NrV8Mhd4OogxJLG20Yk/i05
 ThfI/B6gfizxP/H+ZHtf2IEhCPcc/a3a0oaWD6eoHVmUGTAKkR9c9Q7tewo0M0gUmt83oGi5O
 QDcI81BPH991rLUF9Olyh405eYaIKktnNOjl62VDBJeoqEDRjNW6bkKi6y1QPkNjqIAh95O0d
 Deey5njDd/KClFqMXknGV4EeEkhsHTwXOGMNRwNevAMuEQib0cg0HTaStWlB7g4WzoCfpRehG
 gEjDsb33XhpkGKMs5Xzst8p9SspqmW0DSdzsoFz6BMtYOerLe6eqs0XP04rDOmtWbTE/AL0uX
 mHSF34dupgr2keEWh/0toT6kouaRSIjMpw8Y4ki7Mp1k8+Z30Kv9AjjZyp2hd4nlzcLvZluEu
 /Fdr5Uv3Gt7/wa5Z224S5yB7peuqmhzshsh2PUibQt3cpTBtPUQoOsTmo0jzKPRFUV1KVeSMj
 3TPgZMODN3pDdEWvCEz97cEC+KcG0/UQW2Bpbf1qpZED/oakm3172EaR/mSuhoam3+Q4rCbft
 8TNFeES1knZf/kF+HyZO77tVZiBX3KvT1q7JwB2u415su7pHGPfe962aXBEWHWvpfT5ct8Asr
 bW5WmA2xMK7a674ZVygOnTrTafdG8qRqdUCtoXSR2ykkpYw0psJebDeU8ksmRCg/rU/10/pb9
 S9FF8XxTwaVPI++7W7JCgorlg9VYS0jdY05Nca+qoh5z1X5Ks5jejvH52LyAJYsmSOCMTpajt
 aQxNJrGykp03UzjFQdUpHXifnqOPVUMUcphPSopeIOh2Rz4JXELicZoPOdDjaS5cVR+CFOhIC
 TKSzIXVD24GQMayr7SXJMikrfge4TerwlehfhVDg9XdM07jjmbdAiy4M0ThWXQ12LQLC8x7rs
 STE7Vpi1RyiUI80WE33BGN0uCFw=
Received-SPF: pass client-ip=212.227.15.14; envelope-from=lukasstraub2@web.de;
 helo=mout.web.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--Sig_/RY_lY_XodF=gayUNjo9NMq7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Introduce whitespace to make it easier to reroll the series.

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/ram.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/migration/ram.c b/migration/ram.c
index bd3773d4c4..b95c5c720d 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -602,6 +602,12 @@ static void *do_data_compress(void *opaque)
     return NULL;
 }

+
+
+/* split */
+
+
+
 static void compress_threads_save_cleanup(void)
 {
     int i, thread_count;
@@ -641,6 +647,12 @@ static void compress_threads_save_cleanup(void)
     comp_param =3D NULL;
 }

+
+
+/* split */
+
+
+
 static int compress_threads_save_setup(void)
 {
     int i, thread_count;
--
2.40.0


--Sig_/RY_lY_XodF=gayUNjo9NMq7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEg/qxWKDZuPtyYo+kNasLKJxdslgFAmRBCmEACgkQNasLKJxd
slg4KA//ZzT+m01syvHwtoMHdI/BOCEIZvfy+7iEKSCH1UN+E6S0Xv29NsYXqIWY
hENMOy7qDGM647kc2+WIvIy44GwhywFbrmrnydKQGSL/ovUsRglmT7Y0eRLH/zii
BU0DjVit+hYQlSw1ZrcxdIA/RNbMfzMk11PO6lif7r/PC1xWNAadvkpd53EIdjds
S8PS4xz1mhu1mf9H9MLvQd0L1xRvkjsfbjG2beXsQiJKTSBw/ODHGH6DYjxe9QZw
tFPIBahP30bcPyl5kBwpgjccXnqBzU5QmKvQ2Sl2prBMEMc2xUrM7L47KDpICii2
/pP9RROXyUFjaDUencNhMfZqxvD87oatzwRQmxgOvjiCz4zxa33TTzTJIH8WRAoF
lV3pkO6IjLwAkgOFS3WUV4fBbXpsS/1fg1CMvfGzWGMXDHnVHzanBU9jHh7UHpbE
QOa64wi1f4yaRBmt3NK+VAnkeSZVfN9ymusOD+wtukTi8ew4bVA7whHUtp/yMOWc
xn4BnxSSuhJPg0QrnNMO+MCBicB2zXnu2ttRO+ihiLE/m/N3PKARIKvBxKMbkFW4
SXN8OrKqz6TbmkweXkhBU13e19YmDR9i/JT7G2e9Y4I4FUUcDQIRiQBFLN+E4ouR
5O0KpVYNly57CGQSWBOZGTB0/EiGF403VP9sD4yRZz6M36J1FZ0=
=XG6r
-----END PGP SIGNATURE-----

--Sig_/RY_lY_XodF=gayUNjo9NMq7--

