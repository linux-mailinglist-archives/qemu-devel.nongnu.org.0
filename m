Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EA737A7AE
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 15:33:21 +0200 (CEST)
Received: from localhost ([::1]:57712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgSVk-0007L6-6H
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 09:33:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgSQy-0008OY-8b
 for qemu-devel@nongnu.org; Tue, 11 May 2021 09:28:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgSQv-00014X-99
 for qemu-devel@nongnu.org; Tue, 11 May 2021 09:28:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620739700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GeMQTSzzVOHwDZQ+Xq2Pg+vVFosbE7QueLpfUrF0YiI=;
 b=D2YrRfD9+wSYUtUfiDNiq58rpTz443QRn61aZRFw9tDh4xBJdekmnNaWcQ3VOYYIu2aV6m
 5opufjts0mnYJrlF5y9725O5oALx/p68nyB7m1UnaL0NsaaO7oNFdLO2J8Vy0z9np07udD
 DHinFEYZld4WPhxtvJYnrg9qIxL1F8o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-cCukfJb2MjGh4TbO9E13jg-1; Tue, 11 May 2021 09:28:17 -0400
X-MC-Unique: cCukfJb2MjGh4TbO9E13jg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 507D5801817;
 Tue, 11 May 2021 13:28:16 +0000 (UTC)
Received: from foo.redhat.com (ovpn-115-93.ams2.redhat.com [10.36.115.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9894D19809;
 Tue, 11 May 2021 13:28:13 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/12] crypto: drop used conditional check
Date: Tue, 11 May 2021 14:26:36 +0100
Message-Id: <20210511132641.1022161-8-berrange@redhat.com>
In-Reply-To: <20210511132641.1022161-1-berrange@redhat.com>
References: <20210511132641.1022161-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The condition being tested has never been set since the day the code was
first introduced.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 crypto/tlscredsx509.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/crypto/tlscredsx509.c b/crypto/tlscredsx509.c
index bc503bab55..d9d6f4421e 100644
--- a/crypto/tlscredsx509.c
+++ b/crypto/tlscredsx509.c
@@ -354,11 +354,9 @@ qcrypto_tls_creds_check_cert_pair(gnutls_x509_crt_t cert,
             reason = "The certificate has been revoked";
         }
 
-#ifndef GNUTLS_1_0_COMPAT
         if (status & GNUTLS_CERT_INSECURE_ALGORITHM) {
             reason = "The certificate uses an insecure algorithm";
         }
-#endif
 
         error_setg(errp,
                    "Our own certificate %s failed validation against %s: %s",
-- 
2.31.1


