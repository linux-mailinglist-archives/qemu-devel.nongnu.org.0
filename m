Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB544C87A5
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 10:17:52 +0100 (CET)
Received: from localhost ([::1]:53636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOydj-0002bb-F4
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 04:17:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy3m-0004Ws-6l
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:40:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nOy3k-0008N3-QV
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 03:40:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646124040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oT6l+V3jJuwCFvnRE26WZY8M0dO/7ULSHBa48JNUl4g=;
 b=hDp7IdyPUPNIlTpXPfZ37ZeAIc6p7bUy77BvAZ4U4eqZE49CuYhFxBdjs7YX7iUXTQtnoH
 0S5G+yoTckY5JzUIlAWfs8pHXwUWOwzlm97V854XtqgHUXFLt7pxwJ0SJvUwWBEo7R0qAl
 dv+E+P8dJdLhf3fr+hf9GCoU6GooMVI=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-JWGdUapgOiWGeOwO1JGG3g-1; Tue, 01 Mar 2022 03:40:39 -0500
X-MC-Unique: JWGdUapgOiWGeOwO1JGG3g-1
Received: by mail-pj1-f72.google.com with SMTP id
 u11-20020a17090ae00b00b001bc4cef20f1so8024540pjy.9
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 00:40:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oT6l+V3jJuwCFvnRE26WZY8M0dO/7ULSHBa48JNUl4g=;
 b=PTXOD46G6Wlrq9KEEhuKuSM/IyK71qTcghaUaVoOcFJjRI/vyCmCbRKhb+ZZOiJCVs
 1iOIZMe+d1QM1ifQgdDuvTGfF7weneAC11uSp1j710Uime6FCdasqZjva3wMD2OopRjE
 uSirPd0LZ5pwHLOtvQ9TI8jtFsYb1SJQoCKMktOHX8b0df6cG2FLnNIWhaZ5wA4O/nAI
 DwEeLUOPzdQYDN7M2k6IuQV5P3RzboF7EBzHeIgOxcHyZ7/ijmEcncoVCSg6J9sB+3dJ
 r1RCRDRPBTyc0+DTj4wYlbWL7xbuOnBYrJ6KgeCY4JWMoXebyHaMg3hrdynCG01ntzfW
 +aRw==
X-Gm-Message-State: AOAM531aqqrN+jHA8a+DeTor837v/s5wlOPsC7mOfudDnNbz9YMeiNQq
 VkVzaUW1so26vH7HaNJe62JXka9e3vQN0h9p73VNIs8vb+Ekq06sZxX/Pq0CdoogAKjp5i+4OBN
 0xYCTcwm8urCzveJC3RcoBd3FTmQx7gXR9yyfEDtnJiT/4MSTR13QK7go2R4cKjso
X-Received: by 2002:a17:902:8d81:b0:14d:964b:6186 with SMTP id
 v1-20020a1709028d8100b0014d964b6186mr24343436plo.108.1646124038239; 
 Tue, 01 Mar 2022 00:40:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfnAJVEv2+Z05118KGkOpVDfW4Zds/LLw6Er+hvDrddjhS9XhC8yktyDjoMpThwbvxcSb4oA==
X-Received: by 2002:a17:902:8d81:b0:14d:964b:6186 with SMTP id
 v1-20020a1709028d8100b0014d964b6186mr24343412plo.108.1646124037869; 
 Tue, 01 Mar 2022 00:40:37 -0800 (PST)
Received: from localhost.localdomain ([94.177.118.144])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a17090aec0100b001bc6d8bb27dsm1439987pjy.37.2022.03.01.00.40.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Mar 2022 00:40:37 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/25] migration: Fail postcopy preempt with TLS for now
Date: Tue,  1 Mar 2022 16:39:23 +0800
Message-Id: <20220301083925.33483-24-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220301083925.33483-1-peterx@redhat.com>
References: <20220301083925.33483-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The support is not yet there.  Temporarily fail it properly when starting
postcopy until it's supported.  Fail at postcopy-start still allows the
user to proceed with e.g. pure tls precopy even if postcopy-ram is set.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/migration.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/migration/migration.c b/migration/migration.c
index f30bad982c..95cfc483c9 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1802,6 +1802,12 @@ void qmp_migrate_start_postcopy(Error **errp)
                          " started");
         return;
     }
+
+    if (migrate_postcopy_preempt() && migrate_tls_enabled()) {
+        error_setg(errp, "Postcopy preemption does not support TLS yet");
+        return;
+    }
+
     /*
      * we don't error if migration has finished since that would be racy
      * with issuing this command.
-- 
2.32.0


