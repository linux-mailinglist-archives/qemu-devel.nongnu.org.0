Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A773025B06A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 17:58:25 +0200 (CEST)
Received: from localhost ([::1]:48532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDV9U-0003gB-P7
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 11:58:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kDV1K-0000zk-2A
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 11:49:58 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:56248
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kDV1I-0005Sv-Ai
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 11:49:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599061795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=h1IOSs9Z41XxnKD+WiL1f+EKtAV6BVw7Y3HgBImO9zA=;
 b=BW2CSmmb4iO8u+eNuE78KtyT8AaG7RLranHaPNsJoQAZ9Ni99FQH8gEhmZJ94rvwNvuXCr
 gPDTv2kHkbRUbe1p1cM9oS0rJdgqRxXsx0GQlPsWATuqUSRdCP79hjK7v0m+Teg4x9EMA0
 yfEgw9GWHcTCfz+TxI+RQVsZMYMXvSc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-RnvVR2tVNX6vGJiR1Wls2w-1; Wed, 02 Sep 2020 11:49:50 -0400
X-MC-Unique: RnvVR2tVNX6vGJiR1Wls2w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D053425D2;
 Wed,  2 Sep 2020 15:49:49 +0000 (UTC)
Received: from thuth.com (ovpn-112-129.ams2.redhat.com [10.36.112.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95AD95D9CC;
 Wed,  2 Sep 2020 15:49:48 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 07/15] configure: Add system = 'linux' for meson when
 cross-compiling
Date: Wed,  2 Sep 2020 17:49:24 +0200
Message-Id: <20200902154932.390595-8-thuth@redhat.com>
In-Reply-To: <20200902154932.390595-1-thuth@redhat.com>
References: <20200902154932.390595-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/02 02:33:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Meson needs the "system = xyz" line when cross-compiling. We are already
adding a "system = 'windows'" for the MinGW cross-compilation case here,
so let's add a "system = 'linux'" now for Linux hosts, too.

Message-Id: <20200823111757.72002-2-thuth@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 configure | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configure b/configure
index 5645575688..cc9af72358 100755
--- a/configure
+++ b/configure
@@ -8163,6 +8163,9 @@ if test -n "$cross_prefix"; then
             ?:*) pre_prefix=/ ;;
         esac
     fi
+    if test "$linux" = "yes" ; then
+        echo "system = 'linux'" >> $cross
+    fi
     case "$ARCH" in
         i386|x86_64)
             echo "cpu_family = 'x86'" >> $cross
-- 
2.18.2


