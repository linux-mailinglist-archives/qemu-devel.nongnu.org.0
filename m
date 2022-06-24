Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9990E5595EA
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 10:59:55 +0200 (CEST)
Received: from localhost ([::1]:40500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4fAQ-0006M2-H1
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 04:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4efl-0006ie-KV
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:28:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4efT-0005US-JK
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:28:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656059275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SHEbEFsqUdW8BUVYpCGpPX/zr8CGI3b+oCCQuAT71sg=;
 b=Kw1OaFCgZBB+C1uRSFsoGMluYFh8g5iqe1RlK4FmGkD9Ojwn2MK93LLAQidFByiJAtcWfo
 pw1N1G6FpAxw8nB9bGK//UkNZT6eWx9W9zWx/SGWzq7RE4wkFbo/ED+S7GpJzNpZtEuOB6
 7lJM+pOvYbGE/icVTwbXpR7ULjjiqx4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-zyCDrB2TOFCQzmSe6dQa8w-1; Fri, 24 Jun 2022 04:27:53 -0400
X-MC-Unique: zyCDrB2TOFCQzmSe6dQa8w-1
Received: by mail-ej1-f70.google.com with SMTP id
 k7-20020a1709062a4700b006fe92440164so562260eje.23
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 01:27:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SHEbEFsqUdW8BUVYpCGpPX/zr8CGI3b+oCCQuAT71sg=;
 b=kLN4zqL4rLdAuyifHSysWlt1UgqogkeZ/kbz7BWEFYBq5FK40quw6nIYCpaC/mDGrW
 dLXRLFyKAs8mXTTIRcLc49hWOI31ERCHnJdc7Q2nDPOXkkPpCYjX1fx1cQtiwDZOGT4G
 5L3J/3PdQpbCu58Hi3WED0apW9fUIvvrAngah9RiNmMepbE2LX9G17G7eMtceWjpLJpv
 RHfgk1d7Tst+agTZsjvDQIHtkt1PtSIzl4t7A1QjCWw7/SF4B04AOgnJrBi/U32PHwly
 oMIq5WTLWsjsA0Nwlxy7wQkyZlbNxjecOtlJminx0UfM/+jAEA2UFjycWzbAnTGTTwGI
 QijA==
X-Gm-Message-State: AJIora+P1HDHs2iQzZCL9QXoRjlDj0AKXlXysgD1EmxW1Hq23s0xtWIF
 sVpg9rKUbCn3JPdnXNLl2DB9k5kxsTulKBAkZmvko6t3r+JUQRohYJQ9DTH7lr8T5PzBPP0YRBH
 00cBVsAONBTd8RwVQ4vdOdyoY9wkexsukmgJpSZAEDBbbN5+cDhW4qmxwJuGx+ycKD28=
X-Received: by 2002:a17:907:d0d:b0:711:d554:1c8f with SMTP id
 gn13-20020a1709070d0d00b00711d5541c8fmr12212671ejc.223.1656059272119; 
 Fri, 24 Jun 2022 01:27:52 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1va9mow4twwJq0RPCeO5mCdLJAzcFnF6xtT8xGMPdKX6oXZmK//eA4pKkjMrf0Nf1y17CXAvA==
X-Received: by 2002:a17:907:d0d:b0:711:d554:1c8f with SMTP id
 gn13-20020a1709070d0d00b00711d5541c8fmr12212655ejc.223.1656059271823; 
 Fri, 24 Jun 2022 01:27:51 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 m14-20020aa7c2ce000000b0042dc9aafbfbsm1413755edp.39.2022.06.24.01.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:27:51 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>
Subject: [PULL 10/14] build: improve -fsanitize-coverage-allowlist check
Date: Fri, 24 Jun 2022 10:27:26 +0200
Message-Id: <20220624082730.246924-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624082730.246924-1-pbonzini@redhat.com>
References: <20220624082730.246924-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Bulekov <alxndr@bu.edu>

The sancov filter check still fails when unused arguments are treated as
errors. To work around that, add a SanitizerCoverage flag to the
build-check.

Fixes: aa4f3a3b88 ("build: fix check for -fsanitize-coverage-allowlist")
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <20220621204507.698711-1-alxndr@bu.edu>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 9efcb175d1..1b255f91ef 100644
--- a/meson.build
+++ b/meson.build
@@ -212,7 +212,8 @@ if get_option('fuzzing')
 
   if cc.compiles('int main () { return 0; }',
                   name: '-fsanitize-coverage-allowlist=/dev/null',
-                 args: ['-fsanitize-coverage-allowlist=/dev/null'] )
+                 args: ['-fsanitize-coverage-allowlist=/dev/null',
+                        '-fsanitize-coverage=trace-pc'] )
     add_global_arguments('-fsanitize-coverage-allowlist=instrumentation-filter',
                          native: false, language: ['c', 'cpp', 'objc'])
   endif
-- 
2.36.1



