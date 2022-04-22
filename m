Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B980250C000
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 20:57:25 +0200 (CEST)
Received: from localhost ([::1]:54672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhyT6-0004Zn-RT
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 14:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhyLj-0000SU-U2
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 14:49:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhyLg-0007sm-K4
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 14:49:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650653383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DnJ31nR5mH9aqnMBVsb+BFdlYWkggcQ8uSG3obNji8s=;
 b=Cgw1OgBqs1lDWlJhbhmL0LfZxrURR6XZjsUBjkJBJz9nwbhSD4o9n1ts1YUHgxRJiNhOFj
 +88i+ej580psskt42cW4w6eI//OwHslAiZoOGBhm8N+7ZKpurNZW6qkHrNLSHXJLnJWviA
 dJqK/B6KpvDotATGopev0yq6H0/dAv0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-297-CgGY_Yx3NCqFEdXfzTvw2Q-1; Fri, 22 Apr 2022 14:49:42 -0400
X-MC-Unique: CgGY_Yx3NCqFEdXfzTvw2Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04B202803F63
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 18:49:42 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.10.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B72741468940;
 Fri, 22 Apr 2022 18:49:41 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu.qmp PATCH 02/12] update maintainer metadata
Date: Fri, 22 Apr 2022 14:49:30 -0400
Message-Id: <20220422184940.1763958-3-jsnow@redhat.com>
In-Reply-To: <20220422184940.1763958-1-jsnow@redhat.com>
References: <20220422184940.1763958-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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
Cc: John Snow <jsnow@redhat.com>, Kashyap Chamarthy <kchamart@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Modify "QEMU Developer Team" to "QEMU Project", as this matches the
spelling we use for the collective on gitlab.com/qemu-project.

Add myself as the principal maintainer contact.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 setup.cfg | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/setup.cfg b/setup.cfg
index 4ffab73..f06f944 100644
--- a/setup.cfg
+++ b/setup.cfg
@@ -1,8 +1,10 @@
 [metadata]
 name = qemu.qmp
 version = file:VERSION
-maintainer = QEMU Developer Team
-maintainer_email = qemu-devel@nongnu.org
+author = QEMU Project
+author_email = qemu-devel@nongnu.org
+maintainer = John Snow
+maintainer_email = jsnow@redhat.com
 url = https://www.qemu.org/
 download_url = https://www.qemu.org/download/
 description = QEMU Python Build, Debug and SDK tooling.
-- 
2.34.1


