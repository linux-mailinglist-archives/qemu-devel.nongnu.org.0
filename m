Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF07A276D78
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 11:29:34 +0200 (CEST)
Received: from localhost ([::1]:52434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLNZF-0000i8-Uc
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 05:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kLNTN-0000Ia-Lu
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 05:23:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kLNTM-0005zC-0H
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 05:23:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600939407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=onQMoCCAGls0VB8cHuzv+FYOkPBuZIpvYqOxHWyox8c=;
 b=Y1ZF1MdWkLzTrMsqpaAd0zo6okge/MHGxlBd2QDb4dnrFMAYpGp1jJWCtz0GzGHlFNuz9c
 PlTRr5WrRDLpvZE9wf6mLkymW8RHei8M8lIKQtPmIHecol5H8mEEvCfSvPYS2XKV/goyn+
 kwLcGsKvy8abduTZGHtCRGHTFhHO7EI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-sbgw9wenN1i4EZbVtZI7ow-1; Thu, 24 Sep 2020 05:23:25 -0400
X-MC-Unique: sbgw9wenN1i4EZbVtZI7ow-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AC0F64142
 for <qemu-devel@nongnu.org>; Thu, 24 Sep 2020 09:23:24 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70C5C73662;
 Thu, 24 Sep 2020 09:23:21 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/92] MAINTAINERS: add Paolo Bonzini as RCU maintainer
Date: Thu, 24 Sep 2020 05:21:50 -0400
Message-Id: <20200924092314.1722645-9-pbonzini@redhat.com>
In-Reply-To: <20200924092314.1722645-1-pbonzini@redhat.com>
References: <20200924092314.1722645-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefan Hajnoczi <stefanha@redhat.com>

The RCU code that Paolo maintains is missing a MAINTAINERS file entry.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20200909090851.14458-1-stefanha@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3d17cad19a..9b01385484 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2310,6 +2310,14 @@ F: softmmu/cpus.c
 F: softmmu/cpu-throttle.c
 F: qapi/run-state.json
 
+Read, Copy, Update (RCU)
+M: Paolo Bonzini <pbonzini@redhat.com>
+S: Maintained
+F: include/qemu/rcu*.h
+F: tests/rcutorture.c
+F: tests/test-rcu-*.c
+F: util/rcu.c
+
 Human Monitor (HMP)
 M: Dr. David Alan Gilbert <dgilbert@redhat.com>
 S: Maintained
-- 
2.26.2



