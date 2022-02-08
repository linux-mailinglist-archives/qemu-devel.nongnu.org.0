Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D366F4ACCB2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 01:09:45 +0100 (CET)
Received: from localhost ([::1]:34990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHE4m-0002Ak-H3
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 19:09:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nHE15-0000jG-Iq
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 19:05:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nHE0x-0003yx-Fw
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 19:05:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644278732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jcILUSOd535IInu+GUR9xfKYxPzz9vMrCME9kOLRINI=;
 b=f7SXieWFP3bpnx+AGMkC1cW9z4mWhfePWtpFWdi2dYet0clEZ+eKR+6O3lTW44HhNG0Iez
 w4riYFiL7mk9gU+LlhTc9wxITK/lAI35IxrNpvpej547X/82s2Dc3a3kXmBu0DVRZdL2UG
 OCFu5sobqPGkOuZ0C+otPAml4qqKsnk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-iijcP5WENnWTGThvwsR9bg-1; Mon, 07 Feb 2022 19:05:29 -0500
X-MC-Unique: iijcP5WENnWTGThvwsR9bg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC29F1574C;
 Tue,  8 Feb 2022 00:05:27 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B36811038ACA;
 Tue,  8 Feb 2022 00:05:26 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: python - remove ehabkost and add bleal
Date: Mon,  7 Feb 2022 19:05:25 -0500
Message-Id: <20220208000525.2601011-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost has left Red Hat and has other daily responsibilities to
attend to. In order to stop spamming him on every series, remove him as
"Reviewer" for the python/ library dir and add Beraldo Leal instead.

For the "python scripts" stanza (which is separate due to level of
support), replace Eduardo as maintainer with myself.

(Thanks for all of your hard work, Eduardo!)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9814580975..028ac0de25 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2735,13 +2735,13 @@ F: backends/cryptodev*.c
 Python library
 M: John Snow <jsnow@redhat.com>
 M: Cleber Rosa <crosa@redhat.com>
-R: Eduardo Habkost <eduardo@habkost.net>
+R: Beraldo Leal <bleal@redhat.com>
 S: Maintained
 F: python/
 T: git https://gitlab.com/jsnow/qemu.git python
 
 Python scripts
-M: Eduardo Habkost <eduardo@habkost.net>
+M: John Snow <jsnow@redhat.com>
 M: Cleber Rosa <crosa@redhat.com>
 S: Odd Fixes
 F: scripts/*.py
-- 
2.34.1


