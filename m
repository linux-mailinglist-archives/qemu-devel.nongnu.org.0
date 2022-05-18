Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9267B52BFC1
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 18:25:56 +0200 (CEST)
Received: from localhost ([::1]:40052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrMUl-0004O1-Nc
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 12:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nrMNF-0003jj-RI
 for qemu-devel@nongnu.org; Wed, 18 May 2022 12:18:11 -0400
Received: from mout.gmx.net ([212.227.17.21]:60555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nrMNC-0004Ls-LK
 for qemu-devel@nongnu.org; Wed, 18 May 2022 12:18:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652890680;
 bh=DSuS3NZkso2k1kO/PGV+2j/7e1QVridaN1NaTFnUJyQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=KTJr+x9vj5jUCoAz8VmzlCuDY6maD+fHhpKNRBRUCdYkJ4ZNtDhbpKFz7oLoS+K3O
 y1nm7W/TijIUKSA2Oh6M4V7Ij8drUhjpevjJaAyUXfLsVXbTg53JpmOeTrCYotn/O+
 OP2tHS8BBrNApHJiifnPPhiI3mt5fFV16GV+5SEQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.138.233]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRmjq-1oKbYY1S4A-00TEJB; Wed, 18
 May 2022 18:18:00 +0200
From: Helge Deller <deller@gmx.de>
To: Sven Schnelle <svens@stackframe.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Helge Deller <deller@gmx.de>
Subject: [PULL 2/7] artist: Introduce constant for max cursor size
Date: Wed, 18 May 2022 18:17:53 +0200
Message-Id: <20220518161758.49036-3-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220518161758.49036-1-deller@gmx.de>
References: <20220518161758.49036-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ws1K0a1kwLkyuVet51rlkCfDainx6cgyUSj5/BZdwUEWSJXH3ne
 P5YrhQwZjHWbIqUqSxk5K9dWopmi2lzy4KYa2SeDEmnTtez1ZFs3i6RyjrdY9pj4LNU/uLU
 fNEnUkYPomRKahjlw+OSU6c8LCJDLk+EG6gMQDgHyj4EKa6Q4eZnfWhRgGomkUbnZl7O+Kd
 n6kfDYE8CughLZ2dPDZXQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gFOSdRVHXP4=:zrKQ6pMfK6GJ1lj/wdACzU
 COHOCcYevKdE51uCsPEda+1F5CGaAeclZudFuk3I5Nka7gwasAEPuHKDMnCLtdN3JyupfduE6
 CdNWaKj6VkGsoTnn485+jR2bmiJofXaM/xk4512R9WKOgAXjBWfn/Tgm+NzG7oPGH9fI7RraD
 +phLcGNy/hvYxT2yUsvgwJouEYSvGBnyJ2GTZF307bCTuygMQoLYwu0ime09QJaMy+N0EnmvR
 fhfVfqeGxMWMfxixGTfyxSKPSoSSbXUOw0RfG2vyP9r2CoF4JS6I9TWMyeYOHA4UlL/ytTvIm
 k0DWEccNfjamax/Xoe+LYwwSnTU0IqfftZs4Eiya0bpDco1qhuVVKUr0DKCpugCZ/fz6WS+eI
 WBZRFYlH5IP2+6Us6EkHi/cLVxrAC4dBcjv8gRqE0XQIpV/hKwi62DaU6YBaF7PFVYQd8Thpd
 VExjQOp7aXd42HqU1dmKmtaLwk2nr2/g/kfT32ATn003Xvg38DVNNRcpRguERN3z63IKS4Pdg
 ZnxW4HPsb0SWHPamgY3pJfQw5S7PAY/1a29KjhokjpMO/Dj8JGNGz6zhbVIMDfvIQ7ZvMpbUu
 KVNp9RdPHNncH8X1wqtpB6s8I4oYeyt33eU1mgrK1l9KzzeGQRd3B0kOaku9Zyd5BNjuVS9/F
 +XlKxXLRye8alpdIuhWkdHiJ2gJbI08aFA+89aV/A6fMIUDKjWMar/GJGFI7EnYSf2MuDi8RE
 Ekzyoxf6hiucJVKeZQCCbvUh7yjntKCl/d1sppkED8jnB/Nu1YKMhjPMBiGZe80JiwkM9laOW
 CRyb6eGPj3CKomBrv82dAxEy2S0ceZsq2vaw8hqoml52V+g3ExGHbyrUWVDZUeb3Bc9w42f6X
 /I21ljiA7CW4ulSs+E0Xi3QuD4ZY/2m+oZs30GYPiHxcK89GqxLP3iJ3ZdKgSeLGImI0JI+Tw
 hlYRy/NtjgjlCEllgIK5xvenhT8nVwuDdw6hghJVlkAaXBXF+4HU3Rqa1EnwtkTsKXEeaKTpj
 lUJVQWDZNoe5PDHTneIdDRwLKJkJLNG/DIaqZBEgXhmbpj4f1Pywlbqrw9hZBy5jg9toC3iwP
 RjmdVtCywj+09KeRCrZ45A2JdK9DqZOlgWh13J9eVDrFEuDFiVPSrdPzA==
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the constant NGLE_MAX_SPRITE_SIZE which defines the currently
maximum supported cursor size.

Signed-off-by: Helge Deller <deller@gmx.de>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
=2D--
 hw/display/artist.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/display/artist.c b/hw/display/artist.c
index 39fc0c4ca5..6333ee41db 100644
=2D-- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -98,6 +98,9 @@ struct ARTISTState {
     int draw_line_pattern;
 };

+/* hardware allows up to 64x64, but we emulate 32x32 only. */
+#define NGLE_MAX_SPRITE_SIZE    32
+
 typedef enum {
     ARTIST_BUFFER_AP =3D 1,
     ARTIST_BUFFER_OVERLAY =3D 2,
@@ -1325,11 +1328,10 @@ static void artist_realizefn(DeviceState *dev, Err=
or **errp)
     framebuffer_update_memory_section(&s->fbsection, &buf->mr, 0,
                                       buf->width, buf->height);
     /*
-     * no idea whether the cursor is fixed size or not, so assume 32x32 w=
hich
-     * seems sufficient for HP-UX X11.
+     * Artist cursor max size
      */
-    s->cursor_height =3D 32;
-    s->cursor_width =3D 32;
+    s->cursor_height =3D NGLE_MAX_SPRITE_SIZE;
+    s->cursor_width =3D NGLE_MAX_SPRITE_SIZE;

     /*
      * These two registers are not initialized by seabios's STI implement=
ation.
=2D-
2.35.3


