Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5338C3DAA9C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 20:01:39 +0200 (CEST)
Received: from localhost ([::1]:34150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9ALi-0002Pj-BT
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 14:01:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m9AGR-0006bd-Af
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 13:56:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1m9AGP-0007yh-MY
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 13:56:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627581369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S860YdtNoc77PfMKfZoGPzVURCkoaFO2STQSDN5Val8=;
 b=AfSpXdKEb2f/AO9pNbvwu2qsHtLv8alB3LALVexowgDiFrX3cSLWAyRX6vnhEqYIyXKGPK
 J5Dkcl4SJXShQT6cSu0aHjY24nJaS4nPqVtW6BguYYct3Xu1bgOPMhYstkmPv8Kj/JBbtq
 KxeMC3AAawIUQ4RxPQO8NfLQm0yYW6A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-1xmUPN_7OzGfh70rRs8DWw-1; Thu, 29 Jul 2021 13:56:07 -0400
X-MC-Unique: 1xmUPN_7OzGfh70rRs8DWw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC0891006C80
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 17:56:06 +0000 (UTC)
Received: from localhost (unknown [10.22.18.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9EB326DF1;
 Thu, 29 Jul 2021 17:56:02 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 06/10] docs: qom: Remove unnecessary class typedefs
 from example
Date: Thu, 29 Jul 2021 13:55:50 -0400
Message-Id: <20210729175554.686474-7-ehabkost@redhat.com>
In-Reply-To: <20210729175554.686474-1-ehabkost@redhat.com>
References: <20210729175554.686474-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When there's no specific class struct used for a QOM type, we
normally don't define a typedef for it.  Remove the typedef from
the minimal example, as it is unnecessary.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 docs/devel/qom.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
index 05d045bf570..dee60a64c0a 100644
--- a/docs/devel/qom.rst
+++ b/docs/devel/qom.rst
@@ -20,9 +20,6 @@ features:
 
    #define TYPE_MY_DEVICE "my-device"
 
-   // No new virtual functions: we can reuse the typedef for the
-   // superclass.
-   typedef DeviceClass MyDeviceClass;
    typedef struct MyDevice
    {
        DeviceState parent;
-- 
2.31.1


