Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E772520F4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 21:49:42 +0200 (CEST)
Received: from localhost ([::1]:33760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAewv-0007d1-GR
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 15:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAeXW-00030I-H4
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 15:23:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAeXU-0006OK-To
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 15:23:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598383403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4/bii0I0CDnJr4INXDIBwz29V0ybdvXvWPLrVxOjcLA=;
 b=ZXXLsvM+CIBlvu6k4JbUG84zNJ/17/7Yhr275tcV2VeV3R3nEFaphet/rCLK7IuojKZxC+
 BZaJNIgOoKTf4nMz0bdSLz5SQFJ7AyE4CEMtOmHoFy28upmtBjC5K73Oqfm/yfAcPKsavH
 9Cc/hpc7Eo3YXdoE1Xy6viSz3wQXntg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-QUKgB2ciPF2G1I3jsnOvsA-1; Tue, 25 Aug 2020 15:23:21 -0400
X-MC-Unique: QUKgB2ciPF2G1I3jsnOvsA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D23B210066FC
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 19:23:20 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 996777A40D;
 Tue, 25 Aug 2020 19:23:20 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 61/74] [automated] Delete duplicate QOM typedefs
Date: Tue, 25 Aug 2020 15:20:57 -0400
Message-Id: <20200825192110.3528606-62-ehabkost@redhat.com>
In-Reply-To: <20200825192110.3528606-1-ehabkost@redhat.com>
References: <20200825192110.3528606-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 06:38:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Generated using:

 $ ./scripts/codeconverter/converter.py -i \
   --pattern=QOMDuplicatedTypedefs $(git grep -l '' -- '*.[ch]')

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v2 -> v3: none

Changes v1 -> v2: none

---
Cc: "Daniel P. Berrangé" <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
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


