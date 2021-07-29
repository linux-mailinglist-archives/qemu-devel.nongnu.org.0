Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1D33D9F96
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 10:29:58 +0200 (CEST)
Received: from localhost ([::1]:51978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m91QT-0004hc-9e
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 04:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m91Jb-00061A-20
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:22:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m91JZ-0007Tc-FK
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 04:22:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627546968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SMVIPWFXgSzbfNERWALVbhlS5zQT5hNyhCnosw7SC3A=;
 b=c7tEG9A+lzYpMN3YeU8Pb4rWZxzTUyCMlaxFx00RMHMOSef5hq/fKeXHCz7Dj9jfNTgvoY
 YmAlW4Az3d31zitK2/urGDpae4s1jGop0JcckXC1ZOJHMBkWxI9NNDCL0WQ0pVyxuWznFn
 KKf+aMRbg9UPEU0OvsORPuqp5yws5ns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-wPK6Zfc1M3C07tuD97rjCA-1; Thu, 29 Jul 2021 04:22:45 -0400
X-MC-Unique: wPK6Zfc1M3C07tuD97rjCA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B6F780196C;
 Thu, 29 Jul 2021 08:22:44 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49DD45D9DC;
 Thu, 29 Jul 2021 08:22:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 9/9] configure script fix for Haiku
Date: Thu, 29 Jul 2021 10:22:11 +0200
Message-Id: <20210729082211.532572-10-thuth@redhat.com>
In-Reply-To: <20210729082211.532572-1-thuth@redhat.com>
References: <20210729082211.532572-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Zak <richard.j.zak@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Zak <richard.j.zak@gmail.com>

Haiku does not support compiling with -fpie. See the discussion here
for details:

 https://discuss.haiku-os.org/t/qemu-on-haiku-sdl-issue/10961/6?u=rjzak

Signed-off-by: Richard Zak <richard.j.zak@gmail.com>
Message-Id: <CAOakUfM8zMpYiAEn-_f9s1DHdVB-Bq9fGMM=Hfr8hJW9ra6aWw@mail.gmail.com>
[thuth: Tweaked title and patch description]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 79e2ddc74e..cd5e6892f4 100755
--- a/configure
+++ b/configure
@@ -770,7 +770,8 @@ SunOS)
 ;;
 Haiku)
   haiku="yes"
-  QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE $QEMU_CFLAGS"
+  pie="no"
+  QEMU_CFLAGS="-DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE -fPIC $QEMU_CFLAGS"
 ;;
 Linux)
   audio_drv_list="try-pa oss"
-- 
2.27.0


