Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF67B5A1C8A
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 00:40:33 +0200 (CEST)
Received: from localhost ([::1]:52820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRLWV-0005Wr-Ug
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 18:40:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKT-00027e-SY
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oRLKP-0004XM-QP
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 18:28:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661466475;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nUWdzkrb565CMDO/TYL+WAZ9c6v7Vlsyanxwtw/qzS0=;
 b=OQNDMMAMC8RA83t5bEbvr1XVQK12Iess/Q4aEaaNE0J9dijEmp19KlYVYGKs3I7xUHcAk+
 lTdJHmyQwtPRx/mL8bc5DWIeMX4BA/bNLdPgPyKWMmrtENCA2irkRcoSnJcZoVKlHo3hVi
 Iyk/40rKLmzK96nRlWAA1kUNxUeQmaE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-452-IOCSuQn-MNG34UpB0qaYQQ-1; Thu, 25 Aug 2022 18:27:54 -0400
X-MC-Unique: IOCSuQn-MNG34UpB0qaYQQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 h82-20020a1c2155000000b003a64d0510d9so6519034wmh.8
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 15:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=nUWdzkrb565CMDO/TYL+WAZ9c6v7Vlsyanxwtw/qzS0=;
 b=6qitUhkbDS9rmBO9BL/UjALbXOir2KaMC+Kp20o/L/VmjBcbzN7hk/W41xkU/PyQpL
 R7J2XsQCxLIhESb4uTvRJVs8htpONwvhFmgyYLhcETojWXk8JPElX0G36MZdOCNAQU88
 DPHfLQ6FKHdxh+HEstJ5oyAmtbkdjtbeT6XJzmG54zK6tUytMq7ppiwjH/yhwyqQAU+/
 jsDT00tDWvMpll/zxbe1spl5ChIhT4Q1P+vO2BeN5bW6t0sszCHK0ZPv152zPT6xgb74
 VJOykFHSqlkXHz87H4MbMelDRCGT7FDKK1kYCtLNWPUsHF0EgWhb28/XPb+YSnvgPvxJ
 ddmQ==
X-Gm-Message-State: ACgBeo36AIHlm9pP7VVb9hFzMIDJcgE13luRdFgzbc/lQRRDFczRSX3R
 jHi2NfeNpvd+3iDpQWWohz16v/oChFyrINc9hK4nKbw9L5nZ8oTLKA2QBr4AaxC+u7k+/dONTq+
 zV/+0xuBYYFsTBDlfQLcv1U7XlnSEqVXKputkc2tIyDLqU7N0AEEth3Vzd+r3y0JDFK0=
X-Received: by 2002:adf:dfc8:0:b0:225:2266:7cd8 with SMTP id
 q8-20020adfdfc8000000b0022522667cd8mr3295498wrn.19.1661466473267; 
 Thu, 25 Aug 2022 15:27:53 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7Hh+sj/gkHb2ohOR//UXFiADnlbxe8jnszWHQfWh7/Pmg/LoYUIZocfgf5nOMVq/DpESZSfw==
X-Received: by 2002:adf:dfc8:0:b0:225:2266:7cd8 with SMTP id
 q8-20020adfdfc8000000b0022522667cd8mr3295491wrn.19.1661466472982; 
 Thu, 25 Aug 2022 15:27:52 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a05600c00c700b003a60edc3a44sm609839wmm.5.2022.08.25.15.27.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 15:27:52 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
Subject: [PATCH 04/20] vof: add distclean target
Date: Fri, 26 Aug 2022 00:27:29 +0200
Message-Id: <20220825222745.38779-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220825222745.38779-1-pbonzini@redhat.com>
References: <20220825222745.38779-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 pc-bios/vof/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/pc-bios/vof/Makefile b/pc-bios/vof/Makefile
index 8809c82768..990f26af31 100644
--- a/pc-bios/vof/Makefile
+++ b/pc-bios/vof/Makefile
@@ -19,4 +19,6 @@ vof.elf: entry.o main.o ci.o bootmem.o libc.o
 clean:
 	rm -f *.o vof.bin vof.elf *~
 
-.PHONY: all clean
+distclean:
+
+.PHONY: all clean distclean
-- 
2.37.1



