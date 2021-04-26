Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCD636B111
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 11:52:49 +0200 (CEST)
Received: from localhost ([::1]:41760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laxv6-0000Xe-Mh
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 05:52:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgenfv@gmail.com>) id 1laxtZ-0008Tf-2O
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 05:51:13 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:33337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgenfv@gmail.com>) id 1laxtQ-0002t7-4B
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 05:51:08 -0400
Received: by mail-lf1-x129.google.com with SMTP id j4so47867840lfp.0
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 02:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=W9ducklh3cupUiFGTHDjIlY9QtuLFEWSc7SmNVsPDEQ=;
 b=t9ybUyPv0TKbh192zM6PM2/RIU1GkbCmibQkm/EUqGVYgCuEN/5mMMvtO5T55ekxjV
 gL1X3SbWdFbAnd/jIvbeJWIit3PpiDlNLGv2xFTbZR6MVxXkT9yymcYRrwdbAWvrWy8X
 JNmcK8ambTJs96nK3qT8Je7FATTw/yJVXQgFfv7rqXYzh/sFwHWX6s0RlVlsU3GG7yp4
 liailOLkDfdMb6beAGFYDn1ZmprZsyyF/Qx1R7IQ6lf2+0LLftwrfHpYzKAoj9bN7lMQ
 0VRVNRk3aIaasE+e3k/8s2vdC2mkDkWN225OdfTARRTl3txDDyS3Etajqi+2PrAmq+8G
 lVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=W9ducklh3cupUiFGTHDjIlY9QtuLFEWSc7SmNVsPDEQ=;
 b=rP+L4Fmo2gyoZt5u/ZW5V8IME/7/Zl911ONVse9a70WdH5D7LNU+Alz9CsCZyRUZD6
 rbTQh6gPmL/TQUoJfdd5zT0SVKaYkciUTEGNg3VN+WIg7LAWOZXUhTLf6XRx3IDLNqGl
 9KxqPR97XELm5kz/LXzNcZy0nYWeLTKO9/7V3WT818Y9GINlrylfXEhogykRDMMBs2/h
 KFcR/eWgFVv5aU2Lc/SwtDsQ+nVJdAhjcAwlMRRXzshvGEslqKlveXjGnr/aTaXAtAMq
 HYxbGW4NHuWzzfaQ1HHOUhTK/nqb1MfIYgm7B0Z/D5NxQnukeL2pXbxwk2mo6T8aXNJO
 h+yA==
X-Gm-Message-State: AOAM530VrV8WXX/ip1oC89phA79pPkUkJGsEJWIl6PH1W5PsptmcviMm
 XWCTkWzP4xjxZEppmA6LGPgfw0Zp+stP2W+CbiRKwVsXcJU1dljp
X-Google-Smtp-Source: ABdhPJw6QRmbktPLbNlY64NDC9jHTrU4+qxktuKge0Y3wUk4TCsVZIOc/QZhNqcNcGlAeXtwv6sFaJWeldtlcEg7Pl0=
X-Received: by 2002:a19:ad4a:: with SMTP id s10mr1692764lfd.345.1619430661977; 
 Mon, 26 Apr 2021 02:51:01 -0700 (PDT)
MIME-Version: 1.0
From: Edge NFV <edgenfv@gmail.com>
Date: Mon, 26 Apr 2021 10:50:16 +0100
Message-ID: <CAED3YRr-8ACi5FzsHy8AtijTMMS68aDW2sE1Qy5kmexkhGvETQ@mail.gmail.com>
Subject: [PATCH] make vfio and DAX cache work together
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000005878dd05c0dd15bf"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=edgenfv@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005878dd05c0dd15bf
Content-Type: text/plain; charset="UTF-8"

 Signed-off-by: Edge NFV <edgenfv@gmail.com>
---
 hw/vfio/common.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index ae5654fcdb..83e15bf7a3 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -668,6 +668,15 @@ static void vfio_listener_region_add(MemoryListener
*listener,
                 int128_get64(int128_sub(section->size, int128_one())));
         return;
     }
+
+    /* Do not add virtio fs cache section */
+    if (!strcmp(memory_region_name(section->mr), "virtio-fs-cache")) {
+        trace_vfio_listener_region_add_skip(
+                section->offset_within_address_space,
+                section->offset_within_address_space +
+                int128_get64(int128_sub(section->size, int128_one())));
+        return;
+    }

     if (unlikely((section->offset_within_address_space &
                   ~qemu_real_host_page_mask) !=
-- 
2.25.1

--0000000000005878dd05c0dd15bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">
Signed-off-by: Edge NFV &lt;<a href=3D"mailto:edgenfv@gmail.com" target=3D"=
_blank">edgenfv@gmail.com</a>&gt;<br>
---<br>
=C2=A0hw/vfio/common.c | 9 +++++++++<br>
=C2=A01 file changed, 9 insertions(+)<br>
<br>
diff --git a/hw/vfio/common.c b/hw/vfio/common.c<br>
index ae5654fcdb..83e15bf7a3 100644<br>
--- a/hw/vfio/common.c<br>
+++ b/hw/vfio/common.c<br>
@@ -668,6 +668,15 @@ static void vfio_listener_region_add(MemoryListener *l=
istener,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int128_get64(=
int128_sub(section-&gt;size, int128_one())));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 /* Do not add virtio fs cache section */=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <br>
+=C2=A0 =C2=A0 if (!strcmp(memory_region_name(section-&gt;mr), &quot;virtio=
-fs-cache&quot;)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 trace_vfio_listener_region_add_skip(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 section-&gt;offset=
_within_address_space,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 section-&gt;offset=
_within_address_space +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int128_get64(int12=
8_sub(section-&gt;size, int128_one())));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }=C2=A0 <br>
<br>
=C2=A0 =C2=A0 =C2=A0if (unlikely((section-&gt;offset_within_address_space &=
amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~qemu_=
real_host_page_mask) !=3D<font color=3D"#888888"><br>
-- <br>
2.25.1</font>

</div>

--0000000000005878dd05c0dd15bf--

