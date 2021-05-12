Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E231037B53E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 07:01:19 +0200 (CEST)
Received: from localhost ([::1]:52080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lggzm-00078K-Qn
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 01:01:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lggx3-000512-Dh
 for qemu-devel@nongnu.org; Wed, 12 May 2021 00:58:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lggx1-0007Kp-Rc
 for qemu-devel@nongnu.org; Wed, 12 May 2021 00:58:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620795507;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BD5VB3NA0DAnsqCz29yY9NHMbzohNkZQPdpj4Xwyg+A=;
 b=ccMp6tH+3paKD4OxqcRiVvTXJwtsunIO4o4F06nIBeOCDN6Z+qkzIzNsPGipMsyeD7iaQ5
 DCUAyuy2uD9HjvYLG2T4gHP17WN4f5Q91l17zxEz7kiMbux8aQxxTaq7U0lT0JJ5levb41
 lh9MlzLsLhCGJ/KK6GxdntDMa3K9DSY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564--RnDgzFXNRuwZkNUb25iFA-1; Wed, 12 May 2021 00:58:25 -0400
X-MC-Unique: -RnDgzFXNRuwZkNUb25iFA-1
Received: by mail-wr1-f70.google.com with SMTP id
 u5-20020adf9e050000b029010df603f280so9624699wre.18
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 21:58:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BD5VB3NA0DAnsqCz29yY9NHMbzohNkZQPdpj4Xwyg+A=;
 b=GAFYF2lOHu2tbKoTADQ9/no8z/UiNXvr2CnN7mZY2/kbnQW2lRFrF4jmYS0hBB4+Ht
 ufP4INxPTr1RkWYV09V7tBRYq6x/3X4NVff+OvvaZ0NDHulApRBIkTM5z1FOHsSl0n8D
 k9TrOIca3XNDENEXqT60ttT32OdIEQymO2GJ4zuCCpjEqzlm28tIWBZy+WwBcuyn4gZ1
 rB27DKeAokUZgAAFisylGynpXcFC1D9vGICwC1qEDtO5YGEdsP5p21FSi0O899YkAicy
 VSjWiQu6qM+q2XA7s9gPeWFeABODtp8nItqiGVDwyxvcoQ/Zhae3/sJohdYbnwDLjTGw
 JxbA==
X-Gm-Message-State: AOAM533/zgcH/yPlGiPCieLoFfHE+wMaUJbsHkQW6cX41UX4I15Gp0IE
 yajSEX9haB34lZTZ+WxfZC3zNHD45XLHex2hyrCj9ylaPMBtJPXbj2ueCFFMQojDojudBatb+TO
 mFAG27C0mdvZ3VE/WeYQ36mUyOJ2mfi4okCft2ayUYb8vt/wzbO2XqXo5G3hkaDJo
X-Received: by 2002:a05:6000:1544:: with SMTP id
 4mr10320003wry.370.1620795504323; 
 Tue, 11 May 2021 21:58:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxb/iBftZ3dTjK1BmfU6+4uNrcLRny2WyJkWMRPlU15E7RBBPM3PVufFuI9v+0xE7Cvxp7VNA==
X-Received: by 2002:a05:6000:1544:: with SMTP id
 4mr10319970wry.370.1620795503995; 
 Tue, 11 May 2021 21:58:23 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id n7sm29174549wri.14.2021.05.11.21.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 21:58:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] configure: Only clone softfloat-3 repositories if TCG is
 enabled
Date: Wed, 12 May 2021 06:58:21 +0200
Message-Id: <20210512045821.3257963-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Emilio G . Cota" <cota@braap.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 configure | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 5877a6b2bfe..e0e02623e3e 100755
--- a/configure
+++ b/configure
@@ -257,8 +257,6 @@ if test -e "$source_path/.git"
 then
     git_submodules_action="update"
     git_submodules="ui/keycodemapdb"
-    git_submodules="$git_submodules tests/fp/berkeley-testfloat-3"
-    git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
 else
     git_submodules_action="ignore"
     git_submodules=""
@@ -2277,6 +2275,11 @@ if test "$solaris" = "yes" ; then
   fi
 fi
 
+if test "$tcg" = "enabled"; then
+    git_submodules="$git_submodules tests/fp/berkeley-testfloat-3"
+    git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
+fi
+
 if test -z "${target_list+xxx}" ; then
     default_targets=yes
     for target in $default_target_list; do
-- 
2.26.3


