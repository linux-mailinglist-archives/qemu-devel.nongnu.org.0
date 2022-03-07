Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1784D06AD
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 19:37:40 +0100 (CET)
Received: from localhost ([::1]:48368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRIEl-00036O-9a
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 13:37:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRI42-00069K-8q
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:26:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nRI3x-0006tX-2L
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 13:26:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646677588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0PtSvvELsCEN4a0Sm5Pk+aUEWaZSCWM7JHO//7dWdZA=;
 b=JcpMGlPGMoDYKllKl1D/dcbtIEi8LrABDhrPzNam62yVhrNZ3RsZ6Axir4QbUSwb2P/RJj
 yUKdQmD6aQj0CHsJLIikdtmnYVIt99wfDsmgmy/g2eD8B1wdZXrm11jyY76pNOL+5YG+FV
 rCEGsLVV0w3nIvQ0E7NtngvN59MszDs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-t58sWT9hPQy2sHOa949_FQ-1; Mon, 07 Mar 2022 13:26:25 -0500
X-MC-Unique: t58sWT9hPQy2sHOa949_FQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 635751006AA6;
 Mon,  7 Mar 2022 18:26:24 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99840804DB;
 Mon,  7 Mar 2022 18:26:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/7] MAINTAINERS: Update the files in the FreeBSD section
Date: Mon,  7 Mar 2022 19:26:06 +0100
Message-Id: <20220307182609.94466-5-thuth@redhat.com>
In-Reply-To: <20220307182609.94466-1-thuth@redhat.com>
References: <20220307182609.94466-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The FreeBSD CI definitions now reside in other files than .cirrs.yml.
Update the entry in MAINTAINERS accordingly.

Message-Id: <20220217141138.917292-1-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 68adaac373..dd8ad5531b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3608,7 +3608,8 @@ FreeBSD Hosted Continuous Integration
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


