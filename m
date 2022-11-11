Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 503E0625148
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 04:07:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otKMf-0001At-Ky; Thu, 10 Nov 2022 22:05:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenyzha@redhat.com>)
 id 1otKMe-0001Ak-Kl
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 22:05:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenyzha@redhat.com>)
 id 1otKMc-0008HN-JW
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 22:05:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668135952;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=/Ebtbu7vY+ot3eUAnN0SLhn00mg9X23wEB3kzrJxZRk=;
 b=AW960GFg7jw91mavhr0On6IZLaEM8vVun0zbs/HTOPylRExQKO2jzVh0XT5L3hU72COtVM
 ketOsIpceAnJgnkCQWxoExSQKpLCAeBN2GV0o+yfcyKgSoXmvy9xpmtJfXkqAI8Di/gtww
 Ksx/gryuP3mqZJKhzLM+GaEXabP75Tk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-QMnmio0APse23uMUM0aMag-1; Thu, 10 Nov 2022 22:05:45 -0500
X-MC-Unique: QMnmio0APse23uMUM0aMag-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23B2D86F12E;
 Fri, 11 Nov 2022 03:05:45 +0000 (UTC)
Received: from cav-thunderx1s-cn88xx-03.khw4.lab.eng.bos.redhat.com
 (cav-thunderx1s-cn88xx-03.khw4.lab.eng.bos.redhat.com [10.19.240.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D8D3C40C94AA;
 Fri, 11 Nov 2022 03:05:44 +0000 (UTC)
From: Zhenyu Zhang <zhenyzha@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, philmd@linaro.org, shan.gavin@gmail.com,
 eric.auger@redhat.com, imammedo@redhat.com, zhenyzha@redhat.com,
 lijin@redhat.com
Subject: [PATCH v3] qapi/qom: Memory backend property prealloc-threads doc fix
Date: Thu, 10 Nov 2022 22:05:41 -0500
Message-Id: <20221111030541.191186-1-zhenyzha@redhat.com>
MIME-Version: 1.0\nContent-Type: text/plain;
 charset=UTF-8\nContent-Transfer-Encoding: 8bit
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=zhenyzha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, BOGUS_MIME_VERSION=1,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Commit ffac16fab3 "hostmem: introduce "prealloc-threads" property"
(v5.0.0) changed the default number of threads from number of CPUs
to 1.  This was deemed a regression, and fixed in commit f8d426a685
"hostmem: default the amount of prealloc-threads to smp-cpus".
Except the documentation remained unchanged.  Update it now.

Signed-off-by: Zhenyu Zhang <zhenyzha@redhat.com>
---

v3: Covers historical descriptions                  (Markus) 
v2: The property is changed to smp-cpus since 5.0   (Phild)

---
 qapi/qom.json | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qapi/qom.json b/qapi/qom.json
index 30e76653ad..dfd89bc6d4 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -576,7 +576,7 @@
 #
 # @prealloc: if true, preallocate memory (default: false)
 #
-# @prealloc-threads: number of CPU threads to use for prealloc (default: 1)
+# @prealloc-threads: number of CPU threads to use for prealloc (default: number of CPUs) (since 5.0)
 #
 # @prealloc-context: thread context to use for creation of preallocation threads
 #                    (default: none) (since 7.2)
-- 
2.31.1


