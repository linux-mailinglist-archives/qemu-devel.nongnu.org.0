Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 233A0276DF6
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 11:54:47 +0200 (CEST)
Received: from localhost ([::1]:50444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLNxe-0002TV-3r
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 05:54:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kLNTz-0001aC-Ap
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 05:24:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kLNTw-000682-T6
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 05:24:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600939444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ilyjHoIWSmr+buo0m6gK2fqFJ7bn7M0gcIXCHz8WO7A=;
 b=Usg2TkNEozE4xkwz6TO0TSaJUMT5ji+Mcw43dNnXo6Ginvr4QQjd5pe68tFwD/NeY/6/Le
 EdyPCLrdaGLgxvOhDJeuoCee/8tX4H6adXlH4QjpTWy4JANVbg175AxgoaAG+kuilDfihN
 +BZEtyb4t0uUYC3KiVmCrBfsXo1xvEE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-_pMMb7ehPXOa9N6ZR0KBXQ-1; Thu, 24 Sep 2020 05:24:01 -0400
X-MC-Unique: _pMMb7ehPXOa9N6ZR0KBXQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 875EF81F00F
 for <qemu-devel@nongnu.org>; Thu, 24 Sep 2020 09:24:00 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 361CD5C1DC;
 Thu, 24 Sep 2020 09:24:00 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 54/92] checkpatch: avoid error on cover letter files
Date: Thu, 24 Sep 2020 05:22:36 -0400
Message-Id: <20200924092314.1722645-55-pbonzini@redhat.com>
In-Reply-To: <20200924092314.1722645-1-pbonzini@redhat.com>
References: <20200924092314.1722645-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/24 01:10:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefano Garzarella <sgarzare@redhat.com>

Running checkpatch on a directory that contains a cover letter reports
this error:

    Checking /tmp/tmpbnngauy3/0000-cover-letter.patch...
    ERROR: Does not appear to be a unified-diff format patch

    total: 1 errors, 0 warnings, 0 lines checked

Let's skip cover letter as it is already done in the Linux kernel
commits 06330fc40e3f ("checkpatch: avoid NOT_UNIFIED_DIFF errors
on cover-letter.patch files") and a08ffbef4ab7 ("checkpatch: fix
ignoring cover-letter logic").

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20200917170212.92672-1-sgarzare@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 50910899f2..22bb634c8e 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3005,7 +3005,7 @@ sub process {
 		return 1;
 	}
 
-	if (!$is_patch) {
+	if (!$is_patch && $filename !~ /cover-letter\.patch$/) {
 		ERROR("Does not appear to be a unified-diff format patch\n");
 	}
 
-- 
2.26.2



