Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A8755500C
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 17:53:29 +0200 (CEST)
Received: from localhost ([::1]:44160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o42fY-0001Z0-77
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 11:53:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1o42dR-0000MB-U5
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 11:51:18 -0400
Received: from esa3.hc2706-39.iphmx.com ([68.232.154.118]:20064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1o42dP-0002gz-Se
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 11:51:17 -0400
X-IronPort-RemoteIP: 209.85.219.72
X-IronPort-MID: 207167379
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:proT+6zZAynwoBeL6b96t+e8xCrEfRIJ4+MujC+fZmUNrF6WrkUAx
 mRNWz2BOPnYM2agcot1bY6zp05S6sXWx4VlHVFu+y00HyNBpPSeOdnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ74f5fs7Rh2NQw34LjW1nlV
 e7a+KUzBnf0g1aYDUpJs8pvmDs31BglkGpF1rCWTakjUG72zhH5PrpGTU2CByKQrr1vIwKPb
 72rIIdVX4/u10xF5tuNyt4Xe6CRK1LYFVHmZnF+AsBOjvXez8CbP2lS2Pc0MC9qZzu1c99Z4
 chCqL+eWRkSIY7okeo+bDhVSiRcBPgTkFPHCSDXXc27ykTHdz713awrAh5se4If/elzDCdF8
 vlwxDIlNEjSwbLrhujiG68z3KzPL+GyVG8bknhk3TfVF94sXNbOT7iiCdpwhm9v354RRqmPD
 yYfQQphQxmdTBFgBm0SUag5scXy2lPHYSIN/Tp5ooJyuQA/1jdZybXoLZ/Zd8KHQe1TmUCXo
 H+A+H72aiz2L/SawDuBt2uy36rBwnm9V4UVG7m1sPVthTV/21AuNfHfbnPjydHRt6J0c403x
 5A8ksb2kZUPyQ==
IronPort-HdrOrdr: A9a23:sqOmOKwmjLQcP80duJ06KrPw9r1zdoMgy1knxilNoNJuA6ilfq
 eV7Y4mPHrP4gr5N0tQ/+xoVJPwI080lqQFmrX5Q43SJTUO0VHAROoSjrcKqweBJ8SUzJ876U
 4PSdkaNPTASXJXt4LV2jWZLvoX6OW70cmT9JrjJrRWIT2CqZsM0+60MGim+zVNNXF77FMCe/
 uh2vY=
Received: from mail-qv1-f72.google.com ([209.85.219.72])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Jun 2022 11:50:38 -0400
Received: by mail-qv1-f72.google.com with SMTP id
 x18-20020a0ce252000000b004703cbb92ebso10492566qvl.21
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 08:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=alV3veEVLq3l6rhyfa2SDb0TamyeFKfvcX8noGrvH4k=;
 b=jRAwYqAaFPasVLb5eHoQb93bGjdkqXYAJjkIVINpqbzWspJS54tRfMbTOvL0bQ058q
 rzy0AiMUmXlOFiuhJ0pK+v4P84gR/sLwwWlPQgfQ0GUMybZRjlMoYHALrhg9F1gAVWsv
 tO/35QWQQdKC3X5CH9J6T4DDGn472pUE0nO543G+tmwaWGKuhJWhrZfsHn+th0OTCgMP
 9qhY3yoAUwQnF1gEtT45Zab5c/61/JvuzLVvwIW+Y7WV+SnPE+TRGtT2JFZF8mpiqw8O
 tNPu7AkFdtebz2wWZ6xAiNJy4KrJDADZoBjDjw9o/t1RAxFnFk8cVeNi+7zXwlvyPs/+
 ny8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=alV3veEVLq3l6rhyfa2SDb0TamyeFKfvcX8noGrvH4k=;
 b=NfG47HbevXXwZ1KogiqcDtn0VwMmfPdVcxO7u52EHEaU0cTa7rEtoGwfQXmS+rL9L5
 rxDZsGqC42bS8RrTduiMhPNhLa9TUaR6wTytfgwCt6rizB5Ph1C0fBqt49HOXw6b5Ew4
 2vVoNgQsBVTfAap6rq3hd3Wl96h04VRxw62zN69vB3Gdmy3JBuxNaaBzZIquCUCpbGTL
 mWmdKQ+4JWZSk2jX1Gt3VZ38xZlfhSiqbafIZVEGlMAl7PDIpZzF5oDzAhNy5UnCkbMj
 SIs0fLpyZSbpDAhCSO9SfJsRT7go5gTFKIj8674MByOK8co4deDqA+OMxY3zY6EgZx3w
 CJQA==
X-Gm-Message-State: AJIora/ehec/cCU/+SkLnkgAojayjXH/rsYV7pPLUH9IB/WEE61aumxs
 H8dFlx0OmN7snlpe2mcHH2DTVHDN+/IJ7sXWEj3siYp+9EOZ5Om8NwebggIcs0MBApZZfSzHtS+
 fH3/cqX0HF2OAwyBHmTj3g+F9L8QpIA==
X-Received: by 2002:ac8:7d85:0:b0:316:80e9:d792 with SMTP id
 c5-20020ac87d85000000b0031680e9d792mr2158153qtd.590.1655913037726; 
 Wed, 22 Jun 2022 08:50:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t6sIROhytSw7Pc7bEzhiHPM4ZIQsFGLjh6BBBJMXdvKTCZXQsOU6G7+jfYs2mimsBPaGxNgQ==
X-Received: by 2002:ac8:7d85:0:b0:316:80e9:d792 with SMTP id
 c5-20020ac87d85000000b0031680e9d792mr2158130qtd.590.1655913037452; 
 Wed, 22 Jun 2022 08:50:37 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 m14-20020a05620a290e00b006a6b498e23esm18017427qkp.81.2022.06.22.08.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 08:50:36 -0700 (PDT)
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: [PATCH] fuzz: only use generic-fuzz targets on oss-fuzz
Date: Wed, 22 Jun 2022 11:50:28 -0400
Message-Id: <20220622155028.2086196-1-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=68.232.154.118; envelope-from=alxndr@bu.edu;
 helo=esa3.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The non-generic-fuzz targets often time-out, or run out of memory.
Additionally, they create unreproducible bug-reports. It is possible
that this is resulting in failing coverage-reports on OSS-Fuzz. In the
future, these test-cases should be fixed, or removed.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 scripts/oss-fuzz/build.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
index 98b56e0521..d8b4446d24 100755
--- a/scripts/oss-fuzz/build.sh
+++ b/scripts/oss-fuzz/build.sh
@@ -105,7 +105,7 @@ do
     # to be configured. We have some generic-fuzz-{pc-q35, floppy, ...} targets
     # that are thin wrappers around this target that set the required
     # environment variables according to predefined configs.
-    if [ "$target" != "generic-fuzz" ]; then
+    if echo "$target" | grep -q "generic-fuzz-"; then
         ln  $base_copy \
             "$DEST_DIR/qemu-fuzz-i386-target-$target"
     fi
-- 
2.27.0


