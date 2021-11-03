Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7194444A4
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:28:47 +0100 (CET)
Received: from localhost ([::1]:54628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miIBx-0000uB-Ks
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHpG-0003a0-DY
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:05:18 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33462)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1miHpA-0000xG-9U
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:05:16 -0400
Received: by mail-wr1-x435.google.com with SMTP id d24so4124956wra.0
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rnLo8h8h3qpMsXw4rmg0h4Mlf1YBlXBqCnyDSXIT3o4=;
 b=pvnYhPZC9B7itdMDSLPPYMY8vGyHTk9eTpcE6cpNynZ3IT80pJ2lJH0uzB96DGP2fB
 KFbOSdXv5GrCfS2AGTXHPLZrLKS3Z6YxMzqmDp9d+8sUOTkbvjYqQJ/j9yyUgv8s3Mq3
 zxxrfw1u3Rrb1Nnnco9/kNAMrKFH6X86AH1DoPCFbs5d2yE8/LTQhuhJNUHvWhFXx+wE
 9gpLGf8OtqKthPDWFrE+TqYkfkJpGCs3mV+WoziHnBl4qgaIpclpIfFApGIN4oF7t2gV
 /WemeQJgeLrVi2k1oFWnW2RMlP8zHp4s/G/jKako7/E8OD3fLK856+AdUHB9UnS2BON+
 X4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rnLo8h8h3qpMsXw4rmg0h4Mlf1YBlXBqCnyDSXIT3o4=;
 b=pWg/uYQv3UnNq+cFZwuiO9t7xbxKvOAytcKYwtdY86ZFg7KVVDQOTWcoQZab3TAsKj
 KKg2Y5BKjaBMkqvIDQrblHYntWIlBf2W9wIzcTyhjOhneY5H8AQTKeyY2cOFe9E+yL9+
 Pn3UqSVMw+kdYUKbveQw4EUIoz/nM2qIcuL/5G43/EDzYbdtr6/sH0dgOMQqfHEUA7gy
 44ytNcLPqtRFNHU5vvMJoydKrdsFfgURfGCMXXrM7FC/c2Kjca06Hr2m24QGJTwsNNXx
 ocVAaXugwbktilbI59950qf26VvdDZmJK8dyZI0fipJAArHeBj6vSPS6uhX7GZ9foRQ9
 BYmA==
X-Gm-Message-State: AOAM532k6ritafew+Au13g8AfsVPLSAlvO2yAYQLagRfseuagYTGLEaR
 VGi3KVJhHkA2R/Yv4NdI/INeGvmxWu0=
X-Google-Smtp-Source: ABdhPJzQLGaTkPb4buANTC6HdT1o5g5hyXC6f2fbOTD9g+cMD2Oc8xrvyq1qT+bJEdXeoMljdSiATg==
X-Received: by 2002:adf:efc6:: with SMTP id i6mr33072185wrp.428.1635951909303; 
 Wed, 03 Nov 2021 08:05:09 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id h16sm2488797wrm.27.2021.11.03.08.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:05:08 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 23/27] meson: remove pointless warnings
Date: Wed,  3 Nov 2021 16:04:38 +0100
Message-Id: <20211103150442.387121-24-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211103150442.387121-1-pbonzini@redhat.com>
References: <20211103150442.387121-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x435.google.com
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
index 0ab9c43bf2..d09e314e04 100644
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



