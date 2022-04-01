Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3614EEC08
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 13:08:49 +0200 (CEST)
Received: from localhost ([::1]:41458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naF96-0006ZC-MU
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 07:08:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1naF7k-0005lq-9I
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 07:07:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38028)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victortoso@redhat.com>)
 id 1naF7d-0007nU-JK
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 07:07:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648811236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zyMwoGwyhz/Gq15c9KDFlUhAGI/XCPwL4DNQJUP5qHg=;
 b=g2rp4Z5fPRDqT+9K3JjC4JinoVpq4Xi1gxuZliRsAnWbscnB/oeF8xS6eV7xsRkUGgRcDO
 UNI77mylmJwooQo8Mo7GAN3PdlqaQrCeA0j5LZLF/FxLQUzKX8e4CxZ4zuAuMz8yriHv8b
 pZiUV1pxtRghClsi1ZSXvw2k0iad1Dc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-zmJce7_SP4i5BTNyYhvfVg-1; Fri, 01 Apr 2022 07:07:15 -0400
X-MC-Unique: zmJce7_SP4i5BTNyYhvfVg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC673100BAA4
 for <qemu-devel@nongnu.org>; Fri,  1 Apr 2022 11:07:14 +0000 (UTC)
Received: from tapioca.redhat.com (unknown [10.40.193.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57B2140CF8F7;
 Fri,  1 Apr 2022 11:07:13 +0000 (UTC)
From: Victor Toso <victortoso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1.1 1/9] qapi: fix example of netdev_add command
Date: Fri,  1 Apr 2022 13:07:12 +0200
Message-Id: <20220401110712.26911-1-victortoso@redhat.com>
In-Reply-To: <20220331190633.121077-2-victortoso@redhat.com>
References: <20220331190633.121077-2-victortoso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=victortoso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=victortoso@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
Cc: John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Example output has the optional member @dnssearch as string type. It
should be an array of strings instead. Fix it.

For reference, see NetdevUserOptions.

Signed-off-by: Victor Toso <victortoso@redhat.com>
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


