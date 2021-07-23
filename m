Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF7E3D3854
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 12:08:10 +0200 (CEST)
Received: from localhost ([::1]:48544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6s6C-0005SN-9U
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 06:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m6s43-00034S-4o
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 06:05:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m6s3w-0007C4-1Y
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 06:05:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627034747;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qmbyY9+dCBfOfDQ4ImscPjRaMqu27KsEx4qXonP/C90=;
 b=HTsEoCSrZXhPTf0r5/+5h5Lu5DoPGHoGhiS5F5cVyTs8opBt0H2PhkBo66iCkRHeA+ooy7
 MKjcHR7oYUTWPQf8nVOjkdCRqLVg/eZL7+AuI0ZeCgDM9EK6I2Wq/iEuL3AKk4YFHQAFeZ
 gun5X04gv9Ecb2cmlXxoSU4RfqWgfEg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-M7ePelveMn6x8bDMLJYjaw-1; Fri, 23 Jul 2021 06:05:45 -0400
X-MC-Unique: M7ePelveMn6x8bDMLJYjaw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25F87100E424;
 Fri, 23 Jul 2021 10:05:45 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-112-253.ams2.redhat.com [10.36.112.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C871118431;
 Fri, 23 Jul 2021 10:05:43 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] MAINTAINERS: Add Peter Xu and myself as co-maintainer of
 "Memory API"
Date: Fri, 23 Jul 2021 12:05:31 +0200
Message-Id: <20210723100532.27353-3-david@redhat.com>
In-Reply-To: <20210723100532.27353-1-david@redhat.com>
References: <20210723100532.27353-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter and myself volunteered to help out co-maintaining "Memory API"
with Paolo, so let's update the MAINTAINERS file.

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 420c8a48a1..190a90b541 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2452,6 +2452,8 @@ F: tests/tcg/multiarch/gdbstub/
 
 Memory API
 M: Paolo Bonzini <pbonzini@redhat.com>
+M: Peter Xu <peterx@redhat.com>
+M: David Hildenbrand <david@redhat.com>
 S: Supported
 F: include/exec/ioport.h
 F: include/exec/memop.h
-- 
2.31.1


