Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 562FC274B15
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Sep 2020 23:22:50 +0200 (CEST)
Received: from localhost ([::1]:38682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKpkP-0003hN-8K
	for lists+qemu-devel@lfdr.de; Tue, 22 Sep 2020 17:22:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKpQ3-0002Eg-8M
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 17:01:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kKpPy-0004aK-C5
 for qemu-devel@nongnu.org; Tue, 22 Sep 2020 17:01:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600808501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TfE4iGbq7w22nk05xoMfyoK+hdx/KMvqzG8qGMUIQHw=;
 b=fHwPXFQxaLGcAoI6OB7c6F5FcXz6o9YX0fLT7pzAcLYHX71xRRJIEFLaZ6jLmu76j3uwaq
 pC8ES1RcQh8RNPSdEBaZ96mt9swUSrx2JCgQAkZBbz8093ivF8PMocOKzud4hRiChNYyoA
 rR7n/hE46+gdZNAzvCKhywdDLtHHVM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-FgJAURNDO5qVmJnzFdI5Bg-1; Tue, 22 Sep 2020 17:01:39 -0400
X-MC-Unique: FgJAURNDO5qVmJnzFdI5Bg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B286D1005E6D;
 Tue, 22 Sep 2020 21:01:38 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA95755767;
 Tue, 22 Sep 2020 21:01:37 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 23/38] qapi/source.py: delint with pylint
Date: Tue, 22 Sep 2020 17:00:46 -0400
Message-Id: <20200922210101.4081073-24-jsnow@redhat.com>
In-Reply-To: <20200922210101.4081073-1-jsnow@redhat.com>
References: <20200922210101.4081073-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 02:07:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Shush an error and leave a hint for future cleanups when we're allowed
to use Python 3.7+.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/pylintrc  | 1 -
 scripts/qapi/source.py | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/qapi/pylintrc b/scripts/qapi/pylintrc
index 6151427a51..7438806096 100644
--- a/scripts/qapi/pylintrc
+++ b/scripts/qapi/pylintrc
@@ -8,7 +8,6 @@ ignore-patterns=doc.py,
                 gen.py,
                 parser.py,
                 schema.py,
-                source.py,
                 types.py,
                 visit.py,
 
diff --git a/scripts/qapi/source.py b/scripts/qapi/source.py
index 1cc6a5b82d..ba991d798f 100644
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


