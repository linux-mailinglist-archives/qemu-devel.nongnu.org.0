Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B30F3AD5FA
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 01:33:16 +0200 (CEST)
Received: from localhost ([::1]:37546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luNz9-0005aI-Fg
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 19:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNYm-0007pX-C0
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:06:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNYf-0006Rw-K1
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:06:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624057552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yjTFtvmoyzmsOG3/0XhfM9z/+LFz9GkwKnwuJUSgd1A=;
 b=Gs0fZKDfkSRn5Yj0OemRv0MxP/wdNFMirD8/PL0fhprri5YhwWF/fFpYSA8up2fJIZyYhZ
 VdlXDZcldRsccC2b3d3j8oRURr/3DN7OxcidaCiqniwcPTpLGKw+8ZC0hqENQXl/o5UWQ8
 1wFDpmJ7gQlrxQ1O2Rvz1tLvW0moRfs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-WS-hxENDNx24HkFTtjfCIQ-1; Fri, 18 Jun 2021 19:05:44 -0400
X-MC-Unique: WS-hxENDNx24HkFTtjfCIQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 024908018A5;
 Fri, 18 Jun 2021 23:05:44 +0000 (UTC)
Received: from scv.redhat.com (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5C391017CE5;
 Fri, 18 Jun 2021 23:05:42 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 41/72] scripts/qmp-shell: ignore visit_Name name
Date: Fri, 18 Jun 2021 19:04:24 -0400
Message-Id: <20210618230455.2891199-42-jsnow@redhat.com>
In-Reply-To: <20210618230455.2891199-1-jsnow@redhat.com>
References: <20210618230455.2891199-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Not something I control, sorry, pylint.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20210607200649.1840382-12-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qmp/qmp-shell | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index c46f4f516b..ea6a87e0b3 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -101,7 +101,7 @@ class FuzzyJSON(ast.NodeTransformer):
     """
 
     @classmethod
-    def visit_Name(cls, node):
+    def visit_Name(cls, node):  # pylint: disable=invalid-name
         if node.id == 'true':
             node.id = 'True'
         if node.id == 'false':
-- 
2.31.1


