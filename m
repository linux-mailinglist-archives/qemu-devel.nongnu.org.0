Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 767CE2D7930
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 16:27:29 +0100 (CET)
Received: from localhost ([::1]:46202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knkKO-0006KR-GE
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 10:27:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knkHi-0004Pk-IE
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:24:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knkHg-0005yZ-LQ
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 10:24:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607700278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NaFhRfQq/5LFDHPgAWQ09PoAb6csJ4S8LYMgJKquWiw=;
 b=CXlEYfA/cUcbPVzGQQJzhjygNuNhTkiwRzdq+XVhjYfhfjjxNYc2sxMWpOTKvoPR0yPInV
 uGIv8dNvjgsICDGYWZ2Re+ELlraPOJ6MWLH9RXcjoYky81tmj4JQKdQfg+4QN6yF+SAwHx
 drhDwK5oaANPAT0VjWPqff8UL3kf/aE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-FqGr6uCUNTGFLd5jh9v4Mg-1; Fri, 11 Dec 2020 10:24:36 -0500
X-MC-Unique: FqGr6uCUNTGFLd5jh9v4Mg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 030C6800D62;
 Fri, 11 Dec 2020 15:24:35 +0000 (UTC)
Received: from thuth.com (ovpn-113-76.ams2.redhat.com [10.36.113.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4689E100239F;
 Fri, 11 Dec 2020 15:24:33 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH 02/12] target/unicore32/translate: Add missing fallthrough
 annotations
Date: Fri, 11 Dec 2020 16:24:16 +0100
Message-Id: <20201211152426.350966-3-thuth@redhat.com>
In-Reply-To: <20201211152426.350966-1-thuth@redhat.com>
References: <20201211152426.350966-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Chen Qun <kuhn.chenqun@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looking at the way the code is formatted here (there is an empty line
after break statements, but none where the break is missing), and the
instruction set overview at https://en.wikipedia.org/wiki/Unicore the
fallthrough is very likely intended here. So add a fallthrough comment
to make the it compilable with -Werror=implicit-fallthrough.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/unicore32/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/unicore32/translate.c b/target/unicore32/translate.c
index d4b06df672..962f9877a0 100644
--- a/target/unicore32/translate.c
+++ b/target/unicore32/translate.c
@@ -1801,6 +1801,7 @@ static void disas_uc32_insn(CPUUniCore32State *env, DisasContext *s)
             do_misc(env, s, insn);
             break;
         }
+        /* fallthrough */
     case 0x1:
         if (((UCOP_OPCODES >> 2) == 2) && !UCOP_SET_S) {
             do_misc(env, s, insn);
@@ -1817,6 +1818,7 @@ static void disas_uc32_insn(CPUUniCore32State *env, DisasContext *s)
         if (UCOP_SET(8) || UCOP_SET(5)) {
             ILLEGAL;
         }
+        /* fallthrough */
     case 0x3:
         do_ldst_ir(env, s, insn);
         break;
-- 
2.27.0


