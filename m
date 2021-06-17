Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF983AB40B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:51:27 +0200 (CEST)
Received: from localhost ([::1]:48046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltrUU-0005RH-81
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:51:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltqz4-0006CQ-DC
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:18:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltqz2-0008Fp-MX
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:18:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623932335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lA172G+I+IfUfLvJFW+kzkJQJqfkjxqI81rKpGJsFzw=;
 b=PRCen3NG3zbRDxSMnGaOjC7Lv/WIVQUjcarHtm4YDh7VBx2jek4Elr0hZKMG+ag/3q2kQu
 gj87NFDCyGpdBrslnQ3yzJXymZDR0qZV0hXpd+L45xtV6aAwgRO1yQrMk/aCi+qTxAjQta
 LXJKikSAzfngqshelwmn2gCJrEoJcXM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-Owuffse7Nnu5k5dyoQU-tQ-1; Thu, 17 Jun 2021 08:18:55 -0400
X-MC-Unique: Owuffse7Nnu5k5dyoQU-tQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 r4-20020a7bc0840000b02901b7cb5713ecso2026551wmh.1
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lA172G+I+IfUfLvJFW+kzkJQJqfkjxqI81rKpGJsFzw=;
 b=UNUDrEnuLQkHfVMhIeD0ozJ/3jxCs9ESJt29nqToXXv8Rnaiq8nq/GNjlrQqrZ8v+v
 zymeiNnozZv9CEOt5sLZVjWxp4OMD2RPItJz9lisge056t3HkUS36H2LTzrL8zE33z5M
 03Xi2HWT5UYEFornmOlKH10mQ1uBjXSqZudY9trIsw644rcBIwRbjTzwsKReMF1RT+P5
 04OAgyzdgjrZ4PvmaKD5ckdQE/lbWM/JiOWRti46HoWWbEkYFK3AeN8ccXgmVk+ebPOH
 iF2favDXVnlwTib1BBe7fLw+14f8q2gIA9C2YfZb4yyaZDzYibe45GKzQz37ah8N96Bq
 B+Sg==
X-Gm-Message-State: AOAM533GXoacE/TSiTFsXi05vfYMFQcN4pE9RP3guW8NB7SJz6az+C+C
 8+mr5838DijnzxJYwJrFwma+mdPNF/dM3FT0tJGQD00sRVeMbBjWk0uQshJBc4xdRpUkjSMx1kz
 yWi5C3GWWV6WBvTwADeL4RBaVjB2RLGP+b9fN2iWwELZbLvMsG+R4sYB+2VcpNe5r
X-Received: by 2002:a7b:c157:: with SMTP id z23mr4766705wmi.99.1623932333668; 
 Thu, 17 Jun 2021 05:18:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwg13/n2h68wYxJqXF2EPeJ5395OW35gkHwl/utKdLGcSocloIgVYfUwwW8cKcgnnHhNReRUw==
X-Received: by 2002:a7b:c157:: with SMTP id z23mr4766667wmi.99.1623932333423; 
 Thu, 17 Jun 2021 05:18:53 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id r4sm5188230wrx.24.2021.06.17.05.18.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 05:18:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 5/6] ui/vnc: Use qcrypto_tls_creds_check_endpoint()
Date: Thu, 17 Jun 2021 14:18:29 +0200
Message-Id: <20210617121830.2776182-6-philmd@redhat.com>
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid accessing QCryptoTLSCreds internals by using
the qcrypto_tls_creds_check_endpoint() helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 ui/vnc.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index b3d4d7b9a5f..f7d63a16dd5 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -46,6 +46,7 @@
 #include "qapi/qapi-commands-ui.h"
 #include "ui/input.h"
 #include "crypto/hash.h"
+#include "crypto/tlscreds.h"
 #include "crypto/tlscredsanon.h"
 #include "crypto/tlscredsx509.h"
 #include "crypto/random.h"
@@ -4080,9 +4081,9 @@ void vnc_display_open(const char *id, Error **errp)
         }
         object_ref(OBJECT(vd->tlscreds));
 
-        if (vd->tlscreds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_SERVER) {
-            error_setg(errp,
-                       "Expecting TLS credentials with a server endpoint");
+        if (!qcrypto_tls_creds_check_endpoint(vd->tlscreds,
+                                              QCRYPTO_TLS_CREDS_ENDPOINT_SERVER,
+                                              errp)) {
             goto fail;
         }
     }
-- 
2.31.1


