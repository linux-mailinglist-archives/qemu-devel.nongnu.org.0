Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4D54BA357
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 15:44:20 +0100 (CET)
Received: from localhost ([::1]:49466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKi15-00038A-DE
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 09:44:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nKhVh-0001bN-9M
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 09:11:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nKhVc-0006fm-RK
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 09:11:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645107107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GXRvryvOb45+1R7Y0zMKfUTayGSIsoaPJAdQqQQ8vqU=;
 b=E8o3rUqs3RMJKj3DgdJgdkD1yGa7hwXjxDkFYkbWHZyDOZNoMo3FzT7lvul1JHDgqug3Nt
 RqSHDTv/Dv1Fo5A6WrHaqIokcBpNa/rVYpNCHANI8jAJKrepmpeYs0/+GHJ8t6MJZ2jqMY
 JaqAnIOf8/iJISawDadnuY7BDT0Oji0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-J30qU6BlNLy4Sd-xq1ot5g-1; Thu, 17 Feb 2022 09:11:43 -0500
X-MC-Unique: J30qU6BlNLy4Sd-xq1ot5g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B36EC8143E5;
 Thu, 17 Feb 2022 14:11:42 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D59747C83D;
 Thu, 17 Feb 2022 14:11:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Ed Maste <emaste@freebsd.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Subject: [PATCH] MAINTAINERS: Update the files in the FreeBSD section
Date: Thu, 17 Feb 2022 15:11:38 +0100
Message-Id: <20220217141138.917292-1-thuth@redhat.com>
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The FreeBSD CI definitions now reside in other files than .cirrs.yml.
Update the entry in MAINTAINERS accordingly.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 81aa31b5e1..38da514214 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3601,7 +3601,8 @@ FreeBSD Hosted Continuous Integration
 M: Ed Maste <emaste@freebsd.org>
 M: Li-Wen Hsu <lwhsu@freebsd.org>
 S: Maintained
-F: .cirrus.yml
+F: .gitlab-ci.d/cirrus/freebsd*
+F: tests/vm/freebsd
 W: https://cirrus-ci.com/github/qemu/qemu
 
 Windows Hosted Continuous Integration
-- 
2.27.0


