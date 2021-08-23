Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4B03F4ED4
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 18:58:32 +0200 (CEST)
Received: from localhost ([::1]:44628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIDHL-0006ot-6L
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 12:58:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mID1f-0000EO-An
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:42:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mID1c-0007O7-5V
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:42:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629736935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HKpjD30wqc1vCj0eTxqs6392PPziUtsLt1ojowv2C3g=;
 b=GKUdl4z0yCZGQVyIe/3X7RsO1vmJ5KE+yOvjvLy1JaWrviLTziI3qBowdSyy5B9xYpQ1LN
 mI/Py2L2tC7tzeHXo6vNR1jFh0QEctlr4dUecai92Hvqoz1REnxxQxzwDtF4LCI9joSlyl
 5KEr5St1kMJXaCsbnXcK7joy1pwPpcM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-gjYHCZotPlqz5ZX0lJoEvQ-1; Mon, 23 Aug 2021 12:42:14 -0400
X-MC-Unique: gjYHCZotPlqz5ZX0lJoEvQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 r4-20020a1c4404000000b002e728beb9fbso4500485wma.9
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 09:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HKpjD30wqc1vCj0eTxqs6392PPziUtsLt1ojowv2C3g=;
 b=MSKcQMnCBjGAoD6CnkpzqWDp2sOQbD9Y98dE6ZOYSa96xwmtm4O4mfyEVFwdr5/xPl
 bffjNNuKWQnQSVbqPLXCbU9dLgGXn9WoawnZ8xRSAVZebwsHOdQ/c6F8dH/n9/QjENHJ
 kB24Y96SoI3UQuOi+RoNm/CqP261GEY6Q3Vb1AP9aC6bfZWYaHDpr2LYdVOtGejYiuuV
 MKnEdJLvLuJfAGIFqcXGBlQNWzCvbCSBMBF09a3Ni/+wx5eU1uJ5ScGNuFnrvpNWEBA7
 YqrX3Gz72NIjnxrVYGMSaZRiMbh2Bgmy4TMECXZEBPDpmf81S2II37BGU20B49MPHUc6
 xT0w==
X-Gm-Message-State: AOAM532fOPfrousWiR0gZWoUrnxqkg2DE+PaRegrLHkEQMOAWDeCRtSW
 ptTJbnQg15lrg+oh5RNMTUx/qUEyFIpTEpzsSVv47E414Nel6ECH6YQt06z5sUaKo8fFNYwm4Zr
 7ljju4xN43Ukp+h9EcAFeH7GVyAKArBEIHWR5bVrreRrcfjuEgH3cyV42Y3tva8vz
X-Received: by 2002:a1c:4b04:: with SMTP id y4mr16748204wma.19.1629736933012; 
 Mon, 23 Aug 2021 09:42:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8fXDLGpsvdnTWf4B8j2AwaPTvJKoE7pqUMlwiFI6cOr+8aED2W4z/WfCTVbvQaYODMaXIyQ==
X-Received: by 2002:a1c:4b04:: with SMTP id y4mr16748178wma.19.1629736932861; 
 Mon, 23 Aug 2021 09:42:12 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 r1sm15831189wrt.24.2021.08.23.09.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 09:42:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 3/5] exec/memattrs: Introduce MemTxAttrs::bus_perm field
Date: Mon, 23 Aug 2021 18:41:55 +0200
Message-Id: <20210823164157.751807-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210823164157.751807-1-philmd@redhat.com>
References: <20210823164157.751807-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the 'direct_access' bit to the memory attributes to restrict
bus master access to ROM/RAM.
Have read/write accessors return MEMTX_BUS_ERROR if an access is
restricted and the region is not ROM/RAM ('direct').
Add corresponding trace events.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/exec/memattrs.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
index 95f2d20d55b..7a94ee75a88 100644
--- a/include/exec/memattrs.h
+++ b/include/exec/memattrs.h
@@ -14,6 +14,13 @@
 #ifndef MEMATTRS_H
 #define MEMATTRS_H
 
+/* Permission to restrict bus memory accesses. See MemTxAttrs::bus_perm */
+enum {
+    MEMTXPERM_UNSPECIFIED   = 0,
+    MEMTXPERM_UNRESTRICTED  = 1,
+    MEMTXPERM_RAM_DEVICE    = 2,
+};
+
 /* Every memory transaction has associated with it a set of
  * attributes. Some of these are generic (such as the ID of
  * the bus master); some are specific to a particular kind of
@@ -35,6 +42,19 @@ typedef struct MemTxAttrs {
     unsigned int secure:1;
     /* Memory access is usermode (unprivileged) */
     unsigned int user:1;
+    /*
+     * Bus memory access permission.
+     *
+     * Some devices (such DMA) might be restricted to only access
+     * some type of device, such RAM devices. By default memory
+     * accesses are unspecified (MEMTXPERM_UNSPECIFIED), but could be
+     * unrestricted (MEMTXPERM_UNRESTRICTED, similar to an allow list)
+     * or restricted to a type of devices (similar to a deny list).
+     * Currently only RAM devices can be restricted (MEMTXPERM_RAM_DEVICE).
+     *
+     * Memory accesses to restricted addresses return MEMTX_BUS_ERROR.
+     */
+    unsigned int bus_perm:2;
     /* Requester ID (for MSI for example) */
     unsigned int requester_id:16;
     /* Invert endianness for this page */
@@ -66,6 +86,7 @@ typedef struct MemTxAttrs {
 #define MEMTX_OK 0
 #define MEMTX_ERROR             (1U << 0) /* device returned an error */
 #define MEMTX_DECODE_ERROR      (1U << 1) /* nothing at that address */
+#define MEMTX_BUS_ERROR         (1U << 2) /* bus returned an error */
 typedef uint32_t MemTxResult;
 
 #endif
-- 
2.31.1


