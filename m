Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2E74C6A88
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 12:31:10 +0100 (CET)
Received: from localhost ([::1]:44214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOeFB-0007Ia-Cc
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 06:31:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nOeAg-00047R-SG
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 06:26:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nOeAc-000792-5m
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 06:26:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646047585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=txFEFDX1imOtY/J6Fvf1npDuhL9c7oV3TksvrD+8ljQ=;
 b=ManvaluwWJPL2FL+TdOWJsj5fhxTRYQXN+7oRftZZ6jzsl5OSU16ZQMJ7fnzgb/xkmXP0o
 x1FoCQK5refmGne3HdWx4EGKqzOiBArMy1txvWh5aQm+/dO9vLanFDO/pdR2LeUdetgqfj
 5u7OEGyzu01eMq9AqQtwb2KsZqslkoA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-8V7BkrdiMrCm3yBE0jot2w-1; Mon, 28 Feb 2022 06:26:24 -0500
X-MC-Unique: 8V7BkrdiMrCm3yBE0jot2w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29D861006AA6;
 Mon, 28 Feb 2022 11:26:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D64382B3DE;
 Mon, 28 Feb 2022 11:26:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D743D21E6923; Mon, 28 Feb 2022 12:26:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 9/9] qapi: Belatedly adjust limitations documentation
Date: Mon, 28 Feb 2022 12:26:13 +0100
Message-Id: <20220228112613.520040-10-armbru@redhat.com>
In-Reply-To: <20220228112613.520040-1-armbru@redhat.com>
References: <20220228112613.520040-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: peter.maydell@linaro.org, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 57df0dff1a "qapi: Extend -compat to set policy for unstable
interfaces" (v6.2.0) took care of covering experimental features, but
neglected to adjust a comment suggesting to cover it.  Adjust it now.

Fixes: 57df0dff1a1f4c846aa74a082bfd595a8a990015
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20220225084538.218876-1-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 qapi/compat.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/compat.json b/qapi/compat.json
index c53b69fe3f..39b52872d5 100644
--- a/qapi/compat.json
+++ b/qapi/compat.json
@@ -41,7 +41,7 @@
 #
 # Limitation: covers only syntactic aspects of QMP, i.e. stuff tagged
 # with feature 'deprecated'.  We may want to extend it to cover
-# semantic aspects, CLI, and experimental features.
+# semantic aspects and CLI.
 #
 # Limitation: deprecated-output policy @hide is not implemented for
 # enumeration values.  They behave the same as with policy @accept.
-- 
2.35.1


