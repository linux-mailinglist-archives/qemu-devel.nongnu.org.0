Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F6E252208
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Aug 2020 22:30:54 +0200 (CEST)
Received: from localhost ([::1]:57922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAfan-0008ML-AN
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 16:30:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kAfY8-0005X3-5s
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 16:28:08 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:35310 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kAfY5-0006O0-5y
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 16:28:07 -0400
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id A5AC457501;
 Tue, 25 Aug 2020 20:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1598387281; x=1600201682; bh=TbQEarL239nqt/ACiFvj/GPvI1T0st/AiN4
 tRxK7WqI=; b=Iygl/1WW8S88ikiqZ7idB404LBl3SPqxPfW9v1JYmr5bDCamwtE
 F4in4yZhm5DR0V0dmY4U7+nnC++UjsoAuUSaF1s2GWuy6T5gOE8k9Qh+OdYuSUFR
 7bfbkJ0rjpCLvXA+5nC9bBNeSyohsQvUsFdSd7jq70I7gFxJ365Kn/NU=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6kWsY9YtsYN8; Tue, 25 Aug 2020 23:28:01 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 31DDF574EA;
 Tue, 25 Aug 2020 23:28:01 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 25
 Aug 2020 23:28:01 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 3/4] configure: Prefer gmake on darwin
Date: Tue, 25 Aug 2020 23:27:54 +0300
Message-ID: <20200825202755.50626-4-r.bolshakov@yadro.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200825202755.50626-1-r.bolshakov@yadro.com>
References: <20200825202755.50626-1-r.bolshakov@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 16:28:01
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

New meson/make build requires GNU make 3.82+ but macOS ships 3.81 even
on Big Sur while homebrew provides GNU make 4.3 as 'gmake' in $PATH.

With the change, 'make' switches over to gmake implicitly.

Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
---
 configure | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/configure b/configure
index 07732bf011..664084992b 100755
--- a/configure
+++ b/configure
@@ -907,6 +907,7 @@ Darwin)
   darwin="yes"
   hax="yes"
   hvf="yes"
+  make="${MAKE-gmake}"
   LDFLAGS_SHARED="-bundle -undefined dynamic_lookup"
   if [ "$cpu" = "x86_64" ] ; then
     QEMU_CFLAGS="-arch x86_64 $QEMU_CFLAGS"
@@ -920,6 +921,31 @@ Darwin)
   # won't work when we're compiling with gcc as a C compiler.
   QEMU_CFLAGS="-DOS_OBJECT_USE_OBJC=0 $QEMU_CFLAGS"
   HOST_VARIANT_DIR="darwin"
+  cat > GNUmakefile <<'EOF'
+# This file is auto-generated by configure to implicitly switch from a 'make'
+# invocation to 'gmake'
+
+OLD_MAKE := $(MAKE)
+
+ifeq ($(wildcard config-host.mak),)
+$(error Incomplete configuration. Please run `configure`)
+endif
+include config-host.mak
+
+ifeq ($(MAKECMDGOALS),)
+recurse: all
+endif
+
+.NOTPARALLEL: %
+%: force
+	@echo 'Switch from $(OLD_MAKE) to $(MAKE)'
+	@$(MAKE) -f Makefile $(MAKECMDGOALS)
+force: ;
+.PHONY: force
+GNUmakefile: ;
+config-host.mak: ;
+
+EOF
 ;;
 SunOS)
   solaris="yes"
-- 
2.28.0


