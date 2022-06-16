Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D75DD54DDDD
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 11:08:06 +0200 (CEST)
Received: from localhost ([::1]:39402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1lTx-0008OB-P9
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 05:08:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvu-0001tP-3A
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1o1kvs-0002uk-BI
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 04:32:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655368371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/kJWt8j3how8cos95/19EMdtnSkeL0N3FGx4nYIhsak=;
 b=GdOeVEZ0A7lvGhL2q/V/bvcu5x0vXJEUz73pDgTjZG7MzPKC+jnCcBPQFXytnDlkpbd+dy
 ix3x3op4+IC+M/SAribGpAx+vXwI7aQa8XidnutTwsanPz48zR92VrJsVcdrrRjPEYI+wS
 UAMlI2wOe3z8TfmV0JXJCXgTsd5MaAo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-185-fRu9t19BN1ysXtk6ZnlxvA-1; Thu, 16 Jun 2022 04:32:50 -0400
X-MC-Unique: fRu9t19BN1ysXtk6ZnlxvA-1
Received: by mail-ed1-f71.google.com with SMTP id
 s15-20020a056402520f00b004327f126170so775978edd.7
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 01:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/kJWt8j3how8cos95/19EMdtnSkeL0N3FGx4nYIhsak=;
 b=EEt0JiG6AAUXRedDLtNwDiar1U9PTVi+3XUjykVphlwjKZee2o3dYAMWupfQArkene
 ebDQoAAKyB0ux2LmlffHy514ZcjLkJj/I4kRRsuZ3t6jKV3SA1fQzzUkeLdX2/c6MzB4
 aGMjU+v1t30yO03eB3egMnHxB+3d/Q6unpaIHpCRfwMYS0jjsXJG27Y1Vjf9h7J2Pjak
 xwk8asQojhq2i1dm4Mh58zu4EimPt/27gEMPZN/Q3kqJUjFoLGQ5LTb2e/AeiJoFR9aW
 PphnoP9RKUrXxFm7nxp/PwiVtrpaL99Y870dzYGDdQXNKs2ZfkG6OHZMhOxctjdA1SHS
 6wIg==
X-Gm-Message-State: AJIora+1i64uzCrJz+3bekiNp2I3IpJ6um7zBhK7JEvDqMb8Fza6RSUU
 pXbhfk5HiYiwaFeknvVZ1jv2xHGwLne8dgl9Pgv9PQPY5MyYCdLw0+V1UV8tczBqVA6nKJAv6qU
 XathcHWvIfnuur48jmFSGuCdCpC8ybATOc4BBlFZDG2J7mvo0/+na8dswDC7bxIlg3nQ=
X-Received: by 2002:a05:6402:2741:b0:434:fe8a:1f96 with SMTP id
 z1-20020a056402274100b00434fe8a1f96mr4825508edd.331.1655368369008; 
 Thu, 16 Jun 2022 01:32:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sV3SU/25PS0i5q3L1DcTOeXfPrXE5cN7RkiB5xQIcpaOW6h+RZTVpkUH4Mi+jqSKwYZdhb2Q==
X-Received: by 2002:a05:6402:2741:b0:434:fe8a:1f96 with SMTP id
 z1-20020a056402274100b00434fe8a1f96mr4825488edd.331.1655368368753; 
 Thu, 16 Jun 2022 01:32:48 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a17090631d000b006f3ef214d9fsm500288ejf.5.2022.06.16.01.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 01:32:48 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>
Subject: [PULL 18/21] build: fix check for -fsanitize-coverage-allowlist
Date: Thu, 16 Jun 2022 10:32:06 +0200
Message-Id: <20220616083209.117397-19-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220616083209.117397-1-pbonzini@redhat.com>
References: <20220616083209.117397-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

The existing check has two problems:
1. Meson uses a private directory for the get_supported_arguments check.
./instrumentation-filter does not exist in that private directory (it is
copied into the root of the build-directory).

2. fsanitize-coverage-allowlist is unused when coverage instrumentation
is not configured. No instrumentation are passed for the
get_supported_arguments check

Thus the check always fails. To work around this, change the check to an
"if cc.compiles" check and provide /dev/null, instead of the real
filter.

Meson log:
Working directory:  build/meson-private/tmpl6wld2d9
Command line:  clang-13 -m64 -mcx16
build/meson-private/tmpl6wld2d9/output.obj -c -O3 -D_FILE_OFFSET_BITS=64
-O0 -Werror=implicit-function-declaration -Werror=unknown-warning-option
-Werror=unused-command-line-argument
-Werror=ignored-optimization-argument
-fsanitize-coverage-allowlist=instrumentation-filter

Error:
error: argument unused during compilation:
'-fsanitize-coverage-allowlist=instrumentation-filter'

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Message-Id: <20220614155415.4023833-1-alxndr@bu.edu>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index 21cd949082..fe5d6632fb 100644
--- a/meson.build
+++ b/meson.build
@@ -209,9 +209,13 @@ if get_option('fuzzing')
   configure_file(output: 'instrumentation-filter',
                  input: 'scripts/oss-fuzz/instrumentation-filter-template',
                  copy: true)
-  add_global_arguments(
-      cc.get_supported_arguments('-fsanitize-coverage-allowlist=instrumentation-filter'),
-      native: false, language: ['c', 'cpp', 'objc'])
+
+  if cc.compiles('int main () { return 0; }',
+                  name: '-fsanitize-coverage-allowlist=/dev/null',
+                 args: ['-fsanitize-coverage-allowlist=/dev/null'] )
+    add_global_arguments('-fsanitize-coverage-allowlist=instrumentation-filter',
+                         native: false, language: ['c', 'cpp', 'objc'])
+  endif
 
   if get_option('fuzzing_engine') == ''
     # Add CFLAGS to tell clang to add fuzzer-related instrumentation to all the
-- 
2.36.1



