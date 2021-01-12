Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 058CE2F370A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:27:32 +0100 (CET)
Received: from localhost ([::1]:47164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNS7-0000mi-0o
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:27:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzN00-00022v-Lw
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:58:29 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:36618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzMzw-00074C-Hx
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 11:58:27 -0500
Received: by mail-wm1-x330.google.com with SMTP id y23so2793842wmi.1
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 08:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=4AiUv8vR/uQVbGFxL8A/0x9RYxkd9rCpT0os8VNsY9I=;
 b=vhad0Sw6NPGqfoGQFMUlYNYERWtuGbtxw6ZuvE9oOh6IAN3x/zbhnJuDQtsm3dwU0L
 g+HldsgJ8GKSOGnX3SP8eQ60fHQruRbCELC/ZEHqcKhfb/uvtzasG+izr3x5/K3Uv68/
 n0APx5ZL2boiKO9MBR0ZOApDcX6d8Tnqm4uXVS00koIALVgQQhfhSNnJau5hUfOKlT//
 7zlQJKLzV9VLWd4OLWxqb4jwelLW/tAzA+HdGeb7zSvcEKWlNlt7kvNWo+2fVsyDpDDh
 TkS1JhO+PhOOtiVZMhTAPNZx8K1EoDYpmqVMIgm9pe+05X4UA1wli6qgwSII+brDX01P
 yaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4AiUv8vR/uQVbGFxL8A/0x9RYxkd9rCpT0os8VNsY9I=;
 b=jdjFQqInGuxmz9k7Uj1Vrlbsx43VrqQ6c6C3bwrKusUL0W3SbZhSdudmgxcIIGjQIB
 vXkuIrGcnyV3XeXyZdOTdopNEIRFGxH7qQI/FzgDWJ7YoKs/ZDmIzFyh2WT2+rYyDoGF
 mNSNaNvsd20GaQrJOlAo+I9PJoKmWUj6FPt0saTvrqzmYgK29yK224ytT+PEwntcKNGV
 vsL33/ZHFz89x9gwH+J2gAPD/5uADI2/ak0Gid3FIqx/PRrNR34LIkqsfm2MGI77NePu
 vnFZG9f1UDi9YlXCzbF3OxzFJ1BbPV0IOZaSBYtavSERlR9rsYt/F+aRJp+xunkBhywU
 feIQ==
X-Gm-Message-State: AOAM533LDpjF1H+h67z++8L6FbSpQsL9JrlWZDjT/osqqtiKvOwGtyGA
 of6Q0hehHI2/OJU+9SU3A+PcIs2LP1zhYw==
X-Google-Smtp-Source: ABdhPJy4WJaf8sYfECrV+zkTrzGIrpuENRcktaJDPI5tcMrSNDy2sRw9DmLXEw88oBVUza9+gX11ag==
X-Received: by 2002:a05:600c:22d7:: with SMTP id 23mr193774wmg.7.1610470699409; 
 Tue, 12 Jan 2021 08:58:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i18sm6210083wrp.74.2021.01.12.08.58.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 08:58:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/21] ui/cocoa: Fix openFile: deprecation on Big Sur
Date: Tue, 12 Jan 2021 16:57:50 +0000
Message-Id: <20210112165750.30475-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210112165750.30475-1-peter.maydell@linaro.org>
References: <20210112165750.30475-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

From: Roman Bolshakov <r.bolshakov@yadro.com>

ui/cocoa.m:1188:44: warning: 'openFile:' is deprecated: first deprecated in macOS 11.0 - Use -[NSWorkspace openURL:] instead.
      [-Wdeprecated-declarations]
        if ([[NSWorkspace sharedWorkspace] openFile: full_file_path] == YES) {
                                           ^
/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/AppKit.framework/Headers/NSWorkspace.h:350:1: note:
      'openFile:' has been explicitly marked deprecated here
- (BOOL)openFile:(NSString *)fullPath API_DEPRECATED("Use -[NSWorkspace openURL:] instead.", macos(10.0, 11.0));
^

Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20210102150718.47618-1-r.bolshakov@yadro.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 ui/cocoa.m | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index e913a514455..13fba8103e1 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1178,6 +1178,7 @@ QemuCocoaView *cocoaView;
     /* Where to look for local files */
     NSString *path_array[] = {@"../share/doc/qemu/", @"../doc/qemu/", @"docs/"};
     NSString *full_file_path;
+    NSURL *full_file_url;
 
     /* iterate thru the possible paths until the file is found */
     int index;
@@ -1186,7 +1187,9 @@ QemuCocoaView *cocoaView;
         full_file_path = [full_file_path stringByDeletingLastPathComponent];
         full_file_path = [NSString stringWithFormat: @"%@/%@%@", full_file_path,
                           path_array[index], filename];
-        if ([[NSWorkspace sharedWorkspace] openFile: full_file_path] == YES) {
+        full_file_url = [NSURL fileURLWithPath: full_file_path
+                                   isDirectory: false];
+        if ([[NSWorkspace sharedWorkspace] openURL: full_file_url] == YES) {
             return;
         }
     }
-- 
2.20.1


