Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 262C56D93CF
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 12:18:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkMgs-0002Rr-1c; Thu, 06 Apr 2023 06:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pkMgq-0002Qx-3i
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 06:18:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pkMgn-0002uC-SP
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 06:17:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680776277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=msm06P3yAh7weXiwK9Xo0pOp2tzBnR7wE261K9E/Dn4=;
 b=Hwe9j16CKsZDSZRSNRsaK/ITBm13mYdlU2N87BmJLE1K0PPpd3RDL72AHbSX8k8Y1Yb9b3
 lWw9ISND76GB1wg31KFxw0awG7HHYKC7OQjqO2i0oFvl4cwkm7ZF2CTATCSaVYv60RXdo0
 36XZ1yLKBaF0DEBToFJC0Wlkdl6mXZk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442-1NTtXw6-PWyqRB7Zx1hSMA-1; Thu, 06 Apr 2023 06:17:55 -0400
X-MC-Unique: 1NTtXw6-PWyqRB7Zx1hSMA-1
Received: by mail-ej1-f70.google.com with SMTP id
 de5-20020a1709069bc500b009339c9c32ffso20593ejc.5
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 03:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680776274; x=1683368274;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=msm06P3yAh7weXiwK9Xo0pOp2tzBnR7wE261K9E/Dn4=;
 b=w2Hyeq/Q9/Ca2kkKmELeSyeTIPvAbxlbelT8gzW1Xot/BaJsoB+nVFB+QNxa0ViKXf
 VksLMe1p4k2joAMKEIg7r2pCoICJa+p6n2zkrcfsWDRn8boT969WIxGgCyStcDO5K/EG
 yq0u6wXrtZq0jCW2AWksZu12bD0I1H1hOCdSfEdtna9OpiVP8DaD5HC8lF/SvKWmj0YO
 eB11PBB7xPyojfilraZLwYDjQf7CMDxE+AhZrJYZTC5JwqFF9gnrvLEPZP/ETvb+qhvI
 mTKWih9zCDpRyR+M9TR2pHEPK5R/qrFFQVn0CvQXYldA1YBTrUIDUAnbYewkEGfCLHYD
 Z0Lw==
X-Gm-Message-State: AAQBX9dn73i4z82YfiCeL1648v3tfBiII7QMmm6dT1qrDnNMjYGeQ5US
 yz7/JPLLoA40kzJ26uONHwV5LJSjiw95pUkRhZb9txdeTkXrvQTKNSvzV96+NcAi/qSzU896cDl
 vQU/lFy29/fgjiFGgu0c1eirIqXSGEGT1DVuUILFAEbKD/tX1VwPq5apRUsmwY6eiWSPGcpD0QI
 c=
X-Received: by 2002:a17:906:8056:b0:884:3174:119d with SMTP id
 x22-20020a170906805600b008843174119dmr6945319ejw.14.1680776274141; 
 Thu, 06 Apr 2023 03:17:54 -0700 (PDT)
X-Google-Smtp-Source: AKy350bddpkIhCDf8bDeeKClOQdd5GhLtG6Qi0zoGU6rJP2roHwINwsTSryVLqt9k4FL6KO/FmYg4w==
X-Received: by 2002:a17:906:8056:b0:884:3174:119d with SMTP id
 x22-20020a170906805600b008843174119dmr6945301ejw.14.1680776273792; 
 Thu, 06 Apr 2023 03:17:53 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 a29-20020a509b5d000000b004fd204d180dsm549754edj.64.2023.04.06.03.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 03:17:53 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	kwolf@redhat.com
Subject: [PATCH] block: add missing coroutine_fn annotations
Date: Thu,  6 Apr 2023 12:17:52 +0200
Message-Id: <20230406101752.242125-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

After the recent introduction of many new coroutine callbacks,
a couple calls from non-coroutine_fn to coroutine_fn have sneaked
in; fix them.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/mirror.c             | 4 ++--
 include/block/graph-lock.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/block/mirror.c b/block/mirror.c
index af9bbd23d4cf..80fa345071fe 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -270,8 +270,8 @@ static inline int64_t mirror_clip_bytes(MirrorBlockJob *s,
 
 /* Round offset and/or bytes to target cluster if COW is needed, and
  * return the offset of the adjusted tail against original. */
-static int mirror_cow_align(MirrorBlockJob *s, int64_t *offset,
-                            uint64_t *bytes)
+static int coroutine_fn mirror_cow_align(MirrorBlockJob *s, int64_t *offset,
+                                         uint64_t *bytes)
 {
     bool need_cow;
     int ret = 0;
diff --git a/include/block/graph-lock.h b/include/block/graph-lock.h
index 18cc14de22fa..ac0fef860581 100644
--- a/include/block/graph-lock.h
+++ b/include/block/graph-lock.h
@@ -208,14 +208,14 @@ typedef struct GraphLockable { } GraphLockable;
  * unlocked. TSA_ASSERT() makes sure that the following calls know that we
  * hold the lock while unlocking is left unchecked.
  */
-static inline GraphLockable * TSA_ASSERT(graph_lock) TSA_NO_TSA
+static inline GraphLockable * TSA_ASSERT(graph_lock) TSA_NO_TSA coroutine_fn
 graph_lockable_auto_lock(GraphLockable *x)
 {
     bdrv_graph_co_rdlock();
     return x;
 }
 
-static inline void TSA_NO_TSA
+static inline void TSA_NO_TSA coroutine_fn
 graph_lockable_auto_unlock(GraphLockable *x)
 {
     bdrv_graph_co_rdunlock();
-- 
2.39.2


