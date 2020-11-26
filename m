Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0E82C5706
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 15:24:27 +0100 (CET)
Received: from localhost ([::1]:36222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiICA-00064U-4U
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 09:24:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiIAF-0004T6-4I
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 09:22:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiIAC-0005mh-KW
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 09:22:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606400543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2v4a8dtkHjMlGEaKD3psu8JUdLX0AIWK/wxoBPTbn2Y=;
 b=Cnw7d+LbLxIsKwVyQ5EH0mtbjnsdmnPPjHSshnS5qaOs95TdQ9WJltdRVQ/9mKFY9P0WNW
 FPGrH0FqxpriK6321CiQLj5ft30s8eAtbL+VvJ9y5Rx5cjH5lv6jrHRYqCGdNJT63BTK1K
 lz0+6wXTLvf5lwsU7Tb54cQcSk2lbL0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-xnRmLIXfOXytmsUGVPM1Xg-1; Thu, 26 Nov 2020 09:22:21 -0500
X-MC-Unique: xnRmLIXfOXytmsUGVPM1Xg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F702100A65B;
 Thu, 26 Nov 2020 14:22:20 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F378C10013C0;
 Thu, 26 Nov 2020 14:22:19 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/4] configure: remove python pkg_resources check
Date: Thu, 26 Nov 2020 09:22:16 -0500
Message-Id: <20201126142218.3121595-3-pbonzini@redhat.com>
In-Reply-To: <20201126142218.3121595-1-pbonzini@redhat.com>
References: <20201126142218.3121595-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Olaf Hering <olaf@aepfle.de>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Olaf Hering <olaf@aepfle.de>

Since meson.git#0240d760c7699a059cc89e584363c6431cdd2b61 setuptools is not required anymore.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20201124211925.4194-1-olaf@aepfle.de>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/configure b/configure
index 796cec14de..18c26e0389 100755
--- a/configure
+++ b/configure
@@ -1912,9 +1912,6 @@ fi
 
 case "$meson" in
     git | internal)
-        if ! $python -c 'import pkg_resources' > /dev/null 2>&1; then
-            error_exit "Python setuptools not found"
-        fi
         meson="$python ${source_path}/meson/meson.py"
         ;;
     *) meson=$(command -v "$meson") ;;
-- 
2.26.2



