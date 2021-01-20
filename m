Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 058272FD3C2
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 16:20:51 +0100 (CET)
Received: from localhost ([::1]:41950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2FHu-0001ht-2S
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 10:20:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2FFG-0000FP-I8
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:18:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2FFA-0007gV-EQ
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:18:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611155879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jJCgtbFIWVTjbRJVM6jGRVUbEeOAJsAV/UEZoiikXjw=;
 b=GijjNMu8RcK+RVgml3VA4oKMkHGuI6PSRibznfaZbpmX6CBOcPVo82BIT+AsCMxipuLdej
 heP2wxhRrAHSVErvavfM0qk/gZfQyx6bT5ovsXDYhwgghhnDcnnmcNgKrBrTPWMqVatevh
 HRuWFNFugIHmTDRI1+tbHftjJErGn+I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-hivR_ZsFMqWn7x08FVj8fA-1; Wed, 20 Jan 2021 10:17:57 -0500
X-MC-Unique: hivR_ZsFMqWn7x08FVj8fA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4882810054FF;
 Wed, 20 Jan 2021 15:17:56 +0000 (UTC)
Received: from thuth.com (ovpn-114-135.ams2.redhat.com [10.36.114.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3E0A60C6A;
 Wed, 20 Jan 2021 15:17:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 01/14] osdep.h: Remove <sys/signal.h> include
Date: Wed, 20 Jan 2021 16:17:38 +0100
Message-Id: <20210120151751.520597-2-thuth@redhat.com>
In-Reply-To: <20210120151751.520597-1-thuth@redhat.com>
References: <20210120151751.520597-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
Cc: John Snow <jsnow@redhat.com>, Michael Forney <mforney@mforney.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Michael Forney <mforney@mforney.org>

Prior to 2a4b472c3c, sys/signal.h was only included on OpenBSD
(apart from two .c files). The POSIX standard location for this
header is just <signal.h> and in fact, OpenBSD's signal.h includes
sys/signal.h itself.

Unconditionally including <sys/signal.h> on musl causes warnings
for just about every source file:

  /usr/include/sys/signal.h:1:2: warning: #warning redirecting incorrect #include <sys/signal.h> to <signal.h> [-Wcpp]
      1 | #warning redirecting incorrect #include <sys/signal.h> to <signal.h>
        |  ^~~~~~~

Since there don't seem to be any platforms which require including
<sys/signal.h> in addition to <signal.h>, and some platforms like
Haiku lack it completely, just remove it.

Tested building on OpenBSD after removing this include.

Signed-off-by: Michael Forney <mforney@mforney.org>
Tested-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210113215600.16100-1-mforney@mforney.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/qemu/osdep.h | 4 ----
 meson.build          | 1 -
 2 files changed, 5 deletions(-)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index f9ec8c84e9..a434382c58 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -104,10 +104,6 @@ extern int daemon(int, int);
 #include <setjmp.h>
 #include <signal.h>
 
-#ifdef HAVE_SYS_SIGNAL_H
-#include <sys/signal.h>
-#endif
-
 #ifndef _WIN32
 #include <sys/wait.h>
 #else
diff --git a/meson.build b/meson.build
index 3d889857a0..af2bc89741 100644
--- a/meson.build
+++ b/meson.build
@@ -1113,7 +1113,6 @@ config_host_data.set('HAVE_DRM_H', cc.has_header('libdrm/drm.h'))
 config_host_data.set('HAVE_PTY_H', cc.has_header('pty.h'))
 config_host_data.set('HAVE_SYS_IOCCOM_H', cc.has_header('sys/ioccom.h'))
 config_host_data.set('HAVE_SYS_KCOV_H', cc.has_header('sys/kcov.h'))
-config_host_data.set('HAVE_SYS_SIGNAL_H', cc.has_header('sys/signal.h'))
 
 ignored = ['CONFIG_QEMU_INTERP_PREFIX'] # actually per-target
 arrays = ['CONFIG_AUDIO_DRIVERS', 'CONFIG_BDRV_RW_WHITELIST', 'CONFIG_BDRV_RO_WHITELIST']
-- 
2.27.0


