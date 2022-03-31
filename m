Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDC94EDAFD
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 15:58:36 +0200 (CEST)
Received: from localhost ([::1]:54832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZvJr-0004Q4-S0
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 09:58:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nZvIJ-0003C4-Jo
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 09:56:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nZvIH-0008LG-Uo
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 09:56:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648735016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Jl7MsM9SJ2GWofJh0DbeU90Qu1NiFayE9AHcdgHOtbI=;
 b=Vmx4Kx39NZmv/XwP7httSbSv1aALUIFTxp9X2dcJyK+jZ19se8SMMuIq/fhJ+lKFI8QPDW
 kW1Ti2g32TA/eRASKBd48o9KdW4fEbOgdCyE9Jy0fYhx2WNJJ1m71tkD0+Oc22RNRxxrBt
 AX8Bm6yTkde8M3k8Et9guqWpbRGuzu0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-Zkexx1NoOVKZL9kbbuJ_IA-1; Thu, 31 Mar 2022 09:56:55 -0400
X-MC-Unique: Zkexx1NoOVKZL9kbbuJ_IA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B76AA3802AC4
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 13:56:51 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75100401DBC;
 Thu, 31 Mar 2022 13:56:50 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] doc/style: CLang -> Clang
Date: Thu, 31 Mar 2022 17:56:46 +0400
Message-Id: <20220331135647.1686375-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

It's not the way it is usually written (see https://clang.llvm.org/).

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 docs/devel/style.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/devel/style.rst b/docs/devel/style.rst
index 9e66d133e15b..7ddd42b6c2c8 100644
--- a/docs/devel/style.rst
+++ b/docs/devel/style.rst
@@ -522,7 +522,7 @@ documented in the GNU Compiler Collection manual starting at version 4.0.
 Automatic memory deallocation
 =============================
 
-QEMU has a mandatory dependency either the GCC or CLang compiler. As
+QEMU has a mandatory dependency on either the GCC or the Clang compiler. As
 such it has the freedom to make use of a C language extension for
 automatically running a cleanup function when a stack variable goes
 out of scope. This can be used to simplify function cleanup paths,
-- 
2.35.1.693.g805e0a68082a


