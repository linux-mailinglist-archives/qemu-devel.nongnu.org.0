Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E57944D9BC6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 14:04:57 +0100 (CET)
Received: from localhost ([::1]:40254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU6r7-0005TG-Q2
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 09:04:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6i8-0005QB-Dr
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:55:36 -0400
Received: from [2607:f8b0:4864:20::431] (port=39781
 helo=mail-pf1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nU6i6-0008AI-GP
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:55:36 -0400
Received: by mail-pf1-x431.google.com with SMTP id h2so15530232pfh.6
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ldn2Z6B3k3Plt1cJVie4T8Wt19hcp59Igf8ZqI/jiUE=;
 b=Rte72YRN+lAsESV89Z25RtrpkBvAcfUaul4iVNjO/qbKpdNLnEQNsPthtdH3gol4kq
 0MfMUMogqoSYZXEBuxanFUUQUalVDo20scmQl74N96C51J360TGGASOmaAkFQ9x+cgY9
 VQbjq+I4CgKAt3FYYSmOTf+O+8bzGQkWZ1b4PTQoDfXoiQY5M3ljjXlPBE3s9QEhY3+6
 Cxr+yr7MQ+c/FqlVNtS4fgi0enPAfaV8WCL9MwFeWZrDnEZnX4jVQY5TTNK0QFI/8nCD
 gmnlkhiJ6gvibzxz7c185YShnYgE7Voo63mIWVMW49bDvw8L34bLCgLNmbKSlYfDwxj8
 D2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ldn2Z6B3k3Plt1cJVie4T8Wt19hcp59Igf8ZqI/jiUE=;
 b=e/oKGxiGDSx3qnYu1FR7l3E7M/nqrkzsILP5VMASRehxTqSikt/UtYLMgekaBkfOV3
 2IqW2+pIQckigqyLo9F6yxFw1AAO/mKdQ4h8dq//fO4tmfgF+LNIrCuliLrO4qWBBUyh
 PDodO1jlwvjN+UxZJ0dhm4lgbfnAwmuim8GG2x9LMX+4y/D35hwGWTp0yY40Q6ujuvr/
 8dCWjxrryzxJZFwqUdjs/oprPOurN3A4EN+PZg7T28w8R8qqxsnSvXRsSWQf3sXJdT0y
 qrUct1zkde7DvgK53n5lWSvw1jkRrn6/0+J/B+OiU+xEDqKsvzg0EslyWTVy0gbZgJGb
 PMRQ==
X-Gm-Message-State: AOAM533L25gXK+ojcwpwAkNLhbiz1jkuyEw6humBC97AgQwkJoHUiCaF
 DDa30j3wx+JAOL5ivz3Uxxz0p8CtZas=
X-Google-Smtp-Source: ABdhPJz4414xLW+uPuQKNtVwZBmEoEmsC+Vy1/RkkVdw0NFdFG1wA754cKIXRH67qa2HlF1luTBAhA==
X-Received: by 2002:a62:f203:0:b0:4f6:f330:7e56 with SMTP id
 m3-20020a62f203000000b004f6f3307e56mr28729241pfh.49.1647348931980; 
 Tue, 15 Mar 2022 05:55:31 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a056a0022cd00b004f7eaac852dsm6096212pfj.151.2022.03.15.05.55.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 15 Mar 2022 05:55:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/21] audio: Rename coreaudio extension to use Objective-C
 compiler
Date: Tue, 15 Mar 2022 13:53:40 +0100
Message-Id: <20220315125350.82452-12-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
References: <20220315125350.82452-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::431
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x431.google.com
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The coreaudio library includes Objective-C declarations (using the
caret '^' symbol to declare block references [*]). When building
with a C compiler we get:

  [175/839] Compiling C object libcommon.fa.p/audio_coreaudio.c.o
    In file included from /Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/System/Library/Frameworks/CoreAudio.framework/Headers/CoreAudio.h:18,
                     from ../../audio/coreaudio.c:26:
    /Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/System/Library/Frameworks/CoreAudio.framework/Headers/AudioHardware.h:162:2: error: expected identifier or '(' before '^' token
      162 | (^AudioObjectPropertyListenerBlock)(    UInt32                              inNumberAddresses,
          |  ^
    FAILED: libcommon.fa.p/audio_coreaudio.c.o

Rename the file to use the Objective-C default extension (.m) so
meson calls the correct compiler.

[*] https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/WorkingwithBlocks/WorkingwithBlocks.html

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 audio/{coreaudio.c => coreaudio.m} | 0
 audio/meson.build                  | 2 +-
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename audio/{coreaudio.c => coreaudio.m} (100%)

diff --git a/audio/coreaudio.c b/audio/coreaudio.m
similarity index 100%
rename from audio/coreaudio.c
rename to audio/coreaudio.m
diff --git a/audio/meson.build b/audio/meson.build
index d9b295514f..94dab16891 100644
--- a/audio/meson.build
+++ b/audio/meson.build
@@ -7,7 +7,7 @@ softmmu_ss.add(files(
   'wavcapture.c',
 ))
 
-softmmu_ss.add(when: coreaudio, if_true: files('coreaudio.c'))
+softmmu_ss.add(when: coreaudio, if_true: files('coreaudio.m'))
 softmmu_ss.add(when: dsound, if_true: files('dsoundaudio.c', 'audio_win_int.c'))
 
 audio_modules = {}
-- 
2.34.1


