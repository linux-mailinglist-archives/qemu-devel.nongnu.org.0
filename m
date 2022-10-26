Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0554660E6E8
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 20:00:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onkcz-00005V-Bu; Wed, 26 Oct 2022 13:55:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1onkcx-00005C-6D
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 13:55:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1onkcv-0005ff-Cg
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 13:55:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666806940;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P2vxqhrSgxGLaLWSHgWAQ+Sz40NyHDNGkkC8Hulk6Fo=;
 b=ZKz1vpIF7oNg8p/TdKYA/M3HyPisD4aolE/+OEwuHtbTg6MyqyEw6bCo4lrG3mtAX+02Rk
 ClLzEyM0jM1w4TYOFxkdDRJc8VnE695X/x88h/0/y+cS1NXyJYYiYfYmcBu8oinjvHPUin
 ewW+dba5Wg+686UoZZclE2zTv/NeSH0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-86w05p53OuSD28xtn4O8Uw-1; Wed, 26 Oct 2022 13:55:39 -0400
X-MC-Unique: 86w05p53OuSD28xtn4O8Uw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1383857D1E;
 Wed, 26 Oct 2022 17:55:38 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (ovpn-192-17.brq.redhat.com
 [10.40.192.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E34512166B2B;
 Wed, 26 Oct 2022 17:55:37 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 8/8] qga: add channel path to error messages
Date: Wed, 26 Oct 2022 20:55:18 +0300
Message-Id: <20221026175518.2636846-9-kkostiuk@redhat.com>
In-Reply-To: <20221026175518.2636846-1-kkostiuk@redhat.com>
References: <20221026175518.2636846-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bjørn Forsman <bjorn.forsman@gmail.com>

It's useful to know which device was used if/when it fails.

channel-win32.c had this since 2015, with
c69403fcd4a0cb89f838a212ab71e4a1a3464c95 ("qemu-ga: debug printouts to
help troubleshoot installation"), this brings channel-posix.c up to
speed.

Signed-off-by: Bjørn Forsman <bjorn.forsman@gmail.com>
Reviewed-by: Konstantin Kostiuk <kkostiuk@redhat.com>
Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
---
 qga/channel-posix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qga/channel-posix.c b/qga/channel-posix.c
index 568350ded4..0c5175d957 100644
--- a/qga/channel-posix.c
+++ b/qga/channel-posix.c
@@ -138,7 +138,7 @@ static gboolean ga_channel_open(GAChannel *c, const gchar *path,
             0
         );
         if (fd == -1) {
-            error_setg_errno(errp, errno, "error opening channel");
+            error_setg_errno(errp, errno, "error opening channel '%s'", path);
             return false;
         }
 #ifdef CONFIG_SOLARIS
@@ -182,7 +182,7 @@ static gboolean ga_channel_open(GAChannel *c, const gchar *path,
         assert(fd < 0);
         fd = qga_open_cloexec(path, O_RDWR | O_NOCTTY | O_NONBLOCK, 0);
         if (fd == -1) {
-            error_setg_errno(errp, errno, "error opening channel");
+            error_setg_errno(errp, errno, "error opening channel '%s'", path);
             return false;
         }
         tcgetattr(fd, &tio);
-- 
2.25.1


