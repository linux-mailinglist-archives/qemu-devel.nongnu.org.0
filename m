Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE5B223D7B
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jul 2020 15:58:05 +0200 (CEST)
Received: from localhost ([::1]:54734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jwQsG-0007cC-GK
	for lists+qemu-devel@lfdr.de; Fri, 17 Jul 2020 09:58:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jwQr9-0006je-KW
 for qemu-devel@nongnu.org; Fri, 17 Jul 2020 09:56:55 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:35894
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1jwQr8-0003M6-7S
 for qemu-devel@nongnu.org; Fri, 17 Jul 2020 09:56:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594994213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xTsdgipZQ+6ON7x3p7w9li8wFN7PR3xRLD0hO4lcx6w=;
 b=h50xd+VSKSE9Wb9Tlg5F4Ni1/WDxezyKStz3YGZJwd4BIIAppaqa0NzorEUapKbd2kCeZn
 GxayqMqwYJG1spMsNSP14vUO4sjdMQWCA4zU3Ep/TTjWtSdV+ynX94aG+8UN7uhFUUFL/5
 1n8wSoTGWdc21nBzMVc6CHLVmrYn8D4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-69kIGf6EP4-zaOTnu8Hflw-1; Fri, 17 Jul 2020 09:56:49 -0400
X-MC-Unique: 69kIGf6EP4-zaOTnu8Hflw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B403100CCC2;
 Fri, 17 Jul 2020 13:56:48 +0000 (UTC)
Received: from localhost (ovpn-113-15.ams2.redhat.com [10.36.113.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F4A45FC2E;
 Fri, 17 Jul 2020 13:56:47 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 1/1] docs/s390x: fix vfio-ccw type
Date: Fri, 17 Jul 2020 15:56:33 +0200
Message-Id: <20200717135633.791340-2-cohuck@redhat.com>
In-Reply-To: <20200717135633.791340-1-cohuck@redhat.com>
References: <20200717135633.791340-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/17 01:33:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eric Farman <farman@linux.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix the type name in the mdevctl example.

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
Message-Id: <20200716145031.771476-1-cohuck@redhat.com>
---
 docs/system/s390x/vfio-ccw.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/s390x/vfio-ccw.rst b/docs/system/s390x/vfio-ccw.rst
index 8f65442c0f56..41e0bad5b489 100644
--- a/docs/system/s390x/vfio-ccw.rst
+++ b/docs/system/s390x/vfio-ccw.rst
@@ -29,7 +29,7 @@ automatically, use
 
    [root@host ~]# driverctl -b css set-override 0.0.0313 vfio_ccw
    [root@host ~]# mdevctl define -u 7e270a25-e163-4922-af60-757fc8ed48c6 \
-                  -p 0.0.0313 -t vfio-ccw_io -a
+                  -p 0.0.0313 -t vfio_ccw-io -a
 
 If using ``mdevctl`` is not possible or wanted, follow the manual procedure
 below.
-- 
2.25.4


