Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DDB4F2A6D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 12:56:06 +0200 (CEST)
Received: from localhost ([::1]:45150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbgqz-0001QC-MO
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 06:56:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nbgWr-00021c-3E
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 06:35:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nbgWk-0008UO-Bw
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 06:35:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649154901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YzA54XqPXyDFwDVkxJGNheVHPy/LjWD1qjQATF4ISR8=;
 b=emHpEw3dRyctG5+Cd6ruSD4KUGi8wSzJfLMXeRowmD4kHDBOrUdHVb3b1td50HhNW1qHUc
 D30GtRTffwJZm0/wCa2b8jdNm3HBI1lpjJjBHSYLt+TPXg8tsEgFKxunJaSnZAKsTCbypg
 svunZX89PgcvXxgxtloMoCdN2IJgpF4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-577-0YWcJv11Nj29LC8agczqGQ-1; Tue, 05 Apr 2022 06:34:58 -0400
X-MC-Unique: 0YWcJv11Nj29LC8agczqGQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 493C1296A61E;
 Tue,  5 Apr 2022 10:34:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C886240D2820;
 Tue,  5 Apr 2022 10:34:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B3A4121E6930; Tue,  5 Apr 2022 12:34:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/10] qapi: fix example of query-cpus-fast command
Date: Tue,  5 Apr 2022 12:34:53 +0200
Message-Id: <20220405103455.4145273-9-armbru@redhat.com>
In-Reply-To: <20220405103455.4145273-1-armbru@redhat.com>
References: <20220405103455.4145273-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
Cc: peter.maydell@linaro.org, Victor Toso <victortoso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Victor Toso <victortoso@redhat.com>

Example output contains member @arch that was removed in 445a5b4087
"machine: remove 'arch' field from 'query-cpus-fast' QMP command". Fix
it.

Signed-off-by: Victor Toso <victortoso@redhat.com>
Message-Id: <20220331190633.121077-9-victortoso@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/machine.json | 2 --
 1 file changed, 2 deletions(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 9c460ec450..968f912989 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -109,7 +109,6 @@
 #                 "socket-id": 0
 #             },
 #             "qom-path": "/machine/unattached/device[0]",
-#             "arch":"x86",
 #             "target":"x86_64",
 #             "cpu-index": 0
 #         },
@@ -121,7 +120,6 @@
 #                 "socket-id": 1
 #             },
 #             "qom-path": "/machine/unattached/device[2]",
-#             "arch":"x86",
 #             "target":"x86_64",
 #             "cpu-index": 1
 #         }
-- 
2.35.1


