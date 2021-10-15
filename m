Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E5542EDDF
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 11:40:27 +0200 (CEST)
Received: from localhost ([::1]:41074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbJhS-0000h6-Oh
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 05:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mbJKQ-0003NF-VC
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:16:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mbJKN-0001hD-QT
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 05:16:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634289395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=39mpKyfQzFUvMLQIWNYKT54CvURXfTTnFtQjyxMOOCQ=;
 b=KMLX3WMp7eM8jA+oYl7oO4Jv9cg0nweXYaUerGi1LGVltV/pSdAWHygaWiHVUUjycKfnsS
 CrE5xg7pOyC9h5R3xGfhl8xzHIb2HyBIfedpQv3ywF/bQifzwfW59cEVdBzXhCpSfM+CK3
 G2TWnhuXbU+F04hz6xVSzaBH7ZbnqeU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-6A6zXidsPMWhfC9MBqEQhg-1; Fri, 15 Oct 2021 05:16:31 -0400
X-MC-Unique: 6A6zXidsPMWhfC9MBqEQhg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A73CB80365C;
 Fri, 15 Oct 2021 09:16:30 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BD3337093A;
 Fri, 15 Oct 2021 09:16:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 5/6] s390x virtio-ccw machine: step down as maintainer
Date: Fri, 15 Oct 2021 11:16:21 +0200
Message-Id: <20211015091622.1302433-6-thuth@redhat.com>
In-Reply-To: <20211015091622.1302433-1-thuth@redhat.com>
References: <20211015091622.1302433-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cornelia Huck <cohuck@redhat.com>

I currently don't have time to work on the s390x virtio-ccw machine
anymore, so let's step down. (I will, however, continue as a
maintainer for the virtio-ccw *transport*.)

Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Acked-by: Halil Pasic <pasic@linux.ibm.com>
Message-Id: <20211012144040.360887-4-cohuck@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 234fcaa233..c25793bc39 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1509,7 +1509,6 @@ F: tests/acceptance/machine_sparc_leon3.py
 S390 Machines
 -------------
 S390 Virtio-ccw
-M: Cornelia Huck <cohuck@redhat.com>
 M: Halil Pasic <pasic@linux.ibm.com>
 M: Christian Borntraeger <borntraeger@de.ibm.com>
 S: Supported
@@ -1521,7 +1520,6 @@ F: hw/watchdog/wdt_diag288.c
 F: include/hw/watchdog/wdt_diag288.h
 F: configs/devices/s390x-softmmu/default.mak
 F: tests/acceptance/machine_s390_ccw_virtio.py
-T: git https://gitlab.com/cohuck/qemu.git s390-next
 T: git https://github.com/borntraeger/qemu.git s390-next
 L: qemu-s390x@nongnu.org
 
-- 
2.27.0


