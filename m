Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3892DC577
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 18:40:19 +0100 (CET)
Received: from localhost ([::1]:49838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpamg-0000y8-9J
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 12:40:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpadF-0000CU-2v
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:30:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpad7-00018A-TM
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 12:30:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608139824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u0HRKXuzgfqTIQczh54KMzigvc9aTCz2Kkmi+FSZ8Go=;
 b=XBdlwmNX/T6pnZVVVNDJ0FyhIz1xW4JsOgFxRSAAWt2g4FIoKHEQ8SvSuWDmQJ4P7uRnqF
 KWB4zaSEFy8QseR3xzO/bl/i4sfDvusChUwnDdXgGLCdgkR8giT0DvvxJk+GYyNRUcZnrf
 IETm08GtqdZyjA6DywdEKV+m6Q/dkf8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-ZouQofccMdG-qYCvnBtK4A-1; Wed, 16 Dec 2020 12:30:22 -0500
X-MC-Unique: ZouQofccMdG-qYCvnBtK4A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1A5A107ACE3;
 Wed, 16 Dec 2020 17:30:20 +0000 (UTC)
Received: from thuth.com (ovpn-113-7.ams2.redhat.com [10.36.113.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 727DD10016F4;
 Wed, 16 Dec 2020 17:30:19 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 12/12] configure: Compile with -Wimplicit-fallthrough=2
Date: Wed, 16 Dec 2020 18:29:49 +0100
Message-Id: <20201216172949.57380-13-thuth@redhat.com>
In-Reply-To: <20201216172949.57380-1-thuth@redhat.com>
References: <20201216172949.57380-1-thuth@redhat.com>
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


