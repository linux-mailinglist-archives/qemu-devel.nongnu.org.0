Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 376751D0438
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 03:18:31 +0200 (CEST)
Received: from localhost ([::1]:40208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYg2X-0002yk-OZ
	for lists+qemu-devel@lfdr.de; Tue, 12 May 2020 21:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jYg13-0000nk-KU
 for qemu-devel@nongnu.org; Tue, 12 May 2020 21:16:57 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:41989
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jYg12-0004Bn-5Y
 for qemu-devel@nongnu.org; Tue, 12 May 2020 21:16:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589332615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3rv6/Ww2pSYf1tT1GUATjc6owc1G5Z2EM/1i2BOuOog=;
 b=Ack7GHg9vFiVPHeclM/NrcIybmq5WoGaJR1HOhqIenMaamgtHXmejfvOm62+pcwk7GciC2
 XQ2mfOycICDFVp1HzxuOvFyngVv3cvyiHnUyAr0Bn85TD4zV1Y7dlbhudnOzU0JS3LedeX
 ptJIXniFsDJTvOOyxIaH5wZD4KIHFbg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-408-yT9Wcb91MdWDHYrSVjP55w-1; Tue, 12 May 2020 21:16:53 -0400
X-MC-Unique: yT9Wcb91MdWDHYrSVjP55w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B0AF473;
 Wed, 13 May 2020 01:16:52 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-145.phx2.redhat.com [10.3.116.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF5AB1A923;
 Wed, 13 May 2020 01:16:51 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/9] qemu-img: Fix stale comments on doc location
Date: Tue, 12 May 2020 20:16:41 -0500
Message-Id: <20200513011648.166876-3-eblake@redhat.com>
In-Reply-To: <20200513011648.166876-1-eblake@redhat.com>
References: <20200513011648.166876-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 21:16:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, nsoffer@redhat.com, qemu-block@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Missed in commit e13c59fa.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 qemu-img.c       | 2 +-
 qemu-img-cmds.hx | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index 6a4327aaba56..b6e8af9202a5 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -108,7 +108,7 @@ static void QEMU_NORETURN unrecognized_option(const char *option)
     error_exit("unrecognized option '%s'", option);
 }

-/* Please keep in synch with qemu-img.texi */
+/* Please keep in synch with docs/tools/qemu-img.rst */
 static void QEMU_NORETURN help(void)
 {
     const char *help_msg =
diff --git a/qemu-img-cmds.hx b/qemu-img-cmds.hx
index c9c54de1df40..e0886437b1f2 100644
--- a/qemu-img-cmds.hx
+++ b/qemu-img-cmds.hx
@@ -7,7 +7,7 @@ HXCOMM command structures and help message.
 HXCOMM HXCOMM can be used for comments, discarded from both rST and C

 HXCOMM When amending the rST sections, please remember to copy the usage
-HXCOMM over to the per-command sections in qemu-img.texi.
+HXCOMM over to the per-command sections in docs/tools/qemu-img.rst.

 DEF("amend", img_amend,
     "amend [--object objectdef] [--image-opts] [-p] [-q] [-f fmt] [-t cache] -o options filename")
-- 
2.26.2


