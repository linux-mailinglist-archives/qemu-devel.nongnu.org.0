Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0184F29CE
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 12:43:31 +0200 (CEST)
Received: from localhost ([::1]:59418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbgeo-00005h-BP
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 06:43:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nbgWr-00021X-3A
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 06:35:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nbgWc-0008Tj-SQ
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 06:35:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649154898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=klIqiJKMjPs+CJdTM3Mdt4/yFboMbg5QPjgXsf6Z/3k=;
 b=C/ju5u1Aat2PnKoCEvWLz2nYfSzzeBtOrVMsg1pmFoISpyhr9RyUAaYb2n/FYv+Idf4y9a
 HZK/kbFJdNCO/2DR5Z2DTJz4cKhxHeu1+Xof3NLEy/fddxzof/Q75cnEiihFZuMCW33QmV
 TJbazv+7Sds7oJRwzhHEiji1AMHKplI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-081kuchuMtq1unmiDQXImQ-1; Tue, 05 Apr 2022 06:34:57 -0400
X-MC-Unique: 081kuchuMtq1unmiDQXImQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E01373C11A07;
 Tue,  5 Apr 2022 10:34:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC4A340CF8E5;
 Tue,  5 Apr 2022 10:34:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A387121E690D; Tue,  5 Apr 2022 12:34:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/10] qapi: fix example of netdev_add command
Date: Tue,  5 Apr 2022 12:34:46 +0200
Message-Id: <20220405103455.4145273-2-armbru@redhat.com>
In-Reply-To: <20220405103455.4145273-1-armbru@redhat.com>
References: <20220405103455.4145273-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
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
Cc: peter.maydell@linaro.org, Victor Toso <victortoso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Victor Toso <victortoso@redhat.com>

Example output has the optional member @dnssearch as string type. It
should be an array of String objects instead. Fix it.

For reference, see NetdevUserOptions.

Signed-off-by: Victor Toso <victortoso@redhat.com>
Message-Id: <20220401110712.26911-1-victortoso@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
[Commit message tweaked for precision]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/net.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/net.json b/qapi/net.json
index 0d4578bd07..b92f3f5fb4 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -51,7 +51,7 @@
 #
 # -> { "execute": "netdev_add",
 #      "arguments": { "type": "user", "id": "netdev1",
-#                     "dnssearch": "example.org" } }
+#                     "dnssearch": [ { "str": "example.org" } ] } }
 # <- { "return": {} }
 #
 ##
-- 
2.35.1


