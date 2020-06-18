Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9011FEB34
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jun 2020 07:59:03 +0200 (CEST)
Received: from localhost ([::1]:60650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlnZm-0000i5-T6
	for lists+qemu-devel@lfdr.de; Thu, 18 Jun 2020 01:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jlnYp-0000G3-Q3
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 01:58:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58211
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jlnYo-0000fS-0z
 for qemu-devel@nongnu.org; Thu, 18 Jun 2020 01:58:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592459880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=Gveb/Kk9y0ZV0cAQGZJ9WrvqDJnMXkM6cqedmWrISHc=;
 b=fw4S1KPTyd2IIwxXc6+TGA0XQ6CWfeLvan6D5Mprgt/m1ode4/Y1byW7s3YYwClQUENXYh
 hQAi8N6/sZM7Z+0wX+Rxtvh38JlmcByvU9BkG4zbkd1fsr1dZWWwtOYS2KcM7wdOJz0lN5
 sTewWEAWfktblG/09mnWsYuEnMlYGb4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-B2OPhQWAMXKU2V8ncf_HjA-1; Thu, 18 Jun 2020 01:57:59 -0400
X-MC-Unique: B2OPhQWAMXKU2V8ncf_HjA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BECA1902EA0;
 Thu, 18 Jun 2020 05:57:58 +0000 (UTC)
Received: from thuth.com (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F38A27CAA5;
 Thu, 18 Jun 2020 05:57:56 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] softmmu/vl: Do not recommend to use -M accel=... anymore
Date: Thu, 18 Jun 2020 07:57:54 +0200
Message-Id: <20200618055754.12154-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/18 01:47:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The new -accel parameter can be used multiple times now, so we
should recommend this new way instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 softmmu/vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index f669c06ede..e2b2991a5f 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -3487,7 +3487,7 @@ void qemu_init(int argc, char **argv, char **envp)
                 }
                 if (optarg && strchr(optarg, ':')) {
                     error_report("Don't use ':' with -accel, "
-                                 "use -M accel=... for now instead");
+                                 "use multiple -accel=... options instead");
                     exit(1);
                 }
                 break;
-- 
2.18.1


