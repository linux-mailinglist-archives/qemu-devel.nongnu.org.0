Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC89E26B299
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Sep 2020 00:50:48 +0200 (CEST)
Received: from localhost ([::1]:47572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIJmh-0001RA-Th
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 18:50:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kIJdh-0007RF-OF
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 18:41:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kIJdf-0002hU-9z
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 18:41:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600209686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6DuOI9lXbtpcnnokzlrE4kBUEAbmpC50cXB1sV/i6pw=;
 b=T6HvMcthVSHESwmRy7uRQSoQm8Q266kwHEKIar3rnFXPJXZC1RULa/+K+00Br0n9/Cibdq
 Rt8Wq2aasU1dm0WSwzct7XAVFY6T2o/MN4SGEQCP6zu4nS+CQPE2MTeJI+tlpstCPf73ly
 CC32rDejrEwNgDVWEkbPL9GVR3cXLK8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-AeP2nEKBORKukQ0qNNzN5w-1; Tue, 15 Sep 2020 18:41:24 -0400
X-MC-Unique: AeP2nEKBORKukQ0qNNzN5w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B61818C9F6F;
 Tue, 15 Sep 2020 22:41:10 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 98B537BE76;
 Tue, 15 Sep 2020 22:41:09 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Subject: [PATCH 23/37] qapi/source.py: delint with pylint
Date: Tue, 15 Sep 2020 18:40:13 -0400
Message-Id: <20200915224027.2529813-24-jsnow@redhat.com>
In-Reply-To: <20200915224027.2529813-1-jsnow@redhat.com>
References: <20200915224027.2529813-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 02:10:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
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
Cc: John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
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
index c800055589..c50a6656b7 100644
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


