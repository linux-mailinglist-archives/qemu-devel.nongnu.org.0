Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4444ECC94
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 20:43:49 +0200 (CEST)
Received: from localhost ([::1]:57966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZdIK-0005eW-D9
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 14:43:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZczi-0006VS-1U
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:24:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZczg-0005F6-9z
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 14:24:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648664671;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0J9K2HF7PniDE+QcMXemjxuBrF8dFa9Dp+7IUVp8yXs=;
 b=CgNgXpvUCz5whXOH00T/NDOB+DMo1DBoXS4AN8ZRgGdv9U6Oph4PuP99fhcHsAIaCz8nOW
 6PeoqMcxmAVTmr7EL2RX/RDLRqgsgR8cxXviu9gP3WXHsfpdrZKABlX7xEQWh3z/HW9HLs
 vXBanLsDL380GJxJJmM54iH0Nd2WGh0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-h8_w0_8uPh2bVsaUFkCH7w-1; Wed, 30 Mar 2022 14:24:27 -0400
X-MC-Unique: h8_w0_8uPh2bVsaUFkCH7w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 491E73820546
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 18:24:27 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.35.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB6192166B3F;
 Wed, 30 Mar 2022 18:24:26 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu.qmp PATCH 06/13] [FIXME] update project URLs
Date: Wed, 30 Mar 2022 14:24:17 -0400
Message-Id: <20220330182424.3438872-7-jsnow@redhat.com>
In-Reply-To: <20220330182424.3438872-1-jsnow@redhat.com>
References: <20220330182424.3438872-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, John Snow <jsnow@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Point to this library's URLs instead of the entire project's.

FIXME: In development, the URLs here reference jsnow/qemu.qmp. It is
intended that the production version gets pushed to
qemu-project/python-qemu.qmp and will use URLs that reflect that
repository appropriately. This is being done so that I can easily
iterate and test on this patch series and make sure everything works
exactly as expected.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 setup.cfg | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/setup.cfg b/setup.cfg
index c21f2ce..776f4f1 100644
--- a/setup.cfg
+++ b/setup.cfg
@@ -5,8 +5,10 @@ author = QEMU Project
 author_email = qemu-devel@nongnu.org
 maintainer = John Snow
 maintainer_email = jsnow@redhat.com
-url = https://www.qemu.org/
-download_url = https://www.qemu.org/download/
+# NOTE: Remember to update the commit message when changing these URLs.
+url = https://gitlab.com/jsnow/qemu.qmp
+# NOTE: Remember to update the commit message when changing these URLs.
+download_url = https://gitlab.com/jsnow/qemu.qmp/-/packages
 description = QEMU Monitor Protocol library
 long_description = file:PACKAGE.rst
 long_description_content_type = text/x-rst
-- 
2.34.1


