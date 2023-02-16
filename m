Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4659269975A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:26:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfB4-0005fC-Ou; Thu, 16 Feb 2023 09:24:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ssinprem@celestica.com>)
 id 1pSfB0-0005eU-N2
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:23:58 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ssinprem@celestica.com>)
 id 1pSfAy-0007CI-KD
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:23:58 -0500
Received: by mail-pg1-x530.google.com with SMTP id z6so1390304pgk.0
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 06:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=celestica.com; s=google-201810;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3e3Zfi64909dwW6sNuzFtRBB0paob3pfTKMROYjvonI=;
 b=SR9MR9z9Q3SDhDsrCJ7m/vryTDpZ4DMyMR6mh3d22PNdRyBWlKlWyO7Wy4zDmbqNvN
 os1aPtwygy4ZTPPoaicWcCqS9yuHXiS4zbRSUaDcJMtfiLSpkLhSEXa93fyJ48pGYBmb
 BesIHn2FqMj9tJWZcd8izo8F7Qu5aptl8LKonD+jCOh8QpApByIw2NlEsAqCdt4ct0pp
 OzSthKKwtB1ONC/y4xRyXqMwyCirYXyHH5OnUKgSVXRrtuZiP25iUDX7lTE2NLdqC1a0
 ubMmfwwqII/bFGijvkW7Af1twTJ9bWfRL8Ls+tyZ7XTBqB5FBYRDiD5WtrYX1kqYRYuu
 kjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3e3Zfi64909dwW6sNuzFtRBB0paob3pfTKMROYjvonI=;
 b=iNDdVoEFfcQ06LHd2dScT/a/PgGOmuil7jTGMaQIUef+fUfMqQrd4FM5HYqPrSSXqw
 uoK778lHrTOmqDZB7Hdb5O3cHqpPIgglnxQpdW7Py2AZo+UEsxqCTVijg76NPou0WZIs
 GbSmZwlFAaD6h+JOcIwgGjlWWS7Nn7Cr+aYR9RQNqF0+3xqjfJBiKZTZkDfBM0difR+o
 FHUp5EQrkDq2ppIhRyfE5JZ/2/C3ryvUEd/OgcX/Lu3rhnkt0cGaziyZvQvoQSnHs5No
 AAptl06CHJvM1QSVWDsdTniVsWUvYt0zaWna8FzY0Yrv/shfdPFaaUVgfMz2AqoXto9s
 fBWA==
X-Gm-Message-State: AO0yUKUQqrkHe4RGhuHp88gNgKVJOMWsXKhwYsJaB3PsmZhMtJQ7luwy
 LV0dzNOwL6co1kCdP49KjNblWKPAGr9sy7M8Fci9usiz01yGqTLoferha8gCGZPHdpE77q/u5YZ
 Zu2xANjpcoZ0lK1tzPWvcjdKFwdrXf5Xsg/YAdZmk3Ud/K42xAyFU79FLgCh7J64khqJu+5g4A9
 yLBkJ1WYvnoERpD3iRXGZfd+bR2oMnvhWgMQ==
X-Google-Smtp-Source: AK7set9KGJu4k9nKLHcly0B7lgxAIR4lFdEOZQnVDaAIDQK20p4cUrC9u6ttRsA2oV3dtAgyAJVQdWfKAkvLOSNx8YE=
X-Received: by 2002:a63:ad4e:0:b0:4fc:28a9:a40b with SMTP id
 y14-20020a63ad4e000000b004fc28a9a40bmr14093pgo.98.1676557434376; Thu, 16 Feb
 2023 06:23:54 -0800 (PST)
MIME-Version: 1.0
References: <167636845806.2107.2382940753543768501-2@git.sr.ht>
 <9a5b9e5a-ed67-e2b3-ddda-56220e40c00a@kaod.org>
 <Y+1B43hQU4Zi/ABz@pdel-mbp.dhcp.thefacebook.com>
In-Reply-To: <Y+1B43hQU4Zi/ABz@pdel-mbp.dhcp.thefacebook.com>
From: Sittisak Sinprem <ssinprem@celestica.com>
Date: Thu, 16 Feb 2023 21:23:27 +0700
Message-ID: <CAE+aGtX0o3MZGk6h4N-nGOpNZFATYe1vc_KOKgJpt0PohOnbrw@mail.gmail.com>
Subject: Re: [PATCH qemu 2/2] aspeed/fuji : correct the eeprom size
To: Peter Delevoryas <peter@pjd.dev>
Cc: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org, 
 qemu-stable@nongnu.org, srikanth@celestica.com, kgengan@celestica.com
