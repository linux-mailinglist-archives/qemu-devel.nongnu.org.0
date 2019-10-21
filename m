Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9745DEB6D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 13:54:34 +0200 (CEST)
Received: from localhost ([::1]:39024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMWGf-0002Sy-PZ
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 07:54:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52787)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iMWBb-0005VS-KZ
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 07:49:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iMWBX-0003B1-EE
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 07:49:19 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:38209)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1iMWBR-00038j-Po
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 07:49:14 -0400
Received: by mail-wr1-x442.google.com with SMTP id v9so2350152wrq.5
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 04:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L1ZRC5xfl7LAc8y7XcDjWKXdgHuMKTnYncwldrjeKoE=;
 b=Hw5E9q123R3Tvz1vaTdDmL8+/eQKpTsEt3Qgu1/klh48i+Z9puQ/jxBxlIBNIJiJAD
 XLSla8eh1r0PXmCUAlSDKSB3Q649GBdIXDqIl5V7M38uGtS0Jx+dHMXIdZ7ncLHqiqvq
 vaze0JZa9fANNtde143lXJ6Q466W87v1gwbL66k3R0gwaXdSRDjVj8+s0XS69PsnhixP
 H25q1qxm7MJ91L6OvN+BxG6cRDW+v9KbHR72tKnyW8wYTi/hIcMeJ2eo45ZyC+WYByyv
 ckqhtNyKw9fqVBx07N8LaqBvq+zrTNUVAORn+vFyKHYuZshJgLuccqAZWqcBeDjk/Vyb
 Dc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=L1ZRC5xfl7LAc8y7XcDjWKXdgHuMKTnYncwldrjeKoE=;
 b=Xb54AYDarHtRqRvftP6qrTBBm1T+Zq+Tw89BXfwY9WJGEdiS3P5isCj0kYyWH4guGg
 cx4zslK2VMgPSWG9NexOOOiPT0ZN8Ellagkz+7dwVQzjYicsFSUshJsM0CqQ0ClIx6ND
 g53UoZlT+/YJ63Qkmci+VbhWvxLBCnhPdLvJqoRsn2c3i8U1dPgtEBtgOo+ipXfEN/Ca
 B4XhCKLC+SDcGYmOSDvxqd01HoI/EyCtVQX50ksrJ3x4mDDxi0QZK6A7k1dqgAYG/Fwa
 acj0YBiX3OpSnngKnR1jGR2ASFUUYoa7dLnn4LmgwQhuX+96RRVj0k5jiABIG5KudZQz
 sHfw==
X-Gm-Message-State: APjAAAVUVAD8/SDbc5GcHtBjUfUkUlSwnOLozrLvzjAcnM4HKlg2RtSI
 ahSvpsdrUDF6kbUk3lacSrqnwPDR
X-Google-Smtp-Source: APXvYqyhC2xqhen9lmC1sFAEfA0NBjNDe8SFmARNqljeJrKlGw0ydnjwfWaWvLqNIpG74ouKi+C2zA==
X-Received: by 2002:adf:91e1:: with SMTP id 88mr7747800wri.16.1571658546821;
 Mon, 21 Oct 2019 04:49:06 -0700 (PDT)
Received: from localhost.localdomain
 (129.red-83-57-174.dynamicip.rima-tde.net. [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id x5sm17156137wrt.75.2019.10.21.04.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 04:49:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 4/9] linux-user/syscall: Introduce target_sockaddr_nl
Date: Mon, 21 Oct 2019 13:48:52 +0200
Message-Id: <20191021114857.20538-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191021114857.20538-1-f4bug@amsat.org>
References: <20191021114857.20538-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
Cc: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tested-By: Guido Günther <agx@sigxcpu.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v7: use abi_ushort and abi_uint to keep alignments good (lvivier)
---
 linux-user/syscall.c      | 6 ++++--
 linux-user/syscall_defs.h | 7 +++++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index e2af3c1494..f1ab81b917 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1496,8 +1496,10 @@ static inline abi_long host_to_target_sockaddr(abi_ulong target_addr,
         sizeof(target_saddr->sa_family)) {
         target_saddr->sa_family = tswap16(addr->sa_family);
     }
-    if (addr->sa_family == AF_NETLINK && len >= sizeof(struct sockaddr_nl)) {
-        struct sockaddr_nl *target_nl = (struct sockaddr_nl *)target_saddr;
+    if (addr->sa_family == AF_NETLINK &&
+        len >= sizeof(struct target_sockaddr_nl)) {
+        struct target_sockaddr_nl *target_nl =
+               (struct target_sockaddr_nl *)target_saddr;
         target_nl->nl_pid = tswap32(target_nl->nl_pid);
         target_nl->nl_groups = tswap32(target_nl->nl_groups);
     } else if (addr->sa_family == AF_PACKET) {
diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index fa69c6ab8d..7694d72446 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -153,6 +153,13 @@ struct target_sockaddr_un {
     uint8_t sun_path[108];
 };
 
+struct target_sockaddr_nl {
+    abi_ushort nl_family;   /* AF_NETLINK */
+    abi_ushort __pad;
+    abi_uint nl_pid;
+    abi_uint nl_groups;
+};
+
 struct target_in_addr {
     uint32_t s_addr; /* big endian */
 };
-- 
2.21.0


