Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3D5571ABD
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 15:03:45 +0200 (CEST)
Received: from localhost ([::1]:50842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBFYG-0003gA-9V
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 09:03:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFLS-0003Bt-CI
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBFLQ-0001UY-Mg
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 08:50:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657630228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rKRIRkfS5iDFDtYG1yCN2RIcM7QWhd9MCUeeaDQfRyQ=;
 b=B/IsfQRVBDt41nU0UIhiJpyUUfrk+6z5rUfr9JlaS1v2k8P8nxbxfVHcoTbo7I/tUE+Wmg
 ZnPv981GQ4WBf1MsclKoIMhHX2WKN53ozat/Yl4KBhNqf/+YHB3l/p19ewpGNo6vfZOpR3
 F/hM2PD7sFGaH2UMC2iTGspNcTyPrAc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-Zp8_VYIyM_yhilpuLD9uEg-1; Tue, 12 Jul 2022 08:50:21 -0400
X-MC-Unique: Zp8_VYIyM_yhilpuLD9uEg-1
Received: by mail-ed1-f72.google.com with SMTP id
 o13-20020a056402438d00b0043aa846b2d2so6090285edc.8
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 05:50:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rKRIRkfS5iDFDtYG1yCN2RIcM7QWhd9MCUeeaDQfRyQ=;
 b=zlS1macLaNTd81Oj5ywPGgZlXurfmcD93ODxkTdfIMY+TBa5fHf3Qc6kLVSBgrF5zz
 Vb/stS0kzQYWhdTRobPSvmxRusbzFituo1LaimbRKPkWUPLdiAfS18YNRTqtr0CreS8c
 Pl8YFLjHiAQo2xgPfxkDVjYlJICXCkrJNI3tjyG2iA5glce4h07fK9ITl1yemobFyHk7
 g5vC6OME98hzozk+uZ8nXxY9ApvfMPzEZoWXadQxCx3Op4NsuRcYV6kOJ6LnHiMcV5fP
 VZcogAN9zLayKTdyocj+R5B6EQq9XhP3DeI/G9Dg11F8cjnh5vMLJo0BR98MOVaT6w5x
 ziPQ==
X-Gm-Message-State: AJIora/7PnGGQiqWwZNgrAIIcu9b79jrrDIwpMzhOfGy1EfpOzLY4LRX
 HZQQTfuNLx1d/Q63AtEE19NW5tuZoExu6mQiW/dVAysTyxCWoLbmw+AutS+OtlF7Xv/VTlvCttW
 OJiam87dVL47wciv4TVhodZy+O4PZZvYfEGDi2BnknSmpZyjh31U0Zsqc9g2ulj/4m38=
X-Received: by 2002:a05:6402:3785:b0:435:5d0e:2a2e with SMTP id
 et5-20020a056402378500b004355d0e2a2emr32821315edb.307.1657630219588; 
 Tue, 12 Jul 2022 05:50:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u6OueKGRBOWqdhexCi8XcyZCK6lcdD6T3N3+aKammkLWfdCVe88p0NZLJUv8KE5GtAyjgbnQ==
X-Received: by 2002:a05:6402:3785:b0:435:5d0e:2a2e with SMTP id
 et5-20020a056402378500b004355d0e2a2emr32821280edb.307.1657630219235; 
 Tue, 12 Jul 2022 05:50:19 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 i19-20020a170906115300b007262b9f7120sm3747043eja.167.2022.07.12.05.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 05:50:18 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Darren Kenny <darren.kenny@oracle.com>
Subject: [PULL 13/18] fuzz: only use generic-fuzz targets on oss-fuzz
Date: Tue, 12 Jul 2022 14:49:51 +0200
Message-Id: <20220712124956.150451-14-pbonzini@redhat.com>
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

The non-generic-fuzz targets often time-out, or run out of memory.
Additionally, they create unreproducible bug-reports. It is possible
that this is resulting in failing coverage-reports on OSS-Fuzz. In the
future, these test-cases should be fixed, or removed.

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <20220623125505.2137534-1-alxndr@bu.edu>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/oss-fuzz/build.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
index 98b56e0521..aaf485cb55 100755
--- a/scripts/oss-fuzz/build.sh
+++ b/scripts/oss-fuzz/build.sh
@@ -1,4 +1,4 @@
-#!/bin/sh -e
+#!/bin/bash -e
 #
 # OSS-Fuzz build script. See:
 # https://google.github.io/oss-fuzz/getting-started/new-project-guide/#buildsh
@@ -105,7 +105,7 @@ do
     # to be configured. We have some generic-fuzz-{pc-q35, floppy, ...} targets
     # that are thin wrappers around this target that set the required
     # environment variables according to predefined configs.
-    if [ "$target" != "generic-fuzz" ]; then
+    if [[ $target == "generic-fuzz-"* ]]; then
         ln  $base_copy \
             "$DEST_DIR/qemu-fuzz-i386-target-$target"
     fi
-- 
2.36.1



