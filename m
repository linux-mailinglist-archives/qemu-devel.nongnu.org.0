Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FE157E51B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 19:12:43 +0200 (CEST)
Received: from localhost ([::1]:44444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEwCg-000784-CT
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 13:12:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEw5J-0002J5-P1
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 13:05:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEw5H-0000gD-Nl
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 13:05:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658509502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OsjHDI91sKDaO7jtr73uSZ6ojIq5100HvLrmIMADMIc=;
 b=DGhVBF0fEHZGJkMbNUEC8YcEXqfvMStMrVHNn6lVrmFRLFQYFtJDCd/BMu9Jma1YznE9/2
 12N5ARaW7PTSZOJcOlucQJjC3ykSKGzQXvuf2VZSvjWpUAOt3ZDbBJrp6BRFojYmrTdAGx
 /x10qMvTBwhYdL5wYWgUOLeNGsGWTSQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-ttOTIuniOsCZJMUMzKS11w-1; Fri, 22 Jul 2022 13:05:01 -0400
X-MC-Unique: ttOTIuniOsCZJMUMzKS11w-1
Received: by mail-ed1-f70.google.com with SMTP id
 b7-20020a056402350700b0043baadc4a58so3207906edd.2
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 10:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OsjHDI91sKDaO7jtr73uSZ6ojIq5100HvLrmIMADMIc=;
 b=bjX1Vt3B2Gf5Lbpe8xT1w3MV66qz8hK5LRYaMWCAfABDh+K/9/wU8aJ8zUvIuyluVd
 U6G9qsATOjqSMcndX26NZuA+7DFRiG9MfapUaGKvCrUIevkRrnn52JMMFvx8dc95Q+Qv
 4ydUtcu6Crmi03SxmDmMheCWbXe4zDUVQCURqKHoAU7Mt1j+XpQPo2dkpSiIAuHQFVYN
 Lv9xk+v4IVN8smtHNCzZO819gxSD1vmRndYrKkLa1ZtnALZWccCiGGhgTdSx7Zr58x8R
 bCtIgXdy/1VTPPTANmyL/gtIwWkDlfUKLomiAKvpSoGE++S1bqAT94om2R/yHNPeUA6P
 yWRQ==
X-Gm-Message-State: AJIora/SXwHoxQ8qm+2p9yIlZXJEz/LpVu68fJA9inkvsXHDUSRpNO2N
 vb21/Yy5MukH0pMdppFOci4yzmpvV56ecvUfX0T9xN2bMjffNDRWxALdlKZQl3ZBXDoKUPmmKW2
 qE1+6iRXoehklE8oYo4T7eYAzieou0rcshVWlKfH94FMxivw5MpA6kOHk1j8cixf3Ekw=
X-Received: by 2002:a17:906:cc4a:b0:72b:863e:ef7c with SMTP id
 mm10-20020a170906cc4a00b0072b863eef7cmr637891ejb.686.1658509498940; 
 Fri, 22 Jul 2022 10:04:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vVK/kyx0S61nQJ9nLSqcESzj6LwZQpHg66nWlnQ678cqhuSOqGLtKgdrnu+ys09RUFVTH+Lg==
X-Received: by 2002:a17:906:cc4a:b0:72b:863e:ef7c with SMTP id
 mm10-20020a170906cc4a00b0072b863eef7cmr637872ejb.686.1658509498605; 
 Fri, 22 Jul 2022 10:04:58 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a056402148b00b0043a43fcde13sm2809577edv.13.2022.07.22.10.04.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 10:04:58 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>
Subject: [PULL 4/8] oss-fuzz: ensure base_copy is a generic-fuzzer
Date: Fri, 22 Jul 2022 19:04:45 +0200
Message-Id: <20220722170449.853222-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220722170449.853222-1-pbonzini@redhat.com>
References: <20220722170449.853222-1-pbonzini@redhat.com>
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

Depending on how the target list is sorted in by qemu, the first target
(used as the base copy of the fuzzer, to which all others are linked)
might not be a generic-fuzzer. Since we are trying to only use
generic-fuzz, on oss-fuzz, fix that, to ensure the base copy is a
generic-fuzzer.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <20220720180946.2264253-1-alxndr@bu.edu>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/oss-fuzz/build.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
index 5ee9141e3e..3bda0d72c7 100755
--- a/scripts/oss-fuzz/build.sh
+++ b/scripts/oss-fuzz/build.sh
@@ -92,7 +92,7 @@ make install DESTDIR=$DEST_DIR/qemu-bundle
 rm -rf $DEST_DIR/qemu-bundle/opt/qemu-oss-fuzz/bin
 rm -rf $DEST_DIR/qemu-bundle/opt/qemu-oss-fuzz/libexec
 
-targets=$(./qemu-fuzz-i386 | awk '$1 ~ /\*/  {print $2}')
+targets=$(./qemu-fuzz-i386 | grep generic-fuzz | awk '$1 ~ /\*/  {print $2}')
 base_copy="$DEST_DIR/qemu-fuzz-i386-target-$(echo "$targets" | head -n 1)"
 
 cp "./qemu-fuzz-i386" "$base_copy"
-- 
2.36.1



