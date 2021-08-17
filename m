Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 659A93EECE6
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 14:56:40 +0200 (CEST)
Received: from localhost ([::1]:57632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFydz-0004b4-1K
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 08:56:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mFybX-0002st-CO
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 08:54:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mFybT-0003w6-Mn
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 08:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629204842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ayXgjvyuoUxp5DLanpT2q0tbsfHaAxV1OOK87N69+nA=;
 b=HmyGddeOjV0OAY9HD5uNRAs3JHr+WIJdHdlD5CGPNOEtACam91IaGZJZpxVbm6Cu2Xl4FR
 eUz1/cUn1ynLQUl6w8ZFXQ9VidyAAVR8mD5xuXG8cf7Q1Ts3rcYeQlD2p7bKEq+sR3yKC6
 gxJNljt+9RjWURIoor1LJl0rK6tY5Xw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-cCYB0RaHPBSwKA0ORAdw5A-1; Tue, 17 Aug 2021 08:54:00 -0400
X-MC-Unique: cCYB0RaHPBSwKA0ORAdw5A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B677093920;
 Tue, 17 Aug 2021 12:53:59 +0000 (UTC)
Received: from gator.home (unknown [10.40.195.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73C40620DE;
 Tue, 17 Aug 2021 12:53:57 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel <qemu-devel@nongnu.org>
Subject: [PATCH] qapi/machine.json: Remove zero value reference from
 SMPConfiguration documentation
Date: Tue, 17 Aug 2021 14:53:56 +0200
Message-Id: <20210817125356.9461-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 1e63fe685804 ("machine: pass QAPI struct to mc->smp_parse")
introduced documentation stating that a zero input value for an SMP
parameter indicates that its value should be automatically configured.
This is indeed how things work today, but we'd like to change that.
Avoid documenting behaviors we want to leave undefined for the time
being, giving us freedom to change it later.

Fixes: 1e63fe685804 ("machine: pass QAPI struct to mc->smp_parse")
Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 qapi/machine.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index c3210ee1fb24..157712f00614 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1288,7 +1288,7 @@
 ##
 # @SMPConfiguration:
 #
-# Schema for CPU topology configuration.  "0" or a missing value lets
+# Schema for CPU topology configuration.  A missing value lets
 # QEMU figure out a suitable value based on the ones that are provided.
 #
 # @cpus: number of virtual CPUs in the virtual machine
-- 
2.31.1


