Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CE64D9C0A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 14:21:11 +0100 (CET)
Received: from localhost ([::1]:50422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU76s-0006dn-VC
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 09:21:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6in-0005tb-K0
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:56:17 -0400
Received: from [2607:f8b0:4864:20::434] (port=40917
 helo=mail-pf1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6im-0008Gz-3D
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:56:17 -0400
Received: by mail-pf1-x434.google.com with SMTP id d19so12239726pfv.7
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=szNpCULTdSVW6/SnQzOqZ1askH+O+tpqopbhblHKbSM=;
 b=CUxmM3FMqmt5HN3dQTIto35KC3jr+nILU/t9RJxMtBM1/nqxOcHpXsQT6U+Ms+xeOs
 gY/V1M3Nk8sdhZbckAvXFiP/gm8HR8Iuvep/aMJuJUYCEbKHYEOVMVA/hQR9LE2JlaqJ
 +QrF6LXsNlpww3cS57ChP2icY64SwABJyUqhK0pi9cBsiYoK67GmERrDZNqRW9na8ZM6
 2TcR3D4aXUtnVo3NwbKqvAOJjxi3Xh+erErBBR9U1HZaiZBfgBn/DUTOZHLgPSLwk4eQ
 X7CWffsMGm/T5whYUjmjuDHhuUzT0UviHuc0ayhofGlWJZhntjV4vY/iPRWfobAL7eid
 28YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=szNpCULTdSVW6/SnQzOqZ1askH+O+tpqopbhblHKbSM=;
 b=aKKk2basoBASLYfpzEodbKJfLiTAA2rbqfeaR/ngrBrLb+v3vNNbbm5cIm7uELhGXA
 C6MOaWqehrrUW7Jg9vUUjIfxgsWd10X1A0yqr5hmonVRoe8OPc6mRCTSsjY/QtX0hDiG
 tjGg+ZnFPnC+dX0dOT9ReEbbzRpFnkO9RJmv8DWoqypWl/YgrC5WGUrwbTFig9CjFndI
 q8IgIXyvZbP5HjbiiqiBvtuDJl8VfKVoxcWGV7x384CXBVy8Cy/BkaHarN8kNBmNZ0W/
 yRd3ZlwHv3rMEoAtUEV1DFBbAuft4tX3uMWyO4O6KQ/13Rj9GURtUJ85iPxHNMZgh+yy
 ghGg==
X-Gm-Message-State: AOAM532ApyxW2H6xadOO6Y06Hukw++XQWqwFkDMHl0lyyo+Rbygdh4F0
 Lz8dxSqpvAVr9EtgQdA3QYe6Jj8fd7U=
X-Google-Smtp-Source: ABdhPJyfiIiA7Vnb4RgLoScuq9De/tTOOJY6LBljFbTj5zzZn+6kogf+98x3SVR6VAljty/JYxy3BQ==
X-Received: by 2002:a63:5747:0:b0:381:54b9:b083 with SMTP id
 h7-20020a635747000000b0038154b9b083mr4347776pgm.178.1647348974632; 
 Tue, 15 Mar 2022 05:56:14 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 s21-20020a63dc15000000b00378c9e5b37fsm19158234pgg.63.2022.03.15.05.56.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Mar 2022 05:56:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/21] ui/cocoa: Constify qkeycode translation arrays
Date: Tue, 15 Mar 2022 13:53:45 +0100
Message-Id: <20220315125350.82452-17-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
References: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::434
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x434.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 ui/cocoa.m | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index c88149852b..a66ba3d7b6 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -671,7 +671,7 @@ QemuCocoaView *cocoaView;
 
     /* translates Macintosh keycodes to QEMU's keysym */
 
-    int without_control_translation[] = {
+    static const int without_control_translation[] = {
         [0 ... 0xff] = 0,   // invalid key
 
         [kVK_UpArrow]       = QEMU_KEY_UP,
@@ -686,7 +686,7 @@ QemuCocoaView *cocoaView;
         [kVK_Delete]        = QEMU_KEY_BACKSPACE,
     };
 
-    int with_control_translation[] = {
+    static const int with_control_translation[] = {
         [0 ... 0xff] = 0,   // invalid key
 
         [kVK_UpArrow]       = QEMU_KEY_CTRL_UP,
-- 
2.34.1


