Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE448442D78
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:04:03 +0100 (CET)
Received: from localhost ([::1]:58598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsWI-0000Fk-TR
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:04:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mhs0B-0006KJ-89
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:30:51 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mhs08-0003yk-Jo
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:30:50 -0400
Received: by mail-wr1-x429.google.com with SMTP id d13so32760815wrf.11
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8LF+vgODsshWmzy04pwfU5WzK2P4Qrd0euEx5e7HMDg=;
 b=gB3Pt/mUAPKArINq1B54/dB0qOnZbO+8C1FFQ6SmEYlIskZsm3ftzXwja97/o2E60R
 sB1cgBdJf8jSmEtlMSWVGAxyJsRmJkDlS3mOW4o6ixOe7UBT/O4e5uW4lPNNF6WM9Ut9
 Osj/8RTWpkg1hG7g3M3sZ8D+SdNm3mnoo/7MJIOibnCEdt/20YYbry1YTFJzT2QudOHQ
 s0uEexjNHp5FwBM+MmfM1kZCNs974g/QyWoMdJd5dvW4a8SJmZBvWCeTK9/GVoDxWnpg
 5F5MoashcWeZ28e4wNIrsFMkB8bisJbHSAz17GCV423GP+39CdYLeb3oKZrhO/0pYg/v
 1nSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=8LF+vgODsshWmzy04pwfU5WzK2P4Qrd0euEx5e7HMDg=;
 b=1FiQ7Wr7EjjTMTBcIsIUeIsw8E/MWQ24a36qEwHApH168BKwTtCPijXFlVNA+RNHmM
 7Bot+08MPCCyulGG+grwMjG4aJWW/xbX9dzeMEE0lAkxg9gCr4V5s0BU30CzKqdc2VuV
 C7mUuCfqv87TQZanTx0VZ8w0GcF+iKIo5dgaO3i4tf7Ox5vn4lLTQilsQpL/xA8zxzh7
 ni4w0Tq7MwYkCGKIO9oYydasg2wcCCE5jZTm7E4nKAgRRpb/3L9juX2rmXlX61oYBTsM
 x0UMk39c/CYFZuC+3Jmxt8dj5vET90wX3Nb9S3LdQsGMsjQcjrQ497VfnSOe/mAzW9VX
 sg4Q==
X-Gm-Message-State: AOAM533oCEh3qXQpP8bjRvAVgnzTYujfyZD3yHpAv2xR3lMAm1KwpXeG
 y+0//sjV6JftcVqlJTN9kfLY20SEEVM=
X-Google-Smtp-Source: ABdhPJxmk+cRpvcuu9ox5O/6sSfFJsPJLgolrQizpaDXelnv2LRCoJcFqCQC+kI32dXuaByVbdD9LA==
X-Received: by 2002:a05:6000:1a8b:: with SMTP id
 f11mr15204032wry.409.1635852646794; 
 Tue, 02 Nov 2021 04:30:46 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d7sm4750248wrw.87.2021.11.02.04.30.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:30:46 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] meson: remove pointless warnings
Date: Tue,  2 Nov 2021 12:30:43 +0100
Message-Id: <20211102113044.204344-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x429.google.com
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

Meson tests sometimes warn if the required libraries and headers are present but
a test program fails to link.  In the case of DirectSound and OSS, however, there
is no test program so there is no need to warn.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meson.build b/meson.build
index 8c30089d67..3dadb245a8 100644
--- a/meson.build
+++ b/meson.build
@@ -924,8 +924,6 @@ if have_system and not get_option('oss').disabled()
   if not oss.found()
     if get_option('oss').enabled()
       error('OSS not found')
-    else
-      warning('OSS not found, disabling')
     endif
   endif
 endif
@@ -938,8 +936,6 @@ if not get_option('dsound').auto() or (targetos == 'windows' and have_system)
   if not dsound.found()
     if get_option('dsound').enabled()
       error('DirectSound not found')
-    else
-      warning('DirectSound not found, disabling')
     endif
   endif
 endif
-- 
2.31.1


