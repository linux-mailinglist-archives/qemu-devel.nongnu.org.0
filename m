Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6303A86D9
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 18:49:37 +0200 (CEST)
Received: from localhost ([::1]:34526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltCFs-0007Dn-E2
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 12:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCET-00049Y-0C
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:48:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCEQ-0003Nf-IS
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 12:48:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623775685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Fw1kotC1lVH/taEQixoRs/erwkjLN4mt+GwVN07Ops=;
 b=KjEkXdXS4k0DoL29izYrr7dhMvC/N2Vum5P2eTimpjPHFvIPVVf3u9cQGvXHwAFmUxpGR0
 Ht5uk20PPUgc8emcqhhcz2fNSxy2xrwQ32rtYt3S6Ca6oeA8O0yXZuQPWmF+iE1Sd7mM/k
 3IWficAn/eSE9Nxthv6bDXAIiaT1T3Q=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-0rpE6DdGP9O3zg_keUTPPw-1; Tue, 15 Jun 2021 12:48:02 -0400
X-MC-Unique: 0rpE6DdGP9O3zg_keUTPPw-1
Received: by mail-wr1-f71.google.com with SMTP id
 f22-20020a5d58f60000b029011634e39889so8847397wrd.7
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 09:48:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Fw1kotC1lVH/taEQixoRs/erwkjLN4mt+GwVN07Ops=;
 b=CASkx0vfq4GkpsKepkcKK6oGN4q1yYS853fZy4NT7u/Dm7keBzgE8svRFOc+YKzYiI
 oPI5HgTw5ecrCZtNpQeuilpdarIFulTgdjGzSl+GNc7gbxGhirXZ0/xKgsALB1EXe0Jn
 QfXRP8ChfTDUpuHjdZS6ixjqj7UCM78z/rfHmutFqDJ1WtJBk/HeTm7uZyJ/Y1Md3Fx/
 Lkp64BmEXQ73l6aJh6mpglnSm7pzOR2RRmNu1r1o3M4Y59bhISTXdo0Gg1md1DDjDdee
 JaOxO06lQpqlxUuYzg0r4CpOmrvX527LqdDwyNXdeG2Tdg0PIftPq7HKKq9nhnt/hX0o
 wY/A==
X-Gm-Message-State: AOAM532acCfTTxjOWl723DbCa9TRABVfkCfJfG/swkZNBaneIStrg/JK
 srNMk2GadSmIDjuvB1JLnxNDxzowW3y/SbQxKrsa4ivL4X4Dln7tGHJgQoft/9aPbOMLxoX4CeP
 dxKPr1kJqIu/0SRc0g+n1rgvZrRAbHYjJhLhAWnMmN5FOzGd31A8YhxKADzNuUXAL
X-Received: by 2002:a05:600c:4106:: with SMTP id
 j6mr251029wmi.76.1623775681387; 
 Tue, 15 Jun 2021 09:48:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUdxFiBydGXgexDzux/ZY5de2M9nyzL02rD7TQ+EjluHtFmKVL3qJUuuiGC6v/XIK1WMGarA==
X-Received: by 2002:a05:600c:4106:: with SMTP id
 j6mr251010wmi.76.1623775681231; 
 Tue, 15 Jun 2021 09:48:01 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id g17sm19651154wrp.61.2021.06.15.09.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 09:48:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/7] block/nbd: Use qcrypto_tls_creds_check_endpoint()
Date: Tue, 15 Jun 2021 18:47:46 +0200
Message-Id: <20210615164751.2192807-3-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210615164751.2192807-1-philmd@redhat.com>
References: <20210615164751.2192807-1-philmd@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Leonardo Bras <leobras.c@gmail.com>, Lukas Straub <lukasstraub2@web.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid accessing QCryptoTLSCreds internals by using
the qcrypto_tls_creds_check_endpoint() helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 block/nbd.c    | 3 ++-
 blockdev-nbd.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 616f9ae6c4d..c3523ebf785 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -2159,7 +2159,8 @@ static QCryptoTLSCreds *nbd_get_tls_creds(const char *id, Error **errp)
         return NULL;
     }
 
-    if (creds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT) {
+    if (!qcrypto_tls_creds_check_endpoint(creds,
+                                          QCRYPTO_TLS_CREDS_ENDPOINT_CLIENT)) {
         error_setg(errp,
                    "Expecting TLS credentials with a client endpoint");
         return NULL;
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index b264620b98d..b6023052ac7 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -108,7 +108,8 @@ static QCryptoTLSCreds *nbd_get_tls_creds(const char *id, Error **errp)
         return NULL;
     }
 
-    if (creds->endpoint != QCRYPTO_TLS_CREDS_ENDPOINT_SERVER) {
+    if (!qcrypto_tls_creds_check_endpoint(creds,
+                                          QCRYPTO_TLS_CREDS_ENDPOINT_SERVER)) {
         error_setg(errp,
                    "Expecting TLS credentials with a server endpoint");
         return NULL;
-- 
2.31.1


