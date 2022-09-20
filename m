Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEDC5BF1B1
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 02:07:05 +0200 (CEST)
Received: from localhost ([::1]:38130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oanGa-0003l3-Af
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 20:07:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oam6Y-0006G9-VB
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:52:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oam6J-0001UW-KP
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 18:52:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663714342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QIGbU6jZWHzL+qBCAybLobJs+t2MV+5pyZn8uPH38lc=;
 b=e9jOaAfsEQAJ5WTB4PVEjcvFROdXweV3wVpI0Seg8o91GNvIc4fMY1xyXyPNKlsNFAsKK5
 9cieETUMCvi+MCOWX/bT2Xe3WSbn/jgbWu5c68aI3dh87A+RQEnJ9x1RH/GnT+y5UwZ3PE
 hiTS2QILkqWKS/7Z+6IdgwJ/bHZEClU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-482-Wunzc4vKPhGF9jIGtF1hoA-1; Tue, 20 Sep 2022 18:52:21 -0400
X-MC-Unique: Wunzc4vKPhGF9jIGtF1hoA-1
Received: by mail-qt1-f200.google.com with SMTP id
 fe14-20020a05622a4d4e00b0035cc376b1d5so2895906qtb.4
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 15:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=QIGbU6jZWHzL+qBCAybLobJs+t2MV+5pyZn8uPH38lc=;
 b=oDcQKvAs1GM9Es48e8LGNN/WdhDHKaROtNdrTKrUk5GvaMdz4gSn/yTb9E9MjmS+OO
 fS4cXfOtxFasu3O5nNwVC7ppVlHoMclINlv4Ns2KZakhJ1lMOikYOKd7ppgJSMCXj2Qz
 6dg0DiV0DrRfyk9L1cQGGjlcPd5oDcjlj0S/RN1byg0xZpQkCtxTUKqHOmjZkNMnX5Hb
 2sv6j8gYsmRn/jpW1AJLuHmkoS8LFSQn/g+II9/mE0La8n8sccHxrLI2cnlW28I4oQJt
 4WWcZwaSvVy4U076Wf3Hndt0HNRyBJ9NxW85XlZMMoQc5JxDcEtp3tGaHzwEX+0VxmRK
 /JkQ==
X-Gm-Message-State: ACrzQf1Hbc0vXK1UxBvUe6+fhfdik1INqVncKb9/MnjGVTtDL4QoOxfA
 +8tKInRLT4u56jh2+J6TmW2a4h1WZl7UdFTmeA4CQPgZIJ29XYTe1s0FTihEpDKAfIM9hYXGDaQ
 QdEa9Z/zjqr6qxuLuyXrz3woFDej9A9iCp4hDxi/SkLj0gb1OII+RBZIOjDHCs98+
X-Received: by 2002:ad4:5bcd:0:b0:4ad:2fc4:6571 with SMTP id
 t13-20020ad45bcd000000b004ad2fc46571mr13633297qvt.103.1663714341343; 
 Tue, 20 Sep 2022 15:52:21 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM49AII6Rns1H7ZmLUcEcjO26fJxeQLCFpCsmTaBJPdbSg0aeVmJr9Ni5Y1QCZMOUpeu1gIVgg==
X-Received: by 2002:ad4:5bcd:0:b0:4ad:2fc4:6571 with SMTP id
 t13-20020ad45bcd000000b004ad2fc46571mr13633281qvt.103.1663714341100; 
 Tue, 20 Sep 2022 15:52:21 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
 by smtp.gmail.com with ESMTPSA id
 cc24-20020a05622a411800b0035ba3cae6basm569618qtb.34.2022.09.20.15.52.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Sep 2022 15:52:20 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: peterx@redhat.com, Manish Mishra <manish.mishra@nutanix.com>,
 Juan Quintela <quintela@redhat.com>, ani@anisinha.ca,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH 09/14] migration: Add pss_init()
Date: Tue, 20 Sep 2022 18:52:19 -0400
Message-Id: <20220920225219.48946-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220920225106.48451-1-peterx@redhat.com>
References: <20220920225106.48451-1-peterx@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Helper to init PSS structures.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 40ff5dc49f..b4b36ca59e 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -535,6 +535,14 @@ static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
 static void postcopy_preempt_restore(RAMState *rs, PageSearchStatus *pss,
                                      bool postcopy_requested);
 
+/* NOTE: page is the PFN not real ram_addr_t. */
+static void pss_init(PageSearchStatus *pss, RAMBlock *rb, ram_addr_t page)
+{
+    pss->block = rb;
+    pss->page = page;
+    pss->complete_round = false;
+}
+
 static void *do_data_compress(void *opaque)
 {
     CompressParam *param = opaque;
@@ -2640,9 +2648,7 @@ static int ram_find_and_save_block(RAMState *rs)
         rs->last_page = 0;
     }
 
-    pss.block = rs->last_seen_block;
-    pss.page = rs->last_page;
-    pss.complete_round = false;
+    pss_init(&pss, rs->last_seen_block, rs->last_page);
 
     do {
         again = true;
-- 
2.32.0


