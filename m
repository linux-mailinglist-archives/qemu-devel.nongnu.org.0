Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A0826FE89
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Sep 2020 15:33:50 +0200 (CEST)
Received: from localhost ([::1]:34418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kJGWL-00033e-7D
	for lists+qemu-devel@lfdr.de; Fri, 18 Sep 2020 09:33:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kJGS3-0007Z6-FA
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 09:29:23 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31511
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kJGS0-0002Th-U4
 for qemu-devel@nongnu.org; Fri, 18 Sep 2020 09:29:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600435760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GL3neR6oOzNgGV3HLlmMpDCOElZl4azBHyrGLDtMiw8=;
 b=JlK2SpiB3EqRiknMUwfGFymqC5fW/+0HK+Ad8M+rUSkyhkSbDgLHlnm4dL4xjAX0tcXoJp
 KSTz2xlgaF84WULd1Fbc1LI8PlyL/SCmUK/ye6rtjC+rerzudGfx/1zfXXn5Uq2MB9STDZ
 s72Gxh7AtuUAWi1Z8M+Z1OLbalA8Yms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-lK1oCZXTMayUSP7SJ8pwTA-1; Fri, 18 Sep 2020 09:29:18 -0400
X-MC-Unique: lK1oCZXTMayUSP7SJ8pwTA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 414AF1966323;
 Fri, 18 Sep 2020 13:29:17 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-199.ams2.redhat.com
 [10.36.114.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0EB8B9CBA;
 Fri, 18 Sep 2020 13:29:13 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] gitlab: assign python helper files to GitLab maintainers
 section
Date: Fri, 18 Sep 2020 14:29:03 +0100
Message-Id: <20200918132903.1848939-4-berrange@redhat.com>
In-Reply-To: <20200918132903.1848939-1-berrange@redhat.com>
References: <20200918132903.1848939-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/18 03:47:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3d17cad19a..b60981fb62 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3097,6 +3097,7 @@ R: Wainer dos Santos Moschetta <wainersm@redhat.com>
 S: Maintained
 F: .gitlab-ci.yml
 F: .gitlab-ci.d/crossbuilds.yml
+F: .gitlab-ci.d/*py
 
 Guest Test Compilation Support
 M: Alex Bennée <alex.bennee@linaro.org>
-- 
2.26.2


