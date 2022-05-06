Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8BB51DB06
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 16:46:51 +0200 (CEST)
Received: from localhost ([::1]:38224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmzEI-0003A0-7W
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 10:46:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmz6F-0001Rv-JF
 for qemu-devel@nongnu.org; Fri, 06 May 2022 10:38:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nmz6D-0005bU-QH
 for qemu-devel@nongnu.org; Fri, 06 May 2022 10:38:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651847908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pc/cNGgAsSretjlRf0+yA+53RH0wXEeLPI/4sen1etg=;
 b=dBhhdQbY/dwH4vhiTln6MUAXiXlCbCX8qSwjMCD5IOtv5r+DbuyWKq/wqPhh5rIrZ5cmOr
 NulMtXIfYXQHpf+ppeshsHO7YSkokawUWk2tc4fhdZW23FStc6DzbYQ5JR/GbYju67Ox2F
 L4Dkcx5+S4KPxAHNLhgJHNRJ/UFehAk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-_QwS7USsMCCqgDpn0_ME7g-1; Fri, 06 May 2022 10:38:25 -0400
X-MC-Unique: _QwS7USsMCCqgDpn0_ME7g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F0BA33C0D192;
 Fri,  6 May 2022 14:38:24 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AAD402166B2D;
 Fri,  6 May 2022 14:38:23 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>,
	Warner Losh <imp@bsdimp.com>
Subject: [PULL 8/9] tests/vm: update openbsd to release 7.1
Date: Fri,  6 May 2022 16:37:49 +0200
Message-Id: <20220506143750.559526-9-thuth@redhat.com>
In-Reply-To: <20220506143750.559526-1-thuth@redhat.com>
References: <20220506143750.559526-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Brad Smith <brad@comstyle.com>

tests/vm/openbsd: Update to release 7.1

Signed-off-by: Brad Smith <brad@comstyle.com>
Tested-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Message-Id: <YnRed7sw45lTbRjb@humpty.home.comstyle.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/vm/openbsd | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index 337fe7c303..dc34b2718b 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -22,8 +22,8 @@ class OpenBSDVM(basevm.BaseVM):
     name = "openbsd"
     arch = "x86_64"
 
-    link = "https://cdn.openbsd.org/pub/OpenBSD/7.0/amd64/install70.iso"
-    csum = "1882f9a23c9800e5dba3dbd2cf0126f552605c915433ef4c5bb672610a4ca3a4"
+    link = "https://cdn.openbsd.org/pub/OpenBSD/7.1/amd64/install71.iso"
+    csum = "d3a7c5b9bf890bc404304a1c96f9ee72e1d9bbcf9cc849c1133bdb0d67843396"
     size = "20G"
     pkgs = [
         # tools
-- 
2.27.0


