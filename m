Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 942BC1B7C39
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Apr 2020 18:52:54 +0200 (CEST)
Received: from localhost ([::1]:44684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jS1ZN-0003B4-Ln
	for lists+qemu-devel@lfdr.de; Fri, 24 Apr 2020 12:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57258)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alexander.duyck@gmail.com>) id 1jS1Wo-00087j-1T
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 12:50:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <alexander.duyck@gmail.com>) id 1jS1Wn-0000o7-HG
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 12:50:13 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:34710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexander.duyck@gmail.com>)
 id 1jS1Wn-0000mN-3a
 for qemu-devel@nongnu.org; Fri, 24 Apr 2020 12:50:13 -0400
Received: by mail-pf1-x442.google.com with SMTP id x15so5072115pfa.1
 for <qemu-devel@nongnu.org>; Fri, 24 Apr 2020 09:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:date:message-id:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=XWQH+WqkRfp4wJIRuWJ29KttjuuuSpzbvrw8QWn/fPk=;
 b=RE2S7v1K6xmMobGdD+T0/61rZlmenR1uTKY2g1z1qGjzKAysz5jtSFNw/rQx3YAOKS
 eV8oVuy3/68YQ2wuAHm3SO4zHNlrOqty36Yog0JqRbq4OsXlWwJjrQmmehyyO4CW0Zpl
 y2CANZIYqrlYygCRqXZxDJ5lxDw4JVw+V/AJVBJtuoWOuM51TCPBW0fRAjvZg4/Ot4ux
 sq2qlTpeZl0RHwqfLP9C0qPyjAVk0esY4e501S8cXXenAKfqWM43AFU5pg756fMyY3Pw
 yD0WuRGh05t2ljECeZEc9rpUmIi862mGW16mCDAylbiub1Vbak3SPkRzyiGePaSksq9y
 uOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:date:message-id:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=XWQH+WqkRfp4wJIRuWJ29KttjuuuSpzbvrw8QWn/fPk=;
 b=ABvw1R+yeO8YWGdLnLsq7FNCUlObZwSP3BP3sHStZ9+pXxrN0ijQ0RrmA3Ox+GWCf0
 VMpf6ChMAu86rpz6ah63ut8Npvr/DB9CmFdrHqaUobsZRCtwkCUfjjmInRGSVEthiX6i
 np65Gee9JNGokTx0RJmjwdRyURpUgUgISlm9XbGShxUZxWfi7wRcV+L7Ab0B7ntSIncN
 TvrH2RWo/Ok/Y73ESG8LFOIzabznT7IIuG7kvZl4xBBlY/ZlXjUEFLVnJ2bIB6za0b5G
 Wryztpe/6JYo7gKD6ID0fTHvWU27Eq4RSZCdD4YIavUi+e/8+pzzdvf9QvaKqEstSlOL
 NKZQ==
X-Gm-Message-State: AGi0PuZBet61JFqLW0hEMRwioBkSWBeVFMrwXrbRvpRh/Nhk+MjiGGeA
 pS6TyYvUnmgI+KYbbhk5ViE=
X-Google-Smtp-Source: APiQypKMCIo2GluA5DZ7F0doTygsVSKd7t2kU+ExSPzxBfYN0ypcfY5WIwc0cLQyeNRyV+PePXC9ug==
X-Received: by 2002:a63:6fce:: with SMTP id
 k197mr10011919pgc.431.1587747010474; 
 Fri, 24 Apr 2020 09:50:10 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:b:9c3:9e5c:8eff:fe4f:f2d0])
 by smtp.gmail.com with ESMTPSA id k63sm5216833pjb.6.2020.04.24.09.50.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Apr 2020 09:50:09 -0700 (PDT)
Subject: [PATCH v22 QEMU 1/5] linux-headers: Update to allow renaming of
 free_page_report_cmd_id
From: Alexander Duyck <alexander.duyck@gmail.com>
To: david@redhat.com, mst@redhat.com
Date: Fri, 24 Apr 2020 09:50:09 -0700
Message-ID: <20200424165009.10723.14503.stgit@localhost.localdomain>
In-Reply-To: <20200424164239.10723.58352.stgit@localhost.localdomain>
References: <20200424164239.10723.58352.stgit@localhost.localdomain>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::442;
 envelope-from=alexander.duyck@gmail.com; helo=mail-pf1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::442
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
Cc: virtio-dev@lists.oasis-open.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Duyck <alexander.h.duyck@linux.intel.com>

Sync to the latest upstream changes for free page hinting. To be
replaced by a full linux header sync.

Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
---
 include/standard-headers/linux/virtio_balloon.h |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/standard-headers/linux/virtio_balloon.h b/include/standard-headers/linux/virtio_balloon.h
index 9375ca2a70de..af0a6b59dab2 100644
--- a/include/standard-headers/linux/virtio_balloon.h
+++ b/include/standard-headers/linux/virtio_balloon.h
@@ -47,8 +47,15 @@ struct virtio_balloon_config {
 	uint32_t num_pages;
 	/* Number of pages we've actually got in balloon. */
 	uint32_t actual;
-	/* Free page report command id, readonly by guest */
-	uint32_t free_page_report_cmd_id;
+	/*
+	 * Free page hint command id, readonly by guest.
+	 * Was previously name free_page_report_cmd_id so we
+	 * need to carry that name for legacy support.
+	 */
+	union {
+		uint32_t free_page_hint_cmd_id;
+		uint32_t free_page_report_cmd_id;	/* deprecated */
+	};
 	/* Stores PAGE_POISON if page poisoning is in use */
 	uint32_t poison_val;
 };


