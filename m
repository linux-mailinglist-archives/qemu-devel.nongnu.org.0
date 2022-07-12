Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A562571AD5
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 15:07:23 +0200 (CEST)
Received: from localhost ([::1]:59522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBFbm-0001As-9O
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 09:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFLL-00037v-OK
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38156)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFLI-0001TO-Vt
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657630220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZeBXSVYVoPc/3PZYqaDg7TCVfS9L6tfIu0acozVHuz8=;
 b=SJb2ozP7h5N9uaTtZiyrQK3VuzJvlj5cRedPczeFRSCJ+ijFtpD88KD2VP6MCZIv5YbsTI
 fi5Db72d0u/IOj8pl+HOEx0YTx1HgokcgtgWfI/WXVt6iV1QFKVSVzb/8QIa7JyoRH8owa
 PXuusp+E+bXbOIWtsxCKssoC5P/YTjI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-veTa6RwLPXKWmo5_1i--Gg-1; Tue, 12 Jul 2022 08:50:19 -0400
X-MC-Unique: veTa6RwLPXKWmo5_1i--Gg-1
Received: by mail-ed1-f72.google.com with SMTP id
 t5-20020a056402524500b0043a923324b2so6197677edd.22
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 05:50:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZeBXSVYVoPc/3PZYqaDg7TCVfS9L6tfIu0acozVHuz8=;
 b=rAorehVa1zoKHXhAz/JI8xs9SI4+XX6utnKwZBwNyZHCbKAfHXo/Y82YRxVk6vzinl
 5ts4puozIcPyYGjpP7egQJmiHgFG8WanDo9pYrzd8EoRgs0knKDMKBP7IlLTd/RGYcYu
 rIEaeRESNNt/zU2xubbSAwT5AXFVSUznRIM8+zs5Ym2LX6vWQmC9TBwy5Xg/hKl2xVEW
 gz2XOt45HMw0lDFqfSob5vyWFJW3o+SblbpFDDpOpBM5Zi6cndsYbzxMNP29sd0nMfgY
 D68ptqmBZUgnNfWbwrAM8K+A8KKro3eaD+ttKgOhMAiZZGV+lv08A3AI5RyQQ3eCmhoc
 sjAw==
X-Gm-Message-State: AJIora8jEf6ely4j3YZQJ5lrrKvbPk/efmzntEufXDbBQiHz/Av6/dOp
 PXmhrPI63CZyjzRamUvWC1GnDW2XmuamPgF8PcKdOJwOUKAsaBgafwtCzyW3T6h5tAmrfu1O4AW
 EBFQRHh03hE00DxcUvKREFmKcR2ky91zDdeQhkeiv5SZaQYTWyxwaxPFCaAB8G28R5l4=
X-Received: by 2002:a17:907:2723:b0:72b:5af3:5a11 with SMTP id
 d3-20020a170907272300b0072b5af35a11mr8863180ejl.584.1657630217963; 
 Tue, 12 Jul 2022 05:50:17 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u09XIwYte+Hvndy6KfJAxJatrT886KRStWzpUPc+8lyP1t8e5QM/Ty7pfPbwP2bOEyWt1qJQ==
X-Received: by 2002:a17:907:2723:b0:72b:5af3:5a11 with SMTP id
 d3-20020a170907272300b0072b5af35a11mr8863155ejl.584.1657630217707; 
 Tue, 12 Jul 2022 05:50:17 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 vs24-20020a170907139800b00703671ebe65sm3734333ejb.198.2022.07.12.05.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 05:50:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>
Subject: [PULL 12/18] build: improve -fsanitize-coverage-allowlist check
Date: Tue, 12 Jul 2022 14:49:50 +0200
Message-Id: <20220712124956.150451-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712124956.150451-1-pbonzini@redhat.com>
References: <20220712124956.150451-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
index bc5569ace1..013c694a49 100644
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



