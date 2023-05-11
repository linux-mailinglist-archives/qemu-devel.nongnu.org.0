Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06ABB6FFAF0
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 21:59:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxCQl-0008PV-3l; Thu, 11 May 2023 15:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tmaillart@freebox.fr>)
 id 1pxCQi-0008P1-Dd
 for qemu-devel@nongnu.org; Thu, 11 May 2023 15:58:24 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tmaillart@freebox.fr>)
 id 1pxCQf-0002s9-Q7
 for qemu-devel@nongnu.org; Thu, 11 May 2023 15:58:24 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-9661a1ff1e9so1038285066b.1
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 12:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=freebox-fr.20221208.gappssmtp.com; s=20221208; t=1683835099; x=1686427099;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fLVZd2PllTd3Bi/AScF3rmiMir5PSyUKlvplXULfff8=;
 b=XPMdr6PFmGw4bYL91FWFsV3gKocglWIU9h6dmSjRolQRsrYyQYfHVcXvzGpNEU3qPi
 658Rlq49R+kziTGEzNN+YFzmH0eLn0YEQ7aploARQZwHE6p2k90rQk5fJdGAo7AA5kj/
 5h3vLa6sUh5E6CNOCYm/CZbynq1yatp/y3bj2CqSZ2eKvHLTMd5VWlLpLiQPteZjwt77
 /4MxgGPx3iClQFpTHXOHSY26sxJ6ecAl9ym9Fnf8oOfIpPDsGaiO/A9OymxViegTkLii
 zd4g3gmIdZTr8aH+A2Oac+9dGKm2Ke2+9HwBRp2l5mX9kexnKh4M+xwK/01E4jsD4t69
 MIng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683835099; x=1686427099;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fLVZd2PllTd3Bi/AScF3rmiMir5PSyUKlvplXULfff8=;
 b=WMwg9NQhaNGdz9P+sVuOA3DkZ0FjiB7aZo8FR8QRirGkWEvlTVnYCiw4R/5lcgnURx
 0cSn8ErjQcL2tBZR3IZRRdQLc9A/EXVx4dp8an2nwKYIXTJ9Vi1fqYJpKqk0e2tdGw1F
 wcWwuX2zgbJvnC4YfxrPkpubuyaiUDJRtOneRq8e5rUJx9XRU6u/jX23ItA/UZUBf4KS
 46F2GKaaiAZSlOqXvEmEzTRIiNDOLu9UC7iiNdcUs7yzOZvnH2L/7EHxxszIBBm61HFw
 /IKcjGQ9YjvtZ2+A40/HHnvEzSHmUkn8M4kI9TC5qhFcUtnMAq7WxZMkfDD4mwWm+jwu
 5+Eg==
X-Gm-Message-State: AC+VfDxCeKAqba2+o7PY7Tr5UsgPkz17hAFqtA6g9F3wU1xmTM79cqeB
 rLhmmeFMd/OGRnlxKYvNwSXw+Y1P3+8NJFMEK0R86Q==
X-Google-Smtp-Source: ACHHUZ7UzZw7h2GEyuiMHQUc3TdOgwnRErPClXyHcpsqf1MZalMcEK5q8E9E4F82c6p/ROXVz8GbPQ7A/0W4baBPeXk=
X-Received: by 2002:a17:907:ea2:b0:94f:8605:3f31 with SMTP id
 ho34-20020a1709070ea200b0094f86053f31mr24585904ejc.42.1683835099081; Thu, 11
 May 2023 12:58:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230426133747.403945-1-tmaillart@freebox.fr>
 <62e34905-91fc-6498-d228-faa37b26fd60@redhat.com>
 <CANDNypxOsD_HLC1Ad_MrGqUizsHgDmBv+zH3yEU6X=BXfNRi=w@mail.gmail.com>
 <22a98a39-ab70-01f4-712a-3fd358d1af57@redhat.com>
In-Reply-To: <22a98a39-ab70-01f4-712a-3fd358d1af57@redhat.com>
From: =?UTF-8?Q?Th=C3=A9o_Maillart?= <tmaillart@freebox.fr>
Date: Thu, 11 May 2023 21:58:08 +0200
Message-ID: <CANDNypwtcUC94YuyzY+4G94rmuQsN-YOBW9vpBrv8oK7SCz-pA@mail.gmail.com>
Subject: Re: [PATCH] scsi: check inquiry buffer length to prevent crash
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000f1123f05fb706898"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=tmaillart@freebox.fr; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

