Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2FC640423
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 11:09:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p12vX-0003hE-0q; Fri, 02 Dec 2022 05:05:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p12vQ-0003cf-Et
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 05:05:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p12vO-0002Pg-FX
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 05:05:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669975541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7CVXwdteIovPTLIogZPCBl18R8yiuwemTpoQlJQHMe8=;
 b=Qz2BWjIYZIV5USY6XSzCfa7UsZdjgTuBfJAzYoyQX3LjFrmbnUUB5iPEGTX0W3Vl1umRoy
 JlaMTrw8+asyhYQ/Qxdsv+J9osWD3CXjPNfJPamrvfKmeMzu18ajr87oy6OUWcNLUqzwdy
 OX22JAINIf9hr0hjg0SfHDjuwl2U71U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-b5gjWjrPNkmpiWtt2NSAig-1; Fri, 02 Dec 2022 05:05:38 -0500
X-MC-Unique: b5gjWjrPNkmpiWtt2NSAig-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B74A38041FB;
 Fri,  2 Dec 2022 10:05:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D5C22166B2A;
 Fri,  2 Dec 2022 10:05:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F1C1121E65C7; Fri,  2 Dec 2022 11:05:12 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com, dgilbert@redhat.com, berrange@redhat.com,
 philmd@linaro.org
Subject: [PATCH v2 07/14] ui/spice: Give hmp_info_spice()'s channel_names[]
 static linkage
Date: Fri,  2 Dec 2022 11:05:05 +0100
Message-Id: <20221202100512.4161901-8-armbru@redhat.com>
In-Reply-To: <20221202100512.4161901-1-armbru@redhat.com>
References: <20221202100512.4161901-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 monitor/hmp-cmds.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 7360ed71a6..8eb9c19b3a 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -615,7 +615,7 @@ void hmp_info_spice(Monitor *mon, const QDict *qdict)
     SpiceChannelList *chan;
     SpiceInfo *info;
     const char *channel_name;
-    const char * const channel_names[] = {
+    static const char *const channel_names[] = {
         [SPICE_CHANNEL_MAIN] = "main",
         [SPICE_CHANNEL_DISPLAY] = "display",
         [SPICE_CHANNEL_INPUTS] = "inputs",
-- 
2.37.3


