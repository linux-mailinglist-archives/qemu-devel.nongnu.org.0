Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E7C301605
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 15:44:44 +0100 (CET)
Received: from localhost ([::1]:36582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3K9b-00041Z-TP
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 09:44:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxJ-0003iG-6T
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:32:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxH-0005tB-64
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:32:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611412318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7nWc0zti+UtSjbKpZNWAZ+f1N7xdJzkpg3Aijgg1XDc=;
 b=USZfzEi2LMaa3MCH+akfVSfnmuzoU0iwVc86goNbUaEgRMdhA+S8FAbKV3l4FZ5YBKzjLD
 48NEAZgXNErl2Gu55ouIPY+DxzIiqRlc9N+xKAScW5dZODET0CBTfJ9F/YAjP3MSBgTstw
 /vLEJry1hu+OUbSpX3KJf6Fbnnf/C/8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597--LzhfX7QOIWLuC6dt_wnSQ-1; Sat, 23 Jan 2021 09:31:56 -0500
X-MC-Unique: -LzhfX7QOIWLuC6dt_wnSQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 750D9E745
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 14:31:55 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3192B5D9CC;
 Sat, 23 Jan 2021 14:31:55 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/31] meson: Display crypto-related information altogether
Date: Sat, 23 Jan 2021 09:31:18 -0500
Message-Id: <20210123143128.1167797-22-pbonzini@redhat.com>
In-Reply-To: <20210123143128.1167797-1-pbonzini@redhat.com>
References: <20210123143128.1167797-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210121095616.1471869-8-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/meson.build b/meson.build
index dbac95890d..abd2c05a82 100644
--- a/meson.build
+++ b/meson.build
@@ -2416,18 +2416,8 @@ if have_block
 endif
 summary(summary_info, bool_yn: true, section: 'Block layer support')
 
+# Crypto
 summary_info = {}
-if targetos == 'darwin'
-  summary_info += {'Cocoa support':   cocoa.found()}
-endif
-# TODO: add back version
-summary_info += {'SDL support':       sdl.found()}
-summary_info += {'SDL image support': sdl_image.found()}
-# TODO: add back version
-summary_info += {'GTK support':       gtk.found()}
-summary_info += {'pixman':            pixman.found()}
-# TODO: add back version
-summary_info += {'VTE support':       config_host.has_key('CONFIG_VTE')}
 summary_info += {'TLS priority':      config_host['CONFIG_TLS_PRIORITY']}
 summary_info += {'GNUTLS support':    config_host.has_key('CONFIG_GNUTLS')}
 # TODO: add back version
@@ -2441,6 +2431,23 @@ summary_info += {'nettle':            config_host.has_key('CONFIG_NETTLE')}
 if config_host.has_key('CONFIG_NETTLE')
    summary_info += {'  XTS':             not config_host.has_key('CONFIG_QEMU_PRIVATE_XTS')}
 endif
+summary_info += {'crypto afalg':      config_host.has_key('CONFIG_AF_ALG')}
+summary_info += {'rng-none':          config_host.has_key('CONFIG_RNG_NONE')}
+summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
+summary(summary_info, bool_yn: true, section: 'Crypto')
+
+summary_info = {}
+if targetos == 'darwin'
+  summary_info += {'Cocoa support':   cocoa.found()}
+endif
+# TODO: add back version
+summary_info += {'SDL support':       sdl.found()}
+summary_info += {'SDL image support': sdl_image.found()}
+# TODO: add back version
+summary_info += {'GTK support':       gtk.found()}
+summary_info += {'pixman':            pixman.found()}
+# TODO: add back version
+summary_info += {'VTE support':       config_host.has_key('CONFIG_VTE')}
 # TODO: add back version
 summary_info += {'slirp support':     slirp_opt == 'disabled' ? false : slirp_opt}
 summary_info += {'libtasn1':          config_host.has_key('CONFIG_TASN1')}
@@ -2486,7 +2493,6 @@ if targetos == 'windows'
   endif
 endif
 summary_info += {'seccomp support':   seccomp.found()}
-summary_info += {'crypto afalg':      config_host.has_key('CONFIG_AF_ALG')}
 summary_info += {'GlusterFS support': glusterfs.found()}
 summary_info += {'TPM support':       config_host.has_key('CONFIG_TPM')}
 summary_info += {'libssh support':    config_host.has_key('CONFIG_LIBSSH')}
@@ -2501,8 +2507,6 @@ summary_info += {'capstone':          capstone_opt == 'disabled' ? false : capst
 summary_info += {'libpmem support':   config_host.has_key('CONFIG_LIBPMEM')}
 summary_info += {'libdaxctl support': config_host.has_key('CONFIG_LIBDAXCTL')}
 summary_info += {'libudev':           libudev.found()}
-summary_info += {'rng-none':          config_host.has_key('CONFIG_RNG_NONE')}
-summary_info += {'Linux keyring':     config_host.has_key('CONFIG_SECRET_KEYRING')}
 summary_info += {'FUSE lseek':        fuse_lseek.found()}
 summary(summary_info, bool_yn: true)
 
-- 
2.26.2



