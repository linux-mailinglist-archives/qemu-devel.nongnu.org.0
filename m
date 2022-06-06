Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D358C53E5C3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 18:48:15 +0200 (CEST)
Received: from localhost ([::1]:34942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyFtm-0000OR-Vf
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 12:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nyFpY-0004Q6-T8
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 12:43:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nyFpW-0005SO-5F
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 12:43:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654533829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c80uLVdbxPz7TD7KLJHyzEDrMo9Lz0IWPHyJeQg1VMo=;
 b=E+Twdo/fsp9m+MykRCjDZJKP1XvAjJBnukq6zkWBrs/ekBC/HmgjVnZ0qH6Mt1o7tACjfj
 7VvO90/SbaOVzhYy805YYQ1xKMDEIdrSYJQpgW7PnZnJjSmMlqXRVUam55WzReufaFpoP2
 IDq6vBcSP2NSThXN1cxonXY4Lcp77dg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-faR-N126P8ib6vCo2yWxEw-1; Mon, 06 Jun 2022 12:43:48 -0400
X-MC-Unique: faR-N126P8ib6vCo2yWxEw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4858E3817A60;
 Mon,  6 Jun 2022 16:43:48 +0000 (UTC)
Received: from pinwheel.redhat.com (unknown [10.39.192.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 841E1C15E72;
 Mon,  6 Jun 2022 16:43:46 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, thuth@redhat.com, peter.maydell@linaro.org,
 eblake@redhat.com, Kashyap Chamarthy <kchamart@redhat.com>
Subject: [PATCH v3 4/4] Add a new doc "contacting-the-project.rst"
Date: Mon,  6 Jun 2022 18:43:36 +0200
Message-Id: <20220606164336.245740-5-kchamart@redhat.com>
In-Reply-To: <20220606164336.245740-1-kchamart@redhat.com>
References: <20220606164336.245740-1-kchamart@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This document slightly duplicates the "support"[1] page here, but
largely refers to the content in[1].

This is based on Peter Maydell's feedback[2] in v2: "there is some
merit in the documentation being standalone, even if it does mean a bit
of duplication with the website".

[1] https://www.qemu.org/support/
[2] https://lists.nongnu.org/archive/html/qemu-devel/2022-03/msg05178.html

Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
---
 docs/about/contacting-the-project.rst | 16 ++++++++++++++++
 docs/about/index.rst                  |  1 +
 2 files changed, 17 insertions(+)
 create mode 100644 docs/about/contacting-the-project.rst

diff --git a/docs/about/contacting-the-project.rst b/docs/about/contacting-the-project.rst
new file mode 100644
index 0000000000..83c1c50c48
--- /dev/null
+++ b/docs/about/contacting-the-project.rst
@@ -0,0 +1,16 @@
+.. _contacting-the-project:
+
+Contacting the project
+======================
+
+There are a multiple ways to reach out to upstream QEMU project,
+depending on what you're trying to do.
+
+If you have technical questions on QEMU usage, there are multiple
+channels for it -- mailing lists, real-time chat (IRC, etc).  Refer to
+`this web page <https://www.qemu.org/support>`__ for more precise
+details.
+
+If you think you have found a bug in QEMU, please follow the procedure
+outlined in `this document
+<https://www.qemu.org/contribute/report-a-bug>`__ on how to report it.
diff --git a/docs/about/index.rst b/docs/about/index.rst
index 5bea653c07..32831eb09a 100644
--- a/docs/about/index.rst
+++ b/docs/about/index.rst
@@ -26,3 +26,4 @@ convert and modify disk images.
    deprecated
    removed-features
    license
+   contacting-the-project
-- 
2.36.1


