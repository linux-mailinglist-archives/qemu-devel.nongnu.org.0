Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4454288F17
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Oct 2020 18:42:41 +0200 (CEST)
Received: from localhost ([::1]:56948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQvTc-0005jv-QU
	for lists+qemu-devel@lfdr.de; Fri, 09 Oct 2020 12:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kQv4P-0004M3-St
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 12:16:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kQv4N-0003Kf-UU
 for qemu-devel@nongnu.org; Fri, 09 Oct 2020 12:16:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602260195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ls855QKTFsJMuAE7yS3Rpb+00OSVPlAGFSZZEVl1vs8=;
 b=Faxv3I2VusIiDkhiOBn5KApH3QqYdByDBOsPa09Wprc0rNnBigIMs1DsxLZ3ZVp5Zq8nJo
 3pfWtkRRximdjqI8LG/1OttVtUeo9vDKX2ooiXtEDGsi8mNX9JxBveQ9OJUbT3o14h2CQG
 WDQkCcjgaXry/tLuExdDsCY68KSFjHc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-5hYN68TIMb6YO_y_BOajgQ-1; Fri, 09 Oct 2020 12:16:32 -0400
X-MC-Unique: 5hYN68TIMb6YO_y_BOajgQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F05C64082;
 Fri,  9 Oct 2020 16:16:31 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-203.rdu2.redhat.com [10.10.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC0521A925;
 Fri,  9 Oct 2020 16:16:30 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 25/36] qapi/source.py: delint with pylint
Date: Fri,  9 Oct 2020 12:15:47 -0400
Message-Id: <20201009161558.107041-26-jsnow@redhat.com>
In-Reply-To: <20201009161558.107041-1-jsnow@redhat.com>
References: <20201009161558.107041-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/09 02:34:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Shush an error and leave a hint for future cleanups when we're allowed
to use Python 3.7+.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
---
 scripts/qapi/pylintrc  | 1 -
 scripts/qapi/source.py | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/qapi/pylintrc b/scripts/qapi/pylintrc
index 507f15537ab..d840b150313 100644
--- a/scripts/qapi/pylintrc
+++ b/scripts/qapi/pylintrc
@@ -7,7 +7,6 @@ ignore-patterns=error.py,
                 gen.py,
                 parser.py,
                 schema.py,
-                source.py,
                 types.py,
                 visit.py,
 
diff --git a/scripts/qapi/source.py b/scripts/qapi/source.py
index 27af5295a85..d7a79a9b8ae 100644
--- a/scripts/qapi/source.py
+++ b/scripts/qapi/source.py
@@ -15,6 +15,9 @@
 
 
 class QAPISchemaPragma:
+    # Replace with @dataclass in Python 3.7+
+    # pylint: disable=too-few-public-methods
+
     def __init__(self) -> None:
         # Are documentation comments required?
         self.doc_required = False
-- 
2.26.2


