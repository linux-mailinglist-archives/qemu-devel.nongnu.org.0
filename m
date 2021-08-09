Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E303E431B
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 11:48:21 +0200 (CEST)
Received: from localhost ([::1]:50048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD1tM-0003sr-7C
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 05:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mD1qi-0007Ty-HS
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:45:37 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:45722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mD1qh-0008G0-06
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:45:36 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 l11-20020a7bcf0b0000b0290253545c2997so11063692wmg.4
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 02:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2CONYzyMfIwqlZKcWFAPMECPa5Mggor1aRHlqwcsDsQ=;
 b=vf3dBxFRuBmKV16JK1GUXo1GWbtbweOZUWennpC8qOHjKbw8iexIDFKTgw94VLcI8W
 OocUaBjgdb+MSGL6uyjMjd7iBhPWbA8eISaswu/A5rYHEh0MSMTtApeDKwSmdrEOKlW0
 hzWeqBJDIW7wZlxdE1Dz1b5r1Cso0sqzyZxtkSGR+CYzb4rhciXnkc8Og0wfMzePe82k
 OyVTLQ43JMD6QyZL7dQI2W54rlOdHW0xfncmX8R+C8aHdSpWrYopJsCH0DtMvKTi83pA
 i700SccPB/eLvgyY/VaK4envvBY9YuiJEKDPo5z+n/Uycza9W0GdzsHPH3J3b72/EBNX
 kP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=2CONYzyMfIwqlZKcWFAPMECPa5Mggor1aRHlqwcsDsQ=;
 b=S7zWJD5bNedc1+xD1hkNUx2byrzm/wR0J3mjzixHmT2GGjMZOr/R1aboXCgokHlDEp
 at+w/mlpXpOpbNs5dOtYwH71W9oWlC1QSPwoDrJSBnJd/YWHn3A2bub78X4t50oxzGVQ
 KN4tgXE+M9CkevPySJsA30dYIgpZQgo6bvGKdShBwQpAyN8Yq4q0QHstX1PJ5M5ksuo+
 WcAaiXljF8YfuL0dPyruhgD/RwZLzdTJ+xNB80ipIwLq32CYzxHcZgxbbtvWDXzJRkj7
 L5Kff0PsDHeP93fY7Mm/5YoejdnHzXnGg6m4p11qocz6x5pSBBS0nK8xP1kzkrriiJJN
 hMpA==
X-Gm-Message-State: AOAM531VmmrZqfcpOq8E0gZtHjjbwM4afKkV6pZkhvyovLseNreglutq
 QZfJ5EWj8xlYIpsHUL9P5WOEWbkM6jxhrQ==
X-Google-Smtp-Source: ABdhPJzU+yjOajtIMuXJ6X/6g0seRDpDxYYerv612Ky5IwbTpMpAm7SlkVkBeAI/rixorOU3FY0MSQ==
X-Received: by 2002:a7b:c351:: with SMTP id l17mr15778734wmj.120.1628502332603; 
 Mon, 09 Aug 2021 02:45:32 -0700 (PDT)
Received: from avogadro.redhat.com ([93.56.169.140])
 by smtp.gmail.com with ESMTPSA id y21sm20142820wma.38.2021.08.09.02.45.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 02:45:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] Build system patch for 6.1-rc3
Date: Mon,  9 Aug 2021 11:45:29 +0200
Message-Id: <20210809094530.230065-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The following changes since commit dee64246ded3aa7dbada68b96ce1c64e5bea327d:

  Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.1-pull-request' into staging (2021-08-06 10:28:33 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to abc14fd05606274d8350f1f90d1ec7bc9e51aa21:

  meson: fix logic for gnutls check (2021-08-06 15:36:11 +0000)

----------------------------------------------------------------
Fix for gnutls-crypto detection

----------------------------------------------------------------
Alyssa Ross (1):
      meson: fix logic for gnutls check

 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
-- 
2.31.1


