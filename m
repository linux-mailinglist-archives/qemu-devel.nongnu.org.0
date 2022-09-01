Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D68B35A93C2
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 12:00:18 +0200 (CEST)
Received: from localhost ([::1]:37812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTgzh-0006Ul-HU
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 06:00:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oTg2N-0000An-BB
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 04:58:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1oTg2K-0004v1-MM
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 04:58:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662022736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YANyqo6xdxA+F6kXPe4PkEPJmV3ClUHFmP63nYNfhkw=;
 b=a0dp8A6t38Q9yPHnV2P1EszTWMyqqVybiLCFFQrqDeRKGzkd0JeSfx8j44AaV9RJMkfOYR
 cFL0jJcEphjvJVm70XRsSNxxKDWq6D9RnEdorc13TisxzAXIs/3pDHqN4XE/XqDKWNwdse
 BybSEL+9Q5Tv3l9xI13/SQSTr0dBLQ8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-339-LC9L10P2MGejZx3WK57RRQ-1; Thu, 01 Sep 2022 04:58:52 -0400
X-MC-Unique: LC9L10P2MGejZx3WK57RRQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3FCDA101A56C;
 Thu,  1 Sep 2022 08:58:52 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.192.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0FB42026D4C;
 Thu,  1 Sep 2022 08:58:50 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 John Snow <jsnow@redhat.com>, Michael Roth <michael.roth@amd.com>
Subject: [PATCH v2 05/10] qapi: fix example of NIC_RX_FILTER_CHANGED event
Date: Thu,  1 Sep 2022 10:58:35 +0200
Message-Id: <20220901085840.22520-6-victortoso@redhat.com>
In-Reply-To: <20220901085840.22520-1-victortoso@redhat.com>
References: <20220901085840.22520-1-victortoso@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Example output has an extra ending curly bracket. Fix it.

Problem was noticed when trying to load the example into python's json
library.

Signed-off-by: Victor Toso <victortoso@redhat.com>
---
 qapi/net.json | 1 -
 1 file changed, 1 deletion(-)

diff --git a/qapi/net.json b/qapi/net.json
index 75ba2cb989..dd088c09c5 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -757,7 +757,6 @@
 #      "data": { "name": "vnet0",
 #                "path": "/machine/peripheral/vnet0/virtio-backend" },
 #      "timestamp": { "seconds": 1368697518, "microseconds": 326866 } }
-#    }
 #
 ##
 { 'event': 'NIC_RX_FILTER_CHANGED',
-- 
2.37.2


