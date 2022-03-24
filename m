Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3862E4E683F
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 19:00:06 +0100 (CET)
Received: from localhost ([::1]:35772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXRkj-0008TR-7l
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 14:00:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXRcy-0002kS-GC
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:52:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1nXRcw-0006cB-MG
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 13:52:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648144322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AaCRxeJ7WpVdw6OO+lxAnd0XdJduR1VyS2aMpksYaQ8=;
 b=U0Vle0mPA7+47/huI/jmMh4O830OZHT43Y6Je1pEhemk4b9HVjAKRdnLCMCnJWCKLntOFL
 tlBrn49VngMsTzxBwJyOCZFlBTjlFnFQ2W0E73wJMrA51U+0FaAeuUeHxDNw/UEJldiaCA
 WiDMx9PRV2LmfgRIvs5b6r4vWAfxwaM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-65K_5OR5PqKqHMea3B5Erw-1; Thu, 24 Mar 2022 13:50:27 -0400
X-MC-Unique: 65K_5OR5PqKqHMea3B5Erw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EA8643C163E1
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 17:50:26 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.195.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E517F401E89;
 Thu, 24 Mar 2022 17:50:25 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/14] qapi: fix example of MEMORY_DEVICE_SIZE_CHANGE event
Date: Thu, 24 Mar 2022 18:50:07 +0100
Message-Id: <20220324175015.232794-7-victortoso@redhat.com>
In-Reply-To: <20220324175015.232794-1-victortoso@redhat.com>
References: <20220324175015.232794-1-victortoso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=victortoso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

* qom-path is not optional

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 qapi/machine.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qapi/machine.json b/qapi/machine.json
index 42fc68403d..9c460ec450 100644
--- a/qapi/machine.json
+++ b/qapi/machine.json
@@ -1356,7 +1356,8 @@
 # Example:
 #
 # <- { "event": "MEMORY_DEVICE_SIZE_CHANGE",
-#      "data": { "id": "vm0", "size": 1073741824},
+#      "data": { "id": "vm0", "size": 1073741824,
+#                "qom-path": "/machine/unattached/device[2]" },
 #      "timestamp": { "seconds": 1588168529, "microseconds": 201316 } }
 #
 ##
-- 
2.35.1


