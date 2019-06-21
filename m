Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 183414DEEA
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jun 2019 04:00:38 +0200 (CEST)
Received: from localhost ([::1]:54094 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1he8qz-0001JG-9C
	for lists+qemu-devel@lfdr.de; Thu, 20 Jun 2019 22:00:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41328)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1he8a7-0006gQ-4q
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 21:43:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1he8a3-0006fp-NF
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 21:43:10 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:38425)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1he8a3-0006MU-0Z
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 21:43:07 -0400
Received: by mail-wm1-x32a.google.com with SMTP id s15so4890454wmj.3
 for <qemu-devel@nongnu.org>; Thu, 20 Jun 2019 18:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=lELKDL0Qi4GxKG0TXKbAlktFhWCNneWOViNCGmw6D1c=;
 b=VlxbECuR4mVYREo20S6CHcp9FhDNtpLD+uEkCjs2xK5/MaTtoACzA010XSjL2izOJj
 wo7IOB8zLYzIJURZQGQbHVsR98CIvrRaaOEclUHnnzi5YqlsUoaAwdvs3aNWKKSroNrd
 KvV9AAJyBdVK5Gb/eCxY0OUDiFJLL9xEBB7Sz4rJfGMgmlckI3WTXRAiqMYvByqwyK1Z
 o4Zq2qnS4Ot8v48igMXUsT05lwNbWc4VZ99lwJHnE3L4OnJlEj6l17xlpRg911w4mUA1
 OituoHxVW3sfdInAvxAqlkKE/rzjm98AXiAoPdAyjdvYGZOafUMertWiBQxQ1/FaI0C9
 uANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=lELKDL0Qi4GxKG0TXKbAlktFhWCNneWOViNCGmw6D1c=;
 b=qT1TTFC8YPnYiqcQWZraKCqlKDCoFbbpQbbQ9Bbv2xoVRY9LHMDpVNNzOF19x3alRS
 bsgyGpZcdsELMMi5QH+E+zrK/g3Wt05v5TQNc+Lh2KMLLIQaq/axSc4DD8ubcDCLaD/n
 ENR5eGbx+egYj7/MiC+ZzVOAGb9uEQglUvPjbJ+OqekWAmHSCb6kNIiK1jwIxWRQuebS
 YgsoyeufXeRVHxtcj+KURbC1OJ+WTYTWxzAOaLdiOscK8fnzgl1L4R/x1WUgu2CwiA3U
 FIp2myOL6VLcqR2wCokPiueFspduizGiIxSI47fbWeM7H4dJ08fxj4TfhEEjWXYNG74y
 yE9Q==
X-Gm-Message-State: APjAAAVvwpbQaRKEOBw738EMGGoiLG7d5ekf1LYcu9x+CO0Cc0w2d2j6
 QtmeSGPp5tQil5C6Gt7yms0XaSUB
X-Google-Smtp-Source: APXvYqy4PuTD1QBrmweHPODxpbQAdWJuWlpkqD62C3pDCFq1pUt+nvwATZuZZkpIjVa6McnIEAJ1Ag==
X-Received: by 2002:a1c:c2d5:: with SMTP id s204mr1558585wmf.174.1561081371726; 
 Thu, 20 Jun 2019 18:42:51 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id d1sm1123125wru.41.2019.06.20.18.42.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2019 18:42:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2019 03:42:24 +0200
Message-Id: <1561081350-3723-20-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1561081350-3723-1-git-send-email-pbonzini@redhat.com>
References: <1561081350-3723-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32a
Subject: [Qemu-devel] [PULL 19/25] vmstate: Add support for kernel integer
 types
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
Cc: Liran Alon <liran.alon@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Liran Alon <liran.alon@oracle.com>

Reviewed-by: Nikita Leshenko <nikita.leshchenko@oracle.com>
Reviewed-by: Maran Wilson <maran.wilson@oracle.com>
Signed-off-by: Liran Alon <liran.alon@oracle.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <20190619162140.133674-8-liran.alon@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/migration/vmstate.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 9224370..ca68584 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -797,6 +797,19 @@ extern const VMStateInfo vmstate_info_qtailq;
 #define VMSTATE_UINT64_V(_f, _s, _v)                                  \
     VMSTATE_SINGLE(_f, _s, _v, vmstate_info_uint64, uint64_t)
 
+#ifdef CONFIG_LINUX
+
+#define VMSTATE_U8_V(_f, _s, _v)                                   \
+    VMSTATE_SINGLE(_f, _s, _v, vmstate_info_uint8, __u8)
+#define VMSTATE_U16_V(_f, _s, _v)                                  \
+    VMSTATE_SINGLE(_f, _s, _v, vmstate_info_uint16, __u16)
+#define VMSTATE_U32_V(_f, _s, _v)                                  \
+    VMSTATE_SINGLE(_f, _s, _v, vmstate_info_uint32, __u32)
+#define VMSTATE_U64_V(_f, _s, _v)                                  \
+    VMSTATE_SINGLE(_f, _s, _v, vmstate_info_uint64, __u64)
+
+#endif
+
 #define VMSTATE_BOOL(_f, _s)                                          \
     VMSTATE_BOOL_V(_f, _s, 0)
 
@@ -818,6 +831,19 @@ extern const VMStateInfo vmstate_info_qtailq;
 #define VMSTATE_UINT64(_f, _s)                                        \
     VMSTATE_UINT64_V(_f, _s, 0)
 
+#ifdef CONFIG_LINUX
+
+#define VMSTATE_U8(_f, _s)                                         \
+    VMSTATE_U8_V(_f, _s, 0)
+#define VMSTATE_U16(_f, _s)                                        \
+    VMSTATE_U16_V(_f, _s, 0)
+#define VMSTATE_U32(_f, _s)                                        \
+    VMSTATE_U32_V(_f, _s, 0)
+#define VMSTATE_U64(_f, _s)                                        \
+    VMSTATE_U64_V(_f, _s, 0)
+
+#endif
+
 #define VMSTATE_UINT8_EQUAL(_f, _s, _err_hint)                        \
     VMSTATE_SINGLE_FULL(_f, _s, 0, 0,                                 \
                         vmstate_info_uint8_equal, uint8_t, _err_hint)
-- 
1.8.3.1



