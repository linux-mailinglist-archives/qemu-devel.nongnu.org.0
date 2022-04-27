Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB212511C93
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 19:24:16 +0200 (CEST)
Received: from localhost ([::1]:40456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njlOh-0000eE-Sc
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 13:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1njlMS-00062m-Ng
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 13:21:58 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:35742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jcmvbkbc@gmail.com>)
 id 1njlMQ-00017U-DS
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 13:21:55 -0400
Received: by mail-pl1-x630.google.com with SMTP id d15so2147425plh.2
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 10:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BFaN1P/7/9R9Y3CXttZnq3vfdYDfWFapHBP4E9iurPA=;
 b=avQ2GX/qP2sOGTv/o7tBCjt8ATRfsMsKdAfpavhY4bBtQIOChMS5g9MB002lJSzdYl
 Z83VPeE2JVQuFnHvOvFN/2ST2hkjjdxhh0lifbInZXRZVQGLzWeOoNNShCIT8r1BLF7t
 5MLjqMzLbH292r42UTxCdxVi2uSBIINrgF0VfNqlgZ6bhcVfTg36KYBHgE/Y+fWPS3WJ
 M04KNw0adR0pTxJHr+n6UUVD6xPYuk6KzO1lTzDA9wRNTmn//yCfAJohjNFt1xj3jEU0
 dkn4yj0MdfEDd4uhZLx+7R9dtUf75GMMCgTe4Cm6157qlP7GtX9+vsptkod4wHLnazaA
 IpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BFaN1P/7/9R9Y3CXttZnq3vfdYDfWFapHBP4E9iurPA=;
 b=FQpftWEDjlCGhsRuft37ZE9xRlG/+FuHmffjqvim8cipVWkwk/HNhGwn75Q2fBkhuO
 qoKGyFYXl0tCA/z8hZ1yKHey+l2lviGVgPAdzRiVag++jxFijAWSePC+sdXVSlU/7VT1
 JDshY0vF9Igcxd4SDmam61d0MPaxapwUdCvo2VrKs0BI6Z1Gobdp/ltlzXgFwSluFCWB
 OIMNzkfcuYLjNL+yRZcYrUacKbP3fEAXLUBIl2b/3a/lH+TT7tgZKr9C53pMr2aFWWeV
 aglUTwo4iqRUjNwRh8OVd5EiphIB/qD042AWhElCeAxcYd04o6A6wjWdurzx9jb7z6BQ
 P40g==
X-Gm-Message-State: AOAM530HrU9N2rA8F+WL7g2v+y6WqbocbXHYXw4qSfqYv9Uu6asOffe6
 0xsCO/C+C7Cz6lG308O1d0QUdAw5UfI=
X-Google-Smtp-Source: ABdhPJzzKYjDc4JHM2M0/7oM9Kh/ih4bQY4vYCvLrEYV5lbrVHH4uL7UR29TI4ckZ50XDlx5j8CcrQ==
X-Received: by 2002:a17:90b:1c88:b0:1b8:a77e:c9cb with SMTP id
 oo8-20020a17090b1c8800b001b8a77ec9cbmr44681443pjb.205.1651080112411; 
 Wed, 27 Apr 2022 10:21:52 -0700 (PDT)
Received: from octofox.hsd1.ca.comcast.net
 ([2601:641:401:1d20:76e8:b785:3fb9:b6d6])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a056a00239000b004fa7103e13csm21202124pfc.41.2022.04.27.10.21.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 10:21:51 -0700 (PDT)
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] tests/tcg/xtensa: fix build for cores without windowed
 registers
Date: Wed, 27 Apr 2022 10:21:34 -0700
Message-Id: <20220427172140.1406059-2-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220427172140.1406059-1-jcmvbkbc@gmail.com>
References: <20220427172140.1406059-1-jcmvbkbc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=jcmvbkbc@gmail.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_LOCAL_NOVOWEL=0.5, HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Max Filippov <jcmvbkbc@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Don't try to initialize windowbase/windowstart in crt.S if they don't
exist.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 tests/tcg/xtensa/crt.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/tcg/xtensa/crt.S b/tests/tcg/xtensa/crt.S
index d9846acace90..909872cd3853 100644
--- a/tests/tcg/xtensa/crt.S
+++ b/tests/tcg/xtensa/crt.S
@@ -8,10 +8,12 @@
 .text
 .global _start
 _start:
+#if XCHAL_HAVE_WINDOWED
     movi    a2, 1
     wsr     a2, windowstart
     movi    a2, 0
     wsr     a2, windowbase
+#endif
     movi    a1, _fstack
     movi    a2, 0x4000f
     wsr     a2, ps
-- 
2.30.2


