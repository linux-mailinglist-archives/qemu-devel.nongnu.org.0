Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 303573F5FFC
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 16:15:05 +0200 (CEST)
Received: from localhost ([::1]:38558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIXCh-0004zZ-CY
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 10:15:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIX9s-00051E-9E
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:12:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIX9q-0005Lu-6U
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:12:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629814325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yP4txqlPFI2A9kMCd1u6S+dpF5skjJnaUikspGogW/I=;
 b=QrnukRnTs21Uzf9rE/CzIJoRBawa1l4acqc6ZgzJVqOjaWacvAmL4V2DKhbFyXrxFmwx7m
 7Po2PEUsAkpWRTu9qIAuoO6MlTzypo0VQ38aIw78pUF/NEg2D7sPztIn/hlHegKLg2XCxA
 NRYU6gITWOJvyRO3O9H62Gz8JCEUWV0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-RDbX6Q0gO8u9-IGikIfZGw-1; Tue, 24 Aug 2021 10:12:04 -0400
X-MC-Unique: RDbX6Q0gO8u9-IGikIfZGw-1
Received: by mail-wr1-f70.google.com with SMTP id
 q11-20020a5d61cb0000b02901550c3fccb5so5772374wrv.14
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 07:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yP4txqlPFI2A9kMCd1u6S+dpF5skjJnaUikspGogW/I=;
 b=MSDfcURgJOnAv/QpSY2oBF7rZzUzsAKsfiVcVdQjCteySEg38dxpgQfusZfWhLltsk
 JgfH9FRBXeAfjcfvp7KFC4ksUyevCSxpgmaslGWN0KC+JD2MBkPdsxeDM9Hn+PlNj9xo
 s7i+2PCQJaAD4BWkhikefs+mS6NEcY19cdofgf832s2NHe9+34WkOx1jSMmSvhAyIDz9
 FNQB0ocbf1hOgvrs/lq1bPxJ+b9d6utTOhreMuZWlujst2ODz506j/JSaMS2Q6RYpfKJ
 rXkfgUIvsFfjiV2RY+nYbCRBSPUNnADY9v1N3Wm3G5BrW5eTav4uiScbdFrSx2KoZZNF
 DrXQ==
X-Gm-Message-State: AOAM533nQyELGF6GSoFjOwN8h5wH6TSBkNbTOcXBuWwpmRRt00kk83W2
 BBWX2xG88g35YqErB3DHlbcXCgQ9NVkCgYfa6wTIBuHvcIbWoD61b9ssR5rz75PgG80IMtMvxai
 824qhJcToRMH95AXXqp5NF+GoCh3D2doSxOxp2ZW0xxAWeBeXsEbbY/sYQlTbVOEA
X-Received: by 2002:adf:fa82:: with SMTP id h2mr5480662wrr.195.1629814323034; 
 Tue, 24 Aug 2021 07:12:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/jkoZN0odgTBflGStoSth7pZwSCKwVVLpg02DsKmprcNGs4MIJDtEyMjzPc9L49Ri0EZkQA==
X-Received: by 2002:adf:fa82:: with SMTP id h2mr5480638wrr.195.1629814322884; 
 Tue, 24 Aug 2021 07:12:02 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 f23sm2686543wmc.3.2021.08.24.07.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 07:12:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/9] util/vfio-helpers: Replace qemu_mutex_lock() calls with
 QEMU_LOCK_GUARD
Date: Tue, 24 Aug 2021 16:11:37 +0200
Message-Id: <20210824141142.1165291-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824141142.1165291-1-philmd@redhat.com>
References: <20210824141142.1165291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Auger Eric <eric.auger@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simplify qemu_vfio_dma_[un]map() handlers by replacing a pair of
qemu_mutex_lock/qemu_mutex_unlock calls by the WITH_QEMU_LOCK_GUARD
macro.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 util/vfio-helpers.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
index 1d149136299..d956866b4e9 100644
--- a/util/vfio-helpers.c
+++ b/util/vfio-helpers.c
@@ -735,7 +735,7 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
     assert(QEMU_PTR_IS_ALIGNED(host, qemu_real_host_page_size));
     assert(QEMU_IS_ALIGNED(size, qemu_real_host_page_size));
     trace_qemu_vfio_dma_map(s, host, size, temporary, iova);
-    qemu_mutex_lock(&s->lock);
+    QEMU_LOCK_GUARD(&s->lock);
     mapping = qemu_vfio_find_mapping(s, host, &index);
     if (mapping) {
         iova0 = mapping->iova + ((uint8_t *)host - (uint8_t *)mapping->host);
@@ -778,7 +778,6 @@ int qemu_vfio_dma_map(QEMUVFIOState *s, void *host, size_t size,
         *iova = iova0;
     }
 out:
-    qemu_mutex_unlock(&s->lock);
     return ret;
 }
 
@@ -813,14 +812,12 @@ void qemu_vfio_dma_unmap(QEMUVFIOState *s, void *host)
     }
 
     trace_qemu_vfio_dma_unmap(s, host);
-    qemu_mutex_lock(&s->lock);
+    QEMU_LOCK_GUARD(&s->lock);
     m = qemu_vfio_find_mapping(s, host, &index);
     if (!m) {
-        goto out;
+        return;
     }
     qemu_vfio_undo_mapping(s, m, NULL);
-out:
-    qemu_mutex_unlock(&s->lock);
 }
 
 static void qemu_vfio_reset(QEMUVFIOState *s)
-- 
2.31.1


