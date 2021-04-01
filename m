Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55152351508
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 15:17:40 +0200 (CEST)
Received: from localhost ([::1]:49178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRxCd-0006mp-CN
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 09:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRx7n-0001qi-UC
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:12:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39196)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lRx7m-0004R1-0e
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 09:12:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617282757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FRUA/QiBQYsVYk1+j/OxuU2IfjgkT4H6apGbA8Jzq+k=;
 b=KZCbXPI+v79YOFAT+GayLKmIQt0nNaF2OxyLbY8shSASPjGyR+wbiY0CbCByTt4eh6igzA
 BUEwa3075ReIV4Chx0J27sZfjKeaH6E2QvMrC5Eu+rYeQOD8B9uKPNo7lxbJSRARHlKPzY
 d09ogHVenVUL3XZh3fINn+jbrJSOKB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-L5x80ScKNNuj8qELyzCwtA-1; Thu, 01 Apr 2021 09:12:32 -0400
X-MC-Unique: L5x80ScKNNuj8qELyzCwtA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A879C801984;
 Thu,  1 Apr 2021 13:12:30 +0000 (UTC)
Received: from thuth.com (ovpn-112-53.ams2.redhat.com [10.36.112.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7B24173A67;
 Thu,  1 Apr 2021 13:12:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 02/13] MAINTAINERS: add/replace backups for some s390 areas
Date: Thu,  1 Apr 2021 15:12:09 +0200
Message-Id: <20210401131220.3252320-3-thuth@redhat.com>
In-Reply-To: <20210401131220.3252320-1-thuth@redhat.com>
References: <20210401131220.3252320-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matthew Rosato <mjrosato@linux.ibm.com>

S390 PCI currently has no backup, add one.  Add an additional backup
for vfio-ccw and refresh the backup for vfio-ap.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
Acked-by: Jason J. Herne <jjherne@linux.ibm.com>
Acked-by: Eric Farman <farman@linux.ibm.com>
Acked-by: Pierre Morel <pmorel@linux.ibm.com>
Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
Acked-by: Halil Pasic <pasic@linux.ibm.com>
Message-Id: <1616680509-8339-1-git-send-email-mjrosato@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 670132f7fe..fcd8da53ae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1516,6 +1516,7 @@ L: qemu-s390x@nongnu.org
 
 S390 PCI
 M: Matthew Rosato <mjrosato@linux.ibm.com>
+M: Eric Farman <farman@linux.ibm.com>
 S: Supported
 F: hw/s390x/s390-pci*
 F: include/hw/s390x/s390-pci*
@@ -1830,6 +1831,7 @@ F: docs/igd-assign.txt
 vfio-ccw
 M: Cornelia Huck <cohuck@redhat.com>
 M: Eric Farman <farman@linux.ibm.com>
+M: Matthew Rosato <mjrosato@linux.ibm.com>
 S: Supported
 F: hw/vfio/ccw.c
 F: hw/s390x/s390-ccw.c
@@ -1839,10 +1841,9 @@ T: git https://gitlab.com/cohuck/qemu.git s390-next
 L: qemu-s390x@nongnu.org
 
 vfio-ap
-M: Christian Borntraeger <borntraeger@de.ibm.com>
 M: Tony Krowiak <akrowiak@linux.ibm.com>
 M: Halil Pasic <pasic@linux.ibm.com>
-M: Pierre Morel <pmorel@linux.ibm.com>
+M: Jason Herne <jjherne@linux.ibm.com>
 S: Supported
 F: hw/s390x/ap-device.c
 F: hw/s390x/ap-bridge.c
-- 
2.27.0


