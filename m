Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 578FD4ED3F2
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 08:29:53 +0200 (CEST)
Received: from localhost ([::1]:40320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZoJb-0001Uh-SR
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 02:29:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nZoEM-0000Xy-Qn
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 02:24:26 -0400
Received: from [2a00:1450:4864:20::62f] (port=34774
 helo=mail-ej1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nZoEL-0005F9-2Y
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 02:24:26 -0400
Received: by mail-ej1-x62f.google.com with SMTP id o10so45950425ejd.1
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 23:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=65LAApyknJ4Ap/WBTWbz9LDqY048gEZBR+OKXqDXuFo=;
 b=PoDXEsMeSPNMIYMfwDRANw0bSrmztDkPvOnp8bAxJCc313qSaF+CtCV2FkynzDxuc9
 yOjNDZ0HJUqHjDXPPjYXxXgtmo7iSL/wbvn2bxmUvby4T/ZDWFm9PO/QaWCr7A1V9mP/
 x7GyolIR654Xs0PHC3fy8u/+VcPXNjxRik8DnWpQsR99cfHDFYL+76mHCyOls1PCO4te
 CVbzMinl/ZZV8jhBRTtwYdxKvypiK81IfE+q88wiJMy2w2X0ydzv4GDKH303+xQx7zFr
 0ZFzp6wv9MmDOtbujKW8DE8zGXr9/wcXYw4g9g3FNl/NNAue+Dh9OIaNNTPtEqcqIAyW
 Of2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=65LAApyknJ4Ap/WBTWbz9LDqY048gEZBR+OKXqDXuFo=;
 b=2fsFnJxCQE8Z/+mrIw5YV11VkoRaTuhBqvWFIjjV+AeqdsE0p1idpJ7X1EtzNayWKL
 Vqr5FV0vN5XdbS3wNZYt7uiE3gjhCeKRpvk9g6ka06kUPdAlA8EcRaF9TfhO4d1injZN
 YmMCRxX2+NpHNWhP9SX0xl3M3RwemtcLgDK0pM4kRrUvxs+1D9m3UWmYHw6U1UaNCRFm
 PjqHf8pXsMPKr+L7q8goDNtznriL7MY59P7uvez0G1Ywg0QxZcD36W51U8+oRv3r5bui
 QATJ1L5aJU3dorFoDMnIUmTawdxkJQVyS/nLzEXmGX2vgrfhovU7BEb752d/gnUE0JYb
 ZnjA==
X-Gm-Message-State: AOAM532+1Zn48qeCuqvlpbxy5l7lHXDx9/pm6Nus9mSZCmXDzXvjlSfw
 ewHU3+fPdbFXTcTTEI1vAQNeAGYrikU=
X-Google-Smtp-Source: ABdhPJyQlU96okECOf9QCHfSa164RRojGUZ/jvBiZ1apXAfh90bzWU1qPw/YAzxa3n+RC5rGJWNJRA==
X-Received: by 2002:a17:907:1b0e:b0:6da:81ae:a798 with SMTP id
 mp14-20020a1709071b0e00b006da81aea798mr3540588ejc.699.1648707862973; 
 Wed, 30 Mar 2022 23:24:22 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:8ca6:a836:a237:fed1])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a170906724d00b006cedd6d7e24sm9021846ejk.119.2022.03.30.23.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 23:24:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] coverity: update model for latest tools
Date: Thu, 31 Mar 2022 08:24:19 +0200
Message-Id: <20220331062419.1099306-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Coverity is now rejecting incomplete types in the modeling file.
Just use a random number (in the neighborhood of the actual one)
for the size of a GIOChannel.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 scripts/coverity-scan/model.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/coverity-scan/model.c b/scripts/coverity-scan/model.c
index 9d4fba53d9..686d1a3008 100644
--- a/scripts/coverity-scan/model.c
+++ b/scripts/coverity-scan/model.c
@@ -356,7 +356,8 @@ int g_poll (GPollFD *fds, unsigned nfds, int timeout)
 typedef struct _GIOChannel GIOChannel;
 GIOChannel *g_io_channel_unix_new(int fd)
 {
-    GIOChannel *c = g_malloc0(sizeof(GIOChannel));
+    /* cannot use incomplete type, the actual struct is roughly this size.  */
+    GIOChannel *c = g_malloc0(20 * sizeof(void *));
     __coverity_escape__(fd);
     return c;
 }
-- 
2.35.1


