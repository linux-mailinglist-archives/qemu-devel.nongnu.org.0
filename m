Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D89B84E2E69
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 17:45:08 +0100 (CET)
Received: from localhost ([::1]:51042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWL9X-0000qH-SG
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 12:45:07 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nWL7L-0007AX-HP
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:42:51 -0400
Received: from [2a00:1450:4864:20::52f] (port=43859
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nWL7J-0007d2-LL
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 12:42:51 -0400
Received: by mail-ed1-x52f.google.com with SMTP id b24so18539827edu.10
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 09:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sk8pvpH+MlV1NIvcix5A72DAjg7Ob/Kh/1bdPx8dB0c=;
 b=fusprzqZG38XonKXSZRkoquCFKBLWPTSn/oetoy4dnif9Xfb5RBPgKIP5sNn+y66oz
 DcFEp5rmfYrtT/M3Z2JRh5/LYxEwX7hIwjhw/4mxrolJcYnEZ7X/VnvkXQoK++bMwfJS
 MAdmCzd/gPiXE5+xYcjCSPZjQhcN8BGpBo/A6xpAD9SZWtnU+CptnPenPoIk86VFeoPg
 SRfJfRGCN1z7SjWsk524bq3J/xo4DBVQGuEVJizBr8Haq8zl+v9gRSY0s9m2j7c9Y/xw
 o+pBszlFDMvP4dr8QhacgWTazXjNxb5LerVtkHQL93dmbs6oEtWVNt90w7ws+OK4Xevr
 NMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Sk8pvpH+MlV1NIvcix5A72DAjg7Ob/Kh/1bdPx8dB0c=;
 b=40HYFnksmztqZHNiC3B1GNOqnuiscYa8L2xQYNTdCnCewdjxzm/DlNmP8F17NZh/JV
 qaz4DlxifGNxHLJbT6ZTp0cKOY0F8lUyKhohoP14McamFHuYfTGvhknnL6u58iVAtZrq
 1Jbw27vkd3y+LnuAo/hln46k1IzrdPCK7KnK55qpb+pPiZ21ISARVsULd8iAzt9ZbnkF
 CfQqizsY8L3D6W8Y0X6Ez+IIuUy/YjNpamf6JyD6PGBNCeHmqaiSfsI3wn9ysLUsTe2J
 5pUoGhvSCnl/DWKWFoTmXTwpc3CnYUBzstMTjCdkK4qfMMLUrtTCfVqrRPdSM9TTPS5U
 +H/g==
X-Gm-Message-State: AOAM533c1A8KyjIoGkQsnj+QKtL+ubee4L7p7rdUJAYZ0IFiUilB+ZVR
 ijQhiz87FYWipcxYo0Zrp5xjLJALrTw=
X-Google-Smtp-Source: ABdhPJyRoiVPlXr+lmJzBa5FWItGyeGlZLg5g46PRo/zEfKsq53AJrCsWMTLpC4irN9/u3SMUrPlcg==
X-Received: by 2002:a05:6402:d0e:b0:418:f011:275e with SMTP id
 eb14-20020a0564020d0e00b00418f011275emr23507330edb.323.1647880968342; 
 Mon, 21 Mar 2022 09:42:48 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a50d802000000b00410d7f0c52csm8289385edj.8.2022.03.21.09.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 09:42:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] qapi-schema: test: add a qapi-schema-test for array
 alternates
Date: Mon, 21 Mar 2022 17:42:42 +0100
Message-Id: <20220321164243.200569-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220321164243.200569-1-pbonzini@redhat.com>
References: <20220321164243.200569-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
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
Cc: armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Check that conflicts among array alternates are detected correctly.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qapi-schema/alternate-conflict-lists.err  | 2 ++
 tests/qapi-schema/alternate-conflict-lists.json | 6 +++++
 tests/qapi-schema/alternate-conflict-lists.out  | 0
 tests/qapi-schema/meson.build                   | 1 +
 4 files changed, 8 insertions(+)
 create mode 100644 tests/qapi-schema/alternate-conflict-lists.err
 create mode 100644 tests/qapi-schema/alternate-conflict-lists.json
 create mode 100644 tests/qapi-schema/alternate-conflict-lists.out

diff --git a/tests/qapi-schema/alternate-conflict-lists.err b/tests/qapi-schema/alternate-conflict-lists.err
new file mode 100644
index 0000000000..288b75a2ff
--- /dev/null
+++ b/tests/qapi-schema/alternate-conflict-lists.err
@@ -0,0 +1,2 @@
+alternate-conflict-lists.json: In alternate 'Alt':
+alternate-conflict-lists.json:5: branch 'two' can't be distinguished from 'one'
diff --git a/tests/qapi-schema/alternate-conflict-lists.json b/tests/qapi-schema/alternate-conflict-lists.json
new file mode 100644
index 0000000000..90710da115
--- /dev/null
+++ b/tests/qapi-schema/alternate-conflict-lists.json
@@ -0,0 +1,6 @@
+# Two lists conflict even if their inner types would be compatible
+{ 'struct': 'One',
+  'data': { 'name': 'str' } }
+{ 'alternate': 'Alt',
+  'data': { 'one': [ 'int' ],
+            'two': [ 'str' ] } }
diff --git a/tests/qapi-schema/alternate-conflict-lists.out b/tests/qapi-schema/alternate-conflict-lists.out
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index caf0791ba8..c18dd7d02f 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -11,6 +11,7 @@ schemas = [
   'alternate-conflict-dict.json',
   'alternate-conflict-enum-bool.json',
   'alternate-conflict-enum-int.json',
+  'alternate-conflict-lists.json',
   'alternate-conflict-string.json',
   'alternate-conflict-bool-string.json',
   'alternate-conflict-num-string.json',
-- 
2.35.1



