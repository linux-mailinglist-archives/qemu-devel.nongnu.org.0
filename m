Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 785FF50BFF6
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 20:52:15 +0200 (CEST)
Received: from localhost ([::1]:40878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhyO6-0002wt-Du
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 14:52:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhyLj-0000SZ-Jn
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 14:49:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhyLg-0007sw-QH
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 14:49:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650653384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xg8drPiZvrAS+7nNKlXYfvV3lfz6VLMubva4reAPed4=;
 b=Sl0dAQbkXDEtJYbbzBZXMaNDPun2vkSnJCJ4UiuSfuL1Xta40hi4tklgyT64tjdEJnfjKD
 ur+DCtuGeuesASLP3p+r7F217KXNCJX/aE9jrNraACVQdQWyghXcxtYiyaaCFz+U6GQZfO
 f6scIYUDJlny6hR/meyM/falMjEvEps=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-ll6C-05vOmO54mxvWk6G0Q-1; Fri, 22 Apr 2022 14:49:43 -0400
X-MC-Unique: ll6C-05vOmO54mxvWk6G0Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC48385A5A8
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 18:49:42 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.10.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6B5C41468940;
 Fri, 22 Apr 2022 18:49:42 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [qemu.qmp PATCH 04/12] update project URLs
Date: Fri, 22 Apr 2022 14:49:32 -0400
Message-Id: <20220422184940.1763958-5-jsnow@redhat.com>
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

Point to this library's URLs instead of the entire project's.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 setup.cfg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/setup.cfg b/setup.cfg
index c21f2ce..0a1c215 100644
--- a/setup.cfg
+++ b/setup.cfg
@@ -5,8 +5,8 @@ author = QEMU Project
 author_email = qemu-devel@nongnu.org
 maintainer = John Snow
 maintainer_email = jsnow@redhat.com
-url = https://www.qemu.org/
-download_url = https://www.qemu.org/download/
+url = https://gitlab.com/qemu-project/python-qemu-qmp
+download_url = https://gitlab.com/qemu-project/python-qemu-qmp/-/packages
 description = QEMU Monitor Protocol library
 long_description = file:PACKAGE.rst
 long_description_content_type = text/x-rst
-- 
2.34.1


