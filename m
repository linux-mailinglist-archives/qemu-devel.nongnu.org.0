Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2AE702E98
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:43:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXsK-000708-S6; Mon, 15 May 2023 09:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pyXqw-0004Yp-Gz
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:03:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pyXqp-00011e-Gc
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:02:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684155773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mLAcJvdt4KSIVqT7+BRvf/ct4IqT2QBXigE3eLpau+4=;
 b=hIY3rAnHfKVuBWwKFrBUmHjMwwwUzUxdMJMIsrea0vmDUh9oIbgbw/ZNqWFAGDOirms7Lh
 MKnjUBa5Lz9KQS6LBVkT0vrswNR5xXrpJJI6bOXNjRtm6ZIJy+8SOXo1Sa09MSL4n49Qf1
 gjLgg7b8OqRoQrBScQY7NlSmEDSNhN4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-WlX00yl-PZyA5RBWMW0cpw-1; Mon, 15 May 2023 09:02:47 -0400
X-MC-Unique: WlX00yl-PZyA5RBWMW0cpw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7E49863E85;
 Mon, 15 May 2023 13:02:44 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22A6840C6EC4;
 Mon, 15 May 2023 13:02:44 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: Mateusz Krawczuk <mat.krawczuk@gmail.com>
Subject: [PULL 06/21] Add information how to fix common build error on Windows
 in symlink-install-tree
Date: Mon, 15 May 2023 15:02:18 +0200
Message-Id: <20230515130233.418183-7-thuth@redhat.com>
In-Reply-To: <20230515130233.418183-1-thuth@redhat.com>
References: <20230515130233.418183-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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

From: Mateusz Krawczuk <mat.krawczuk@gmail.com>

By default, Windows doesn't allow to create soft links for user account
and only administrator is allowed to do this. To fix this problem you have
to raise your permissions or enable Developer Mode, which available since
Windows 10. Additional explanation when build fails will allow developer
to fix the problem on his computer faster.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1386
Signed-off-by: Mateusz Krawczuk <mat.krawczuk@gmail.com>
Message-Id: <20230504211101.1386-1-mat.krawczuk@gmail.com>
[thuth: Drop the hunk with the white space changes]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 scripts/symlink-install-tree.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/symlink-install-tree.py b/scripts/symlink-install-tree.py
index 67cb86dd52..8ed97e3c94 100644
--- a/scripts/symlink-install-tree.py
+++ b/scripts/symlink-install-tree.py
@@ -28,5 +28,8 @@ def destdir_join(d1: str, d2: str) -> str:
         os.symlink(source, bundle_dest)
     except BaseException as e:
         if not isinstance(e, OSError) or e.errno != errno.EEXIST:
+            if os.name == 'nt':
+                print('Please enable Developer Mode to support soft link '
+                      'without Administrator permission')
             print(f'error making symbolic link {dest}', file=sys.stderr)
             raise e
-- 
2.31.1


