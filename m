Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D41F0493715
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 10:19:26 +0100 (CET)
Received: from localhost ([::1]:45314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA77l-0007mE-8M
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 04:19:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nA6PC-0006rJ-P1
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:33:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nA6PA-0006M6-2w
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 03:33:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642581199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cx9bq+4n5tPdK36ksYIUnTcdkcQ7lt3JScVomUqMMY8=;
 b=g8SEU5GJD7LJGOLLyFdwR3r4CoXJ1nETTzG2H+RwpOfc1ab/eNLQIKfaHifT4M3zuIRglv
 RMdHfj50vBjvMAw4vZYuiNG6eAtKzKMpMbVe8YVKNeOyfXsoaxUwgCn/KDwn5SMUsICSdE
 DrWRGtGZJAZgqD8GxKm9Bllnw6VQdJo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-LsNEhxy1NqqBjg6Yps9ANA-1; Wed, 19 Jan 2022 03:33:14 -0500
X-MC-Unique: LsNEhxy1NqqBjg6Yps9ANA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD1C11966323;
 Wed, 19 Jan 2022 08:33:12 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2339C4F858;
 Wed, 19 Jan 2022 08:33:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/10] MAINTAINERS: Add myself to s390 I/O areas
Date: Wed, 19 Jan 2022 09:32:13 +0100
Message-Id: <20220119083215.120911-9-thuth@redhat.com>
In-Reply-To: <20220119083215.120911-1-thuth@redhat.com>
References: <20220119083215.120911-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Halil Pasic <pasic@linux.ibm.com>, Peter Maydell <peter.maydell@linaro.org>,
 Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Farman <farman@linux.ibm.com>

After the recent restructuring, I'd like to volunteer to help
in some of the s390 I/O areas.

Built on "[PATCH RFC v2] MAINTAINERS: split out s390x sections"

Signed-off-by: Eric Farman <farman@linux.ibm.com>
Acked-by: Christian Borntraeger <borntraeger@linux.ibm.com>
Acked-by: Halil Pasic <pasic@linux.ibm.com>
Message-Id: <20220112164044.2210508-1-farman@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 793d6edd2d..893a556710 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1525,6 +1525,7 @@ S390 Machines
 S390 Virtio-ccw
 M: Halil Pasic <pasic@linux.ibm.com>
 M: Christian Borntraeger <borntraeger@linux.ibm.com>
+M: Eric Farman <farman@linux.ibm.com>
 S: Supported
 F: hw/s390x/
 F: include/hw/s390x/
@@ -1555,6 +1556,7 @@ L: qemu-s390x@nongnu.org
 S390 channel subsystem
 M: Halil Pasic <pasic@linux.ibm.com>
 M: Christian Borntraeger <borntraeger@linux.ibm.com>
+M: Eric Farman <farman@linux.ibm.com>
 S: Supported
 F: hw/s390x/ccw-device.[ch]
 F: hw/s390x/css.c
@@ -1987,6 +1989,7 @@ T: git https://github.com/stefanha/qemu.git block
 virtio-ccw
 M: Cornelia Huck <cohuck@redhat.com>
 M: Halil Pasic <pasic@linux.ibm.com>
+M: Eric Farman <farman@linux.ibm.com>
 S: Supported
 F: hw/s390x/virtio-ccw*.[hc]
 F: hw/s390x/vhost-vsock-ccw.c
-- 
2.27.0


