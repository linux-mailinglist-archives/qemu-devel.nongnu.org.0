Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D770457D1C3
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 18:42:10 +0200 (CEST)
Received: from localhost ([::1]:40864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEZFZ-0007km-Uj
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 12:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEZAO-0007C9-6x
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:36:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEZAB-0007g5-HT
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:36:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658421394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OsjHDI91sKDaO7jtr73uSZ6ojIq5100HvLrmIMADMIc=;
 b=EbKOgAkF9dlxKxVjLN+S5jF6KZOM+KpZgAU7NaEPGOQnG/m0FzEmmYVJnALxJWEfPuXNtQ
 lDD2hDY8oE0Rpc7AEkw5jhZMBlZGJQekYFoHd9eHWn1KV+vssRa04iGzRYBQuK9UabkjVq
 TkT/BVW3KgQ4ec5efSRSLVe1vJU1GEc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-eRbBdzfCOdq1wUvtPFb7xw-1; Thu, 21 Jul 2022 12:36:32 -0400
X-MC-Unique: eRbBdzfCOdq1wUvtPFb7xw-1
Received: by mail-ej1-f70.google.com with SMTP id
 oz11-20020a1709077d8b00b0072f2f17c267so967821ejc.16
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 09:36:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OsjHDI91sKDaO7jtr73uSZ6ojIq5100HvLrmIMADMIc=;
 b=XwfkzXgTbdWcP0Ypw9i8CNtkstvzuJJ6QaBK4URiA/g4e2le3dpx4VkJ6r44ZQ1Cja
 Ah1GkY0FnQ5rzrqKLa8dbmTT/69Tm21riRfW16fFo1WH7d3lMXeAnZTwuTP3IsaRTy6f
 rECTkwpu4taD/PG0VaivmekaV5wybP6OATF1aaKrHSkSDMU5IbFRD/O3FVHLY/d+oe4Q
 wNBoWcakp3HOKB2QSZBXFB0nv1pQiXSGFz0ivv1hmREAY2VrXBsfroNSu8j3/THnfbcK
 REx6Ero7uhkcKCFIDUNlnq7X1j7akB9DOFYbVRAUhMWMaS5DfwT0KU5vHrgUQa69htFI
 PQJw==
X-Gm-Message-State: AJIora8jVYOmZP+98FMm6yLhbOZ/f54qKemllbO8JzMO6q6kzcnRq4+C
 rsAyumJbiw6Lf7sGOm9ELWiklbXsVdfrTsp3vFiXw5OvdDStuPjBzAaaLk4JiQvSOWgYgK4Dt1Z
 itfkDiN2BeqVsXyYoIW4NQ1BvzYwLi11shksczV4Ly99n3xJ+XDvxVLYyHTM7EUKrlrc=
X-Received: by 2002:a05:6402:1b03:b0:43b:c8df:bc43 with SMTP id
 by3-20020a0564021b0300b0043bc8dfbc43mr3021814edb.174.1658421391172; 
 Thu, 21 Jul 2022 09:36:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tIpfDdMyqmIuMOpE0pZAg96GE/qF7joPMDCrdKUIhghZ28Yx02Do6DNdcyAT+LkcpqTxcsBg==
X-Received: by 2002:a05:6402:1b03:b0:43b:c8df:bc43 with SMTP id
 by3-20020a0564021b0300b0043bc8dfbc43mr3021767edb.174.1658421390650; 
 Thu, 21 Jul 2022 09:36:30 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 op9-20020a170906bce900b00722e31fcf42sm999024ejb.184.2022.07.21.09.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 09:36:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>
Subject: [PULL 4/9] oss-fuzz: ensure base_copy is a generic-fuzzer
Date: Thu, 21 Jul 2022 18:36:16 +0200
Message-Id: <20220721163621.761513-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220721163621.761513-1-pbonzini@redhat.com>
References: <20220721163621.761513-1-pbonzini@redhat.com>
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



