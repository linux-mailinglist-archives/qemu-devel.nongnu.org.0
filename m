Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 424C74BD9EA
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 14:29:32 +0100 (CET)
Received: from localhost ([::1]:44082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM8kt-0003vt-1K
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 08:29:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM7OC-00049N-30
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:02:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM7OA-0000vw-BI
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 07:01:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645444917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SpeSQVF9GaiikK4x2yRillYZqbqQ/eyOHDBV8JXq8ao=;
 b=AIWUuEutUGNiq2FdwjxERxmXCWev2DRauqxBrtlJEpP7GMI4ZkZPOSkl9fse5ApvW19ykY
 L9pn/p9RSmPpGQK5giP/WSyuTOynyKYA7kWlGmB74K56FvIme47q0wjKde8FsXseMmFdlj
 VWg32jXb49y5AxZ/u1ghKeJpccmvQ4s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-_siQ2iTmOSaaOcWJHXXpwQ-1; Mon, 21 Feb 2022 07:01:54 -0500
X-MC-Unique: _siQ2iTmOSaaOcWJHXXpwQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57C6B1F2DA;
 Mon, 21 Feb 2022 12:01:53 +0000 (UTC)
Received: from thuth.com (unknown [10.39.195.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F1E473160;
 Mon, 21 Feb 2022 12:01:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/25] exec/ramblock: Add missing includes
Date: Mon, 21 Feb 2022 13:00:01 +0100
Message-Id: <20220221120008.600114-19-thuth@redhat.com>
In-Reply-To: <20220221120008.600114-1-thuth@redhat.com>
References: <20220221120008.600114-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

"exec/ramblock.h" requires "qemu/rcu.h" for the definition of
rcu_head, and "exec/ramlist.h" for the definition of RAMBlockNotifier.
Add them to avoid when when refactoring include/:

  include/exec/ramblock.h:26:21: error: field has incomplete type 'struct rcu_head'
    struct rcu_head rcu;
                    ^

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220207082756.82600-6-f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/exec/ramblock.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/exec/ramblock.h b/include/exec/ramblock.h
index 664701b759..6cbedf9e0c 100644
--- a/include/exec/ramblock.h
+++ b/include/exec/ramblock.h
@@ -21,6 +21,8 @@
 
 #ifndef CONFIG_USER_ONLY
 #include "cpu-common.h"
+#include "qemu/rcu.h"
+#include "exec/ramlist.h"
 
 struct RAMBlock {
     struct rcu_head rcu;
-- 
2.27.0


