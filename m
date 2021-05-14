Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BA9380F2B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:42:38 +0200 (CEST)
Received: from localhost ([::1]:41846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbpe-0000uy-0c
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:42:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lhbei-0002xY-Vm
 for qemu-devel@nongnu.org; Fri, 14 May 2021 13:31:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lhbeh-0007ev-D9
 for qemu-devel@nongnu.org; Fri, 14 May 2021 13:31:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621013478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OgaKi3bqPUSyL/e/XvADdG5dMLoIT+LVwi6y9+nRWdo=;
 b=Hwyp6veMX5dRzZpPQvScpcV+hjs6LzvU3PdEayrSbMz2P/U+ubl+IopdzDOmXlJSaDzAOY
 mgHezEQmCZmriigmjgY377pCNSFB3AcUCFD+KtvUSeT28G4DX2DY8JkvWIzOFpweg/+sZJ
 yKdQieRaolujSnrCSdkfZ5JbU+w7cwk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-hW9Z8mDVNB2rwysIh43brw-1; Fri, 14 May 2021 13:31:17 -0400
X-MC-Unique: hW9Z8mDVNB2rwysIh43brw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74B19801817
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 17:31:16 +0000 (UTC)
Received: from localhost.redhat.com (ovpn-113-212.ams2.redhat.com
 [10.36.113.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB41B5C1C4;
 Fri, 14 May 2021 17:31:15 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] sasl: remove comment about obsolete kerberos versions
Date: Fri, 14 May 2021 18:31:10 +0100
Message-Id: <20210514173110.1397741-5-berrange@redhat.com>
In-Reply-To: <20210514173110.1397741-1-berrange@redhat.com>
References: <20210514173110.1397741-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is not relevant to any OS distro that QEMU currently targets.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 qemu.sasl | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/qemu.sasl b/qemu.sasl
index abdfc686be..851acc7e8f 100644
--- a/qemu.sasl
+++ b/qemu.sasl
@@ -29,10 +29,6 @@ mech_list: gssapi
 # client.
 #mech_list: scram-sha-256 gssapi
 
-# Some older builds of MIT kerberos on Linux ignore this option &
-# instead need KRB5_KTNAME env var.
-# For modern Linux, and other OS, this should be sufficient
-#
 # This file needs to be populated with the service principal that
 # was created on the Kerberos v5 server. If switching to a non-gssapi
 # mechanism this can be commented out.
-- 
2.31.1