Content-Type: multipart/alternative; boundary="00000000000052b4ba05f4d1f200"
X-CLS-Gapps: True
X-CLOUD-SEC-AV-Sent: true
X-CLOUD-SEC-AV-Info: celesticainc,google_mail,monitor
X-Gm-Spam: 0
X-Gm-Phishy: 0
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=ssinprem@celestica.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--00000000000052b4ba05f4d1f200
Content-Type: text/plain; charset="UTF-8"

From: Sittisak Sinprem <ssinprem@celestca.com>

Device 24C64 the size is 64 kilobits = 8kilobyte
Device 24C02 the size is 2 kilobits = 256byte

Signed-off-by: Sittisak Sinprem <ssinprem@celestca.com>
---
 hw/arm/aspeed.c | 36 ++++++++++++++++++++----------------
 1 file changed, 20 insertions(+), 16 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 27dda58338..40f6076b44 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -840,42 +840,46 @@ static void fuji_bmc_i2c_init(AspeedMachineState *bmc)
     i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4c);
     i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4d);

-    at24c_eeprom_init(i2c[19], 0x52, 64 * KiB);
-    at24c_eeprom_init(i2c[20], 0x50, 2 * KiB);
-    at24c_eeprom_init(i2c[22], 0x52, 2 * KiB);
+    /*
+    * EEPROM 24c64 size is 64Kbits or 8 Kbytes
+    *        24c02 size is 2Kbits or 256 bytes
+    */
+    at24c_eeprom_init(i2c[19], 0x52, 8 * KiB);
+    at24c_eeprom_init(i2c[20], 0x50, 256);
+    at24c_eeprom_init(i2c[22], 0x52, 256);

     i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x48);
     i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x49);
     i2c_slave_create_simple(i2c[3], TYPE_LM75, 0x4a);
     i2c_slave_create_simple(i2c[3], TYPE_TMP422, 0x4c);

-    at24c_eeprom_init(i2c[8], 0x51, 64 * KiB);
+    at24c_eeprom_init(i2c[8], 0x51, 8 * KiB);
     i2c_slave_create_simple(i2c[8], TYPE_LM75, 0x4a);

     i2c_slave_create_simple(i2c[50], TYPE_LM75, 0x4c);
-    at24c_eeprom_init(i2c[50], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[50], 0x52, 8 * KiB);
     i2c_slave_create_simple(i2c[51], TYPE_TMP75, 0x48);
     i2c_slave_create_simple(i2c[52], TYPE_TMP75, 0x49);

     i2c_slave_create_simple(i2c[59], TYPE_TMP75, 0x48);
     i2c_slave_create_simple(i2c[60], TYPE_TMP75, 0x49);

-    at24c_eeprom_init(i2c[65], 0x53, 64 * KiB);
+    at24c_eeprom_init(i2c[65], 0x53, 8 * KiB);
     i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x49);
     i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x48);
-    at24c_eeprom_init(i2c[68], 0x52, 64 * KiB);
-    at24c_eeprom_init(i2c[69], 0x52, 64 * KiB);
-    at24c_eeprom_init(i2c[70], 0x52, 64 * KiB);
-    at24c_eeprom_init(i2c[71], 0x52, 64 * KiB);
+    at24c_eeprom_init(i2c[68], 0x52, 8 * KiB);
+    at24c_eeprom_init(i2c[69], 0x52, 8 * KiB);
+    at24c_eeprom_init(i2c[70], 0x52, 8 * KiB);
+    at24c_eeprom_init(i2c[71], 0x52, 8 * KiB);

-    at24c_eeprom_init(i2c[73], 0x53, 64 * KiB);
+    at24c_eeprom_init(i2c[73], 0x53, 8 * KiB);
     i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x49);
     i2c_slave_create_simple(i2c[74], TYPE_TMP75, 0x48);
