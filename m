Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C8A206F09
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 10:36:15 +0200 (CEST)
Received: from localhost ([::1]:60900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo0tC-0007ee-Ls
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 04:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jo0rO-00066m-KN
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 04:34:22 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:48759
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jo0rN-00086Z-04
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 04:34:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592987659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LzNuYAfPq4hETAZ2n6TDmArzhP5CG1xLHaZKSwZLe+I=;
 b=SOdTDff3504Tc5wgyHgPWBSIYM+vBOVae4V+VLAGvfGyewICoydRtJDzVVkF3ZJpRvNC1p
 L0FnZZHaS+r+c4agvoLfx+fOR3vePxZCC98w+dCAbFBht30jmVahsHGqeDVFckkwKwIuim
 ITrCSIQhvK5Yf9L3L65ghZ5tsEyEgUE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-U_C4V7IWMHmYwRCO8Hm0GQ-1; Wed, 24 Jun 2020 04:34:18 -0400
X-MC-Unique: U_C4V7IWMHmYwRCO8Hm0GQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF16410059A0;
 Wed, 24 Jun 2020 08:34:16 +0000 (UTC)
Received: from turbo.com (ovpn-112-91.ams2.redhat.com [10.36.112.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED2125C3E7;
 Wed, 24 Jun 2020 08:34:10 +0000 (UTC)
From: Christophe de Dinechin <dinechin@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] trivial: Remove extra character in configure help
Date: Wed, 24 Jun 2020 10:33:37 +0200
Message-Id: <20200624083337.912846-1-dinechin@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=dinechin@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 00:34:35
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
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Christophe de Dinechin <dinechin@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index ba88fd1824..c7a6a5adfe 100755
--- a/configure
+++ b/configure
@@ -1787,7 +1787,7 @@ Advanced options (experts only):
   --block-drv-ro-whitelist=L
                            set block driver read-only whitelist
                            (affects only QEMU, not qemu-img)
-  --enable-trace-backends=B Set trace backend
+  --enable-trace-backends= Set trace backend
                            Available backends: $trace_backend_list
   --with-trace-file=NAME   Full PATH,NAME of file to store traces
                            Default:trace-<pid>
-- 
2.26.2


