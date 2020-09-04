Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F1525D834
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 13:59:40 +0200 (CEST)
Received: from localhost ([::1]:60278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kEANX-0001k7-2z
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 07:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kEA6v-00014L-3B
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 07:42:29 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:57488
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kEA6r-0005IY-UR
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 07:42:28 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-Y_CF8AlgMFuClPbqI9mU4g-1; Fri, 04 Sep 2020 07:42:23 -0400
X-MC-Unique: Y_CF8AlgMFuClPbqI9mU4g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A23710A59C8
 for <qemu-devel@nongnu.org>; Fri,  4 Sep 2020 11:41:46 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57BBD10843E9
 for <qemu-devel@nongnu.org>; Fri,  4 Sep 2020 11:41:46 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 40/46] docs: suggest Meson replacements for various configure
 functions
Date: Fri,  4 Sep 2020 07:41:16 -0400
Message-Id: <20200904114122.31307-41-pbonzini@redhat.com>
In-Reply-To: <20200904114122.31307-1-pbonzini@redhat.com>
References: <20200904114122.31307-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 01:57:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/devel/build-system.rst | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
index 28492cfcae..591e93f4b4 100644
--- a/docs/devel/build-system.rst
+++ b/docs/devel/build-system.rst
@@ -125,23 +125,27 @@ developers in checking for system features:
 `compile_object $CFLAGS`
    Attempt to compile a test program with the system C compiler using
    $CFLAGS. The test program must have been previously written to a file
-   called $TMPC.
+   called $TMPC.  The replacement in Meson is the compiler object `cc`,
+   which has methods such as `cc.compiles()`,
+   `cc.check_header()`, `cc.has_function()`.
 
 `compile_prog $CFLAGS $LDFLAGS`
    Attempt to compile a test program with the system C compiler using
    $CFLAGS and link it with the system linker using $LDFLAGS. The test
    program must have been previously written to a file called $TMPC.
+   The replacement in Meson is `cc.find_library()` and `cc.links()`.
 
 `has $COMMAND`
    Determine if $COMMAND exists in the current environment, either as a
-   shell builtin, or executable binary, returning 0 on success.
+   shell builtin, or executable binary, returning 0 on success.  The
+   replacement in Meson is `find_program()`.
 
 `check_define $NAME`
    Determine if the macro $NAME is defined by the system C compiler
 
 `check_include $NAME`
    Determine if the include $NAME file is available to the system C
-   compiler
+   compiler.  The replacement in Meson is `cc.has_header()`.
 
 `write_c_skeleton`
    Write a minimal C program main() function to the temporary file
-- 
2.26.2