-    at24c_eeprom_init(i2c[76], 0x52, 64 * KiB);
-    at24c_eeprom_init(i2c[77], 0x52, 64 * KiB);
-    at24c_eeprom_init(i2c[78], 0x52, 64 * KiB);
-    at24c_eeprom_init(i2c[79], 0x52, 64 * KiB);
-    at24c_eeprom_init(i2c[28], 0x50, 2 * KiB);
+    at24c_eeprom_init(i2c[76], 0x52, 8 * KiB);
+    at24c_eeprom_init(i2c[77], 0x52, 8 * KiB);
+    at24c_eeprom_init(i2c[78], 0x52, 8 * KiB);
+    at24c_eeprom_init(i2c[79], 0x52, 8 * KiB);
+    at24c_eeprom_init(i2c[28], 0x50, 256);

     for (int i = 0; i < 8; i++) {
         at24c_eeprom_init(i2c[81 + i * 8], 0x56, 64 * KiB);
-- 
2.34.6

--00000000000052b4ba05f4d1f200
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:&quot;tr=
ebuchet ms&quot;,sans-serif;font-size:small;color:rgb(19,79,92)"><span styl=
e=3D"font-family:Arial,Helvetica,sans-serif;color:rgb(34,34,34)">From: Sitt=
isak Sinprem &lt;</span><a href=3D"mailto:ssinprem@celestca.com" target=3D"=
_blank" style=3D"font-family:Arial,Helvetica,sans-serif">ssinprem@celestca.=
com</a><span style=3D"font-family:Arial,Helvetica,sans-serif;color:rgb(34,3=
4,34)">&gt;</span></div><br>Device 24C64 the size is 64 kilobits =3D 8kilob=
yte<br>Device 24C02 the size is 2 kilobits =3D 256byte<br><br>Signed-off-by=
: Sittisak Sinprem &lt;<a href=3D"mailto:ssinprem@celestca.com">ssinprem@ce=
lestca.com</a>&gt;<br>---<br>=C2=A0hw/arm/aspeed.c | 36 +++++++++++++++++++=
+----------------<br>=C2=A01 file changed, 20 insertions(+), 16 deletions(-=
)<br><br>diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c<br>index 27dda58338=
..40f6076b44 100644<br>--- a/hw/arm/aspeed.c<br>+++ b/hw/arm/aspeed.c<br>@@=
 -840,42 +840,46 @@ static void fuji_bmc_i2c_init(AspeedMachineState *bmc)<=
br>=C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4c);<b=
r>=C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(i2c[17], TYPE_LM75, 0x4d);<br=
>=C2=A0<br>- =C2=A0 =C2=A0at24c_eeprom_init(i2c[19], 0x52, 64 * KiB);<br>- =
=C2=A0 =C2=A0at24c_eeprom_init(i2c[20], 0x50, 2 * KiB);<br>- =C2=A0 =C2=A0a=
t24c_eeprom_init(i2c[22], 0x52, 2 * KiB);<br>+ =C2=A0 =C2=A0/*<br>+ =C2=A0 =
=C2=A0* EEPROM 24c64 size is 64Kbits or 8 Kbytes<br>+ =C2=A0 =C2=A0* =C2=A0=
 =C2=A0 =C2=A0 =C2=A024c02 size is 2Kbits or 256 bytes<br>+ =C2=A0 =C2=A0*/=
