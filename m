Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B59D4EDC6D
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 17:12:07 +0200 (CEST)
Received: from localhost ([::1]:52338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZwT0-0004xZ-9O
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 11:12:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZwQE-00027T-8Y
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:09:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nZwQ6-0001LG-Rc
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 11:09:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648739346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WuNDDv29rDBOfHxmW0v67zbZ/KMeTKCpZ84LsWOMvjI=;
 b=EI7n4+MpGO5T8bsKWKX5pOx70iW7DjExZMFQkTDQ8qXC0yjPlFoMRcYVcZXPtW2g5UbD6b
 lXymbmIc7RjZviCIxXuC58rsoty3P16khM63aMOudRjWVUaVGfB6zqPq35yDjzhEAWmolT
 uOPprcZZFU1YWRfhCSw+ar7/G6yRMkc=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-FHDOu2RANS6F429jnBTO3Q-1; Thu, 31 Mar 2022 11:09:05 -0400
X-MC-Unique: FHDOu2RANS6F429jnBTO3Q-1
Received: by mail-qv1-f69.google.com with SMTP id
 cl19-20020a05621404f300b0044103143211so18774785qvb.10
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 08:09:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WuNDDv29rDBOfHxmW0v67zbZ/KMeTKCpZ84LsWOMvjI=;
 b=40AaKs5htUNbcbeaorYLfcLlHe9Js3/tDhrSqerP0aTa4TjADx9cNO0o3ixPCLNCqC
 k18T0CfcKp3WKs5ordfo2WcShAP3Le4xUuQ3oX+K1pxKdCLwXu+oTz/GekgivyceGlx/
 4zUhjypJN2wZtrWWSH4MSEboTjoqoYvIN8eVX0BifBSJ9+4k9QUwIsbBYjw0w3p3GkoD
 alFkegl1SinO/Cqh+NIa5QSILkG2C73bE7XyptDm6wR1UCzd5GCsodcsq0yl9dq2Zwar
 Sop295L5GNa6xgoAlg5tVTjH7/9F/92DZJ1SmsTRSPOm0hwp9Nw5DJe3DrCR4htYu40b
 Sf8A==
X-Gm-Message-State: AOAM533zZ1CzvGkKF6ops0zbAThAng2dPyFjdtxKWm899+PFjImvhrq4
 C+dYE/4b9u3dhBPEV60ug1PoES1rMhxGlXUHwjb3sTT+8gNjggWZhzO6k0yXGt4FR7npex3NiFD
 +qpqZXhJYxJufzQTiFboahUxWWf8pJ8QuVYnklxTcFgkkc32Ai/8psHws1KueY8LY
X-Received: by 2002:a05:622a:58e:b0:2e1:cdf1:d428 with SMTP id
 c14-20020a05622a058e00b002e1cdf1d428mr4592316qtb.254.1648739344548; 
 Thu, 31 Mar 2022 08:09:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+LduFbJjgYdqYC5bQoWxJBRkfof3BqC5xKsNZpsFbDAdzbOFL8WJO+/va89BpMFq1faHw+A==
X-Received: by 2002:a05:622a:58e:b0:2e1:cdf1:d428 with SMTP id
 c14-20020a05622a058e00b002e1cdf1d428mr4592275qtb.254.1648739344199; 
 Thu, 31 Mar 2022 08:09:04 -0700 (PDT)
Received: from localhost.localdomain
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 21-20020ac85715000000b002e1ce9605ffsm20246871qtw.65.2022.03.31.08.09.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 31 Mar 2022 08:09:03 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 05/19] migration: Export ram_load_postcopy()
Date: Thu, 31 Mar 2022 11:08:43 -0400
Message-Id: <20220331150857.74406-6-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220331150857.74406-1-peterx@redhat.com>
References: <20220331150857.74406-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Will be reused in postcopy fast load thread.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 migration/ram.c | 2 +-
 migration/ram.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index bfcd45a36e..253fe4b756 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3645,7 +3645,7 @@ int ram_postcopy_incoming_init(MigrationIncomingState *mis)
  *
  * @f: QEMUFile where to send the data
  */
-static int ram_load_postcopy(QEMUFile *f)
+int ram_load_postcopy(QEMUFile *f)
 {
     int flags = 0, ret = 0;
     bool place_needed = false;
diff --git a/migration/ram.h b/migration/ram.h
index 2c6dc3675d..ded0a3a086 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -61,6 +61,7 @@ void ram_postcopy_send_discard_bitmap(MigrationState *ms);
 /* For incoming postcopy discard */
 int ram_discard_range(const char *block_name, uint64_t start, size_t length);
 int ram_postcopy_incoming_init(MigrationIncomingState *mis);
+int ram_load_postcopy(QEMUFile *f);
 
 void ram_handle_compressed(void *host, uint8_t ch, uint64_t size);
 
-- 
2.32.0


