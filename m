Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5E5230C78
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 16:32:59 +0200 (CEST)
Received: from localhost ([::1]:41012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0Qf4-0004cg-0k
	for lists+qemu-devel@lfdr.de; Tue, 28 Jul 2020 10:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1k0Qdj-0003Br-33
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 10:31:35 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:41372
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1k0Qdg-0001jV-8R
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 10:31:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595946691;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HavDs4TdbWRcgCjIP//IJUjb5X1vWRc5f/SAV3XXkvE=;
 b=XBzHuoK7YW1ZCJ1ZItOz2S7zIjay3eV3w9rnB513rSj5HxSrdroDIAf0EVsYCXlY/VY7BB
 BFQx3pjzsjlLTwiGcUEMptM/BzZpPdGYLuk7k5sBNIEIXoOP6M9Do6cMr0EgWoapisGLe7
 yDuMHht7C3xv6gtm/I7XH+uDJpUhKkY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-xKN85W_FNXSsvHzSCy_zFA-1; Tue, 28 Jul 2020 10:31:29 -0400
X-MC-Unique: xKN85W_FNXSsvHzSCy_zFA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9044F8064AF;
 Tue, 28 Jul 2020 14:31:28 +0000 (UTC)
Received: from localhost (unknown [10.36.110.39])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78FC15DA6A;
 Tue, 28 Jul 2020 14:31:27 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/2] slirp: update to latest stable-4.2 branch
Date: Tue, 28 Jul 2020 18:31:08 +0400
Message-Id: <20200728143108.2192896-3-marcandre.lureau@redhat.com>
In-Reply-To: <20200728143108.2192896-1-marcandre.lureau@redhat.com>
References: <20200728143108.2192896-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/28 10:31:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Dr. David Alan Gilbert (1):
      ip_stripoptions use memmove

Jindrich Novy (4):
      Fix possible infinite loops and use-after-free
      Use secure string copy to avoid overflow
      Be sure to initialize sockaddr structure
      Check lseek() for failure

Marc-André Lureau (2):
      util: do not silently truncate
      Merge branch 'stable-4.2' into 'stable-4.2'

Philippe Mathieu-Daudé (3):
      Fix win32 builds by using the SLIRP_PACKED definition
      Fix constness warnings
      Remove unnecessary break

Ralf Haferkamp (2):
      Drop bogus IPv6 messages
      Fix MTU check

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 slirp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/slirp b/slirp
index 2faae0f778..ce94eba204 160000
--- a/slirp
+++ b/slirp
@@ -1 +1 @@
-Subproject commit 2faae0f778f818fadc873308f983289df697eb93
+Subproject commit ce94eba2042d52a0ba3d9e252ebce86715e94275
-- 
2.28.0.rc2.1.g3d20111cbd


