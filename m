Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B914CEE78
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 00:27:48 +0100 (CET)
Received: from localhost ([::1]:36728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR0Hy-0002cO-T2
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 18:27:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR09W-0008Rl-BD; Sun, 06 Mar 2022 18:19:02 -0500
Received: from [2a00:1450:4864:20::42f] (port=45920
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR09U-0007S8-KX; Sun, 06 Mar 2022 18:19:02 -0500
Received: by mail-wr1-x42f.google.com with SMTP id p9so20648919wra.12;
 Sun, 06 Mar 2022 15:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ldn2Z6B3k3Plt1cJVie4T8Wt19hcp59Igf8ZqI/jiUE=;
 b=o9gDAPqIfP4UFswBmNZwq2O//adImPtB2z2BLKdX5hx0/7Dl9pE2VVv4KSnge7Z0RN
 y2YL0rY1PT8uFjAhRmvjLxx6CdhyMcX8ZGhM9M5bo6mFXH5bSol4epwCKESF8rOPxUdK
 3ht7E/IVJ3xj5VkIv+A7V1iwXCq7xMIN9dsQzHrZkIjIX9NYaX6yQz5047shf4H4hx7k
 ++uB0znPTerAyFRT7KseVt3YaXcfIBMF800uonsdWAX+79Ifrqd4Wna6A02tdIdQqeNQ
 O9tT9AeV5aQe5SocnuzOvEtMsmj+swVmDbOdiMxpJLifD00knJTk01tqNDOmKeErR4el
 23/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ldn2Z6B3k3Plt1cJVie4T8Wt19hcp59Igf8ZqI/jiUE=;
 b=D7wRWFuScaXFfI7EyLjx9voZhMAkcCwK2C0wYsjvsNpAJVu4Ad9c7hpAtvhERMUJv5
 a0T9KedkCNpMnG6ywl9TXpd6QRqGgE2XdVj9tYx2H0ijiWj5YDnBVNZilxYRGVpYWJ3a
 hWwYonNmI4EPKIwZqCTadIA2gq2sLavuUkdzMPWr/bfbv1FYww2Ztp0kS8/+bR8aD3/b
 xvaXl8X+b2dFoWWADEj1vNTJZIDN35sqL0efMdWcMkueJKo3a6sT4b4hsEj+uBazdFsz
 iK7juF4C+YP9E6FM8Sx3ziukPXIBuZs3/nTslF8Mi3IBWp0dvKLmY3ukaRgdx7asbRvq
 uW4w==
X-Gm-Message-State: AOAM531Ty7VNIc0rZ0w2ZCP9hJR3Sb7CCYNNLf8tr5p+3g3UdTIMpGds
 SYoHHdFKpsKTOF61/jrrCp/1KGTJdxE=
X-Google-Smtp-Source: ABdhPJztQwRBMpekx3C6bxQ+E+YGGyqWL/w+6tUQpDAZrAPoYx1PrjlJMpRQbKhGueXgh5klHMyj5w==
X-Received: by 2002:adf:8b9d:0:b0:1f1:deb6:5607 with SMTP id
 o29-20020adf8b9d000000b001f1deb65607mr5844511wra.125.1646608738838; 
 Sun, 06 Mar 2022 15:18:58 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ay23-20020a5d6f17000000b001ea79f73fbcsm9611259wrb.25.2022.03.06.15.18.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 06 Mar 2022 15:18:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 12/22] audio: Rename coreaudio extension to use Objective-C
 compiler
Date: Mon,  7 Mar 2022 00:17:43 +0100
Message-Id: <20220306231753.50277-13-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
References: <20220306231753.50277-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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


