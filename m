Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E763AA141
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 18:27:36 +0200 (CEST)
Received: from localhost ([::1]:60296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltYO7-0002oe-JI
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 12:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltYJV-00010e-CL
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:22:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltYJT-0002Ey-Oy
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:22:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623860567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k9Lp1hpOHTUDUkB6RWqmF0u0II8iRadKEZCA3yeM8Ts=;
 b=akprm1w7gFAEqPUiGIH8UOiE6TY8OqnuB37vkpJeGQ28Olc3VcBa/I9iyckHtIcQZmVHL1
 xHt4e9sR/YjGV1yg1TbjijfTzqE1du3ps9T4eiWLCo6gReV9c+ipFyLnZ5yzJ+OpTHx+K8
 VzXkAvXWh7VvyM5rnmiUi4Ce8K42PoM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-330-rfoSBVX1O3a10_5G3ih_Yw-1; Wed, 16 Jun 2021 12:22:41 -0400
X-MC-Unique: rfoSBVX1O3a10_5G3ih_Yw-1
Received: by mail-wm1-f72.google.com with SMTP id
 v25-20020a1cf7190000b0290197a4be97b7so1434600wmh.9
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 09:22:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k9Lp1hpOHTUDUkB6RWqmF0u0II8iRadKEZCA3yeM8Ts=;
 b=mX+uWW90jr0v9JxpUsxcu10ovsX0FYfon3iwm2Ct0PIt9D59jLBPWNVlzeqskE1D/n
 BCgDTW92Ib532AGpzfQQqIyiB4QUP5Ftv0yKzcttHdaufcpbiRW3PU8GhkAx9QgmVeij
 yoKfw6CD0HcfzH4/2jZMuJkGAlrYX81ZsqQGNrXRx1hfF4HUfPIXfCSEkTQYAcqKDE2n
 kz2mcWZjZuhc96wUtaOPCMrPHbbxj/eVprJhTSaWOjduGm+2zTM/1jJ4nbaYqmqeuSjy
 H+wa6SUmYYNGc9QpCLA/r500S3z1eOEGHoheK5yYIQ2Ln7MTDF6z0RRithz2bJHhWutF
 wF8w==
X-Gm-Message-State: AOAM53059sBbB4en5r1lWy/+wKnlp/OpOIglvYl1jIR6qM05z09Z7kFV
 /A6QKL2Bh9NzKkNo+1H8oJ7x1BT/yvQO4jCow4s2Wve2w1FuS2ZuUaj19wehqbLQ2AFxPBenw1P
 kZHLajbg6gQ7mqRoBgNsGtHqYWI1Up4Uc/KwuYl7adpPmzzYsizek4WbYGWvSXgCd
X-Received: by 2002:a1c:a785:: with SMTP id q127mr779525wme.152.1623860559613; 
 Wed, 16 Jun 2021 09:22:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2q0FNzByA2T8pqjfp3wFtkJ7fe8iaB43Gzj9lUVtPORVbvITlbcidS0lIJEAAHx9Mi1HBxA==
X-Received: by 2002:a1c:a785:: with SMTP id q127mr779514wme.152.1623860559436; 
 Wed, 16 Jun 2021 09:22:39 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id v17sm3275382wrp.36.2021.06.16.09.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 09:22:39 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 3/7] chardev/socket: Use qcrypto_tls_creds_check_endpoint()
Date: Wed, 16 Jun 2021 18:22:21 +0200
Message-Id: <20210616162225.2517463-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210616162225.2517463-1-philmd@redhat.com>
References: <20210616162225.2517463-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid accessing QCryptoTLSCreds internals by using
the qcrypto_tls_creds_check_endpoint() helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 chardev/char-socket.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index daa89fe5d1d..d0fb5459638 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -1402,18 +1402,12 @@ static void qmp_chardev_open_socket(Chardev *chr,
             return;
         }
         object_ref(OBJECT(s->tls_creds));
-        if (is_listen) {
-            if (s->tls_creds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_SERVER) {
-                error_setg(errp, "%s",
-                           "Expected TLS credentials for server endpoint");
-                return;
-            }
-        } else {
-            if (s->tls_creds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT) {
-                error_setg(errp, "%s",
-                           "Expected TLS credentials for client endpoint");
-                return;
-            }
+        if (!qcrypto_tls_creds_check_endpoint(s->tls_creds,
+                                          is_listen
+                                          ? QCRYPTO_TLS_CREDS_ENDPOINT_SERVER
+                                          : QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT,
+                                          errp)) {
+            return;
         }
     }
     s->tls_authz = g_strdup(sock->tls_authz);
-- 
2.31.1


