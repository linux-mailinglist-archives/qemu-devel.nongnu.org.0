Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C36244178
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Aug 2020 00:48:15 +0200 (CEST)
Received: from localhost ([::1]:43278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k6M18-0005eK-K2
	for lists+qemu-devel@lfdr.de; Thu, 13 Aug 2020 18:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k6Lgo-0005y7-Vh
 for qemu-devel@nongnu.org; Thu, 13 Aug 2020 18:27:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26964
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k6Lgn-0002vx-3l
 for qemu-devel@nongnu.org; Thu, 13 Aug 2020 18:27:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597357632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hyn0lhsGikhPlIEonNf+uE6ge5tDeAg7+buTd1loNoE=;
 b=doj+zf7lSQSVYdYSs89bRagxVNhgp4hd+RgixJyd//96CgFvFFxmjYsl1mmzMwFhPdUhwA
 fS39zpdWe0rXJ2iQZj3eQV4P3rhgqHs4fMPSjcaUdRZHEewmHNU1ADpUhRd3UxJCGcOH8n
 NumvqZs0Z5/kD9sfl9dWEQLQqVH8Xto=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-dZlnZa1TNx2g6TrvJMfdHQ-1; Thu, 13 Aug 2020 18:27:10 -0400
X-MC-Unique: dZlnZa1TNx2g6TrvJMfdHQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7DB91DDEA
 for <qemu-devel@nongnu.org>; Thu, 13 Aug 2020 22:27:09 +0000 (UTC)
Received: from localhost (ovpn-117-153.rdu2.redhat.com [10.10.117.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60B666198E;
 Thu, 13 Aug 2020 22:27:09 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 33/41] [automated] Delete duplicate QOM typedefs
Date: Thu, 13 Aug 2020 18:26:17 -0400
Message-Id: <20200813222625.243136-34-ehabkost@redhat.com>
In-Reply-To: <20200813222625.243136-1-ehabkost@redhat.com>
References: <20200813222625.243136-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 17:30:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Generated using:

 $ ./scripts/codeconverter/converter.py -i \
   --pattern=QOMDuplicatedTypedefs $(git grep -l '' -- '*.[ch]')

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/crypto/secret_keyring.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/crypto/secret_keyring.h b/include/crypto/secret_keyring.h
index 9f371ad251..4345eb048e 100644
--- a/include/crypto/secret_keyring.h
+++ b/include/crypto/secret_keyring.h
@@ -39,14 +39,14 @@
 typedef struct QCryptoSecretKeyring QCryptoSecretKeyring;
 typedef struct QCryptoSecretKeyringClass QCryptoSecretKeyringClass;
 
-typedef struct QCryptoSecretKeyring {
+struct QCryptoSecretKeyring {
     QCryptoSecretCommon parent;
     int32_t serial;
-} QCryptoSecretKeyring;
+};
 
 
-typedef struct QCryptoSecretKeyringClass {
+struct QCryptoSecretKeyringClass {
     QCryptoSecretCommonClass parent;
-} QCryptoSecretKeyringClass;
+};
 
 #endif /* QCRYPTO_SECRET_KEYRING_H */
-- 
2.26.2


