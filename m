Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7648B444489
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:19:25 +0100 (CET)
Received: from localhost ([::1]:52506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miI2u-0005aw-LL
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHpG-0003a6-GR
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:05:20 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:43722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHpA-0000y3-9I
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:05:15 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so2090553wmz.2
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AR6zROu+hSNCFZnWbKN2sMBmcQto/oUWk8gUO4Jr0u0=;
 b=V2ivIC/hkPlL4WuNYuy5VLSScMFZNoq6QwHSDPjBiezpw1Eu2G0Pu3tcG65N7t6Nqh
 81YmOWA/3B6+LOV5uuoR75zFKJ1PHqDAFK2J4l1zY8vQxXhp7WdOlDSxV8AfoTYCAb3b
 9JcpQ0F5ZZ8Xrzlk2icO5ursTrUNgpbir+XVZFRGQ4vSsX4UHHmrnWl1RAGkP9IwX/Ox
 XC3+YnUnW4mMqfjkEaxFeeAYTJPPPHMNYRPStlwpJ77nKHzMMsnx82DVL+KSkdeVqfM/
 WPGcz4poZqIjHOZvlI5ZdK9gRVPqrCjFqMv1pVVprEtp5iS5vAADqoZ1eX+3FoRIIjN+
 noPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AR6zROu+hSNCFZnWbKN2sMBmcQto/oUWk8gUO4Jr0u0=;
 b=d7m+7ILfvjvgqF+ssXYYX/USgziaTeV7eQrd5LwAJ4/lvkquQV08Hmw+ZqOqgo5M3T
 srMtTjQC4DZcLMK4Z0q+QsSA1MXETffL3dmwNMU9s4F/Ln5f8FIVs2w2EtmjZwaJ7Ou8
 hrbG+rRcJruJdNw4n+9CGiA+Eo5gzL4nd1j/7UDGJcFqG8XIGW3ZNT5aqmlN1s381ZXN
 1QVKCLJXoMIlSZqIqrHXChJLup2qTZYyIzubHJ3SsczMT7dLCMsB8kMWNJB5Bo6zBjLJ
 PJBFMWsyEXb86q8q/N0jUtwVdexfrhObx9BYt0HkVbJPBz9Se3R55n3JzSqNJ//qUI21
 wynQ==
X-Gm-Message-State: AOAM532gTQi1qtdPAG8cQKTNNdwsteKXf+38AgvOf5Cg2njNKBJOOK6X
 R6eVZImgYJkuVMC7voNuin3r4ScJT7Y=
X-Google-Smtp-Source: ABdhPJxUhflfR1Xs9pxKCDOtb8h/946uLp8JuI5aMupXezdTOY6FsyykYPUvFJX1f/kJhCvBQbV9jA==
X-Received: by 2002:a05:600c:4e8d:: with SMTP id f13mr81029wmq.7.1635951910468; 
 Wed, 03 Nov 2021 08:05:10 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h16sm2488797wrm.27.2021.11.03.08.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:05:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 24/27] meson: remove unnecessary coreaudio test program
Date: Wed,  3 Nov 2021 16:04:39 +0100
Message-Id: <20211103150442.387121-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103150442.387121-1-pbonzini@redhat.com>
References: <20211103150442.387121-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32b.google.com
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
index d09e314e04..30b06b12b4 100644
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



