Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 338CE4EE165
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 21:09:33 +0200 (CEST)
Received: from localhost ([::1]:43362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na0Am-0004pg-AO
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 15:09:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1na08L-0006yT-Eg
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 15:07:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1na08J-0003hM-D2
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 15:07:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648753618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uJqAbkaXCg0b5r77MJBRBl9XZlSjStZ3gEwgrJ4zODg=;
 b=LEXW52xRSDq6HnfjFlHMs4D39dBfUD9PXlUdlMXkFQTHsIEwK4Kbb9KNB5niDpGCSfY06C
 LgPOBwGtKImFBv4jHFjXeuAbu1ABjpSxFAhG+S2U1E4Sj30T0uaOMt45zdXHponofpij1E
 4wRTFATOgaqvn52nlqLggZr1OIzW2cs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-224-t7fHs3vJOWGW9-chiVzDtg-1; Thu, 31 Mar 2022 15:06:57 -0400
X-MC-Unique: t7fHs3vJOWGW9-chiVzDtg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F9343C1618E
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 19:06:56 +0000 (UTC)
Received: from tapioca.home (unknown [10.40.193.178])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5912401E48;
 Thu, 31 Mar 2022 19:06:52 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 8/9] qapi: fix example of query-cpus-fast command
Date: Thu, 31 Mar 2022 21:06:32 +0200
Message-Id: <20220331190633.121077-9-victortoso@redhat.com>
In-Reply-To: <20220331190633.121077-1-victortoso@redhat.com>
References: <20220331190633.121077-1-victortoso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=victortoso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
Cc: John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Example output contains member @arch that was removed in 445a5b4087
"machine: remove 'arch' field from 'query-cpus-fast' QMP command". Fix
it.

Signed-off-by: Victor Toso <victortoso@redhat.com>
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


