Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2AA3BC9E4
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 12:27:15 +0200 (CEST)
Received: from localhost ([::1]:50230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0iIL-00073O-V7
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 06:27:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htu-0000tb-3b
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:58 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1m0htl-0002F2-BG
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 06:01:57 -0400
Received: by mail-wr1-x42c.google.com with SMTP id t15so22009030wry.11
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 03:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XZL4YZ4Qjo2HUlaagvRlRs9NR2x4tz1U3FKjUbVWYIk=;
 b=Ce6vDQdyzRLDwH6O1f1YmpI/pit9HCOErC9K3O/id1cBF4Wr4Bq93gvQ4WtHrQ+fzW
 upryTkZBZyZtrp1yMxjTa8hWwpgHYxh03usXB0AetOGQJqK6WtOHzrAAJxDyHUM2ewo6
 1ol7fERP/0KLEk28kR+2ULjwVHDrQwXk8WLXdqIYT81ztFaFwvKDikfDFycdoVt+KxXj
 kOBvRaRwpOreZYxL+IXEblSDCNU3xqfOlje9oY0i0jJTChim70PYdjbPuHnoRcU/D5Ty
 QlguMLPxUDTy8Z1im6vAYucyE3LK8B2zQUcvw/ZV9keAWBeKbao9T5hjudZ7Q1DuVeKb
 Nmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XZL4YZ4Qjo2HUlaagvRlRs9NR2x4tz1U3FKjUbVWYIk=;
 b=djl4CntYlvQG5HZGdiwQUhHHeBw1sr/Td/2uRcmhUEWRrFNo2wv3V1072bsrb8XTEq
 Yj5na/ktLp8De92mV8L6dBpqZaTnsYbJNRIL3wtW7rRT98yNc5d/xbZ6hgkG0jfYr7nQ
 SUQMoHIiQjrB4U1Dk6GPFDEWJa75dBHfZfHQca76cU1tLlfkRZh7Du0SQaxZXM7SnSyX
 /iQXDYEEKCY1lgX6E8bIVpia+NqFBKz0U9Y3KAKrT/uz1tPHzJCI2yjPjoMpQbfc3KYs
 gqz9dShyF8SdNdZnter1R27HtlNT2L+FgH9iVNBLyTs3RagDHNI34AEEfmrrE1GNBGgL
 oeSA==
X-Gm-Message-State: AOAM5334XUxoW2F/By6qyulRzAAeZOcpt1WFah8I1bpCbGG/pmPYkcBa
 1U+TCyM9sNUPFNYFFAZp2NV7wJDJBoQ=
X-Google-Smtp-Source: ABdhPJzsPnZAoaAz97MY4Iyb2HlnjS5tWvse/G6Cpcg8XFfjbMj1vig7IcAYUP4H5FUDMlbygwtYbA==
X-Received: by 2002:a5d:4f10:: with SMTP id c16mr20720972wru.3.1625565708063; 
 Tue, 06 Jul 2021 03:01:48 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 v15sm2331268wmj.39.2021.07.06.03.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:01:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/40] target/i386: Declare constants for XSAVE offsets
Date: Tue,  6 Jul 2021 12:01:09 +0200
Message-Id: <20210706100141.303960-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210706100141.303960-1-pbonzini@redhat.com>
References: <20210706100141.303960-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: David Edmondson <david.edmondson@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Edmondson <david.edmondson@oracle.com>

Declare and use manifest constants for the XSAVE state component
offsets.

Signed-off-by: David Edmondson <david.edmondson@oracle.com>
Message-Id: <20210705104632.2902400-2-david.edmondson@oracle.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/cpu.h | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index f7fa5870b1..aedb8f2e01 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1305,6 +1305,22 @@ typedef struct XSavePKRU {
     uint32_t padding;
 } XSavePKRU;
 
+#define XSAVE_FCW_FSW_OFFSET    0x000
+#define XSAVE_FTW_FOP_OFFSET    0x004
+#define XSAVE_CWD_RIP_OFFSET    0x008
+#define XSAVE_CWD_RDP_OFFSET    0x010
+#define XSAVE_MXCSR_OFFSET      0x018
+#define XSAVE_ST_SPACE_OFFSET   0x020
+#define XSAVE_XMM_SPACE_OFFSET  0x0a0
+#define XSAVE_XSTATE_BV_OFFSET  0x200
+#define XSAVE_AVX_OFFSET        0x240
+#define XSAVE_BNDREG_OFFSET     0x3c0
+#define XSAVE_BNDCSR_OFFSET     0x400
+#define XSAVE_OPMASK_OFFSET     0x440
+#define XSAVE_ZMM_HI256_OFFSET  0x480
+#define XSAVE_HI16_ZMM_OFFSET   0x680
+#define XSAVE_PKRU_OFFSET       0xa80
+
 typedef struct X86XSaveArea {
     X86LegacyXSaveArea legacy;
     X86XSaveHeader header;
@@ -1325,19 +1341,19 @@ typedef struct X86XSaveArea {
     XSavePKRU pkru_state;
 } X86XSaveArea;
 
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, avx_state) != 0x240);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, avx_state) != XSAVE_AVX_OFFSET);
 QEMU_BUILD_BUG_ON(sizeof(XSaveAVX) != 0x100);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndreg_state) != 0x3c0);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndreg_state) != XSAVE_BNDREG_OFFSET);
 QEMU_BUILD_BUG_ON(sizeof(XSaveBNDREG) != 0x40);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndcsr_state) != 0x400);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, bndcsr_state) != XSAVE_BNDCSR_OFFSET);
 QEMU_BUILD_BUG_ON(sizeof(XSaveBNDCSR) != 0x40);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, opmask_state) != 0x440);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, opmask_state) != XSAVE_OPMASK_OFFSET);
 QEMU_BUILD_BUG_ON(sizeof(XSaveOpmask) != 0x40);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, zmm_hi256_state) != 0x480);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, zmm_hi256_state) != XSAVE_ZMM_HI256_OFFSET);
 QEMU_BUILD_BUG_ON(sizeof(XSaveZMM_Hi256) != 0x200);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, hi16_zmm_state) != 0x680);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, hi16_zmm_state) != XSAVE_HI16_ZMM_OFFSET);
 QEMU_BUILD_BUG_ON(sizeof(XSaveHi16_ZMM) != 0x400);
-QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, pkru_state) != 0xA80);
+QEMU_BUILD_BUG_ON(offsetof(X86XSaveArea, pkru_state) != XSAVE_PKRU_OFFSET);
 QEMU_BUILD_BUG_ON(sizeof(XSavePKRU) != 0x8);
 
 typedef enum TPRAccess {
-- 
2.31.1



