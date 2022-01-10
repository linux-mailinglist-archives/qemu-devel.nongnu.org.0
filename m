Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7EB48A3B8
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 00:36:45 +0100 (CET)
Received: from localhost ([::1]:50056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n74DQ-0007no-0D
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 18:36:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n746m-0000ju-9q
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:29:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n746k-00089Z-PL
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:29:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641857386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VUcGHCn7G9JUHxI079emoPM39xxMoNT5ubpHX3950Rg=;
 b=Ag0E7+S8w47j53+3LMu9brDMCe7XMyxH6QNI0XzowoDJYk+OhSlTPTubHiEACo5iHS60wq
 M43h8Bl+Js86S7rz4d4Wb3i2SIegl/tYAx/V7hnUDYYBW4j7mqEB/UtZ+5CNUgGq76uCTN
 hUxgsc2LDNh+GpNuLaMJhWRwmgEZvHI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-FQVQfnEdNoiWyrPb0Lf9oQ-1; Mon, 10 Jan 2022 18:29:43 -0500
X-MC-Unique: FQVQfnEdNoiWyrPb0Lf9oQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 957431019631;
 Mon, 10 Jan 2022 23:29:41 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 716697B022;
 Mon, 10 Jan 2022 23:29:29 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/31] python: update type hints for mypy 0.930
Date: Mon, 10 Jan 2022 18:28:42 -0500
Message-Id: <20220110232910.1923864-4-jsnow@redhat.com>
In-Reply-To: <20220110232910.1923864-1-jsnow@redhat.com>
References: <20220110232910.1923864-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mypy 0.930, released Dec 22, changes the way argparse objects are
considered. Crafting a definition that works under Python 3.6 and an
older mypy alongside newer versions simultaneously is ... difficult,
so... eh. Stub it out with an 'Any' definition to get the CI moving
again.

Oh well.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20220110191349.1841027-4-jsnow@redhat.com
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


