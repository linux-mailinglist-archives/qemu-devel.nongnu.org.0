Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5783E276D76
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 11:29:30 +0200 (CEST)
Received: from localhost ([::1]:51976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLNZB-0000X6-Bi
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 05:29:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kLNTL-0000Cz-27
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 05:23:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kLNTJ-0005yw-Fc
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 05:23:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600939404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DKDAsXNdA9IzokB/HzgiqAvs9wBy7MFtQ9GvqnGwBkU=;
 b=eiUoiHgiQBEYS9SSmt47l306lNU1z1AYis8kJerR3X1gRlyF4yxzIDzLTjvI5RA9tVDsQW
 45MWMhB6DWZuN+KEucRqrJ8TC76WYxnYZF2rcbJo2/pvCnVh2UsfwltDK0xBGBsHxcpGr/
 zVn1xpXDBXs/lkfDZmglI00y50tecR8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-bZet-C_pMjC2VsuSD7c2pQ-1; Thu, 24 Sep 2020 05:23:22 -0400
X-MC-Unique: bZet-C_pMjC2VsuSD7c2pQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54EF764153;
 Thu, 24 Sep 2020 09:23:21 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B496C73668;
 Thu, 24 Sep 2020 09:23:20 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/92] configure: Do not intent to build WHPX on 32-bit host
Date: Thu, 24 Sep 2020 05:21:49 -0400
Message-Id: <20200924092314.1722645-8-pbonzini@redhat.com>
In-Reply-To: <20200924092314.1722645-1-pbonzini@redhat.com>
References: <20200924092314.1722645-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Hyper-V is available on 64-bit versions of Windows,
do not try to build its support on 32-bit versions.

Signed-off-by: Philippe Mathieu-DaudÃ© <f4bug@amsat.org>
Message-Id: <20200910054516.405777-1-f4bug@amsat.org>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index e8e8e984f2..db9ec3231f 100755
--- a/configure
+++ b/configure
@@ -2985,7 +2985,10 @@ fi
 
 ##########################################
 # Windows Hypervisor Platform accelerator (WHPX) check
-if test "$whpx" != "no" ; then
+if test "$whpx" = "yes" && test "$ARCH" != "x86_64"; then
+  error_exit "WHPX requires 64-bit host"
+fi
+if test "$whpx" != "no" && test "$ARCH" = "x86_64"; then
     if check_include "WinHvPlatform.h" && check_include "WinHvEmulation.h"; then
         whpx="yes"
     else
-- 
2.26.2



