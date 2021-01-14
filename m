Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 776F72F6180
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:06:23 +0100 (CET)
Received: from localhost ([::1]:46298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l02KU-00039b-Fa
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:06:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l02HT-0001QU-Vb
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:03:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l02HQ-0007z7-2k
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:03:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610629390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wIMvKbmsqREXcIZJCbfVL60S/HeM5fgHvGvHtuyQaQU=;
 b=YcDk6au2jmcQ3K9gIOUbDaccLteIIPhiY81HBhlb2dO3POcW3Rpt/dirbAtauz46vNVgRk
 47yFLsuN/UziTeUw9vZu4aOAOnRPp1F8X0b8ei0QgqSe2jAeveBaRkbo/+hPsSESDm3EBV
 4df61hy/T1xypZ65a1oYGI4pokYtsSI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-Swu-oetOMHmK0M9pWxcSeg-1; Thu, 14 Jan 2021 08:03:08 -0500
X-MC-Unique: Swu-oetOMHmK0M9pWxcSeg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 290F6180A0A1;
 Thu, 14 Jan 2021 13:03:07 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-77.ams2.redhat.com
 [10.36.115.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE93E5F708;
 Thu, 14 Jan 2021 13:03:05 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/25] tests/docker: fix mistakes in fedora package list
Date: Thu, 14 Jan 2021 13:02:29 +0000
Message-Id: <20210114130245.1654081-10-berrange@redhat.com>
In-Reply-To: <20210114130245.1654081-1-berrange@redhat.com>
References: <20210114130245.1654081-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

llvm is not required by QEMU, just clang.

libblockdev-mpath-devel is not used by QEMU, rather it wants
device-mapper-multipath-devel.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/docker/dockerfiles/fedora.docker | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 03b88f1cfe..754b381e1e 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -27,7 +27,6 @@ ENV PACKAGES \
     libaio-devel \
     libasan \
     libattr-devel \
-    libblockdev-mpath-devel \
     libcacard-devel \
     libcap-ng-devel \
     libcurl-devel \
@@ -45,7 +44,6 @@ ENV PACKAGES \
     libusbx-devel \
     libxml2-devel \
     libzstd-devel \
-    llvm \
     lzo-devel \
     make \
     mingw32-bzip2 \
-- 
2.29.2


