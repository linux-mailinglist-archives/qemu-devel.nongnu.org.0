Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C201FBB59
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 18:20:00 +0200 (CEST)
Received: from localhost ([::1]:48878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlEJb-0004GB-6U
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 12:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jlEI2-0002do-Mt
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 12:18:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52860
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jlEI1-0006B6-2p
 for qemu-devel@nongnu.org; Tue, 16 Jun 2020 12:18:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592324299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DIjm/8xwK/DT5kpdyRhUMPiZRt7q51iVsp53U/FhjOM=;
 b=AVCLO8wadjEyRtBL4eaQDyDewt4hdlt3lok3W7zald1jduTMDhOIPobq4cosX1fmcRCcCr
 Y7s9hcGuJsQKXlrHkxFwS/bjRlcC9Vg94/ehadf+o539D6in96zFMTMZ4pSSo6oDxtsy/2
 w3Hv/4dOWsl2HWXTxPvxLR+2el7/9g0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-KqXDoMpLONS4x0JGHBa12Q-1; Tue, 16 Jun 2020 12:18:18 -0400
X-MC-Unique: KqXDoMpLONS4x0JGHBa12Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B478E918
 for <qemu-devel@nongnu.org>; Tue, 16 Jun 2020 16:18:17 +0000 (UTC)
Received: from turbo.com (ovpn-112-91.ams2.redhat.com [10.36.112.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75DC37CAA0
 for <qemu-devel@nongnu.org>; Tue, 16 Jun 2020 16:18:16 +0000 (UTC)
From: Christophe de Dinechin <dinechin@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Makefile: Compute libraries for libqemuutil.a and
 libvhost-user.a
Date: Tue, 16 Jun 2020 18:18:14 +0200
Message-Id: <20200616161814.891053-1-dinechin@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=dinechin@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 02:46:07
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In util/Makefile.objs, there is a setting for dbus.o-libs.
Trying to copy-paste that to add a library for module.o that was was
not otherwise linked yields link errors on a number of binaries,
e.g. qemu-ga, with unsatisfied symbols in libqemuutil.a(module.o).
The reason is that library dependencies are not propagated to the .a
files automatically.

Adding a call to extract-libs to get the libraries for the two .a
files that are used elsewhere.

Signed-off-by: Christophe de Dinechin <dinechin@redhat.com>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index 2e93068894..5fb0c78a0b 100644
--- a/Makefile
+++ b/Makefile
@@ -598,6 +598,8 @@ Makefile: $(version-obj-y)
 ######################################################################
 # Build libraries
 
+libqemuutil.a-libs += $(call extract-libs, $(util-obj-y) $(trace-obj-y) $(stub-obj-y))
+libvhost-user.a-libs += $(call extract-libs, $(libvhost-user-obj-y) $(util-obj-y) $(stub-obj-y))
 libqemuutil.a: $(util-obj-y) $(trace-obj-y) $(stub-obj-y)
 libvhost-user.a: $(libvhost-user-obj-y) $(util-obj-y) $(stub-obj-y)
 
-- 
2.26.2


