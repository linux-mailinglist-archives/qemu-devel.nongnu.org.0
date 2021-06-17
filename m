Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0583AB458
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 15:10:28 +0200 (CEST)
Received: from localhost ([::1]:48002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrmt-0001PR-Kr
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 09:10:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltqyt-0005Wy-SL
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:18:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltqyq-00087l-2x
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:18:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623932323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MJbc/G5LNsyD5V8LmC6w86fKEuSJG2YZCbtV6MI1WEQ=;
 b=E0tAjncx/7wN6mklfatyfYEIKiv5clyjb6lLXsJzie/x+y4PYKCOIXNFSYF2n2XFeXKV3p
 6fkhIaGEJCmTTnaJSyejFjwUvFB/JzkIi4H3FbqHR3cgcWSTTqa+nOX6GiMLI21tThe803
 ueoQWYW7GQMgB0b5VLPRcPHQp7oNTwQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-x8vXWOIRObix159CVkrLhw-1; Thu, 17 Jun 2021 08:18:42 -0400
X-MC-Unique: x8vXWOIRObix159CVkrLhw-1
Received: by mail-wm1-f70.google.com with SMTP id
 m6-20020a7bce060000b02901d2a0c361bfso1102542wmc.4
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:18:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MJbc/G5LNsyD5V8LmC6w86fKEuSJG2YZCbtV6MI1WEQ=;
 b=Bs41rAqmxqjtrBcUzvd1DvOrViLkpo6TrrHVrGkPEl5BqUeeU4vhYDL1ofneK5YFRM
 aImOBCzYa/+7+v2AYHlRKgrT2Jzp036ZTLoYgOwrIvs0sUXIy5wO5lUxJB39dQRmpAoi
 dDBm1ptSpJwetXbYfVUCcvgHXc374Pa9VYoZTIERt0MxhYqa8ECoyyOXqfW5M1Xkf7Jc
 mteuZPW0Z/hHzhrTZqh1k4fAclSs6r86+bnIF6SXZbffdwFnGEomw3VI1Gpg3DaPfs4b
 kkaxWtc/YF/TbsK/5j8U/7faq+a65JwX27wsaFQltZncsmEIYb//P9ZBj+vVrEPNc/u5
 RNEw==
X-Gm-Message-State: AOAM531EKcxD6rq2Ai3Nn7uvM1AVJup11gQ4iUMkP8aYUw9prN0PJcIz
 aff12IvN0fxLXXGnNROdSEHweuSwJV7KrVQ9JyIYLsqE1xvnRguNpL6WiDNabIt8+zFb2Ikbjc1
 S8Rqc/8/ABvnRb+iWhsXyfiype0McDdBtV/mL4eXsj0RNngUHUtNI0BiGKPY4ElKz
X-Received: by 2002:a1c:ed14:: with SMTP id l20mr4727202wmh.20.1623932320826; 
 Thu, 17 Jun 2021 05:18:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuw4KHdgGgrgglIX/lfQd4zE+qGZ71URc9xaY5fYZuHR8g8lq/MdVVtrg8fek+u/8IGxDj8g==
X-Received: by 2002:a1c:ed14:: with SMTP id l20mr4727189wmh.20.1623932320692; 
 Thu, 17 Jun 2021 05:18:40 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id a24sm4251890wmj.30.2021.06.17.05.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:18:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/6] block/nbd: Use qcrypto_tls_creds_check_endpoint()
Date: Thu, 17 Jun 2021 14:18:26 +0200
Message-Id: <20210617121830.2776182-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617121830.2776182-1-philmd@redhat.com>
References: <20210617121830.2776182-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid accessing QCryptoTLSCreds internals by using
the qcrypto_tls_creds_check_endpoint() helper.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/nbd.c    | 6 +++---
 blockdev-nbd.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 616f9ae6c4d..b13a33c3d21 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -2159,9 +2159,9 @@ static QCryptoTLSCreds *nbd_get_tls_creds(const char *id, Error **errp)
         return NULL;
     }
 
-    if (creds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT) {
-        error_setg(errp,
-                   "Expecting TLS credentials with a client endpoint");
+    if (!qcrypto_tls_creds_check_endpoint(creds,
+                                          QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT,
+                                          errp)) {
         return NULL;
     }
     object_ref(obj);
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index b264620b98d..bdfa7ed3a5a 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -108,9 +108,9 @@ static QCryptoTLSCreds *nbd_get_tls_creds(const char *id, Error **errp)
         return NULL;
     }
 
-    if (creds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_SERVER) {
-        error_setg(errp,
-                   "Expecting TLS credentials with a server endpoint");
+    if (!qcrypto_tls_creds_check_endpoint(creds,
+                                          QCRYPTO_TLS_CREDS_ENDPOINT_SERVER,
+                                          errp)) {
         return NULL;
     }
     object_ref(obj);
-- 
2.31.1


