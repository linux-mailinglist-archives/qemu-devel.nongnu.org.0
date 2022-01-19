Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C804937FA
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 11:11:30 +0100 (CET)
Received: from localhost ([::1]:38680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA7w9-0003R8-7O
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 05:11:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1nA7kM-0002fw-Sm
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 04:59:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1nA7kF-0007OA-Sp
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 04:59:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642586341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8I57EkV/s3QS+3ZufSnPu4hZIBmUbZx+WdcGMKajzXA=;
 b=K9AFqYGN+t/VF6pF26errPR35//eCz7XmexfZYKgtsNxZRE5LIeAIjhsjHvpMxbMwWziXk
 DMDYROyCs3MWfAftcCoRMCsvItIF7Qt1qAHL8YS4UMamZBJvc6NkRmT+s59ulrkTs8vS7b
 GBCnte8DYJ7Sf7szvWqNZitjtfRbsiM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-4XHolJlKPJON0bnZ-iNOLw-1; Wed, 19 Jan 2022 04:57:02 -0500
X-MC-Unique: 4XHolJlKPJON0bnZ-iNOLw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6F05B7D21;
 Wed, 19 Jan 2022 09:56:43 +0000 (UTC)
Received: from wi2021.rezanina.moe.rezanina.moe (unknown [10.40.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBD6716E51;
 Wed, 19 Jan 2022 09:56:42 +0000 (UTC)
From: mrezanin@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: Use -mlittle-endian instead of -mlittle for ppc64
Date: Wed, 19 Jan 2022 04:56:41 -0500
Message-Id: <20220119095641.6729-1-mrezanin@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Miroslav Rezanina <mrezanin@redhat.com>

GCC options -mlittle and -mlittle-endian are equivalent on ppc64
architecture. However, clang supports only -mlittle-endian option.

Use longer form in configure to properly support both GCC and clang
compiler.

Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index e1a31fb332..e63c78ca67 100755
--- a/configure
+++ b/configure
@@ -658,7 +658,7 @@ case "$cpu" in
     CPU_CFLAGS="-m64 -mbig" ;;
   ppc64le)
     cpu="ppc64"
-    CPU_CFLAGS="-m64 -mlittle" ;;
+    CPU_CFLAGS="-m64 -mlittle-endian" ;;
 
   s390)
     CPU_CFLAGS="-m31" ;;
-- 
2.27.0


