Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E7B1F6CB9
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 19:25:53 +0200 (CEST)
Received: from localhost ([::1]:60938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjQxc-00036c-3a
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 13:25:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jjQwk-0002T4-85
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 13:24:58 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:38454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jjQwh-0003E7-Ur
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 13:24:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591896294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=aUc7gcvGfkoAqH1LjVCdLvpFWssN8A0xkTNAdE9ioaQ=;
 b=MRsoLRyn8g05X3zWwg2+ax2KT2hUcorXr/CC7HW3HOqoeSyMt2Q3iduCLkx9rB+wYGTfeW
 WJ5+Bm4zC25iAGD1Lj16zQKJ58FAwyfOvFNRyPgAI7gTJByUNuWcZ+RniyOkQZtAw4igNj
 LYb0g13X2vz/53m0vG1gqKmbizC55Zw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-ZJbk7-qoNUW7iglS9Py5WA-1; Thu, 11 Jun 2020 13:24:49 -0400
X-MC-Unique: ZJbk7-qoNUW7iglS9Py5WA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D947107ACF2;
 Thu, 11 Jun 2020 17:24:48 +0000 (UTC)
Received: from thuth.com (ovpn-112-19.ams2.redhat.com [10.36.112.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 603145C1B2;
 Thu, 11 Jun 2020 17:24:47 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] target/i386: Remove obsolete TODO file
Date: Thu, 11 Jun 2020 19:24:45 +0200
Message-Id: <20200611172445.5177-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 03:29:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The last real change to this file is from 2012, so it is very likely
that this file is completely out-of-date and ignored today. Let's
simply remove it to avoid confusion if someone finds it by accident.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/i386/TODO | 31 -------------------------------
 1 file changed, 31 deletions(-)
 delete mode 100644 target/i386/TODO

diff --git a/target/i386/TODO b/target/i386/TODO
deleted file mode 100644
index a8d69cf87f..0000000000
--- a/target/i386/TODO
+++ /dev/null
@@ -1,31 +0,0 @@
-Correctness issues:
-
-- some eflags manipulation incorrectly reset the bit 0x2.
-- SVM: test, cpu save/restore, SMM save/restore. 
-- x86_64: lcall/ljmp intel/amd differences ?
-- better code fetch (different exception handling + CS.limit support)
-- user/kernel PUSHL/POPL in helper.c
-- add missing cpuid tests
-- return UD exception if LOCK prefix incorrectly used
-- test ldt limit < 7 ?
-- fix some 16 bit sp push/pop overflow (pusha/popa, lcall lret)
-- full support of segment limit/rights 
-- full x87 exception support
-- improve x87 bit exactness (use bochs code ?)
-- DRx register support
-- CR0.AC emulation
-- SSE alignment checks
-
-Optimizations/Features:
-
-- add SVM nested paging support
-- add VMX support
-- add AVX support
-- add SSE5 support
-- fxsave/fxrstor AMD extensions
-- improve monitor/mwait support
-- faster EFLAGS update: consider SZAP, C, O can be updated separately
-  with a bit field in CC_OP and more state variables.
-- evaluate x87 stack pointer statically
-- find a way to avoid translating several time the same TB if CR0.TS
-  is set or not.
-- 
2.18.1