--000000000000f1123f05fb706898
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From 31fd9e07df62663e6fb427ce3e7e767e07cf7aeb Mon Sep 17 00:00:00 2001
From: =3D?UTF-8?q?Th=3DC3=3DA9o=3D20Maillart?=3D <tmaillart@freebox.fr>
Date: Wed, 26 Apr 2023 13:57:44 +0200
Subject: [PATCH] scsi: check inquiry buffer length to prevent crash
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

Using linux 6.x guest, at boot time, an inquiry makes qemu crash.

More precisely, linux version containing v5.18-rc1-157-gc92a6b5d6335.

Here is a trace of the scsi inquiry in question:

scsi_req_parsed target 1 lun 0 tag 0x2cffb48 command 18 dir 1 length 4
scsi_req_parsed_lba target 1 lun 0 tag 0x2cffb48 command 18 lba 110592
scsi_req_alloc target 1 lun 0 tag 0x2cffb48
scsi_inquiry target 1 lun 0 tag 0x2cffb48 page 0x01/0xb0
scsi_generic_send_command Command: data=3D 0x12 0x01 0xb0 0x00 0x04 0x00
scsi_req_continue target 1 lun 0 tag 0x2cffb48
scsi_generic_read_data scsi_read_data tag=3D0x2cffb48
scsi_generic_aio_sgio_command generic aio sgio: tag=3D0x2cffb48 cmd=3D0x12
timeout=3D30000
scsi_generic_read_complete Data ready tag=3D0x2cffb48 len=3D4
scsi_req_data target 1 lun 0 tag 0x2cffb48 len 4
scsi_req_continue target 1 lun 0 tag 0x2cffb48
scsi_generic_read_data scsi_read_data tag=3D0x2cffb48
scsi_generic_command_complete_noio Command complete 0x7fb0870b80
tag=3D0x2cffb48 status=3D0
scsi_req_dequeue target 1 lun 0 tag 0x2cffb48

And here is a backtrace from the crash:

 #0  0x0000007face68580 in a_crash () at ./src/internal/atomic.h:250
 #1  get_nominal_size (end=3D0x7f6758f92c "", p=3D0x7f6758f920 "") at
src/malloc/mallocng/meta.h:168
 #2  __libc_free (p=3D0x7f6758f920) at src/malloc/mallocng/free.c:110
 #3  0x0000005592f93ed8 in scsi_free_request (req=3D0x7fac2c6b50) at
../hw/scsi/scsi-generic.c:70
 #4  0x0000005592f869b8 in scsi_req_unref (req=3D0x7fac2c6b50) at
../hw/scsi/scsi-bus.c:1382
 #5  0x0000005592f94b7c in scsi_read_complete (opaque=3D0x7fac2c6b50, ret=
=3D0)
at ../hw/scsi/scsi-generic.c:354
 #6  0x0000005593659b90 in blk_aio_complete (acb=3D0x7f66c206a0) at
../block/block-backend.c:1527
 #7  0x000000559365a3c8 in blk_aio_ioctl_entry (opaque=3D0x7f66c206a0) at
../block/block-backend.c:1735
 #8  0x00000055937dee64 in coroutine_bootstrap (self=3D0x7f672f77e0,
co=3D0x7f672f77e0) at ../util/coroutine-sigaltstack.c:104
 #9  0x00000055937deed8 in coroutine_trampoline (signal=3D12) at
../util/coroutine-sigaltstack.c:145
 #10 <signal handler called>
 #11 __cp_end () at src/thread/aarch64/syscall_cp.s:30
 #12 0x0000007facea8214 in __syscall_cp_c (nr=3D133, u=3D<optimized out>,
v=3D<optimized out>, w=3D<optimized out>, x=3D<optimized out>,
     y=3D<optimized out>, z=3D<optimized out>) at src/thread/pthread_cancel=
.c:33
 #13 0x0000007facefa020 in ?? ()

Signed-off-by: Th=C3=A9o Maillart <tmaillart@freebox.fr>
---
 hw/scsi/scsi-generic.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c
