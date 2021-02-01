Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0AE30B1F4
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 22:17:29 +0100 (CET)
Received: from localhost ([::1]:57066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6gZc-0007Y5-JD
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 16:17:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l6gXX-0006Dj-Rg
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 16:15:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1l6gXV-0007cN-NI
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 16:15:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612214117;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TeKzjrIymoXT0Ss6pSYaRzZ3tHoFOyPCmleOLCTvi5w=;
 b=IMrEKhgswe7b1ZbKCFlbwxKI4mfKuVDqNPrXcI2b/2wJlGm2JCzyhvQAkcibWM6kZUuUzE
 rX6D85G6uBWh1gYabH3NdY8KWGjrEo0UF+bfbKri6OvQKMIXxbsIsK4934Yns9ukPqIC2k
 qXdAcMCmQxtWGS8QFnpNg6j/TEQEuQk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-wZcjffFNP6KDestt0SQ3vA-1; Mon, 01 Feb 2021 16:15:12 -0500
X-MC-Unique: wZcjffFNP6KDestt0SQ3vA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A75281621;
 Mon,  1 Feb 2021 21:15:11 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-116-207.gru2.redhat.com
 [10.97.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70E275C1A1;
 Mon,  1 Feb 2021 21:15:06 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] virtiofsd: Allow to build it without the tools
Date: Mon,  1 Feb 2021 18:14:56 -0300
Message-Id: <20210201211456.1133364-2-wainersm@redhat.com>
In-Reply-To: <20210201211456.1133364-1-wainersm@redhat.com>
References: <20210201211456.1133364-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: pbonzini@redhat.com, dgilbert@redhat.com, stefanha@redhat.com,
 misono.tomohiro@jp.fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This changed the Meson build script to allow virtiofsd be built even
though the tools build is disabled, thus honoring the --enable-virtiofsd
option.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 tools/meson.build | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tools/meson.build b/tools/meson.build
index fdce66857d..3e5a0abfa2 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -10,8 +10,11 @@ if get_option('virtiofsd').enabled()
       error('virtiofsd requires Linux')
     elif not seccomp.found() or not libcap_ng.found()
       error('virtiofsd requires libcap-ng-devel and seccomp-devel')
-    elif not have_tools or 'CONFIG_VHOST_USER' not in config_host
-      error('virtiofsd needs tools and vhost-user support')
+    elif 'CONFIG_VHOST_USER' not in config_host
+      error('virtiofsd needs vhost-user support')
+    else
+      # Disabled all the tools but virtiofsd.
+      have_virtiofsd = true
     endif
   endif
 elif get_option('virtiofsd').disabled() or not have_system
-- 
2.29.2


