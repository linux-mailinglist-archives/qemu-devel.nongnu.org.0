Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C0253FAAA
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 12:00:28 +0200 (CEST)
Received: from localhost ([::1]:59766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyW0g-00031H-HU
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 06:00:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyVhd-0007sH-Go
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:40:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyVhZ-0008NC-C5
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 05:40:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654594839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LIJcs0zDFOcbc9kvJopi8n/1vIGjhg7JpZGVlXurn6M=;
 b=FrzbSpfXNKpFRiErGNSyyGsY15xuFR4anuoovGG9gjjeoprzHwF3tp5U8T5kMo/EXSxoj1
 2maCQSWFw8daRpaLfbDLFxJrI94KN3u1Zt8UNhLd7CQJnYSDN+TQwPvAwVjz9wUGZLN72v
 nL9WW4A7f4F1+xR3ZeICUBnjbwHHZ+M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-jeeIrpmCPu2Qs3GmcdIgZQ-1; Tue, 07 Jun 2022 05:40:38 -0400
X-MC-Unique: jeeIrpmCPu2Qs3GmcdIgZQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 c125-20020a1c3583000000b003978decffedso12530760wma.5
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 02:40:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LIJcs0zDFOcbc9kvJopi8n/1vIGjhg7JpZGVlXurn6M=;
 b=EmhHq/o0sUkioVaITlGhP175Sr5uG1xQSaRFy+cRzmL+RFB+HXAq5A+niSZD9XebkK
 tvPiQRaQSNh/t1ejgwsfK4/sz7cxsKyflpeFGPKz9zc7gWYc9rMYNXsIjJtmxHntfN1y
 JWJSv/WrMOaAI7uckG2iMDM3dqxBca0F0tKucBrvLeAlKFwSH8cPQ3kqgoAhYFWBJAFR
 jSBdd2vtcn/K8Wblyp+L1AanAqXA7dHwnvHfW5traxkTO/9v3gHXXNEr2wSmMQluRcl9
 K009sdZf2xQb11YjCM5EL0dCwlZcNZ0XztbV+rsqczIuxgq6fzRM1DmjE9F+6Um3yd5B
 mdzg==
X-Gm-Message-State: AOAM533syGdagXw4caTlhP//tUo1cI5l37AAdWH5ci38Qpdi5cCebh8T
 lIx1hjkmLYT2vEjuCMFza4l+Aicr6w7l4fGobvE6m1RO/XCs5SbOW3bMNAFqAA1BNebJ4OfwIRz
 xCHAc031eAGQqVIfZDuR626OI3N9W0UT/2xujbwGKxEvYpHP0t7splV+gZhbKO/pDVzw=
X-Received: by 2002:a5d:55ca:0:b0:211:4092:1c27 with SMTP id
 i10-20020a5d55ca000000b0021140921c27mr26499363wrw.108.1654594836894; 
 Tue, 07 Jun 2022 02:40:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxKFeShmIe2HAV46bJx/SgZZpyv1aPLzGyIma9cUeRuAmqOdAFZ7bX/QEDctlDl9A3dmFwxg==
X-Received: by 2002:a5d:55ca:0:b0:211:4092:1c27 with SMTP id
 i10-20020a5d55ca000000b0021140921c27mr26499329wrw.108.1654594836505; 
 Tue, 07 Jun 2022 02:40:36 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 z3-20020a05600c0a0300b0039c362311d2sm24344611wmp.9.2022.06.07.02.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 02:40:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH 1/7] meson: put cross compiler info in a separate section
Date: Tue,  7 Jun 2022 11:40:25 +0200
Message-Id: <20220607094031.1227714-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607094031.1227714-1-pbonzini@redhat.com>
References: <20220607094031.1227714-1-pbonzini@redhat.com>
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

While at it, remove a dead assignment and simply inline the value of the
"target" variable, which is used just once.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meson.build b/meson.build
index 21cd949082..3f38b3ee4f 100644
--- a/meson.build
+++ b/meson.build
@@ -3740,21 +3740,24 @@ endif
 summary_info += {'strip binaries':    get_option('strip')}
 summary_info += {'sparse':            sparse}
 summary_info += {'mingw32 support':   targetos == 'windows'}
+summary(summary_info, bool_yn: true, section: 'Compilation')
 
 # snarf the cross-compilation information for tests
+summary_info = {}
+have_cross = false
 foreach target: target_dirs
   tcg_mak = meson.current_build_dir() / 'tests/tcg' / 'config-' + target + '.mak'
   if fs.exists(tcg_mak)
     config_cross_tcg = keyval.load(tcg_mak)
-    target = config_cross_tcg['TARGET_NAME']
-    compiler = ''
     if 'CC' in config_cross_tcg
-      summary_info += {target + ' tests': config_cross_tcg['CC']}
+      summary_info += {config_cross_tcg['TARGET_NAME']: config_cross_tcg['CC']}
+      have_cross = true
     endif
-   endif
+  endif
 endforeach
-
-summary(summary_info, bool_yn: true, section: 'Compilation')
+if have_cross
+  summary(summary_info, bool_yn: true, section: 'Cross compilers')
+endif
 
 # Targets and accelerators
 summary_info = {}
-- 
2.36.1



