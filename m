Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5322F57E516
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 19:10:00 +0200 (CEST)
Received: from localhost ([::1]:40482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEwA3-0003vF-CW
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 13:09:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEw5I-0002Iz-Vo
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 13:05:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEw5H-0000fi-4K
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 13:05:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658509500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QIe3GqZfn4ySK6BpRC1oz1OEETJCzYLqg2tOgkwe3oM=;
 b=c99W640u0+EF+2cTKt/GkUb8lqVSMLrAxVJ55QlTLLjT+VZVPYWKw6+ZSxLgo6ZdYD86QS
 pLJpPZYgEDtBFYR0Lwb2bMw9XreBjGsT9SzG+JG4L2y2D9tWtf91QzH8i5ym8ZRJRbOpMx
 vgfAv1jOwkDXOupd+6M4XYbU0pj3plE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-taDpcqScPA-qFQT1UAKA-g-1; Fri, 22 Jul 2022 13:04:59 -0400
X-MC-Unique: taDpcqScPA-qFQT1UAKA-g-1
Received: by mail-ej1-f71.google.com with SMTP id
 ji2-20020a170907980200b0072b5b6d60c2so2142572ejc.22
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 10:04:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QIe3GqZfn4ySK6BpRC1oz1OEETJCzYLqg2tOgkwe3oM=;
 b=Je6OWQm8cD0AbGNbOaXaNLQDsHgT9G7lN5/TothdLZ5cQ1Erp2kEMb352grTWiEzJ5
 zbBm7ThsNGtNvtrE3FDyaCA+fjVfsIVejnAJSVFrYSCRFzOqyhFtPHU73tuSF/ujq8qU
 Tii+138dhWshmuWaJQrWzDEcDSwNbWTstN6ZIMvsz2AtEqV7ISTBS8sVvf852TxF6caa
 TJZpKoGKkUQEl3h2bXURw0RJRsO9OYjB9wkYb/OYIbyfWPqIdqwR8cXxhXguFXnWqMt3
 tRxNdSgOvcEEjPU7cm1vGHhKnAgVzOlK0U0ClDM/m+gcFMTOmMl61915AuAWFgyqAxWe
 FFWg==
X-Gm-Message-State: AJIora/ydpv96vS99T2SMRuC4CpSCcyjvGsxrY3a2IbZ171SybHPf3VP
 1UZx9Cx7588F/kQAsF+ErsKIujirCW+XL9U+NMJ63Sr7sl7QxBBkZ2yqmT3t36C7yy4xp1YM8Fk
 QlNjaRthJsIj/MhlY1G9epcdFY1ADMOQtSCrWEG4er7EbCsrWkC0bq/xzgJmCaSeYL2g=
X-Received: by 2002:a17:907:60cc:b0:72b:40a8:a5b with SMTP id
 hv12-20020a17090760cc00b0072b40a80a5bmr624632ejc.379.1658509497293; 
 Fri, 22 Jul 2022 10:04:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vBKP52JveUe93H/JHjs6AGifaaaxQXuZtwWrug1lbvlLzFGXkJtk5jyvsvic+errKTwMYGsA==
X-Received: by 2002:a17:907:60cc:b0:72b:40a8:a5b with SMTP id
 hv12-20020a17090760cc00b0072b40a80a5bmr624608ejc.379.1658509496986; 
 Fri, 22 Jul 2022 10:04:56 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 kx6-20020a170907774600b0072b3182368fsm2198701ejc.77.2022.07.22.10.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 10:04:56 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>
Subject: [PULL 3/8] oss-fuzz: remove binaries from qemu-bundle tree
Date: Fri, 22 Jul 2022 19:04:44 +0200
Message-Id: <20220722170449.853222-4-pbonzini@redhat.com>
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

oss-fuzz is finding possible fuzzing targets even under qemu-bundle/.../bin, but they
cannot be used because the required shared libraries are missing.  Since the
fuzzing targets are already placed manually in $OUT, the bindir and libexecdir
subtrees are not needed; remove them.

Cc: Alexander Bulekov <alxndr@bu.edu>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/oss-fuzz/build.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
index 2656a89aea..5ee9141e3e 100755
--- a/scripts/oss-fuzz/build.sh
+++ b/scripts/oss-fuzz/build.sh
@@ -87,8 +87,10 @@ if [ "$GITLAB_CI" != "true" ]; then
     make "-j$(nproc)" qemu-fuzz-i386 V=1
 fi
 
-# Prepare a preinstalled tree
+# Place data files in the preinstall tree
 make install DESTDIR=$DEST_DIR/qemu-bundle
+rm -rf $DEST_DIR/qemu-bundle/opt/qemu-oss-fuzz/bin
+rm -rf $DEST_DIR/qemu-bundle/opt/qemu-oss-fuzz/libexec
 
 targets=$(./qemu-fuzz-i386 | awk '$1 ~ /\*/  {print $2}')
 base_copy="$DEST_DIR/qemu-fuzz-i386-target-$(echo "$targets" | head -n 1)"
-- 
2.36.1



