Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A9D3F8F56
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 21:58:12 +0200 (CEST)
Received: from localhost ([::1]:41780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJLVh-0002L6-Dr
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 15:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJLOU-00059m-MF
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 15:50:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJLOT-0002z2-4A
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 15:50:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630007432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2lm4MltjciLe1FvPMjz8J1KaGtyzlphex4Ajbbc6qJo=;
 b=P4FgOn88ze7wrshXMRNUbqUWscc0JNbHcJ+pfb1+urtVztTNiTzuOCpj9A5ECQ/1qaQn+d
 BTabsQ328TjtomUL+vzcOswe2FAAlKgk/Ylp0Ku7Rd0xYuDUwZLm6K540wxExucsMir1Da
 WfBAi/SUeVzPVXFf22fxDPPpHjyRtb4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-5y7amJanMmanGlzlhCZ-Ng-1; Thu, 26 Aug 2021 15:50:31 -0400
X-MC-Unique: 5y7amJanMmanGlzlhCZ-Ng-1
Received: by mail-wr1-f69.google.com with SMTP id
 q11-20020a5d61cb0000b02901550c3fccb5so1200826wrv.14
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 12:50:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2lm4MltjciLe1FvPMjz8J1KaGtyzlphex4Ajbbc6qJo=;
 b=oPzXhCPrRcyzgK2jkhFYRHOeG6yLsP9DYsCJ5QyikusFD3YVCXZ3YaT9kdehxLZ9Bq
 YmVsAOxz9KfhzaL6tZJfmlBKo722RPOf8cm3X+RZmw8mTNoaVpSO3haU4qAK1S39yJW2
 ScXsTe/EyJ6q+GM5WqeTZ8RWWmEg5+TIoCbm9+UtYXIv4ui/mKrxNX9DT4z0yeL2Y0MA
 iJZEuUSQpF1KOE2/5U25LbxrgpbzYIDYcm4SQmdVfhhoszap+bmA7oRmGJGfplmuoXLr
 3n0nCosv1TTp2NqBRyHUXvQathOPbaotF98Ht3z1Syp7Kgi5iPVzjafqK2pANAMhypYu
 CT1Q==
X-Gm-Message-State: AOAM533He/h6ZAQ+XkgJNOWg6p7tSefHSOmPrDNWsT9i8m+i/X00PDRX
 hTIwv1QMGqsdMaEZrLl5bDHh7tI48rWEIKNXQaIyKy3wDBjD/xrHZtK256I3+nf4yRUBfEDCNeU
 LhXEK6nrt/jrPkd2NHr5vtKj8xMsbL2zXobezpBZaHohraFXBarWjNi5wSyMklld7
X-Received: by 2002:a1c:29c3:: with SMTP id p186mr5259861wmp.22.1630007429784; 
 Thu, 26 Aug 2021 12:50:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhY56nY8acJv336t+w5OxTG8jgsWTSeozY/XtH4noR1liRtVoYV69/WBsw2kOvcNGHblDT6Q==
X-Received: by 2002:a1c:29c3:: with SMTP id p186mr5259838wmp.22.1630007429532; 
 Thu, 26 Aug 2021 12:50:29 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 q11sm9152016wmc.41.2021.08.26.12.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 12:50:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/11] util/vfio-helpers: Replace qemu_mutex_lock() calls
 with QEMU_LOCK_GUARD
Date: Thu, 26 Aug 2021 21:50:06 +0200
Message-Id: <20210826195014.2180369-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210826195014.2180369-1-philmd@redhat.com>
References: <20210826195014.2180369-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Auger Eric <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simplify qemu_vfio_dma_[un]map() handlers by replacing a pair of
qemu_mutex_lock/qemu_mutex_unlock calls by the WITH_QEMU_LOCK_GUARD
macro.

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
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


