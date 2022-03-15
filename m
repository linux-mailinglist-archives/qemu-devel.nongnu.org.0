Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D45F4D9680
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 09:42:25 +0100 (CET)
Received: from localhost ([::1]:39640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU2l3-0004JJ-2E
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 04:42:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nU2gn-0001P7-VI
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 04:37:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nU2gm-0004Aj-Iu
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 04:37:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647333476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+MxF029BNB/m2ksbvlPxu5NM5xZ2UtucxCL0GpVSwMQ=;
 b=ZN8fl3PoBeEX6YiUJAhyLRY/hHeclhMV3Arj02IMeIwzTyU4LO758ZSKRPdlj+1HYTn4zS
 Qqwp+ILvpi0ndSzqeojDCxVJh+r4ItfOjKlvRGVmyDUa6yy4IuJd76lAcg0rD4avz/4qni
 iy8jFGR15v8ku0Tk6IJapSRkjuco51k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-kTekbZSIMEa85aLmcy9piQ-1; Tue, 15 Mar 2022 04:37:54 -0400
X-MC-Unique: kTekbZSIMEa85aLmcy9piQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 41E49811E80;
 Tue, 15 Mar 2022 08:37:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.196.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B5142112C082;
 Tue, 15 Mar 2022 08:37:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 701201800623; Tue, 15 Mar 2022 09:37:02 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/11] edk2/docker: use ubuntu 18.04
Date: Tue, 15 Mar 2022 09:36:55 +0100
Message-Id: <20220315083656.1949517-11-kraxel@redhat.com>
In-Reply-To: <20220315083656.1949517-1-kraxel@redhat.com>
References: <20220315083656.1949517-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Upstream CI uses ubuntu 18.04 too, so pick
that version (instead of something newer).

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/edk2/Dockerfile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/edk2/Dockerfile b/.gitlab-ci.d/edk2/Dockerfile
index 7484b3846d71..bbe50ff8328a 100644
--- a/.gitlab-ci.d/edk2/Dockerfile
+++ b/.gitlab-ci.d/edk2/Dockerfile
@@ -1,7 +1,7 @@
 #
 # Docker image to cross-compile EDK2 firmware binaries
 #
-FROM ubuntu:16.04
+FROM ubuntu:18.04
 
 MAINTAINER Philippe Mathieu-Daudé <f4bug@amsat.org>
 
-- 
2.35.1


