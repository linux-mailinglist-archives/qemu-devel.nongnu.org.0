Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B784D7EEC
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 10:44:34 +0100 (CET)
Received: from localhost ([::1]:49714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nThFh-00008y-Kz
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 05:44:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3p-00085A-TJ; Mon, 14 Mar 2022 05:32:18 -0400
Received: from [2a00:1450:4864:20::335] (port=41860
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nTh3o-000862-1H; Mon, 14 Mar 2022 05:32:17 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 7-20020a05600c228700b00385fd860f49so9255021wmf.0; 
 Mon, 14 Mar 2022 02:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EPtGpaZDJxpeZcBYRXdbW8UrBo+5MZXYIoQz3sFLUQM=;
 b=n1sRa/OUl1U6RriBah+4QMmenl/jw9elqVz70Mm64iHaWJCTCJq7pCOayd3kis6mb1
 /HVOZYMFCyLziiImYVQy7f+2fdORTvTbG5PsqjvqO2rkSnKo43kIZ5XGtJdicgUK+tIm
 rxiiViSbZ7QP9Ud+UAN7yzTohcx50d8hZTjyuA88Oz1Ax1PIa07b4SwNaJHMZEhgpwae
 hQ7xMFnZpuAPkxf/j9tXdOWKwqkN1bawPpEOLiLJP7dqv3qj2U6DwlGkySbgjHVESaW2
 MHfQFRDGdB9LFQQf0EdwWkVrRuxzyJM0yPV03uukBjrkkumrUCEvmssmMGFFNuR2NaEp
 PrQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=EPtGpaZDJxpeZcBYRXdbW8UrBo+5MZXYIoQz3sFLUQM=;
 b=Js6wri8MYqTt30r9nq3kSWX7OyigB3DDRaEAc7hYE8UI105g0/jUSSuRmeeUFfJSZT
 lX0WNvfrp8ZWtkV/f5VHkwhqB5xjNFKdH/fsdFqOi8/dGcUnYFD4li4i+5firSojvgYd
 B5X/8O8NEPdYix3fuTW4YI2Y6QMrhENwBPasyXz+3wCYwVgsVj8+CMo8QjAOg4vXsYUY
 HDhygwAIQnlp/4ffACX8lNe2eXhOgFbQ1E8/uwCPDvo+Odpn2BNe6FrmPs72w4kJDLxb
 e/F642pX/GSdSBDqKYLPDjYWl7rwQolKDeCnqpbT9FP0cdzqSMVKLV3GwwYOQsW2kOmr
 LP8A==
X-Gm-Message-State: AOAM530JvoncxraGBPhRpZ/9CzROMH8tOfrJqjVmY0RFVnV6Y6yElDqG
 5SA74C/8uZahOdg77Czrk5XC9O54hu4=
X-Google-Smtp-Source: ABdhPJxwBug5TfHrp9f0qVT3Py7ISWc5szQofvBfcW0JrZZ0v5jON2WR/+LexBsLn8QZpGTaE/oSFA==
X-Received: by 2002:a05:600c:3589:b0:389:cf43:eaf7 with SMTP id
 p9-20020a05600c358900b00389cf43eaf7mr16764103wmq.200.1647250334252; 
 Mon, 14 Mar 2022 02:32:14 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l7-20020adfe9c7000000b001f06f8ec92dsm12707517wrn.30.2022.03.14.02.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 02:32:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH experiment 11/16] bump to C++20
Date: Mon, 14 Mar 2022 10:31:58 +0100
Message-Id: <20220314093203.1420404-12-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314093203.1420404-1-pbonzini@redhat.com>
References: <20220314093203.1420404-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, hreitz@redhat.com, berrange@redhat.com,
 qemu-block@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 4 ++--
 meson.build | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index 886000346a..091710ec03 100755
--- a/configure
+++ b/configure
@@ -157,8 +157,8 @@ update_cxxflags() {
     # Set QEMU_CXXFLAGS from QEMU_CFLAGS by filtering out those
     # options which some versions of GCC's C++ compiler complain about
     # because they only make sense for C programs.
-    QEMU_CXXFLAGS="-D__STDC_LIMIT_MACROS -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS"
-    CONFIGURE_CXXFLAGS=$(echo "$CONFIGURE_CFLAGS" | sed s/-std=gnu11/-std=gnu++11/)
+    QEMU_CXXFLAGS="-D__STDC_LIMIT_MACROS -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -fcoroutines"
+    CONFIGURE_CXXFLAGS=$(echo "$CONFIGURE_CFLAGS" | sed s/-std=gnu11/-std=gnu++20/)
     for arg in $QEMU_CFLAGS; do
         case $arg in
             -Wstrict-prototypes|-Wmissing-prototypes|-Wnested-externs|\
diff --git a/meson.build b/meson.build
index 2d6601467f..810ebb0865 100644
--- a/meson.build
+++ b/meson.build
@@ -1,5 +1,5 @@
 project('qemu', ['c'], meson_version: '>=0.59.3',
-        default_options: ['warning_level=1', 'c_std=gnu11', 'cpp_std=gnu++11', 'b_colorout=auto',
+        default_options: ['warning_level=1', 'c_std=gnu11', 'cpp_std=gnu++20', 'b_colorout=auto',
                           'b_staticpic=false', 'stdsplit=false'],
         version: files('VERSION'))
 
-- 
2.35.1



