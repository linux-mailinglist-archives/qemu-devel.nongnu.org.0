Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D89A051D1B9
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 08:56:26 +0200 (CEST)
Received: from localhost ([::1]:33454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmrt3-0000ru-2z
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 02:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmrna-0007L0-6l
 for qemu-devel@nongnu.org; Fri, 06 May 2022 02:50:46 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:40267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmrnV-0003fr-Re
 for qemu-devel@nongnu.org; Fri, 06 May 2022 02:50:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651819839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=/h+zFEY8W0Biv4vZTN2wGZkXzIK0ziBJJ+qrsWEKtl0=;
 b=iCGmjQQmcEiBoxemEPjWhHUID0DBfA1BZmFkJtbN/tLv0Li2tKGjpc4yWGPFvxYww3ng0D
 3pZWdGtPK452SvziC3y8loYMRem4M1Wnk16RGy3RUeHpVfyzs1iBOLbayewpHQPIXtgPNR
 0OhZJxhS6rHpd0i7DPHV3aYvLvvc+8Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-96-4MwWgFb6O1Skn1p0hEyx4g-1; Fri, 06 May 2022 02:50:36 -0400
X-MC-Unique: 4MwWgFb6O1Skn1p0hEyx4g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A7D83C62B61;
 Fri,  6 May 2022 06:50:36 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2214B111E3FD;
 Fri,  6 May 2022 06:50:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-s390x@nongnu.org, Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>
Cc: qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>
Subject: [PATCH] hw/s390x/s390-virtio-ccw: Improve the machine description
 string
Date: Fri,  6 May 2022 08:50:26 +0200
Message-Id: <20220506065026.513590-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.74; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The machine name already contains the words "ccw" and "virtio", so
using "VirtIO-ccw" in the description likely does not really help
the average user to get an idea what this machine type is about.
Thus let's switch to "Virtual s390x machine" now, since "virtual
machine" should be a familiar term, and "s390x" signals that this
is about 64-bit guests (unlike S390 which could mean that it is
31-bit only).
Also expand "v" to "version, since this makes it easier to use
this macro also with non-numeric machine names in downstream.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/s390x/s390-virtio-ccw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 8fa488d13a..11a942a325 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -768,7 +768,7 @@ bool css_migration_enabled(void)
     {                                                                         \
         MachineClass *mc = MACHINE_CLASS(oc);                                 \
         ccw_machine_##suffix##_class_options(mc);                             \
-        mc->desc = "VirtIO-ccw based S390 machine v" verstr;                  \
+        mc->desc = "Virtual s390x machine (version " verstr ")";      \
         if (latest) {                                                         \
             mc->alias = "s390-ccw-virtio";                                    \
             mc->is_default = true;                                            \
-- 
2.27.0


