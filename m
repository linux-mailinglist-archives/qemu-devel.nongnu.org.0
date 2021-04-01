Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4250350E61
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 07:19:27 +0200 (CEST)
Received: from localhost ([::1]:44410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRpjq-0000Dz-Nl
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 01:19:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRpj6-0008GU-3L
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 01:18:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRpj3-0008Rr-DV
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 01:18:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617254315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+ZgKGYDUAqwB0ZU2iwhyHRbK1NrPHYdy6cUlBr6QwxI=;
 b=OvvrFuqm1nZRvuDSGML9V0YrxW+Vl0r3ry26PExwk9JKstQVcHbyerHGW2EjYZdZo0bTlO
 Elx0ahDZSVgYUou0KYGaZE7z1KkR8Zzdcxeiu+JzU77CgscLaYxB62JcPiiQ6Mi1WIMlo7
 cQLIw9DocrcJdLG/873Ad31fbBQ5Yig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-GyjWRuxWNKW51GHVyLzEKA-1; Thu, 01 Apr 2021 01:18:34 -0400
X-MC-Unique: GyjWRuxWNKW51GHVyLzEKA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C74276B9C1;
 Thu,  1 Apr 2021 05:18:32 +0000 (UTC)
Received: from thuth.com (ovpn-112-53.ams2.redhat.com [10.36.112.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4E255D748;
 Thu,  1 Apr 2021 05:18:31 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	pbonzini@redhat.com
Subject: [PATCH] docs: Fix typo in the default name of the qemu-system-x86_64
 binary
Date: Thu,  1 Apr 2021 07:18:29 +0200
Message-Id: <20210401051829.3169438-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's a '-' between 'qemu' and 'system', not a '_'.

Fixes: 324b2298fe ("docs/system: convert Texinfo documentation to rST")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/defs.rst.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/defs.rst.inc b/docs/defs.rst.inc
index 48d05aaf33..52d6454b93 100644
--- a/docs/defs.rst.inc
+++ b/docs/defs.rst.inc
@@ -10,6 +10,6 @@
    incorrectly in boldface.
 
 .. |qemu_system| replace:: qemu-system-x86_64
-.. |qemu_system_x86| replace:: qemu_system-x86_64
+.. |qemu_system_x86| replace:: qemu-system-x86_64
 .. |I2C| replace:: I\ :sup:`2`\ C
 .. |I2S| replace:: I\ :sup:`2`\ S
-- 
2.27.0


