Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4296A088F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 13:25:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVAdO-0002yt-I9; Thu, 23 Feb 2023 07:23:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVAdK-0002wl-G7
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:23:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVAdJ-0003y6-1J
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:23:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677155012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EuqbNzloE8p5VJVGICYz1ePjTwoKZYwYA8XMCXL9IOw=;
 b=D7yR1qSBrEjZmCD7HL7N82NRiTVa/pa7C6OdhkZhFARx3jvDjWPixuditmfJkqoK9oIz47
 zs+gPXwjTw2XwayiBfjjh47tWg4wZ2JEwxJwpAh57az9IkRLNv0hnOE2/wRw/Aj5nW4fm/
 FDLaBQnMKKX68OJKkUIkA1rct497oM4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-UQ0mgSUiPhamu2fMxlTtqg-1; Thu, 23 Feb 2023 07:23:29 -0500
X-MC-Unique: UQ0mgSUiPhamu2fMxlTtqg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C70763813F3B;
 Thu, 23 Feb 2023 12:23:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FC452026D4B;
 Thu, 23 Feb 2023 12:23:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8A34721E6A22; Thu, 23 Feb 2023 13:23:27 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	John Snow <jsnow@redhat.com>
Subject: [PULL 3/8] qapi: Update flake8 config
Date: Thu, 23 Feb 2023 13:23:22 +0100
Message-Id: <20230223122327.1920247-4-armbru@redhat.com>
In-Reply-To: <20230223122327.1920247-1-armbru@redhat.com>
References: <20230223122327.1920247-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

From: John Snow <jsnow@redhat.com>

New versions of flake8 don't like same-line comments. (It's a version
newer than what fc37 ships, but it still makes my life easier to fix it
now.)

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230215000011.1725012-2-jsnow@redhat.com>
---
 scripts/qapi/.flake8 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/qapi/.flake8 b/scripts/qapi/.flake8
index 6b158c68b8..a873ff6730 100644
--- a/scripts/qapi/.flake8
+++ b/scripts/qapi/.flake8
@@ -1,2 +1,3 @@
 [flake8]
-extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
+# Prefer pylint's bare-except checks to flake8's
+extend-ignore = E722
-- 
2.39.0


