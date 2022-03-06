Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A83174CEE60
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 00:20:26 +0100 (CET)
Received: from localhost ([::1]:37462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR0Ar-00011z-NM
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 18:20:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR08f-0006KB-TV; Sun, 06 Mar 2022 18:18:10 -0500
Received: from [2a00:1450:4864:20::42e] (port=37389
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR08e-0007L0-IC; Sun, 06 Mar 2022 18:18:09 -0500
Received: by mail-wr1-x42e.google.com with SMTP id q14so5105462wrc.4;
 Sun, 06 Mar 2022 15:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/n/kp/EEzr/qAon/GdLY35mCaB/pGz6v6JFGGwXRBP4=;
 b=C0W5U2YuG2OrjxgScBW+VzEe5rWVw64MPCGaghWgtDj9WYrTGc3Yj2I8bn3UCqnSNX
 51XY+iX9vnDINj5/P2ytv5kagB5zOnycr93nb7vQCwRbFuGhTJkZopA8faTwjPc5Q6S8
 YONFiMHghToFziP09ynrWTaZsA2trb98FJT/7qUZPECA1bf8XXay/5gCztjsk4+GGEOd
 axa/KUYXnnUnQo1p1KAHvIThxzNNLfwP+gvoVip5Vc+CCkMsYzgLixxQFnqR1hJEwAo5
 v/2UB8gsnyPa/fO3MOCiDpc9u7Id2UZCxC0/mocbTYrlMT1CMr95DxSS2Q5+AomTeoil
 uK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/n/kp/EEzr/qAon/GdLY35mCaB/pGz6v6JFGGwXRBP4=;
 b=i4XDg6abZkV+C4BewbagKL9kk/+PReizbuhtAnPiFlVNS78kOH1LgMZ4LfVY6quKt+
 ol4UjK2rzvkLvgHwj82oMBSKt+KgEx+/0YG/4fy0OLyrxb/+fyetiiE4Bdqc20yZpiMG
 OI8dTteRm7dwHzieyBa8uQAVzmdLrxwOvR1UafqrC0HfnpPdqoP5c4n0mhLnOJtc0sph
 Hv9eC/uTcSUnGQCZpvVIBYzBdqyr2/esju7F5loGkBB8fSwNbxLpklyKMwEgAwXIVJdK
 le0eZh14q0uTxzreywxKhTRSfdFm09KJJP6yVyriDd8PwvIfjPrx0ykr8PhHjl+W52C3
 CbRw==
X-Gm-Message-State: AOAM530sxLEXRUC9nY2eSfyFLE+N9DOJwweWIPKpU3PuzfDbtw9jQaeo
 umL5M+u4E5mFY4y4A/4fndN07UV0qJY=
X-Google-Smtp-Source: ABdhPJyu+FvKzRahj2WTzb8KJbelZAGrL7HvBmRld+qKI9uJ9FpOQZryp2AQLbZEHncgA3/bpmdZtQ==
X-Received: by 2002:adf:db82:0:b0:1ed:bf4b:e327 with SMTP id
 u2-20020adfdb82000000b001edbf4be327mr6220407wri.527.1646608686406; 
 Sun, 06 Mar 2022 15:18:06 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a7bcb17000000b0037bdfa1665asm27125392wmj.18.2022.03.06.15.18.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Mar 2022 15:18:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 02/22] tests/fp/berkeley-testfloat-3: Ignore ignored
 #pragma directives
Date: Mon,  7 Mar 2022 00:17:33 +0100
Message-Id: <20220306231753.50277-3-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Will Cohen <wwcohen@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Roman Bolshakov <roman@roolebo.dev>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

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

Reported-by: Roman Bolshakov <roman@roolebo.dev>
Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/fp/meson.build | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/fp/meson.build b/tests/fp/meson.build
index 59776a00a7..8bd0979f67 100644
--- a/tests/fp/meson.build
+++ b/tests/fp/meson.build
@@ -37,6 +37,11 @@ tfcflags = [
   '-Wno-error',
 ]
 
+if cc.get_id() == 'clang'
+  # Clang does not support '#pragma STDC FENV_ACCESS'
+  tfcflags += [ '-Wno-ignored-pragmas' ]
+endif
+
 tfgencases = [
   tfdir / 'genCases_ui32.c',
   tfdir / 'genCases_ui64.c',
-- 
2.34.1