index ac9fa662b4..13f01e311d 100644
--- a/hw/scsi/scsi-generic.c
+++ b/hw/scsi/scsi-generic.c
@@ -191,12 +191,24 @@ static int scsi_handle_inquiry_reply(SCSIGenericReq
*r, SCSIDevice *s, int len)
     if ((s->type =3D=3D TYPE_DISK || s->type =3D=3D TYPE_ZBC) &&
         (r->req.cmd.buf[1] & 0x01)) {
         page =3D r->req.cmd.buf[2];
-        if (page =3D=3D 0xb0) {
+        if (page =3D=3D 0xb0 && r->buflen > 8) {
             uint64_t max_transfer =3D calculate_max_transfer(s);
-            stl_be_p(&r->buf[8], max_transfer);
+            uint8_t buf[4];
+
+            stl_be_p(buf, max_transfer);
+            if (r->buflen <=3D 12) {
+                memcpy(&r->buf[8], buf, r->buflen - 8);
+                return len;
+            }
+            memcpy(&r->buf[8], buf, sizeof(uint32_t));
+
             /* Also take care of the opt xfer len. */
-            stl_be_p(&r->buf[12],
-                    MIN_NON_ZERO(max_transfer, ldl_be_p(&r->buf[12])));
+            stl_be_p(buf, MIN_NON_ZERO(max_transfer,
ldl_be_p(&r->buf[12])));
+            if (r->buflen <=3D 16) {
+                memcpy(&r->buf[12], buf, r->buflen - 12);
+                return len;
+            }
+            memcpy(&r->buf[12], buf, sizeof(uint32_t));
         } else if (s->needs_vpd_bl_emulation && page =3D=3D 0x00 && r->buf=
len
>=3D 4) {
             /*
              * Now we're capable of supplying the VPD Block Limits
--=20
2.40.0

--000000000000f1123f05fb706898
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">From 31fd9e07df62663e6fb427ce3e7e767e07cf7aeb Mon Sep 17 0=
0:00:00 2001<br>From: =3D?UTF-8?q?Th=3DC3=3DA9o=3D20Maillart?=3D &lt;<a hre=
f=3D"mailto:tmaillart@freebox.fr">tmaillart@freebox.fr</a>&gt;<br>Date: Wed=
, 26 Apr 2023 13:57:44 +0200<br>Subject: [PATCH] scsi: check inquiry buffer=
 length to prevent crash<br>MIME-Version: 1.0<br>Content-Type: text/plain; =
charset=3DUTF-8<br>Content-Transfer-Encoding: 8bit<br><br>Using linux 6.x g=
uest, at boot time, an inquiry makes qemu crash.<br><br>More precisely, lin=
ux version containing v5.18-rc1-157-gc92a6b5d6335.<br><br>Here is a trace o=
f the scsi inquiry in question:<br><br>scsi_req_parsed target 1 lun 0 tag 0=
x2cffb48 command 18 dir 1 length 4<br>scsi_req_parsed_lba target 1 lun 0 ta=
g 0x2cffb48 command 18 lba 110592<br>scsi_req_alloc target 1 lun 0 tag 0x2c=
ffb48<br>scsi_inquiry target 1 lun 0 tag 0x2cffb48 page 0x01/0xb0<br>scsi_g=
eneric_send_command Command: data=3D 0x12 0x01 0xb0 0x00 0x04 0x00<br>scsi_=
req_continue target 1 lun 0 tag 0x2cffb48<br>scsi_generic_read_data scsi_re=
ad_data tag=3D0x2cffb48<br>scsi_generic_aio_sgio_command generic aio sgio: =
tag=3D0x2cffb48 cmd=3D0x12 timeout=3D30000<br>scsi_generic_read_complete Da=
ta ready tag=3D0x2cffb48 len=3D4<br>scsi_req_data target 1 lun 0 tag 0x2cff=
b48 len 4<br>scsi_req_continue target 1 lun 0 tag 0x2cffb48<br>scsi_generic=
_read_data scsi_read_data tag=3D0x2cffb48<br>scsi_generic_command_complete_=
noio Command complete 0x7fb0870b80 tag=3D0x2cffb48 status=3D0<br>scsi_req_d=
equeue target 1 lun 0 tag 0x2cffb48<br><br>And here is a backtrace from the=
 crash:<br><br>=C2=A0#0 =C2=A00x0000007face68580 in a_crash () at ./src/int=
ernal/atomic.h:250<br>=C2=A0#1 =C2=A0get_nominal_size (end=3D0x7f6758f92c &=
quot;&quot;, p=3D0x7f6758f920 &quot;&quot;) at src/malloc/mallocng/meta.h:1=
68<br>=C2=A0#2 =C2=A0__libc_free (p=3D0x7f6758f920) at src/malloc/mallocng/=
free.c:110<br>=C2=A0#3 =C2=A00x0000005592f93ed8 in scsi_free_request (req=
=3D0x7fac2c6b50) at ../hw/scsi/scsi-generic.c:70<br>=C2=A0#4 =C2=A00x000000=
5592f869b8 in scsi_req_unref (req=3D0x7fac2c6b50) at ../hw/scsi/scsi-bus.c:=
1382<br>=C2=A0#5 =C2=A00x0000005592f94b7c in scsi_read_complete (opaque=3D0=
x7fac2c6b50, ret=3D0) at ../hw/scsi/scsi-generic.c:354<br>=C2=A0#6 =C2=A00x=
0000005593659b90 in blk_aio_complete (acb=3D0x7f66c206a0) at ../block/block=
-backend.c:1527<br>=C2=A0#7 =C2=A00x000000559365a3c8 in blk_aio_ioctl_entry=
 (opaque=3D0x7f66c206a0) at ../block/block-backend.c:1735<br>=C2=A0#8 =C2=
=A00x00000055937dee64 in coroutine_bootstrap (self=3D0x7f672f77e0, co=3D0x7=
f672f77e0) at ../util/coroutine-sigaltstack.c:104<br>=C2=A0#9 =C2=A00x00000=
055937deed8 in coroutine_trampoline (signal=3D12) at ../util/coroutine-siga=
ltstack.c:145<br>=C2=A0#10 &lt;signal handler called&gt;<br>=C2=A0#11 __cp_=
end () at src/thread/aarch64/syscall_cp.s:30<br>=C2=A0#12 0x0000007facea821=
4 in __syscall_cp_c (nr=3D133, u=3D&lt;optimized out&gt;, v=3D&lt;optimized=
 out&gt;, w=3D&lt;optimized out&gt;, x=3D&lt;optimized out&gt;,<br>=C2=A0 =
=C2=A0 =C2=A0y=3D&lt;optimized out&gt;, z=3D&lt;optimized out&gt;) at src/t=
hread/pthread_cancel.c:33<br>=C2=A0#13 0x0000007facefa020 in ?? ()<br><br>S=
igned-off-by: Th=C3=A9o Maillart &lt;<a href=3D"mailto:tmaillart@freebox.fr=
">tmaillart@freebox.fr</a>&gt;<br>---<br>=C2=A0hw/scsi/scsi-generic.c | 20 =
++++++++++++++++----<br>=C2=A01 file changed, 16 insertions(+), 4 deletions=
(-)<br><br>diff --git a/hw/scsi/scsi-generic.c b/hw/scsi/scsi-generic.c<br>=
index ac9fa662b4..13f01e311d 100644<br>--- a/hw/scsi/scsi-generic.c<br>+++ =
b/hw/scsi/scsi-generic.c<br>@@ -191,12 +191,24 @@ static int scsi_handle_in=
quiry_reply(SCSIGenericReq *r, SCSIDevice *s, int len)<br>=C2=A0 =C2=A0 =C2=
=A0if ((s-&gt;type =3D=3D TYPE_DISK || s-&gt;type =3D=3D TYPE_ZBC) &amp;&am=
p;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(r-&gt;req.cmd.buf[1] &amp; 0x01)) =
{<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0page =3D r-&gt;req.cmd.buf[2];<br>- =
=C2=A0 =C2=A0 =C2=A0 =C2=A0if (page =3D=3D 0xb0) {<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if (page =3D=3D 0xb0 &amp;&amp; r-&gt;buflen &gt; 8) {<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t max_transfer =3D calculat=
e_max_transfer(s);<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stl_be_p(&=
amp;r-&gt;buf[8], max_transfer);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0uint8_t buf[4];<br>+<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0st=
l_be_p(buf, max_transfer);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if=
 (r-&gt;buflen &lt;=3D 12) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0memcpy(&amp;r-&gt;buf[8], buf, r-&gt;buflen - 8);<br>+ =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return len;<br>+ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0memcpy(&amp;r-&gt;buf[8], buf, sizeof(uint32_t));<br>+<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Also take care of the opt xfer len=
. */<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stl_be_p(&amp;r-&gt;buf[=
12],<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0MIN_NON_ZERO(max_transfer, ldl_be_p(&amp;r-&gt;buf[12])));<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stl_be_p(buf, MIN_NON_ZERO(max_transf=
er, ldl_be_p(&amp;r-&gt;buf[12])));<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (r-&gt;buflen &lt;=3D 16) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0memcpy(&amp;r-&gt;buf[12], buf, r-&gt;buflen - 12);=
<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return len;<br=
>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0memcpy(&amp;r-&gt;buf[12], buf, sizeof(uint32_t));<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else if (s-&gt;needs_vpd_bl_emulation &amp=
;&amp; page =3D=3D 0x00 &amp;&amp; r-&gt;buflen &gt;=3D 4) {<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 * Now we&#39;re capable of supplying the VPD Block Limits=
<br>-- <br>2.40.0<br></div>

--000000000000f1123f05fb706898--