<br>+ =C2=A0 =C2=A0at24c_eeprom_init(i2c[19], 0x52, 8 * KiB);<br>+ =C2=A0 =
=C2=A0at24c_eeprom_init(i2c[20], 0x50, 256);<br>+ =C2=A0 =C2=A0at24c_eeprom=
_init(i2c[22], 0x52, 256);<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0i2c_slave_creat=
e_simple(i2c[3], TYPE_LM75, 0x48);<br>=C2=A0 =C2=A0 =C2=A0i2c_slave_create_=
simple(i2c[3], TYPE_LM75, 0x49);<br>=C2=A0 =C2=A0 =C2=A0i2c_slave_create_si=
mple(i2c[3], TYPE_LM75, 0x4a);<br>=C2=A0 =C2=A0 =C2=A0i2c_slave_create_simp=
le(i2c[3], TYPE_TMP422, 0x4c);<br>=C2=A0<br>- =C2=A0 =C2=A0at24c_eeprom_ini=
t(i2c[8], 0x51, 64 * KiB);<br>+ =C2=A0 =C2=A0at24c_eeprom_init(i2c[8], 0x51=
, 8 * KiB);<br>=C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(i2c[8], TYPE_LM7=
5, 0x4a);<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(i2c[50],=
 TYPE_LM75, 0x4c);<br>- =C2=A0 =C2=A0at24c_eeprom_init(i2c[50], 0x52, 64 * =
KiB);<br>+ =C2=A0 =C2=A0at24c_eeprom_init(i2c[50], 0x52, 8 * KiB);<br>=C2=
=A0 =C2=A0 =C2=A0i2c_slave_create_simple(i2c[51], TYPE_TMP75, 0x48);<br>=C2=
=A0 =C2=A0 =C2=A0i2c_slave_create_simple(i2c[52], TYPE_TMP75, 0x49);<br>=C2=
=A0<br>=C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(i2c[59], TYPE_TMP75, 0x4=
8);<br>=C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(i2c[60], TYPE_TMP75, 0x4=
9);<br>=C2=A0<br>- =C2=A0 =C2=A0at24c_eeprom_init(i2c[65], 0x53, 64 * KiB);=
<br>+ =C2=A0 =C2=A0at24c_eeprom_init(i2c[65], 0x53, 8 * KiB);<br>=C2=A0 =C2=
=A0 =C2=A0i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x49);<br>=C2=A0 =C2=
=A0 =C2=A0i2c_slave_create_simple(i2c[66], TYPE_TMP75, 0x48);<br>- =C2=A0 =
=C2=A0at24c_eeprom_init(i2c[68], 0x52, 64 * KiB);<br>- =C2=A0 =C2=A0at24c_e=
eprom_init(i2c[69], 0x52, 64 * KiB);<br>- =C2=A0 =C2=A0at24c_eeprom_init(i2=
c[70], 0x52, 64 * KiB);<br>- =C2=A0 =C2=A0at24c_eeprom_init(i2c[71], 0x52, =
64 * KiB);<br>+ =C2=A0 =C2=A0at24c_eeprom_init(i2c[68], 0x52, 8 * KiB);<br>=
+ =C2=A0 =C2=A0at24c_eeprom_init(i2c[69], 0x52, 8 * KiB);<br>+ =C2=A0 =C2=
=A0at24c_eeprom_init(i2c[70], 0x52, 8 * KiB);<br>+ =C2=A0 =C2=A0at24c_eepro=
m_init(i2c[71], 0x52, 8 * KiB);<br>=C2=A0<br>- =C2=A0 =C2=A0at24c_eeprom_in=
it(i2c[73], 0x53, 64 * KiB);<br>+ =C2=A0 =C2=A0at24c_eeprom_init(i2c[73], 0=
x53, 8 * KiB);<br>=C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(i2c[74], TYPE=
_TMP75, 0x49);<br>=C2=A0 =C2=A0 =C2=A0i2c_slave_create_simple(i2c[74], TYPE=
_TMP75, 0x48);<br>- =C2=A0 =C2=A0at24c_eeprom_init(i2c[76], 0x52, 64 * KiB)=
;<br>- =C2=A0 =C2=A0at24c_eeprom_init(i2c[77], 0x52, 64 * KiB);<br>- =C2=A0=
 =C2=A0at24c_eeprom_init(i2c[78], 0x52, 64 * KiB);<br>- =C2=A0 =C2=A0at24c_=
eeprom_init(i2c[79], 0x52, 64 * KiB);<br>- =C2=A0 =C2=A0at24c_eeprom_init(i=
2c[28], 0x50, 2 * KiB);<br>+ =C2=A0 =C2=A0at24c_eeprom_init(i2c[76], 0x52, =
8 * KiB);<br>+ =C2=A0 =C2=A0at24c_eeprom_init(i2c[77], 0x52, 8 * KiB);<br>+=
 =C2=A0 =C2=A0at24c_eeprom_init(i2c[78], 0x52, 8 * KiB);<br>+ =C2=A0 =C2=A0=
at24c_eeprom_init(i2c[79], 0x52, 8 * KiB);<br>+ =C2=A0 =C2=A0at24c_eeprom_i=
nit(i2c[28], 0x50, 256);<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0for (int i =3D 0;=
 i &lt; 8; i++) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0at24c_eeprom_init(i2=
c[81 + i * 8], 0x56, 64 * KiB);<br>-- <br>2.34.6<br><br></div>

--00000000000052b4ba05f4d1f200--

