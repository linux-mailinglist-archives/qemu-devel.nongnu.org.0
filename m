Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E3557B32A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 10:41:49 +0200 (CEST)
Received: from localhost ([::1]:55488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE5HA-0008Sw-QC
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 04:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oE5Fj-00071b-U7
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 04:40:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oE5Fe-00068Y-BS
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 04:40:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658306413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QIe3GqZfn4ySK6BpRC1oz1OEETJCzYLqg2tOgkwe3oM=;
 b=OPGHrHVTJTXWLvBheFjfUa9DmlSDlKrbuximJs+GJ3MrRhekPce6gLCrKsXotqbfraR5f4
 XeWz98ohx8p54nh0tcdLhkuRCJ2UrySXxL2jJd3bq+1kPA+dIu8UK4th0fvzK3oEuqmM8i
 zBdRkuT07Urc6iCuu9dPkSvCKOZuUXQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-k5nsNEShNqiZ-PgFgfMekw-1; Wed, 20 Jul 2022 04:40:12 -0400
X-MC-Unique: k5nsNEShNqiZ-PgFgfMekw-1
Received: by mail-ed1-f70.google.com with SMTP id
 x21-20020a05640226d500b0043abb7ac086so11619800edd.14
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 01:40:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QIe3GqZfn4ySK6BpRC1oz1OEETJCzYLqg2tOgkwe3oM=;
 b=1nXF7N2SidzLfhijULR/3Y1sjW3SpbEqPFHeZjyog0xDmpQZqK856AuMbo4OWNpqkd
 03Y+eR18KMhw2gYkxP0vDCBBMXDMTICSXt4I86DHuMBv5WTJ+8Ps2XOW2/OepRbIbhzr
 5UnpuyFPMst/nUKkzWtzP/jH93DTui7cdVBo3NPHa2bGQQb4UD/05P82K4XRMWZhghb9
 BtGbpo2ElmXVi3TirbYIqBa5ZdglGzkOREsmJKy1lEMrOgzqSZkxV+R0rkUcjGVmjOTS
 DfcBtFgQs2xJRaJl1Sq6E1TV8F79NiCsdZ1QVSquvn+8knAhN/7sAXVPoSX9eypLtsIt
 7N1A==
X-Gm-Message-State: AJIora9ldMC2nLo7XXWQODRKwgEpvLgJ/nGajOQNfLtjF7bRqSqMw5MK
 FG6vvkK0e0m+nxfZSTmzOuAqa5dbIAKKsV0Mxwa+oeDz/5ozcsXEpSZ6i3LGkKjrZrRCPZjRWMx
 2Vna9mDWqWq3BqWub+Cq54Xt3ZmX8u4+XNV9b2Nl8zn1Wg6ICId1arR41GbuOoN8Ekc8=
X-Received: by 2002:a05:6402:15a:b0:431:71b9:86f3 with SMTP id
 s26-20020a056402015a00b0043171b986f3mr48570543edu.249.1658306411007; 
 Wed, 20 Jul 2022 01:40:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tR8vi8sL6/63CVGgulhsAuWmIbQcgjvk2uDtnIkYxUQzazAes6XBQEXLHZCCeAqKlpURYr9Q==
X-Received: by 2002:a05:6402:15a:b0:431:71b9:86f3 with SMTP id
 s26-20020a056402015a00b0043171b986f3mr48570530edu.249.1658306410750; 
 Wed, 20 Jul 2022 01:40:10 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 r17-20020a056402035100b0043a6a7048absm11949407edw.95.2022.07.20.01.40.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 01:40:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>
Subject: [PATCH] oss-fuzz: remove binaries from qemu-bundle tree
Date: Wed, 20 Jul 2022 10:40:09 +0200
Message-Id: <20220720084009.603423-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
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


