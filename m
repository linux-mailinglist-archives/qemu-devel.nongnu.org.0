Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FC93A9E23
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 16:52:33 +0200 (CEST)
Received: from localhost ([::1]:35244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltWu7-00061K-Vn
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 10:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ltWs5-0003Ps-ME
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 10:50:25 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:34598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ltWs4-0001O7-4h
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 10:50:25 -0400
Received: by mail-pl1-x62a.google.com with SMTP id h1so1244778plt.1
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 07:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aXuSE7WPOewcMgOZ+q8pXyjRlB8ZpBeOEOU/dxurvV4=;
 b=V/nlmOopIVOiEKuB4FU5CEw6gtxCGmO4D6rwfWf1JpH61hNVcqBE1Q2GhLsBMDnfgO
 1lkJz3rv0A7mUFxLL+DOjw6e5XjVr/45pr94yKeTmhQi8z5Y/Kd+EJ8/BeR9Jmc4KTPq
 HrwI25+DM7rAsKj7IR5uexuFwq3s9rUqrLFvcisxi9D6VnehRz4qbQHOVTHM+17y9In8
 nFV7rB1AeDmvUZC08F4ujnTAOHH6nebUrBvEXUI7Qj21MmPm3lQGXEPDYI4jpDfLHst2
 Fz03AvxbMucBPobAXLxE8lqHhLqMjNOHN3ZJ9tkXO2C6ocIeaexvMe4G4b2wDf4foxJP
 6t4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aXuSE7WPOewcMgOZ+q8pXyjRlB8ZpBeOEOU/dxurvV4=;
 b=ZgW3dDbsfPmH4kvugq4opvG3HSyL8Ntwwj0VB7j2pKQTAKCUrg8Sv9ZzBqvUDQndUr
 ukX6sQkBmjZnN0y2VpvtmJDtHU0DD1PaY5/Hts+DNd8Ms9oOip7s+nwajK8SsJHoC77z
 tbRyf4Ux0aKvDbns6yru/gOBog+CKfCNfi6tEwuiu6lB7d/GSyxYLFYE47/K4DEa0UH8
 1spbbKuILa5kmpcUJHVkhPpzka80+/LtZwiD5nw+2DubsURBMaHxLsX4cvnY6mOss5GU
 PQPKwsiZNgPfw/7A/CvJ4Ur9VAU0K67r8gwfQhASy6hBLoOlHm1yS/RGbhy5JQDG0R8O
 fOUw==
X-Gm-Message-State: AOAM5332JmtVx/+ZXf+5Z0xJSSJ/1hm3Q2KJAT9p0DLX5gZLPqatdPJu
 sPdG6tWk2sC6nyxsaaXDbvJUqIff+sMVbA==
X-Google-Smtp-Source: ABdhPJzvIJB+fLnC4WE6rwUyUfFEJhGMlLGmYdEO9BjbEqH92TBRh1hlOsTXokwIQDh2Qb+Jb8Nraw==
X-Received: by 2002:a17:902:fe03:b029:104:12b5:954f with SMTP id
 g3-20020a170902fe03b029010412b5954fmr31811plj.85.1623855022664; 
 Wed, 16 Jun 2021 07:50:22 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:40bd:72ed:2c81:7963])
 by smtp.gmail.com with ESMTPSA id w7sm2381580pjy.11.2021.06.16.07.50.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Jun 2021 07:50:22 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [ui/keycodemapdb PATCH 1/1] Add QEMU QKeyCode "lang1" and "lang2"
Date: Wed, 16 Jun 2021 23:50:09 +0900
Message-Id: <20210616145009.56146-2-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210616145009.56146-1-akihiko.odaki@gmail.com>
References: <20210616145009.56146-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 data/keymaps.csv | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/data/keymaps.csv b/data/keymaps.csv
index 6b1631e..1ffe3b0 100644
--- a/data/keymaps.csv
+++ b/data/keymaps.csv
@@ -192,8 +192,8 @@ KEY_PAUSE,119,,,0xe046,0xe077,0x62,72,VK_PAUSE,0x013,0x66,0x66,XK_Pause,0xff13,P
 KEY_SCALE,120,,,0xe00b,,,,,,,,,,,I128,,,
 KEY_KPCOMMA,121,,,0x7e,0x6d,,133,VK_SEPARATOR??,0x6c,,,,,NumpadComma,KPCO,kp_comma,,
 KEY_KPCOMMA,121,,,0x7e,0x6d,,133,VK_SEPARATOR??,0x6c,,,,,NumpadComma,I129,,,
-KEY_HANGEUL,122,JIS_Kana,0x68,0x72,,,144,VK_HANGEUL,0x15,,0x71,,,Lang1,HNGL,,,
-KEY_HANJA,123,JIS_Eisu,0x66,0x71,,,145,VK_HANJA,0x19,,0x72,,,Lang2,HJCV,,,
+KEY_HANGEUL,122,JIS_Kana,0x68,0x72,,,144,VK_HANGEUL,0x15,,0x71,,,Lang1,HNGL,lang1,,
+KEY_HANJA,123,JIS_Eisu,0x66,0x71,,,145,VK_HANJA,0x19,,0x72,,,Lang2,HJCV,lang2,,
 KEY_YEN,124,JIS_Yen,0x5d,0x7d,0x6a,0x5d,137,,,0x7d,0x7d,,,IntlYen,AE13,yen,,
 KEY_LEFTMETA,125,Command,0x37,0xe05b,0xe01f,0x8b,227,VK_LWIN,0x5b,0x6b,0x6b,XK_Meta_L,0xffe7,MetaLeft,LMTA,meta_l,0x78,0x37
 KEY_LEFTMETA,125,Command,0x37,0xe05b,0xe01f,0x8b,227,VK_LWIN,0x5b,0x6b,0x6b,XK_Meta_L,0xffe7,MetaLeft,LWIN,meta_l,0x78,0x37
-- 
2.30.1 (Apple Git-130)


