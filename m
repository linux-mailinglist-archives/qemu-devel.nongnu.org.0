Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4BC31931D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 20:31:11 +0100 (CET)
Received: from localhost ([::1]:45152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAHgE-0006JP-Cu
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 14:31:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lAHCr-0004ra-Tg
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:00:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30138)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lAHCS-0005fZ-ND
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 14:00:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613070017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gSiSxIw9XBWZyjUByemILi8dk1hZxjGwl052cclYlpg=;
 b=NRrh5f1n2UMefYibse8RnBFz+f0Kwj3EC9XRTI306S3I0t9iJLrCL8xkjGqOUXxqxsFoGJ
 rfXCbFw5e67IwpEc0LQ/a4+Rhe9Ylc/WOcanjqyIC3Yo3odvsMD9EWl8qSnV9lLt5xXb3X
 QvVYgWHKCZndCZT06m0lEfCfYsPlD+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-ZqoRaxoTNLWVhDp8-BOStg-1; Thu, 11 Feb 2021 14:00:14 -0500
X-MC-Unique: ZqoRaxoTNLWVhDp8-BOStg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92B29100725E;
 Thu, 11 Feb 2021 18:59:53 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 149D76F998;
 Thu, 11 Feb 2021 18:59:51 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 16/24] python: move .isort.cfg into setup.cfg
Date: Thu, 11 Feb 2021 13:58:48 -0500
Message-Id: <20210211185856.3975616-17-jsnow@redhat.com>
In-Reply-To: <20210211185856.3975616-1-jsnow@redhat.com>
References: <20210211185856.3975616-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/.isort.cfg | 7 -------
 python/setup.cfg  | 8 ++++++++
 2 files changed, 8 insertions(+), 7 deletions(-)
 delete mode 100644 python/.isort.cfg

diff --git a/python/.isort.cfg b/python/.isort.cfg
deleted file mode 100644
index 6d0fd6cc0d3..00000000000
--- a/python/.isort.cfg
+++ /dev/null
@@ -1,7 +0,0 @@
-[settings]
-force_grid_wrap=4
-force_sort_within_sections=True
-include_trailing_comma=True
-line_length=72
-lines_after_imports=2
-multi_line_output=3
\ No newline at end of file
diff --git a/python/setup.cfg b/python/setup.cfg
index f919e95f95b..bc90d52b9ca 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -56,3 +56,11 @@ good-names=i,
 [pylint.similarities]
 # Ignore imports when computing similarities.
 ignore-imports=yes
+
+[isort]
+force_grid_wrap=4
+force_sort_within_sections=True
+include_trailing_comma=True
+line_length=72
+lines_after_imports=2
+multi_line_output=3
-- 
2.29.2


