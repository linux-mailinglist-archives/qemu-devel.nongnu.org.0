Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6BF3C7E4C
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 07:58:10 +0200 (CEST)
Received: from localhost ([::1]:35736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3XuL-0005k8-7a
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 01:58:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m3XtB-00055l-Io
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 01:56:57 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:53931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1m3XtA-0005gU-AZ
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 01:56:57 -0400
Received: by mail-pj1-x102a.google.com with SMTP id p9so907622pjl.3
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 22:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9zgTdTH4F6jopaw4ez3/bVpr8JMkxQZYbRlyJYVA9gM=;
 b=IC2sj4eOId1CTTLI6uYudyvpSZhiz2SLvqlmpcOl3WJoSy2M8GqYHHTX3x3y+2kvFW
 fncNEaRQRg/53LcJGhMV01K3UIcfSXet1c4CuiA7zqLMjbsDzC7M7QE4mxIoUe3nWUmz
 PiqFaCKv2lOel8HEpjz+AEM9/gqoCf4Zn5giHCOi1HpNjXtUwPYCQ0rWqi8mR4izbfQn
 QeQH+qjaoSTucZceE8GOfOLTARM8ngkF8QfwNBf0QEGmpHGRScOn+bL0ex4Lkv4n5xZD
 cvnraRHkPexW4GZzUnrP/RR4SZRqQ+8mRx40K4scRzj8J3lDOV3SAfotV+vr1YeM6WAV
 Jnzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9zgTdTH4F6jopaw4ez3/bVpr8JMkxQZYbRlyJYVA9gM=;
 b=mjy/gxyX55NEb8WapHeWCi9fol2IV8EKpnGhld2HF3Mk3/pJOVO4hxrwnJk513IpKQ
 6n/1U+q7IHQtidNMI+hO29RPL63rSYBApz/fdNfmh9KY3OW9Fn8SEPZXd5Y0fh5XQIes
 Oa3en8BBdQTC8VrrbJ87L+wUkTX7Lv/tr15cji2kEQm6biszi5vxMPDy+TsIqws6KjHA
 ZjVeQSxdK9zO1dlX1kYYzRYqBIgJvQaM357tS+h7cInHIjE2l4nb3fisHmqSpQJ4VBqj
 DZdMsKENtYGNHHHRF6l1AwOX0s0XRgpDHwNFQqiqmwJT0ruDSgs+nBs0R3HYi3+Azzfd
 fSvg==
X-Gm-Message-State: AOAM5311pv5OBaUwk/VkstpQIBsaQXoN2P/25wZA57EqsvtQUzu7elVt
 l/Bj3by4ZRSwm7Qmj6zLQPhTCK2Gkw+Yiw==
X-Google-Smtp-Source: ABdhPJzEymNgcF5vKj4bbLrwuhIu3giy4KgvxY6Cv5FUg0N4U+iZ+5ykJ+7oNK/C4au75Q/7/9HPbA==
X-Received: by 2002:a17:902:ff0c:b029:11d:3e9e:41ec with SMTP id
 f12-20020a170902ff0cb029011d3e9e41ecmr6534796plj.1.1626242214242; 
 Tue, 13 Jul 2021 22:56:54 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:580a:d13f:a86e:77e4])
 by smtp.gmail.com with ESMTPSA id s15sm1089501pfw.207.2021.07.13.22.56.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 13 Jul 2021 22:56:53 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH] ui/egl-headless: Remove a check for CONFIG_OPENGL
Date: Wed, 14 Jul 2021 14:56:46 +0900
Message-Id: <20210714055646.85952-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pj1-x102a.google.com
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
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ui/egl-headless is only built when CONFIG_OPENGL is defined because it
depends on CONFIG_OPENGL without condition. Remove a redundant
conditonal in ui/egl-headless.c

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 ui/egl-headless.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/ui/egl-headless.c b/ui/egl-headless.c
index 75404e0e870..a26a2520c49 100644
--- a/ui/egl-headless.c
+++ b/ui/egl-headless.c
@@ -214,6 +214,4 @@ static void register_egl(void)
 
 type_init(register_egl);
 
-#ifdef CONFIG_OPENGL
 module_dep("ui-opengl");
-#endif
-- 
2.30.1 (Apple Git-130)


