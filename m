Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8954D212B70
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 19:45:02 +0200 (CEST)
Received: from localhost ([::1]:57638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jr3Gf-0005PZ-FK
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 13:45:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jr3AV-0003xg-Tf; Thu, 02 Jul 2020 13:38:41 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:32971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jr3AR-0007KE-Fp; Thu, 02 Jul 2020 13:38:37 -0400
Received: by mail-ej1-x630.google.com with SMTP id n26so16789745ejx.0;
 Thu, 02 Jul 2020 10:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AKg0voXZ64/Pok3jOijrDQeL9nahXXS43ecQ7LVwOZ4=;
 b=aydsHEdA9TkO9FyNZ9lnF9Std0U3bZ83arw197YB3KzZ63j36NYbD1HQKWljeWUkL+
 K/R+RZ5JaJvFbtL1JYxy5/57mQTh4VhPPrmVfd+wPBqKlRVSZbSjuUdmmKXxSDesnol4
 Jr9hkCLe2dURILWx3F/9r9fUmOsetbDzFRbSjj7z7yT0DggM9eZhNpxG7tM506l+lKSQ
 Lf6tntWlJ9jK7UiyDPs2ER+iQZESSJnIbpf9bCImS3J3diDcmzJmn9ywKv/GOBxQ0OEl
 CVRw1bEcMm+fo5rbLE5Y58BGWb0DLtM20kqBXmNPPpk66U5MTWT36rzUA5Bg1Mm1Bmjl
 UGgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AKg0voXZ64/Pok3jOijrDQeL9nahXXS43ecQ7LVwOZ4=;
 b=unZmCxYvI4/yguYoVXjLs+vo/pXQ5I7IZbiqXUqXWTWqa+ja2qIldeW8HrxantdPvi
 LcEBiTOLvzVX69RfrPVqcfHxVARpO2MRFudG0phiZvHlZ+K3BWqSrluzOR4iLI0bsSit
 rI7utwOQIbFoQWdnA/Q4GkzrTitrUzLPq3l5osxrBdMhOmiQeKpcURfk2hJoJvdlOuyc
 po3UDICt/BdEd3uUKlDIvJCUMcmLlyx9Fp22seHsX0z5CS8A+IGqea3XZf6UKQTEUjzx
 bKqQQwKIJrckvWUW/0Y8kIBwkURXPT7PGuP8XCh90EXrI+N5k9CXi4QKoDnVZqoZIMwN
 mIdQ==
X-Gm-Message-State: AOAM532p0xRWMxw3u/Bkpz+qhKaKnTeWbmMoKkLpIvFDZGanijki1jzG
 deP33jjRSy2UH8pgfG4NKtEpj0fiT5g=
X-Google-Smtp-Source: ABdhPJzX+L8rBnYo2koic36vpil+J4mu/+iR9A2CvOHskZOwAYF6jsQS0VzHZikerHY3NfBVL97HZA==
X-Received: by 2002:a17:906:7017:: with SMTP id
 n23mr12669488ejj.262.1593711513282; 
 Thu, 02 Jul 2020 10:38:33 -0700 (PDT)
Received: from x1w.redhat.com (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id w20sm5710344eds.21.2020.07.02.10.38.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 10:38:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/19] .mailmap: Display Lili Huang name correctly
Date: Thu,  2 Jul 2020 19:38:10 +0200
Message-Id: <20200702173818.14651-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200702173818.14651-1-f4bug@amsat.org>
References: <20200702173818.14651-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x630.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-trivial@nongnu.org, Lili Huang <huanglili.huang@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Correctly display Lili Huang name in the following commits:

  $ git log --committer=huanglili.huang@huawei.com --oneline
  76349f5ba8 bootdevice: add check in restore_boot_order()
  f05f47bb5f bootdevice: check boot order argument validation before vm running

Cc: Lili Huang <huanglili.huang@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 70a9848cfe..efb012f357 100644
--- a/.mailmap
+++ b/.mailmap
@@ -112,6 +112,7 @@ Jun Li <junmuzi@gmail.com>
 Laurent Vivier <Laurent@lvivier.info>
 Leandro Lupori <leandro.lupori@gmail.com>
 Li Guang <lig.fnst@cn.fujitsu.com>
+Lili Huang <huanglili.huang@huawei.com>
 Liming Wang <walimisdev@gmail.com>
 linzhecheng <linzc@zju.edu.cn>
 Liran Schour <lirans@il.ibm.com>
-- 
2.21.3


