Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3247855958D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 10:38:29 +0200 (CEST)
Received: from localhost ([::1]:56804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4epg-00035C-0i
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 04:38:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4efh-0006ZU-Ij
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:28:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o4eff-0005X2-1I
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 04:28:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656059286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vdqmLvR6JN932wcQnmiu8+mPHY+md+mV37njXiUqS3g=;
 b=YdQ8SVqP4lUcU5VWTO6u9H4nUOxWVK8f6sozkKK9igDSejLVskY/e9nmQ0LxdysuJXczDf
 Nxt1MQoJBqqOHvZgEa8ZE49atSRpEhrcpWUyvF8BNArug5hW6M20K1azJyKJND6U1hh+yt
 yMq3n1zjTyoskiLZf1r88wPEPCyi/do=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-480-u65Uel5FMZ-U8Ol0hu4Veg-1; Fri, 24 Jun 2022 04:27:46 -0400
X-MC-Unique: u65Uel5FMZ-U8Ol0hu4Veg-1
Received: by mail-ej1-f70.google.com with SMTP id
 nb10-20020a1709071c8a00b006e8f89863ceso568194ejc.18
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 01:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vdqmLvR6JN932wcQnmiu8+mPHY+md+mV37njXiUqS3g=;
 b=QgOXFD5D5zeszLPKdGRXxnSN9A4rH1QpzyC0m3ugcl18H6qQy+LWTlgmfMA3F54PNT
 Xog26l2DATNw0NVgM8GrubEIalr8esp3JA+f1QI1iasdcD62B7stEikfuEWE+a8/rJ1X
 qx/EG0J5HD68o+REUWTq7excQ5SII3gJ0WBrA3ZZt9qGcdvPWJyrLx1lCuYYfMH7Wb0z
 Ct9l2UxLZ/DKsVYvcBP4cMwp8aJqUoqmroBh9vRdZLOsx4qd5miLafMr131TRBnSqIz2
 M1oRq76JP2Jx9O0rQ/MStEhe0rV24Ur6siG8XK7dztrIV+Dj7D54RMHuF7Dpq1+s618i
 6UUg==
X-Gm-Message-State: AJIora/WBqYHyTseF8tpZtoTgAmVEl2EXS4TZdZ9SLVAwxpE6Escf0wA
 oPl8AqyGht31Vne/CvR9+XLvJ71/2nCArnOaD+2Xbf6hOox8VlOqyZ3U5mOmcGGZHbxa9m97De1
 LFkHJ+jZ9GC54EQZbvd/rV+r4VIhTTKYQqXy/awABIYIhqEnkdYU2EWSZADiNINypFXQ=
X-Received: by 2002:a17:907:2d8a:b0:722:e35b:695 with SMTP id
 gt10-20020a1709072d8a00b00722e35b0695mr12262442ejc.470.1656059264742; 
 Fri, 24 Jun 2022 01:27:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vXYXpHp1iAN7263xRh34TwTKUvih2wPBY4TikT1T7PAHvO7PFV059zFSA9uEUXzQPhg5/Z2A==
X-Received: by 2002:a17:907:2d8a:b0:722:e35b:695 with SMTP id
 gt10-20020a1709072d8a00b00722e35b0695mr12262413ejc.470.1656059264331; 
 Fri, 24 Jun 2022 01:27:44 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 g20-20020a170906521400b00722f48d1f19sm715121ejm.67.2022.06.24.01.27.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 01:27:43 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/14] configure: allow more host/target combos to use the host
 compiler
Date: Fri, 24 Jun 2022 10:27:22 +0200
Message-Id: <20220624082730.246924-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624082730.246924-1-pbonzini@redhat.com>
References: <20220624082730.246924-1-pbonzini@redhat.com>
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

Add more pairs of bi-arch compilers, so that it is not necessary to have
e.g. both little-endian and big-endian ARM compilers.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configure b/configure
index 8f3401a23e..c9feb1a924 100755
--- a/configure
+++ b/configure
@@ -2058,8 +2058,12 @@ probe_target_compiler() {
   compute_target_variable $1 target_ranlib ranlib
   compute_target_variable $1 target_strip strip
   case "$1:$cpu" in
+    aarch64_be:aarch64 | \
+    armeb:arm | \
     i386:x86_64 | \
+    mips*:mips64 | \
     ppc*:ppc64 | \
+    sparc:sparc64 | \
     "$cpu:$cpu")
       : ${target_cc:=$cc}
       : ${target_ccas:=$ccas}
-- 
2.36.1



