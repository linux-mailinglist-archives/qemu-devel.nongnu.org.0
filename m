Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DDD252F5B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 15:08:46 +0200 (CEST)
Received: from localhost ([::1]:54818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAvAT-0006RH-7n
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 09:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kAv8w-0004nN-1U
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 09:07:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kAv8u-0002FK-9l
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 09:07:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598447227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R1bixWs7YawKmc1KBJbS3ohcGUCnPIAUu2VpF9JtO9Y=;
 b=Cg+wp7B12GOWBH9e99nC3cvhOrENFaGWt4qTGFXgiEYNnVEFYYsJTl18AzLh21qAtJ6xFv
 Sv3RPK3msdE/actyYYDZ4OjxQsXlDnAoodX3U0ZW62K89mfBkkl9P6VSbSgEMDUXTVdNKY
 nG6ehzMxICVvJruKL3HsaOIYkm6RSQg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-u0GbR078MNyhA57AMcq3tA-1; Wed, 26 Aug 2020 09:07:05 -0400
X-MC-Unique: u0GbR078MNyhA57AMcq3tA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89B1D10ABDBC
 for <qemu-devel@nongnu.org>; Wed, 26 Aug 2020 13:07:04 +0000 (UTC)
Received: from localhost (unknown [10.36.110.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 253385D9E8;
 Wed, 26 Aug 2020 13:07:02 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 5/6] meson: install $localstatedir/run for qga
Date: Wed, 26 Aug 2020 17:06:21 +0400
Message-Id: <20200826130622.553318-6-marcandre.lureau@redhat.com>
In-Reply-To: <20200826130622.553318-1-marcandre.lureau@redhat.com>
References: <20200826130622.553318-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 06:53:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com, berrange@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 Makefile        | 10 +---------
 qga/meson.build |  2 ++
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index dc3c20dd5e..9a9e7c0301 100644
--- a/Makefile
+++ b/Makefile
@@ -232,17 +232,9 @@ distclean: clean ninja-distclean
 install-datadir:
 	$(INSTALL_DIR) "$(DESTDIR)$(qemu_datadir)"
 
-install-localstatedir:
-ifdef CONFIG_POSIX
-ifeq ($(CONFIG_GUEST_AGENT),y)
-	$(INSTALL_DIR) "$(DESTDIR)$(qemu_localstatedir)"/run
-endif
-endif
-
-
 # Needed by "meson install"
 export DESTDIR
-install: all install-datadir install-localstatedir
+install: all install-datadir
 	$(INSTALL_DIR) "$(DESTDIR)$(qemu_datadir)/keymaps"
 
 ifdef CONFIG_WIN32
diff --git a/qga/meson.build b/qga/meson.build
index 3f28f74b52..e5c5778a3e 100644
--- a/qga/meson.build
+++ b/qga/meson.build
@@ -82,6 +82,8 @@ if targetos == 'windows'
     all_qga += [qga_msi]
     alias_target('msi', qga_msi)
   endif
+else
+  install_subdir('run', install_dir: get_option('localstatedir'))
 endif
 
 alias_target('qemu-ga', all_qga)
-- 
2.26.2


