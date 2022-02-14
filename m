Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD884B5A6D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 20:08:39 +0100 (CET)
Received: from localhost ([::1]:42868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJgiD-0000yX-Qg
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 14:08:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgWj-00006d-PZ; Mon, 14 Feb 2022 13:56:45 -0500
Received: from [2607:f8b0:4864:20::42a] (port=41777
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJgWi-0006MR-9Y; Mon, 14 Feb 2022 13:56:45 -0500
Received: by mail-pf1-x42a.google.com with SMTP id c10so5218538pfv.8;
 Mon, 14 Feb 2022 10:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nu4DUrbIWXAn4pHgWXMlADFVEGOdcq7Po3cgGBBjqHs=;
 b=WN9LTkgMPtLDK1/kr7k/EjCOikKvkFG6wyPDu8Z0tOkn73QQE5y8JxPthZK8xcW9Wn
 WXVL8MC2RYRC5rPpudQGcd9tftgDPC2eAP3HLZ9rjPEfxCsMYmgp5R9mJzi89/cZl/yg
 7NjieC8q9u1Wdbq1S0qwtcrQJ581fFPXEbbGhoopxyiMt6gK4esYm1tFrIfU2gJe0UQZ
 SmqOnGKFfeujBxcPMaPJt9gdGeVl6L7gkCCHX6yUzTF2BJMjFe2cfZEB7vpRRc9Er6lf
 57P23X9eElhADQwSz9+xprL4Ju0kKdI3G790KuWnobZzzTvHHWnfVtQqWujyCCZd4mQp
 Phew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Nu4DUrbIWXAn4pHgWXMlADFVEGOdcq7Po3cgGBBjqHs=;
 b=viapL9BdXQRLiaVkS+HRc/LJHHdWk8P9bSTlZeuNCQpLFQVEbQELLjzTG6fg7m/CiH
 1QRfSXVaj0FengsUiX6G03U9mgRP4Aet6FrY8iFLkCTnKaeIKipU2iUInsyyakfnXlYZ
 VrWDQXglAH/oofSvkp33ZYVuo7U2jr8CNizKkDrBxF8LHV4la2FyvkMsqEnArrqX2hdM
 Mmg/aAf5zRbcp3VOqVyAC8c5Vk3LPu4Hmflh7L+EIWjcGD8O/wbPG14PmuZldBCv3JLr
 3Is2YXsfWgv45GsZDIsfO9PPzcnSHwyA5IOpyhusI/BoHp8CiodKNavUZZuUxywvlwY+
 l9fA==
X-Gm-Message-State: AOAM532uxHDq0IacncwmY222I14JVKpxY5B+LGKoe+bIFWYGhOL/dk6l
 /GFg0tAA155gd15wpYe1pT5FKasgXcw=
X-Google-Smtp-Source: ABdhPJzGw0FVSlgztDJueOnV+E1lqcvvttKcW/UmDZBBS56sB3jQ0l4gLc5gPUibKleqX40D6Z08iQ==
X-Received: by 2002:a62:1ec7:: with SMTP id e190mr51268pfe.66.1644865002624;
 Mon, 14 Feb 2022 10:56:42 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id 13sm36456481pfm.161.2022.02.14.10.56.38
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Feb 2022 10:56:42 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Will Cohen <wwcohen@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Li Zhang <lizhang@suse.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v5 03/16] tests/fp/berkeley-testfloat-3: Ignore ignored
 #pragma directives
Date: Mon, 14 Feb 2022 19:55:52 +0100
Message-Id: <20220214185605.28087-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220214185605.28087-1-f4bug@amsat.org>
References: <20220214185605.28087-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Since we already use -Wno-unknown-pragmas, we can also use
-Wno-ignored-pragmas. This silences hundred of warnings using
clang 13 on macOS Monterey:

  [409/771] Compiling C object tests/fp/libtestfloat.a.p/berkeley-testfloat-3_source_test_az_f128_rx.c.o
  ../tests/fp/berkeley-testfloat-3/source/test_az_f128_rx.c:49:14: warning: '#pragma FENV_ACCESS' is not supported on this target - ignored [-Wignored-pragmas]
  #pragma STDC FENV_ACCESS ON
               ^
  1 warning generated.

Having:

  $ cc -v
  Apple clang version 13.0.0 (clang-1300.0.29.30)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/fp/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/fp/meson.build b/tests/fp/meson.build
index 59776a00a7..5192264a08 100644
--- a/tests/fp/meson.build
+++ b/tests/fp/meson.build
@@ -30,6 +30,7 @@ tfcflags = [
   '-Wno-implicit-fallthrough',
   '-Wno-strict-prototypes',
   '-Wno-unknown-pragmas',
+  '-Wno-ignored-pragmas',
   '-Wno-uninitialized',
   '-Wno-missing-prototypes',
   '-Wno-return-type',
-- 
2.34.1


