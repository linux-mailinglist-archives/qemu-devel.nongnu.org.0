Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB83442DCA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:24:30 +0100 (CET)
Received: from localhost ([::1]:41914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsq4-0002Ys-9s
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mhs0B-0006MS-Lp
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:30:51 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:43624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mhs08-0003yr-Nc
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:30:51 -0400
Received: by mail-wr1-x42a.google.com with SMTP id t30so7925310wra.10
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5yNSJwwNFQr1nM3JfKLj4t6lpvOSUbaXW100csvtVKw=;
 b=SkdYyBM0Fb6xjY0LWdpAUA8O8GY5+eM57+YNEPvxkZh1NVv7uNH61x8HRULtsOYdUc
 iPwpNpxfBxdMTqBG89KPZx9BskQpWfgBNTpoo2/y7pMscoFV67TTrJrzcEZP0PjKd+jE
 wk5dfCbi5+q+8WAcJLGWygb2i/s9dC6124FYd0OeMxinvfXXDDtg3nhO40i6kYrb5JAm
 UAI/+7WTNZdSvSN71ZxE9NUBjD/U2v1BE5X5wzFxPC66NpgaPpNpOhJwZEWDnsiNenFv
 sx9fUqXBGmbMXhoiaDoX733Bp/0IAELqGxKPxuZBcoBk89scz7B2U1Yk0jl9sAtHdwLr
 U5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=5yNSJwwNFQr1nM3JfKLj4t6lpvOSUbaXW100csvtVKw=;
 b=ZT2f1+1EQL+SV8XTgeiRIcGXb2HuK45YV0ndM1LD2hQ2CuktylDmldGtBrKiINRx/L
 8uI0qaG8oRcxAax99/C5Khf7ZpB3+RkAhsIaafr1uUzLHhDzvIbM43RU87fwP+jLpLmR
 baNMGrjVOhgaHu97yNRYOtEl9ofk9DOFegfGKx8J4+djqsvqeGLliroaroNrVnRzb4XB
 ubxHetUlYQT26Z8p+2YWAcYCU8dWUeK1DknuZobV4rbcYCGlGmth0GGQhAbiP4fDB/8U
 wpKT2bjX5/l4vtebVA/AZFam3+uNfnt9iWBIHwBpKj8dPmxgudHa0AogXG4HHHvjUWiI
 2asg==
X-Gm-Message-State: AOAM53141SYjf4UMu4AQkr3YjQXTxNykp23EI2QjIkNkKaEYr7yUX8tm
 hvAx9YMe3yT6/YIxJcf+jbmpaMzy7ys=
X-Google-Smtp-Source: ABdhPJwQdugOTHCemr9gUwCwPLMtFVQbJbQ1RptO4nADP4jmr1FgqBf1MnMY+0cbeySAX/i8lg8MGw==
X-Received: by 2002:a05:6000:2ca:: with SMTP id
 o10mr45184313wry.383.1635852647390; 
 Tue, 02 Nov 2021 04:30:47 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d7sm4750248wrw.87.2021.11.02.04.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:30:47 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: remove unnecessary coreaudio test program
Date: Tue,  2 Nov 2021 12:30:44 +0100
Message-Id: <20211102113044.204344-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

AudioGetCurrentHostTime has been present forever, so the test is not
enforcing a specific version of macOS.  In fact the test was broken
since it was not linking against the coreaudio dependency; just remove it.

Fixes: 87430d5b13 ("configure, meson: move audio driver detection to Meson", 2021-10-14)
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/meson.build b/meson.build
index 3dadb245a8..d800b9c5fb 100644
--- a/meson.build
+++ b/meson.build
@@ -944,22 +944,6 @@ coreaudio = not_found
 if not get_option('coreaudio').auto() or (targetos == 'darwin' and have_system)
   coreaudio = dependency('appleframeworks', modules: 'CoreAudio',
                          required: get_option('coreaudio'))
-  if coreaudio.found() and not cc.links('''
-    #include <CoreAudio/CoreAudio.h>
-    int main(void)
-    {
-      return (int)AudioGetCurrentHostTime();
-    }''')
-    coreaudio = not_found
-  endif
-
-  if not coreaudio.found()
-    if get_option('coreaudio').enabled()
-      error('CoreAudio not found')
-    else
-      warning('CoreAudio not found, disabling')
-    endif
-  endif
 endif
 
 opengl = not_found
-- 
2.31.1


