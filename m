Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE07348A00A
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 20:21:26 +0100 (CET)
Received: from localhost ([::1]:50488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n70EQ-0001mn-0A
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 14:21:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n707N-0003bh-33
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 14:14:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n707J-0004KD-8i
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 14:14:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641842040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BfOv0/rdi6Dz2EGqr8Uc/FttFgjKn2CNy9zz2yuRkh4=;
 b=EpkGYCGZhRhPhuUq6kXTorsIzJvf2Cokmz9U8aboSjfLgnxLTLe2K9VhemDIeR2xvvHfAg
 5k6MCQBftRHRJzo5LZnuEZ/ioXzI4B0LIFUtZvnmji2cff7rtm4v/UmO0pSnZVBaoJM2ZN
 IfS03IAcvPx4KARtpTtjxbQ9a2Nebqs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-BZ6E2oNENvy8kCyTTAf4nw-1; Mon, 10 Jan 2022 14:13:57 -0500
X-MC-Unique: BZ6E2oNENvy8kCyTTAf4nw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F36781EE61;
 Mon, 10 Jan 2022 19:13:56 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.33.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C334519D9B;
 Mon, 10 Jan 2022 19:13:55 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] python: update type hints for mypy 0.930
Date: Mon, 10 Jan 2022 14:13:49 -0500
Message-Id: <20220110191349.1841027-4-jsnow@redhat.com>
In-Reply-To: <20220110191349.1841027-1-jsnow@redhat.com>
References: <20220110191349.1841027-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mypy 0.930, released Dec 22, changes the way argparse objects are
considered. Crafting a definition that works under Python 3.6 and an
older mypy alongside newer versions simultaneously is ... difficult,
so... eh. Stub it out with an 'Any' definition to get the CI moving
again.

Oh well.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/qmp/qom_common.py | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/python/qemu/qmp/qom_common.py b/python/qemu/qmp/qom_common.py
index a59ae1a2a1..2e4c741f77 100644
--- a/python/qemu/qmp/qom_common.py
+++ b/python/qemu/qmp/qom_common.py
@@ -30,10 +30,6 @@
 from . import QEMUMonitorProtocol, QMPError
 
 
-# The following is needed only for a type alias.
-Subparsers = argparse._SubParsersAction  # pylint: disable=protected-access
-
-
 class ObjectPropertyInfo:
     """
     Represents the return type from e.g. qom-list.
@@ -89,7 +85,7 @@ def __init__(self, args: argparse.Namespace):
         self.qmp.connect()
 
     @classmethod
-    def register(cls, subparsers: Subparsers) -> None:
+    def register(cls, subparsers: Any) -> None:
         """
         Register this command with the argument parser.
 
-- 
2.31.1


