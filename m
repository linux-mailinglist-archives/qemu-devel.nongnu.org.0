Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE06F6A40C2
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:38:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWbo9-0005UI-LH; Mon, 27 Feb 2023 06:36:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWbo3-0005Ps-GV
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWbo1-0005eb-7z
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677497792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=glytSs2pWzm45dgiOYImbDeuuZoq6m1kxVGdLQjZoqk=;
 b=SLpjYVLUp63Q2BjrbCk0jwx4at3TvTwJIXE4/xpkb3hWl8Hnh2G/+RerYvsI5t6XFDQh04
 Lm/SMaA2ijorcplMt50DFOAWMtSH+LipNkBW1jRHEprtTLQTRy31wnEyLkZ5gdXr97IIIB
 0yaaLUbuhp/pSCqcdbY2qR0VX63PC4U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-chJp-IYOOja_ZqGXsNoJsw-1; Mon, 27 Feb 2023 06:36:31 -0500
X-MC-Unique: chJp-IYOOja_ZqGXsNoJsw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF7FE830F81;
 Mon, 27 Feb 2023 11:36:30 +0000 (UTC)
Received: from thuth.com (unknown [10.45.227.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 022BD1121314;
 Mon, 27 Feb 2023 11:36:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Farman <farman@linux.ibm.com>
Subject: [PULL 06/33] hw/vfio/ccw: Remove pointless S390CCWDevice variable
Date: Mon, 27 Feb 2023 12:35:54 +0100
Message-Id: <20230227113621.58468-7-thuth@redhat.com>
In-Reply-To: <20230227113621.58468-1-thuth@redhat.com>
References: <20230227113621.58468-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Philippe Mathieu-Daudé <philmd@linaro.org>

QOM parenthood relationship is:

  VFIOCCWDevice -> S390CCWDevice -> CcwDevice -> DeviceState

No need to double-cast, call CCW_DEVICE() on VFIOCCWDevice.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
Message-Id: <20230213170145.45666-6-philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/vfio/ccw.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index 2ea7b4a63c..cd66b66742 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -314,8 +314,7 @@ static void vfio_ccw_io_notifier_handler(void *opaque)
 {
     VFIOCCWDevice *vcdev = opaque;
     struct ccw_io_region *region = vcdev->io_region;
-    S390CCWDevice *cdev = S390_CCW_DEVICE(vcdev);
-    CcwDevice *ccw_dev = CCW_DEVICE(cdev);
+    CcwDevice *ccw_dev = CCW_DEVICE(vcdev);
     SubchDev *sch = ccw_dev->sch;
     SCHIB *schib = &sch->curr_status;
     SCSW s;
-- 
2.31.1


