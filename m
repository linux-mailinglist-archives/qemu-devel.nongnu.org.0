Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DB93677D1
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 05:15:45 +0200 (CEST)
Received: from localhost ([::1]:59396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZPoe-00072q-50
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 23:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZPh2-0006dv-Da
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 23:07:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZPgt-0006Vp-1b
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 23:07:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619060862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ckLTAzfordUWJsd4OylshUHYPDpvi9uqov2U8NS2hS0=;
 b=LRM5yeOJEXkmToH6lkyWX8VRn12r45gv194O5cDJ3gEw81tOUd02xtIUytOwianaMUovP+
 tayeUbBkm6di+K6LJHK5R4zpOFMYWSFuB81fhtD/HdawG6rlumYxqyx7mQuafSWm23wgiJ
 0BaIw0Z/2NsDJY5UJ4Bo7iAxQA9cJgg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-e63svZz8MBOX31KIzKHtvQ-1; Wed, 21 Apr 2021 23:07:40 -0400
X-MC-Unique: e63svZz8MBOX31KIzKHtvQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7BAEA343A0;
 Thu, 22 Apr 2021 03:07:39 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C0C2A607CB;
 Thu, 22 Apr 2021 03:07:38 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/22] qapi: [WIP] Import QAPIDoc from qapidoc Signed-off-by:
 John Snow <jsnow@redhat.com>
Date: Wed, 21 Apr 2021 23:07:18 -0400
Message-Id: <20210422030720.3685766-21-jsnow@redhat.com>
In-Reply-To: <20210422030720.3685766-1-jsnow@redhat.com>
References: <20210422030720.3685766-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/expr.py   | 2 +-
 scripts/qapi/parser.py | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/qapi/expr.py b/scripts/qapi/expr.py
index 496f7e0333e..7616646e43d 100644
--- a/scripts/qapi/expr.py
+++ b/scripts/qapi/expr.py
@@ -44,7 +44,7 @@
 
 from .common import c_name
 from .error import QAPISemError
-from .parser import QAPIDoc
+from .qapidoc import QAPIDoc
 from .source import QAPISourceInfo
 
 
diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 6fed742124d..3932f05d015 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -27,6 +27,7 @@
 
 from .common import match_nofail
 from .error import QAPISemError, QAPISourceError
+from .qapidoc import QAPIDoc
 from .source import QAPISourceInfo
 
 
-- 
2.30.2


