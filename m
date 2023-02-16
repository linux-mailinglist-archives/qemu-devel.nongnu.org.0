Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D794F699763
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:28:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfEn-00043R-4i; Thu, 16 Feb 2023 09:27:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ssinprem@celestica.com>)
 id 1pSfEl-00043A-8q
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:27:51 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ssinprem@celestica.com>)
 id 1pSfEj-0000mA-C2
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:27:51 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 f16-20020a17090a9b1000b0023058bbd7b2so2351394pjp.0
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 06:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=celestica.com; s=google-201810;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n7sEmgVeI+QLCj3lYLkto320Y8QhCrVw7YfvtzeeLzQ=;
 b=if1YOJlwiqCyLbwVaQHftwBNMz2qFpDcjrqanKCl9tink9YdMN40/tPvigvvvx7mIC
 dQHrVKU99CAqzQnwA/HkFJzITJDWzikSHjHp5PHYNBTu+wrf0H1tpqlZWIWxOl8VShXX
 dsevfR9v7aMtNlEy7bTfpoxjm3bIxshtDI40V1yVSliF6GzwoOypZ6FjDW9Jx0PIqH8e
 /a//KWfWi0j4fZlB6xlfQGUa9/V5+BkHKbAOAqMfoqvacxFDo0kp4Vt/H8Bsvp8VVaXs
 vqlzw95ITSo1Np4XIfUwcXkEnM5JI/x4n6hoUd2kQLP5Q+e8eiE3fmH62nC9qUjEBnv9
 L7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n7sEmgVeI+QLCj3lYLkto320Y8QhCrVw7YfvtzeeLzQ=;
 b=Y2p/l1B0/CHw1ITm7agKoJ5vDck5ld19ftiPbN5R9zGjmxPDkLX96SRlL8rildDeMh
 88XMMSpx/9nLMejJi63LXrNU1YvSSZEgcIt41jjGlneKgoBVdsoLAU2aqzvpOjDxKTUb
 mTM25hMGPdodEgUWTqOnrDn8cNaTd0oaZQ97E1Wh1ym1+p/rtXvWbyhi1+Q1ys9e8v7g
 XRfne916Gu5JMpseIya8fDVkfQuknC/TMsws0TPBZCL9djf0+Tl72OAYy4Z6S1ZFxJmU
 9wKJrtYwCaEGr7DY2BMTNjW7NagetpF460DHc/7DpLSgqywM4fiZPUGZ4rhNnLjX8OfT
 dLJg==
X-Gm-Message-State: AO0yUKWBu8BMb5QfICpfVtaZC8OYB71XQHEN2tpiFLeswdqrdwkBktna
 REkg2VtOJQTHAJHCx0DYn3Ii05b/l+SPSjIaUlgsVlm2hG/PQKvhn4kldsdNKdvWUmc22zicGNv
 gOoeQMS6ZI8Cy85JxMzWe9IuMTneUnz8bT5mQou/wgf6n0dFoqwmbv6sIbgNkuj83Rw4L1V6D5H
 OOqr/lVF+I+O70t3cbUeEubjksZk+AwzddqDO/HXra0yaBD0g=
X-Google-Smtp-Source: AK7set+HKW/HKZTMBZdR2FsyJ7gVz3C2IzZxePzsaY1jtSvjd7IYcnxK8DrebvoM5R6UKRYHFTo+G3pcDALZF0F3rug=
X-Received: by 2002:a17:90b:4f41:b0:233:b04f:4e65 with SMTP id
 pj1-20020a17090b4f4100b00233b04f4e65mr645013pjb.43.1676557666768; Thu, 16 Feb
 2023 06:27:46 -0800 (PST)
MIME-Version: 1.0
References: <167636845806.2107.2382940753543768501-1@git.sr.ht>
 <0f69bfe5-3c49-c072-833c-24e19b91ad1b@linaro.org>
 <CAE+aGtXvEzbKBcnDxTGBVAm+i9t6TN0dX6CEocv2-Napzooe=Q@mail.gmail.com>
