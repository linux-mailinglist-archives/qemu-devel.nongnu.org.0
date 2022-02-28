Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 530A84C6AFF
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 12:43:45 +0100 (CET)
Received: from localhost ([::1]:36570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOeRL-00056B-Ds
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 06:43:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nOeAe-000468-8n
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 06:26:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nOeAX-00077n-Nr
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 06:26:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646047579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ha58A0v4WbyZFzyt4Oly5tNGHbMMfXoC3AZ2Fshd3g=;
 b=XJpV6tKepD2iSjksxrVl6qklBr+hFIRRlBDDBApk8NaXUJyJLPz9s5yn3wwHeNip3tY6QC
 0McmKHsVQqqn265b5juTOTbkPy2sB9eytldHo+maVu1Lmtpf8YvMKhvlwuvEWIu/E+Pdxz
 DghalDEFwKzOlW+wPm1HV0wkE2D7mhA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-koqScLNgOSW7GLi97ER5vQ-1; Mon, 28 Feb 2022 06:26:16 -0500
X-MC-Unique: koqScLNgOSW7GLi97ER5vQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E3841006AA5;
 Mon, 28 Feb 2022 11:26:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CD037B6F1;
 Mon, 28 Feb 2022 11:26:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C8D4221E6A02; Mon, 28 Feb 2022 12:26:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/9] keyval: Fix grammar comment to cover downstream prefix
Date: Mon, 28 Feb 2022 12:26:06 +0100
Message-Id: <20220228112613.520040-3-armbru@redhat.com>
In-Reply-To: <20220228112613.520040-1-armbru@redhat.com>
References: <20220228112613.520040-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to the grammar, a key __com.redhat_foo would be parsed as
two key fragments __com and redhat_foo.  It's actually parsed as a
single fragment.  Fix the grammar.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20220218145551.892787-2-armbru@redhat.com>
---
 util/keyval.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/util/keyval.c b/util/keyval.c
index 904337c8a1..0cf2e84dc8 100644
--- a/util/keyval.c
+++ b/util/keyval.c
@@ -16,7 +16,9 @@
  *   key-vals     = [ key-val { ',' key-val } [ ',' ] ]
  *   key-val      = key '=' val | help
  *   key          = key-fragment { '.' key-fragment }
- *   key-fragment = / [^=,.]+ /
+ *   key-fragment = qapi-name | index
+ *   qapi-name    = '__' / [a-z0-9.-]+ / '_' / [A-Za-z][A-Za-z0-9_-]* /
+ *   index        = / [0-9]+ /
  *   val          = { / [^,]+ / | ',,' }
  *   help         = 'help' | '?'
  *
-- 
2.35.1


