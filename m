Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1756E8FD8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:17:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRHd-0000uo-I0; Thu, 20 Apr 2023 06:12:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppRHY-0000nL-Te
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:12:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppRHP-00081A-E3
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:12:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681985555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ui2yggeTQOFn9JUy8zvm5tpeV0J42dfVxBTeJbtNM+s=;
 b=MNo0Wgn9H0+9QjgzkqzlHQmshDpPxo5TzYNTZkbwKeSnKlQnKuK5vMHUnUL5NtHnRTvOAG
 mR1jO66SgvM1oLEqjAvgbqbYf6DXGpQoYbWMO2xlxf/5uPdRxsVLfWV4NayY0RHrDkLYs4
 vsH8p1JjK/tgPZw4akwtFE7z+ByxymM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-FwpeJ1YfOcS7H3PWxGFq9A-1; Thu, 20 Apr 2023 06:12:30 -0400
X-MC-Unique: FwpeJ1YfOcS7H3PWxGFq9A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF344185A78B;
 Thu, 20 Apr 2023 10:12:29 +0000 (UTC)
Received: from thuth.com (unknown [10.39.194.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0A52B5AB7A;
 Thu, 20 Apr 2023 10:12:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: [PULL 07/23] travis.yml: Add missing clang-10 package to the 'Clang
 (disable-tcg)' job
Date: Thu, 20 Apr 2023 12:12:00 +0200
Message-Id: <20230420101216.786304-8-thuth@redhat.com>
In-Reply-To: <20230420101216.786304-1-thuth@redhat.com>
References: <20230420101216.786304-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Vaibhav Jain <vaibhav@linux.ibm.com>

Since commit 74a1b256d775("configure: Bump minimum Clang version to 10.0") qemu
needs Clang version 10.0 as the minimum version to build qemu with
Clang. However 'focal' ships by default with Clang version 7.0.0 which causes an
error while executing the 'Clang (disable-tcg)' travis job of the form below:

<snip>
$clang --version

clang version 7.0.0 (tags/RELEASE_700/final)

<snip>
 ERROR: You need at least GCC v7.4 or Clang v10.0 (or XCode Clang v12.0)

 # QEMU configure log Fri 14 Apr 2023 03:48:22 PM UTC

 # Configured with: '../configure' '--disable-docs' '--disable-tools'
 '--disable-containers' '--disable-tcg' '--enable-kvm' '--disable-tools'
 '--enable-fdt=system' '--host-cc=clang' '--cxx=clang++'

Fix this by adding 'clang-10' to the 'apt_packages' section of the "[s390x]
Clang (disable-tcg)" job and updating the compiler to 'clang-10'.

Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
Message-Id: <20230414210645.820204-1-vaibhav@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .travis.yml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.travis.yml b/.travis.yml
index cf088ba4cf..11894eb810 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -243,7 +243,7 @@ jobs:
     - name: "[s390x] Clang (disable-tcg)"
       arch: s390x
       dist: focal
-      compiler: clang
+      compiler: clang-10
       addons:
         apt_packages:
           - libaio-dev
@@ -269,6 +269,7 @@ jobs:
           - libvdeplug-dev
           - libvte-2.91-dev
           - ninja-build
+          - clang-10
       env:
         - TEST_CMD="make check-unit"
         - CONFIG="--disable-containers --disable-tcg --enable-kvm --disable-tools
-- 
2.31.1


