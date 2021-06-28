Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A0A3B668D
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:17:17 +0200 (CEST)
Received: from localhost ([::1]:35194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxtwi-00066c-8d
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:17:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lxtpd-0001GS-Ad
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:09:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lxtpb-00027N-OI
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:09:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624896595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DfqYkwgTKKkxPbFVd5zilcJPjt9FG4DxuN+oPlFbvLM=;
 b=drZ7RlSzFBGcObz1OTl/zUocGWThom7U3GRVBsn2LqoNx7ESywULqaMxhYlVH6KT7VPjrj
 yExFbsqzG3b9JM1Mghfu5TTUcsm8pXKA4jHeWwt3MC+PBGRClwF1bp9feSvfpq+zzhK+Qe
 LWoU1CqOXDUs0PJyATZoOehjz4XRB58=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-0pz79RqKOa6_dST-X8IkgA-1; Mon, 28 Jun 2021 12:09:30 -0400
X-MC-Unique: 0pz79RqKOa6_dST-X8IkgA-1
Received: by mail-wm1-f72.google.com with SMTP id
 i7-20020a05600c3547b02901eaa4d778adso1368204wmq.7
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 09:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DfqYkwgTKKkxPbFVd5zilcJPjt9FG4DxuN+oPlFbvLM=;
 b=RFU8JofeYPCGSXWdwZSjHCZUYCcR0AsxVo7TgnH7Uq+qN8OBE4VZsMjqxY64P/6/XH
 7HhNnlot0OM+qm7CsgsY4yxtSC6LaEFI5kcGf7Iv6HWN9fnYNd7Y4e/8NtYtgqx0QkAQ
 yy02En28nT45megREf9MbMugboUuCHAPeQ/AyQoX9NE294Ep9/cHnHckjDj5DzmvNKcx
 agebMVdJE7L30TTuQ9jPUgmilep4thOLzUGJDFemabQIVwPP2HoOKeuW/lxv3G7N2jJW
 X9LL2VCYBpeNvufW/9TAD2i4C+8Lh3PlcFaQ5jAWRhNOy76EHnWFXJKRvY9v+IhwN7CS
 KcAA==
X-Gm-Message-State: AOAM533HY5IbNKmOqTljhs0EwLiSykyZoO5Jygh/mn8Oiwpy2h0ZRdGa
 IZPP9yAvOZXib8l+pyTSxdyp8nE4Cs5W7tF/HbNGJcPEaN5ii7/sB9A9cQRlzffVwpk1dVFVkZ4
 ATrskS0Eup+I3xrYW+KQGDamf9/YV2IcmOXCIKh+td6sPMBFMbsoebcFOhovXuFPv
X-Received: by 2002:a05:600c:4f15:: with SMTP id
 l21mr15918452wmq.72.1624896569381; 
 Mon, 28 Jun 2021 09:09:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmwQff2AK0G9javFMNtow6PiB0Ulm5gL+u2Ag/NUUmes3l7f8/fAZf7Ml0Oi1KUlHk8DMRXA==
X-Received: by 2002:a05:600c:4f15:: with SMTP id
 l21mr15918433wmq.72.1624896569235; 
 Mon, 28 Jun 2021 09:09:29 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n20sm13522750wmk.12.2021.06.28.09.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 09:09:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 3/7] qemu-nbd: Use qcrypto_tls_creds_check_endpoint()
Date: Mon, 28 Jun 2021 18:09:10 +0200
Message-Id: <20210628160914.2461906-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210628160914.2461906-1-philmd@redhat.com>
References: <20210628160914.2461906-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid accessing QCryptoTLSCreds internals by using
the qcrypto_tls_creds_check_endpoint() helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qemu-nbd.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/qemu-nbd.c b/qemu-nbd.c
index 93ef4e288fd..26ffbf15af0 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -43,6 +43,7 @@
 #include "io/channel-socket.h"
 #include "io/net-listener.h"
 #include "crypto/init.h"
+#include "crypto/tlscreds.h"
 #include "trace/control.h"
 #include "qemu-version.h"
 
@@ -422,18 +423,12 @@ static QCryptoTLSCreds *nbd_get_tls_creds(const char *id, bool list,
         return NULL;
     }
 
-    if (list) {
-        if (creds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT) {
-            error_setg(errp,
-                       "Expecting TLS credentials with a client endpoint");
-            return NULL;
-        }
-    } else {
-        if (creds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_SERVER) {
-            error_setg(errp,
-                       "Expecting TLS credentials with a server endpoint");
-            return NULL;
-        }
+    if (!qcrypto_tls_creds_check_endpoint(creds,
+                                          list
+                                          ? QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT
+                                          : QCRYPTO_TLS_CREDS_ENDPOINT_SERVER,
+                                          errp)) {
+        return NULL;
     }
     object_ref(obj);
     return creds;
-- 
2.31.1