In-Reply-To: <CAE+aGtXvEzbKBcnDxTGBVAm+i9t6TN0dX6CEocv2-Napzooe=Q@mail.gmail.com>
From: Sittisak Sinprem <ssinprem@celestica.com>
Date: Thu, 16 Feb 2023 21:27:19 +0700
Message-ID: <CAE+aGtVk5R2yZw4_CSLcuX2Ep8hhpq5=s-D4GG5N76Fu7aqQfA@mail.gmail.com>
Subject: Re: [PATCH qemu 1/2] hw/at24c : modify at24c to support 1 byte
 address mode
To: qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-stable@nongnu.org, srikanth@celestica.com, kgengan@celestica.com
Content-Type: multipart/alternative; boundary="0000000000002cdab705f4d200f2"
X-CLS-Gapps: True
X-CLOUD-SEC-AV-Sent: true
X-CLOUD-SEC-AV-Info: celesticainc,google_mail,monitor
X-Gm-Spam: 0
X-Gm-Phishy: 0
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=ssinprem@celestica.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

--0000000000002cdab705f4d200f2
Content-Type: text/plain; charset="UTF-8"

From: Sittisak Sinprem <ssinprem@celestca.com>

Signed-off-by: Sittisak Sinprem <ssinprem@celestca.com>
---
 hw/nvram/eeprom_at24c.c | 46 +++++++++++++++++++++++++++++------------
 1 file changed, 33 insertions(+), 13 deletions(-)

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index 3328c32814..0cb650d635 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -41,6 +41,12 @@ struct EEPROMState {
     uint16_t cur;
     /* total size in bytes */
     uint32_t rsize;
+    /* address byte number
+     *  for  24c01, 24c02 size <= 256 byte, use only 1 byte
+     *  otherwise size > 256, use 2 byte
+     */
+    uint8_t asize;
+
     bool writable;
     /* cells changed since last START? */
     bool changed;
@@ -91,7 +97,7 @@ uint8_t at24c_eeprom_recv(I2CSlave *s)
     EEPROMState *ee = AT24C_EE(s);
     uint8_t ret;

-    if (ee->haveaddr == 1) {
+    if (ee->haveaddr > 0 && ee->haveaddr < ee->asize) {
         return 0xff;
     }

@@ -108,11 +114,11 @@ int at24c_eeprom_send(I2CSlave *s, uint8_t data)
 {
     EEPROMState *ee = AT24C_EE(s);

-    if (ee->haveaddr < 2) {
+    if (ee->haveaddr < ee->asize) {
         ee->cur <<= 8;
         ee->cur |= data;
         ee->haveaddr++;
-        if (ee->haveaddr == 2) {
+        if (ee->haveaddr == ee->asize) {
             ee->cur %= ee->rsize;
             DPRINTK("Set pointer %04x\n", ee->cur);
         }
@@ -184,6 +190,29 @@ static void at24c_eeprom_realize(DeviceState *dev,
Error **errp)
     }

     ee->mem = g_malloc0(ee->rsize);
+
+    /*
+     * If address size didn't define with property set
+     *  setting it from Rom size
+     */
+    if (ee->asize == 0) {
+        if (ee->rsize <= 256) {
+            ee->asize = 1;
+        } else {
+            ee->asize = 2;
+        }
+    }
+}
+
+static
+void at24c_eeprom_reset(DeviceState *state)
+{
+    EEPROMState *ee = AT24C_EE(state);
+
+    ee->changed = false;
+    ee->cur = 0;
+    ee->haveaddr = 0;
+
     memset(ee->mem, 0, ee->rsize);

     if (ee->init_rom) {
@@ -201,18 +230,9 @@ static void at24c_eeprom_realize(DeviceState *dev,
Error **errp)
     }
 }

-static
-void at24c_eeprom_reset(DeviceState *state)
-{
-    EEPROMState *ee = AT24C_EE(state);
-
-    ee->changed = false;
-    ee->cur = 0;
-    ee->haveaddr = 0;
-}
-
 static Property at24c_eeprom_props[] = {
     DEFINE_PROP_UINT32("rom-size", EEPROMState, rsize, 0),
+    DEFINE_PROP_UINT8("address-size", EEPROMState, asize, 0),
     DEFINE_PROP_BOOL("writable", EEPROMState, writable, true),
     DEFINE_PROP_DRIVE("drive", EEPROMState, blk),
     DEFINE_PROP_END_OF_LIST()
-- 
2.34.6

--0000000000002cdab705f4d200f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div class=3D"gmail_default" st=
yle=3D"font-size:small;color:rgb(19,79,92)"><font face=3D"trebuchet ms, san=
s-serif"></font><span style=3D"color:rgb(34,34,34)"><font face=3D"arial, sa=
ns-serif">From: Sittisak Sinprem &lt;<a href=3D"mailto:ssinprem@celestca.co=
m">ssinprem@celestca.com</a>&gt;</font></span></div><font face=3D"arial, sa=
ns-serif"><br>Signed-off-by: Sittisak Sinprem &lt;<a href=3D"mailto:ssinpre=
m@celestca.com">ssinprem@celestca.com</a>&gt;<br>---<br>=C2=A0hw/nvram/eepr=
om_at24c.c | 46 +++++++++++++++++++++++++++++------------<br>=C2=A01 file c=
hanged, 33 insertions(+), 13 deletions(-)<br><br>diff --git a/hw/nvram/eepr=
om_at24c.c b/hw/nvram/eeprom_at24c.c<br>index 3328c32814..0cb650d635 100644=
<br>--- a/hw/nvram/eeprom_at24c.c<br>+++ b/hw/nvram/eeprom_at24c.c<br>@@ -4=
1,6 +41,12 @@ struct EEPROMState {<br>=C2=A0 =C2=A0 =C2=A0uint16_t cur;<br>=
=C2=A0 =C2=A0 =C2=A0/* total size in bytes */<br>=C2=A0 =C2=A0 =C2=A0uint32=
_t rsize;<br>+ =C2=A0 =C2=A0/* address byte number <br>+ =C2=A0 =C2=A0 * =
=C2=A0for =C2=A024c01, 24c02 size &lt;=3D 256 byte, use only 1 byte<br>+ =
=C2=A0 =C2=A0 * =C2=A0otherwise size &gt; 256, use 2 byte<br>+ =C2=A0 =C2=
=A0 */<br>+ =C2=A0 =C2=A0uint8_t asize;<br>+<br>=C2=A0 =C2=A0 =C2=A0bool wr=
itable;<br>=C2=A0 =C2=A0 =C2=A0/* cells changed since last START? */<br>=C2=
=A0 =C2=A0 =C2=A0bool changed;<br>@@ -91,7 +97,7 @@ uint8_t at24c_eeprom_re=
cv(I2CSlave *s)<br>=C2=A0 =C2=A0 =C2=A0EEPROMState *ee =3D AT24C_EE(s);<br>=
=C2=A0 =C2=A0 =C2=A0uint8_t ret;<br>=C2=A0<br>- =C2=A0 =C2=A0if (ee-&gt;hav=
eaddr =3D=3D 1) {<br>+ =C2=A0 =C2=A0if (ee-&gt;haveaddr &gt; 0 &amp;&amp; e=
e-&gt;haveaddr &lt; ee-&gt;asize) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0re=
turn 0xff;<br>=C2=A0 =C2=A0 =C2=A0}<br>=C2=A0<br>@@ -108,11 +114,11 @@ int =
at24c_eeprom_send(I2CSlave *s, uint8_t data)<br>=C2=A0{<br>=C2=A0 =C2=A0 =
=C2=A0EEPROMState *ee =3D AT24C_EE(s);<br>=C2=A0<br>- =C2=A0 =C2=A0if (ee-&=
gt;haveaddr &lt; 2) {<br>+ =C2=A0 =C2=A0if (ee-&gt;haveaddr &lt; ee-&gt;asi=
ze) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ee-&gt;cur &lt;&lt;=3D 8;<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ee-&gt;cur |=3D data;<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ee-&gt;haveaddr++;<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ee-=
&gt;haveaddr =3D=3D 2) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ee-&gt;haveadd=
r =3D=3D ee-&gt;asize) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0ee-&gt;cur %=3D ee-&gt;rsize;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0DPRINTK(&quot;Set pointer %04x\n&quot;, ee-&gt;cur);<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>@@ -184,6 +190,29 @@ static void at24c_eepr=
om_realize(DeviceState *dev, Error **errp)<br>=C2=A0 =C2=A0 =C2=A0}<br>=C2=
=A0<br>=C2=A0 =C2=A0 =C2=A0ee-&gt;mem =3D g_malloc0(ee-&gt;rsize);<br>+<br>=
+ =C2=A0 =C2=A0/*<br>+ =C2=A0 =C2=A0 * If address size didn&#39;t define wi=
th property set<br>+ =C2=A0 =C2=A0 * =C2=A0setting it from Rom size<br>+ =
=C2=A0 =C2=A0 */<br>+ =C2=A0 =C2=A0if (ee-&gt;asize =3D=3D 0) {<br>+ =C2=A0=
 =C2=A0 =C2=A0 =C2=A0if (ee-&gt;rsize &lt;=3D 256) {<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0ee-&gt;asize =3D 1;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0} else {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ee-&gt;asize =3D =
2;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0}<br>+}<br>+<br>+sta=
tic<br>+void at24c_eeprom_reset(DeviceState *state)<br>+{<br>+ =C2=A0 =C2=
=A0EEPROMState *ee =3D AT24C_EE(state);<br>+<br>+ =C2=A0 =C2=A0ee-&gt;chang=
ed =3D false;<br>+ =C2=A0 =C2=A0ee-&gt;cur =3D 0;<br>+ =C2=A0 =C2=A0ee-&gt;=
haveaddr =3D 0;<br>+<br>=C2=A0 =C2=A0 =C2=A0memset(ee-&gt;mem, 0, ee-&gt;rs=
ize);<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0if (ee-&gt;init_rom) {<br>@@ -201,18=
 +230,9 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)=
<br>=C2=A0 =C2=A0 =C2=A0}<br>=C2=A0}<br>=C2=A0<br>-static<br>-void at24c_ee=
prom_reset(DeviceState *state)<br>-{<br>- =C2=A0 =C2=A0EEPROMState *ee =3D =
AT24C_EE(state);<br>-<br>- =C2=A0 =C2=A0ee-&gt;changed =3D false;<br>- =C2=
=A0 =C2=A0ee-&gt;cur =3D 0;<br>- =C2=A0 =C2=A0ee-&gt;haveaddr =3D 0;<br>-}<=
br>-<br>=C2=A0static Property at24c_eeprom_props[] =3D {<br>=C2=A0 =C2=A0 =
=C2=A0DEFINE_PROP_UINT32(&quot;rom-size&quot;, EEPROMState, rsize, 0),<br>+=
 =C2=A0 =C2=A0DEFINE_PROP_UINT8(&quot;address-size&quot;, EEPROMState, asiz=
e, 0),<br>=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;writable&quot;, EEPROM=
State, writable, true),<br>=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_DRIVE(&quot;driv=
e&quot;, EEPROMState, blk),<br>=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_END_OF_LIST(=
)<br>-- <br></font><div class=3D"gmail_default" style=3D"font-size:small;co=
lor:rgb(19,79,92)"><span style=3D"color:rgb(34,34,34)"><font face=3D"arial,=
 sans-serif">2.34.6</font></span><font face=3D"trebuchet ms, sans-serif"></=
font></div><br><br></div></div>

--0000000000002cdab705f4d200f2--

