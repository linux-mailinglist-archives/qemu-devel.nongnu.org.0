Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7EA36BCA6
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 02:27:57 +0200 (CEST)
Received: from localhost ([::1]:42234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbBa1-000802-1p
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 20:27:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dev.devaqemu@gmail.com>)
 id 1lb7mk-0000IR-KD; Mon, 26 Apr 2021 16:24:50 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:44692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dev.devaqemu@gmail.com>)
 id 1lb7mi-0004IO-6p; Mon, 26 Apr 2021 16:24:50 -0400
Received: by mail-ej1-x642.google.com with SMTP id r20so36610836ejo.11;
 Mon, 26 Apr 2021 13:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=3/pnjAsfsdQYyYXB1500nUPY2XLyWmJvYz/Zaza6Q4s=;
 b=BZJHXuyC+75WJ+G4bZbykW3TYq7lF5xX9o4LPkYRpFkQ+Z9g84BXdUPwxUyO1QdLsN
 3BIeA1MaGwQFiSZ/P3GHL4761OEfdu+WtUfRJZVL9Ek1KoYt7mPMGQXZE7ChyVRYEyDA
 3ztLXkLkoLwTA4K+SIV2NPlqxGjr3UJjn3SvRpYPnhreuvjO+cdBcF3g0iJlqqWbV8sK
 gz+K6Nm4ZOyNnGIYtXWDmxfCf+3zQ4bftngSf0sJSjUiVUWYGZNx2x94Oa5NxCzOcut4
 0IzBjtar+vX6X5Bfo80zUWjwfP3tB2IZ4+O6UmBdFrxUZRtayyUf/R2FoOTJwrmGNmK7
 FyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=3/pnjAsfsdQYyYXB1500nUPY2XLyWmJvYz/Zaza6Q4s=;
 b=ILosufi+3rBuaPWIivRuH2VaT8KJqnxUyHZ6RNzP4XtAhoM+TpmnpDgYHj41hWKMRv
 gXR0E5Nx19SyJVhN/rGyLTymd46rQq+sPBUekot08rZCgFVvMX4625zl0ItPMhfUYuOg
 MWoct5bY7ynv/ock7K7GPQ9ABrRjwxaFNbvkGl4KRYcHGvlTcKhvziDYraGk/Pv4AMPk
 qx9HYQrXgJvuvCBwjPVULV94iAZ4px9T5CT6jKDwt8p4wJZKP8uYRcjxPsmqwE5u+c2a
 b4p0CAz5t7p7VGP7XXXRDYBgXMymIQhwaAhsb+eU/eNVZd4rz1UEoYSSuPpCZNOwHRAo
 eFcQ==
X-Gm-Message-State: AOAM531k+Q8L1uDgKJZpHpDpL4MFKf3m/eT1nCYeZ4ECSSYnkbK5KRKL
 UWUUA4p8IRBCXJTqnOUEXXAWPgqj+tgumhNtGoS9co1erQcv6hJ7xD4=
X-Google-Smtp-Source: ABdhPJzAAH7cXozqzW3fR4vQhOAOo4h9iLcTn9OW9Qxy3TfhTsw7NXokxO6d/Sf5FaU7VNDvn85kUEFIoHy4LmgjYGg=
X-Received: by 2002:a17:906:c01a:: with SMTP id
 e26mr20594918ejz.300.1619468686353; 
 Mon, 26 Apr 2021 13:24:46 -0700 (PDT)
MIME-Version: 1.0
From: Dev Audsin <dev.devaqemu@gmail.com>
Date: Mon, 26 Apr 2021 21:24:01 +0100
Message-ID: <CANsN3OSXjVLUAfCn2H2NEW2EAn6_FCs9CXuNrnC+XGgzG=rSYg@mail.gmail.com>
Subject: [PATCH] skip virtio fs cache section to enable NIC pass through
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000c6691a05c0e5efe9"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=dev.devaqemu@gmail.com; helo=mail-ej1-x642.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 26 Apr 2021 20:21:43 -0400
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
Cc: qemu-trivial@nongnu.org, alex.williamson@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c6691a05c0e5efe9
Content-Type: text/plain; charset="UTF-8"

 Signed-off-by: Dev Audsin <dev.devaqemu@gmail.com>
---
 hw/vfio/common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 6ff1daa763..3af70238bd 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -541,7 +541,8 @@ static int vfio_host_win_del(VFIOContainer *container,
hwaddr min_iova,

 static bool vfio_listener_skipped_section(MemoryRegionSection *section)
 {
-    return (!memory_region_is_ram(section->mr) &&
+    return (!strcmp(memory_region_name(section->mr), "virtio-fs-cache")) ||
+          (!memory_region_is_ram(section->mr) &&
             !memory_region_is_iommu(section->mr)) ||
            /*
             * Sizing an enabled 64-bit BAR can cause spurious mappings to
-- 
2.25.1

--000000000000c6691a05c0e5efe9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">
Signed-off-by: Dev Audsin &lt;<a href=3D"mailto:dev.devaqemu@gmail.com" tar=
get=3D"_blank">dev.devaqemu@gmail.com</a>&gt;<br>
---<br>
=C2=A0hw/vfio/common.c | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/hw/vfio/common.c b/hw/vfio/common.c<br>
index 6ff1daa763..3af70238bd 100644<br>
--- a/hw/vfio/common.c<br>
+++ b/hw/vfio/common.c<br>
@@ -541,7 +541,8 @@ static int vfio_host_win_del(VFIOContainer *container, =
hwaddr min_iova,<br>
<br>
=C2=A0static bool vfio_listener_skipped_section(MemoryRegionSection *sectio=
n)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 return (!memory_region_is_ram(section-&gt;mr) &amp;&amp;<br>
+=C2=A0 =C2=A0 return (!strcmp(memory_region_name(section-&gt;mr), &quot;vi=
rtio-fs-cache&quot;)) ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (!memory_region_is_ram(section-&gt;mr) =
&amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!memory_region_is_iommu(sec=
tion-&gt;mr)) ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Sizing an enabled 64-bit =
BAR can cause spurious mappings to<font color=3D"#888888"><br>
-- <br>
2.25.1</font>

</div>

--000000000000c6691a05c0e5efe9--

