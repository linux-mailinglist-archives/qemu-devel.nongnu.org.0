Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD47C15FE3D
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Feb 2020 12:51:11 +0100 (CET)
Received: from localhost ([::1]:50500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2vyY-00028x-W3
	for lists+qemu-devel@lfdr.de; Sat, 15 Feb 2020 06:51:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49800)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1j2vpS-0004Z3-ML
 for qemu-devel@nongnu.org; Sat, 15 Feb 2020 06:41:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1j2vpR-0006uQ-KO
 for qemu-devel@nongnu.org; Sat, 15 Feb 2020 06:41:46 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40105
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1j2vpR-0006u8-Gp
 for qemu-devel@nongnu.org; Sat, 15 Feb 2020 06:41:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581766905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y7FjKJhCjWNFMPIs6/Jt5ilEWtrm33h4E6D3NuoDGVM=;
 b=cCI4rzxgnOK83K2UnAkbP/ZGuHaz7nkV+MzPsWEXke4pdELD/xrSRJENf6paphYfZnVcVi
 vD2yK7BL3HajHh4MT7InbKN61UjhIqAwShnzXGwR4LxvBL62sybLoGiJUa7GLaNfT5eaM+
 hGDiuDfWHmy6nm0Cuc7lB4L+4KSmkiY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-LbXgaGctMa2ZUjzXwy11mQ-1; Sat, 15 Feb 2020 06:41:37 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E364100550E;
 Sat, 15 Feb 2020 11:41:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-234.ams2.redhat.com
 [10.36.117.234])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EDBD60BEC;
 Sat, 15 Feb 2020 11:41:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3828411366DE; Sat, 15 Feb 2020 12:41:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/18] qapi/block-core.json: Use literal block for ascii art
Date: Sat, 15 Feb 2020 12:41:24 +0100
Message-Id: <20200215114133.15097-10-armbru@redhat.com>
In-Reply-To: <20200215114133.15097-1-armbru@redhat.com>
References: <20200215114133.15097-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: LbXgaGctMa2ZUjzXwy11mQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

The ascii-art graph in the BlockLatencyHistogramInfo documentation
doesn't render correctly, because the whitespace is collapsed.

Use the '|' format that emits a literal 'example' block so the graph
is displayed correctly.

Strictly the Texinfo generated is still wrong because each line
goes into its own @example environment, but it renders better
than what we had before.

Fixing this rendering is a necessary prerequisite for the upcoming rST
generator, which otherwise complains about the inconsistent
indentation in the ascii-art graph.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20200213175647.17628-8-peter.maydell@linaro.org>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
[Commit message tweaked]
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/block-core.json | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index ef94a29686..db9ca688d4 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -550,13 +550,13 @@
 #        For the example above, @bins may be something like [3, 1, 5, 2],
 #        and corresponding histogram looks like:
 #
-#        5|           *
-#        4|           *
-#        3| *         *
-#        2| *         *    *
-#        1| *    *    *    *
-#         +------------------
-#             10   50   100
+# |      5|           *
+# |      4|           *
+# |      3| *         *
+# |      2| *         *    *
+# |      1| *    *    *    *
+# |       +------------------
+# |           10   50   100
 #
 # Since: 4.0
 ##
--=20
2.21.1


