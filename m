Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 191EF1FD0B3
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 17:18:19 +0200 (CEST)
Received: from localhost ([::1]:37650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlZpS-0001xs-3e
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 11:18:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jlZOA-0003Wz-8v
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 10:50:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43557
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jlZO6-0001na-6T
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 10:50:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592405400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eNkFvaj4dyE8+3xm5mpLxjxl0tkxOUKwoofudZ84/Lo=;
 b=gVBHLkMO4KxGETBmo8J0Nh8Ig1BPMNiO5uvXCJQiyDEAhIQkOqsR5Xz6lJf1iuoUPNEvPS
 0bx2JsX2xWfJfl+UMID0CL0GgPood91j7MPphfpgir8uQWwXZGp0e3mjsnJ5cMub4yLn08
 /KSPZgzbp8B1B//4vNn0R8QtNVWkG+8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-uZv1vobLNBGmoxO4k0QzXw-1; Wed, 17 Jun 2020 10:49:58 -0400
X-MC-Unique: uZv1vobLNBGmoxO4k0QzXw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E49480331A;
 Wed, 17 Jun 2020 14:49:53 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-44.ams2.redhat.com [10.36.114.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A4237CAAA;
 Wed, 17 Jun 2020 14:49:52 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 29/43] .gitignore: Ignore storage-daemon files
Date: Wed, 17 Jun 2020 16:48:55 +0200
Message-Id: <20200617144909.192176-30-kwolf@redhat.com>
In-Reply-To: <20200617144909.192176-1-kwolf@redhat.com>
References: <20200617144909.192176-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 23:30:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Roman Bolshakov <r.bolshakov@yadro.com>

The files are generated.

Fixes: 2af282ec51a ("qemu-storage-daemon: Add --monitor option")
Cc: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
Message-Id: <20200612105830.17082-1-r.bolshakov@yadro.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 .gitignore | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/.gitignore b/.gitignore
index 0c5af83aa7..90acb4347d 100644
--- a/.gitignore
+++ b/.gitignore
@@ -34,18 +34,18 @@
 /qapi/qapi-builtin-types.[ch]
 /qapi/qapi-builtin-visit.[ch]
 /qapi/qapi-commands-*.[ch]
-/qapi/qapi-commands.[ch]
-/qapi/qapi-emit-events.[ch]
+**/qapi/qapi-commands.[ch]
+**/qapi/qapi-emit-events.[ch]
 /qapi/qapi-events-*.[ch]
-/qapi/qapi-events.[ch]
-/qapi/qapi-init-commands.[ch]
-/qapi/qapi-introspect.[ch]
+**/qapi/qapi-events.[ch]
+**/qapi/qapi-init-commands.[ch]
+**/qapi/qapi-introspect.[ch]
 /qapi/qapi-types-*.[ch]
-/qapi/qapi-types.[ch]
+**/qapi/qapi-types.[ch]
 /qapi/qapi-visit-*.[ch]
 !/qapi/qapi-visit-core.c
-/qapi/qapi-visit.[ch]
-/qapi/qapi-doc.texi
+**/qapi/qapi-visit.[ch]
+**/qapi/qapi-doc.texi
 /qemu-edid
 /qemu-img
 /qemu-nbd
@@ -59,6 +59,7 @@
 /qemu-keymap
 /qemu-monitor.texi
 /qemu-monitor-info.texi
+/qemu-storage-daemon
 /qemu-version.h
 /qemu-version.h.tmp
 /module_block.h
-- 
2.25.4


