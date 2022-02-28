Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E42C4C6A8B
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 12:31:59 +0100 (CET)
Received: from localhost ([::1]:44970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOeFy-0007nk-2T
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 06:31:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nOeAZ-00044i-Gm
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 06:26:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40045)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nOeAU-00077Y-Mi
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 06:26:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646047577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LDf8QRaqwrv2HzN0BtwqeB0PDm8aN/poneU911d5t20=;
 b=ToiC/ZAb+JhJsRqTfNhZFUpHwQ/AvHQe+pXEfuXAyfMktdqWty6BsLie2sYMGKniN7PL+y
 TJ9YxiddVEI3Q1zDtk+ZsN6aKPwbGyDzEQsLP6ddgqlMCfxu6dCC53ZKbhAfUQT1dPAZ4f
 v2MtBsSmHlDpghglujJhZSgCufjnP7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-SqiWMTfUNcGZaK6lgH3s3g-1; Mon, 28 Feb 2022 06:26:16 -0500
X-MC-Unique: SqiWMTfUNcGZaK6lgH3s3g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C6C8180FD71;
 Mon, 28 Feb 2022 11:26:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 52955797CB;
 Mon, 28 Feb 2022 11:26:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id CAE3A21E6A03; Mon, 28 Feb 2022 12:26:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/9] qapi: Fix stale reference to scripts/qapi.py in a comment
Date: Mon, 28 Feb 2022 12:26:07 +0100
Message-Id: <20220228112613.520040-4-armbru@redhat.com>
In-Reply-To: <20220228112613.520040-1-armbru@redhat.com>
References: <20220228112613.520040-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20220218145551.892787-3-armbru@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 qapi/qapi-util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
index fda7044539..63596e11c5 100644
--- a/qapi/qapi-util.c
+++ b/qapi/qapi-util.c
@@ -113,7 +113,7 @@ bool qapi_bool_parse(const char *name, const char *value, bool *obj, Error **err
  * may contain only letters, digits, hyphen and period.
  * The special exception for enumeration names is not implemented.
  * See docs/devel/qapi-code-gen.txt for more on QAPI naming rules.
- * Keep this consistent with scripts/qapi.py!
+ * Keep this consistent with scripts/qapi-gen.py!
  * If @complete, the parse fails unless it consumes @str completely.
  * Return its length on success, -1 on failure.
  */
-- 
2.35.1


