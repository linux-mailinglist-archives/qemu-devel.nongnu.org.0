Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 533ED205912
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 19:38:24 +0200 (CEST)
Received: from localhost ([::1]:49532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnmsJ-0008T6-Di
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 13:38:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jnmrW-0007xP-Nm
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 13:37:34 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:47640
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jnmrT-0000nx-6d
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 13:37:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592933849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=j3ivgt/qCiONLnCgZ7sdhhr3P8QC6CBdvgSMRzrXMX8=;
 b=RdjTY7BQQernTJ6mnSvHoPgxNb4Al/EFgwNfkuGiT+4Sa9ENmaZ/+MgJzSi9lmIgQYIXnq
 2m2J7pEdj/4ypUSPReRkEo959sY1u4Pd3skByo41EMaTQOWLD4mL1/VXaMAMkQSIMBwlnX
 L7T0I+QeK9ehWHS/rcWVcE/+g3LclqM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-1qxwIldbNQS_x90NDCyroA-1; Tue, 23 Jun 2020 13:37:28 -0400
X-MC-Unique: 1qxwIldbNQS_x90NDCyroA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 802E4108BD0B
 for <qemu-devel@nongnu.org>; Tue, 23 Jun 2020 17:37:27 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D6D35D9D3
 for <qemu-devel@nongnu.org>; Tue, 23 Jun 2020 17:37:27 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: disable -Wxor-used-as-pow
Date: Tue, 23 Jun 2020 13:37:26 -0400
Message-Id: <20200623173726.20909-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 01:55:08
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Clang being clang and adding more pointless warnings.  In a hardware
emulator there are going to be plenty of bitwise operations, and the
chance of someone writing ^ for pow and not being caught is basically
zero.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index 8d9435a0e0..d42f060ee7 100755
--- a/configure
+++ b/configure
@@ -2062,6 +2062,7 @@ add_to nowarn_flags -Wno-string-plus-int
 add_to nowarn_flags -Wno-typedef-redefinition
 add_to nowarn_flags -Wno-tautological-type-limit-compare
 add_to nowarn_flags -Wno-psabi
+add_to nowarn_flags -Wno-xor-used-as-pow
 
 gcc_flags="$warn_flags $nowarn_flags"
 
-- 
2.26.2


