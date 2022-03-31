Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A51564ED816
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 12:59:44 +0200 (CEST)
Received: from localhost ([::1]:37418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZsWk-0007Bw-OY
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 06:59:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZsRY-0006nL-AA
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:54:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nZsRU-0007ka-Ir
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:54:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648724056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SxZ39twAMS7451y4zQsD3kK6myTNS/dZ7qmmvta8MS0=;
 b=EqOTDlI+lk98CuxvLx+nzWlHZG/9Mz819H/+/hX/Nk8rsHIPawuaCMBErhw3zFJuAA5BD5
 ibaKnu+THdqqLuJ9z8HV1pYrwUIsTu4NeaZd5/27DYiucPH3gWtLCiPG5Nbw04h29mqZI4
 4MNN1cC0N2NZ4MJM8etQ2EKYxr/ZYMw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-AYBG_fjKN3qc4c9IWVS44Q-1; Thu, 31 Mar 2022 06:54:15 -0400
X-MC-Unique: AYBG_fjKN3qc4c9IWVS44Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65BF7811E75;
 Thu, 31 Mar 2022 10:54:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3628D2026980;
 Thu, 31 Mar 2022 10:54:00 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9BF3F21E65E8; Thu, 31 Mar 2022 12:53:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/15] qapi: fix example of dump-guest-memory
Date: Thu, 31 Mar 2022 12:53:44 +0200
Message-Id: <20220331105344.3471295-16-armbru@redhat.com>
In-Reply-To: <20220331105344.3471295-1-armbru@redhat.com>
References: <20220331105344.3471295-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: application/octet-stream; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, BODY_EMPTY=1.31,
 DKIMWL_WL_HIGH=-0.082, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: John Snow <jsnow@redhat.com>, peter.maydell@linaro.org,
 Victor Toso <victortoso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Victor Toso <victortoso@redhat.com>

Example output lacks mandatory member @paging.  Provide it.

Signed-off-by: Victor Toso <victortoso@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-Id: <20220328140604.41484-15-victortoso@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/dump.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/dump.json b/qapi/dump.json
index 9119c82b14..29441af9d8 100644
--- a/qapi/dump.json
+++ b/qapi/dump.json
@@ -83,7 +83,7 @@
 # Example:
 #
 # -> { "execute": "dump-guest-memory",
-#      "arguments": { "protocol": "fd:dump" } }
+#      "arguments": { "paging": false, "protocol": "fd:dump" } }
 # <- { "return": {} }
 #
 ##
-- 
2.35.1


