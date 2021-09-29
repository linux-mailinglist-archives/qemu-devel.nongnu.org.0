Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7F441CD00
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 21:56:20 +0200 (CEST)
Received: from localhost ([::1]:42150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVfgh-0007wj-1z
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 15:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVfWb-0007xx-R9
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:45:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVfWW-0006mL-TP
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:45:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632944748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yK2zQRqyjQfeWhO69DRcjNEI8lUvxV+5zY4py8k9rPo=;
 b=WWbExifY0rXVCVvuOCz9/6MGg9p+WpSznuXLt9AEcdD3+nrpGmLDbETKvbkAlw7H9V5b7u
 WiOf42PEuY3BI1lpiCrVuQtdaLPqoAb638rT9bGRBBl1LOFF77cfxWb3b+C0yngUH5++cl
 eiqq4z2FCXrHRfobmK/t5Su1uN1PG3I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-3bgxMeMRPPyFS8g95pKfEg-1; Wed, 29 Sep 2021 15:45:46 -0400
X-MC-Unique: 3bgxMeMRPPyFS8g95pKfEg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2302B8EC898;
 Wed, 29 Sep 2021 19:45:18 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AAEC119729;
 Wed, 29 Sep 2021 19:45:16 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/13] qapi/parser: Silence too-few-public-methods warning
Date: Wed, 29 Sep 2021 15:44:27 -0400
Message-Id: <20210929194428.1038496-13-jsnow@redhat.com>
In-Reply-To: <20210929194428.1038496-1-jsnow@redhat.com>
References: <20210929194428.1038496-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eh. Not worth the fuss today. There are bigger fish to fry.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 8a846079207..7511eedaa35 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -457,8 +457,10 @@ class QAPIDoc:
     """
 
     class Section:
+        # pylint: disable=too-few-public-methods
         def __init__(self, parser: QAPISchemaParser,
                      name: Optional[str] = None, indent: int = 0):
+
             # parser, for error messages about indentation
             self._parser = parser
             # optional section name (argument/member or section name)
@@ -494,6 +496,7 @@ class NullSection(Section):
         """
         Empty section that signifies the end of a doc block.
         """
+        # pylint: disable=too-few-public-methods
         def append(self, line: str) -> None:
             assert False, "BUG: Text appended after end_comment() called."
 
-- 
2.31.1


