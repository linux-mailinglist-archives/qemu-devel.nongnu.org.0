Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0EC30E4D9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 22:22:08 +0100 (CET)
Received: from localhost ([::1]:33386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7PbD-0007RM-Cz
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 16:22:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l7PYr-0005z1-5G
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 16:19:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l7PYn-0001a7-6m
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 16:19:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612387175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pmYurqa/bs/8JKGQGLljVLqrrUhl7KabmtJNnSJORUQ=;
 b=d35UnHTpr331q1fc1cH1eHxVNdJqw+qMI1ysRIw9WqhPa/lm7XiBHGKxrFbhX8bm+RyOXa
 HBuw2+7SgtZ3z203gPIy3ltA96Jc7q7iB19uIBCM4QR7/H0ZIt3YhT49yuczZNynmdHLQW
 ZHmocPXL7TC6feLWC8z6FWBs5mVChDY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-VaRt85sYNTiSESxftmJM1w-1; Wed, 03 Feb 2021 16:19:34 -0500
X-MC-Unique: VaRt85sYNTiSESxftmJM1w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 416AF195D560;
 Wed,  3 Feb 2021 21:19:33 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-116-207.gru2.redhat.com
 [10.97.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7BF3C1A266;
 Wed,  3 Feb 2021 21:19:27 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: Fix the location of virtiofsd.rst
Date: Wed,  3 Feb 2021 18:19:22 -0300
Message-Id: <20210203211922.1342203-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, dgilbert@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The virtiofsd.rst file was moved to docs/tools, so this update
MAINTAINERS accordingly.

Fixes: a08b4a9fe6c ("docs: Move tools documentation to tools manual")

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 00626941f1..1a929c6b26 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1859,7 +1859,7 @@ S: Supported
 F: tools/virtiofsd/*
 F: hw/virtio/vhost-user-fs*
 F: include/hw/virtio/vhost-user-fs.h
-F: docs/interop/virtiofsd.rst
+F: docs/tools/virtiofsd.rst
 
 virtio-input
 M: Gerd Hoffmann <kraxel@redhat.com>
-- 
2.29.2


