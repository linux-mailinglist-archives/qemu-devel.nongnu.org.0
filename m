Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E903A2DDF89
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 09:31:06 +0100 (CET)
Received: from localhost ([::1]:51434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqBAI-000489-10
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 03:31:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kqB6d-00016K-G0
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 03:27:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kqB6b-0008LS-SD
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 03:27:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608280036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u0HRKXuzgfqTIQczh54KMzigvc9aTCz2Kkmi+FSZ8Go=;
 b=REDB5532TpgrSvv8aRB3LqWejg7fbrbSwpPY3Z8vmrlPkOXpW2EiDwCvWyi5+wWPCnKpRN
 gWrP9kWTnuSVUlvh0x4E0gh3zaepWw7Z20HBdGlwuvt2elfnznbP+p60HrNMgeGC0EDFZd
 kzAgnjy5ThsT6kX/aQjhxwxUAHwhoPE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-jfnCXF5DNwKm8AWNIrwTgg-1; Fri, 18 Dec 2020 03:27:14 -0500
X-MC-Unique: jfnCXF5DNwKm8AWNIrwTgg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 654FF19251A0;
 Fri, 18 Dec 2020 08:27:13 +0000 (UTC)
Received: from thuth.com (ovpn-112-59.ams2.redhat.com [10.36.112.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2821610013C0;
 Fri, 18 Dec 2020 08:27:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 14/14] configure: Compile with -Wimplicit-fallthrough=2
Date: Fri, 18 Dec 2020 09:27:04 +0100
Message-Id: <20201218082704.2014294-4-thuth@redhat.com>
In-Reply-To: <20201218082704.2014294-1-thuth@redhat.com>
References: <20201218082704.2014294-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Chen Qun <kuhn.chenqun@huawei.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity always complains about switch-case statements that fall through
the next one when there is no comment in between - which could indicate
a forgotten "break" statement. Instead of handling these issues after
they have been committed, it would be better to avoid them in the build
process already. Thus let's enable the -Wimplicit-fallthrough warning now.
The "=2" level seems to be a good compromise between being too strict and
too generic about the possible comments, so we'll start with "=2" for now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20201211152426.350966-13-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index c228f7c21e..881af4b6be 100755
--- a/configure
+++ b/configure
@@ -2023,6 +2023,7 @@ add_to warn_flags -Wempty-body
 add_to warn_flags -Wnested-externs
 add_to warn_flags -Wendif-labels
 add_to warn_flags -Wexpansion-to-defined
+add_to warn_flags -Wimplicit-fallthrough=2
 
 nowarn_flags=
 add_to nowarn_flags -Wno-initializer-overrides
-- 
2.27.0


