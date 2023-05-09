Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E04786FC117
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 10:01:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwIGk-0008Ti-BM; Tue, 09 May 2023 04:00:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwIGi-0008Sx-Ls
 for qemu-devel@nongnu.org; Tue, 09 May 2023 04:00:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwIGg-0008TP-FK
 for qemu-devel@nongnu.org; Tue, 09 May 2023 04:00:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683619217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T9povUrV+u+bm1chm5LE+rb8/h+Aqq4hnzCyP0W5Wes=;
 b=Nr0v7Q2sNoolV9wy1ZSo/4zrDaL3rNBi/46LtBigY79SIaLRSkEUWyFa2/ROCQnO0moeKs
 JHx8vmcZ0Mu1UswYqvPTyf9cXaPz+XeahRbp4ptGB9Kqu8h4I0B4WpS38WqF3B+x+hHT32
 DopbQk+qBi7G0A3p5i6KW/7X9Snn+zw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351-e92iRWAjNjuNp42ZJW-gBg-1; Tue, 09 May 2023 04:00:15 -0400
X-MC-Unique: e92iRWAjNjuNp42ZJW-gBg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72F3B28237E2;
 Tue,  9 May 2023 08:00:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 501FE2026D16;
 Tue,  9 May 2023 08:00:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2016821E692E; Tue,  9 May 2023 10:00:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	Juan Quintela <quintela@redhat.com>
Subject: [PULL 01/17] docs/devel/qapi-code-gen: Clean up use of quotes a bit
Date: Tue,  9 May 2023 09:59:55 +0200
Message-Id: <20230509080011.3231661-2-armbru@redhat.com>
In-Reply-To: <20230509080011.3231661-1-armbru@redhat.com>
References: <20230509080011.3231661-1-armbru@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Section "Definition documentation" uses both single and double quotes
around doc text snippets.  Stick to double quotes.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230428105429.1687850-2-armbru@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 docs/devel/qapi-code-gen.rst | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index af1986f33e..289869c53b 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -989,7 +989,7 @@ The number of spaces between the ':' and the text is not significant.
    union branches should be described, too.
 
 Extensions added after the definition was first released carry a
-'(since x.y.z)' comment.
+"(since x.y.z)" comment.
 
 The feature descriptions must be preceded by a line "Features:", like
 this::
@@ -1003,17 +1003,17 @@ The section ends with the start of a new section.
 
 The text of a section can start on a new line, in
 which case it must not be indented at all.  It can also start
-on the same line as the 'Note:', 'Returns:', etc tag.  In this
+on the same line as the "Note:", "Returns:", etc tag.  In this
 case if it spans multiple lines then second and subsequent
 lines must be indented to match the first, in the same way as
 multiline argument descriptions.
 
-A 'Since: x.y.z' tagged section lists the release that introduced the
+A "Since: x.y.z" tagged section lists the release that introduced the
 definition.
 
-An 'Example' or 'Examples' section is automatically rendered
-entirely as literal fixed-width text.  In other sections,
-the text is formatted, and rST markup can be used.
+An "Example" or "Examples" section is automatically rendered entirely
+as literal fixed-width text.  In other sections, the text is
+formatted, and rST markup can be used.
 
 For example::
 
-- 
2.39.2


