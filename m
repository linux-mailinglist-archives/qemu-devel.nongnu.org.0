Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F07E96F5B2E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 17:31:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puES0-0003ex-TY; Wed, 03 May 2023 11:31:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mat.krawczuk@gmail.com>)
 id 1puE6k-0006Ol-NF
 for qemu-devel@nongnu.org; Wed, 03 May 2023 11:09:30 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mat.krawczuk@gmail.com>)
 id 1puE6i-0003u0-KP
 for qemu-devel@nongnu.org; Wed, 03 May 2023 11:09:30 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50bdd7b229cso3038534a12.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 08:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683126566; x=1685718566;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ESD1pdr0aHVgZrZeFAqnfUGdATwcUO4ugikd+JVvhoA=;
 b=BWuWPng0LkJjAKoQvi/dB+Y2IXuOov2XJSBbz3R1xUxgXAgs96i+LY8HaPxvX4oXzA
 lXM7r3Iv6xMvZMqPInHM8FMcmNVEovY7ex+86p1rTHVjXYa/lyQsr0eKnyWkD0mpc92Y
 /33F/fjy+gxUCePAQ2bnFRY4QvO30ObVmNWJiQn/SEzsZ6SeGqfAV0hBO+GIudZUBFOM
 LkFvgJLEbN+xGyNqj+vtPTPDNPKujMMs9x4nBFHUKSrhhOprZJuLZV8ZOn/0C6A+G5mR
 awwSthwh6wzhRAyOHEvcyYGgGp8CKvfaOqUL5FjhwM3eA67ItaEKYeMzIEHRosZbANJJ
 Anew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683126566; x=1685718566;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ESD1pdr0aHVgZrZeFAqnfUGdATwcUO4ugikd+JVvhoA=;
 b=lsJcLQnadEbypI3IgBtxXD7vpRLTGPUYGtY4S+yAkkRwoZK4vhz96ELHnpIfFxqp16
 eWnG0aMrRskM75P9mtKLVG96eNdeo3FKeKzK0EIj68EF26RHK2CssnVr9/0ZphorNDNL
 HAgrevd1h9qjaNj2v8mMKIOU2z8q8Y+GIEZWwHiy224ut98HnAmzcZagsA3I2TTHGgRD
 e+7Knxrwu3JsTGvKirLhEhfgS8IqBUGFUWq1R4n+5DWTbpodXZzVb6p5i5w6+n9rSS+O
 lkBSzwoe4/Yr3FWoC6LODyL+iXeTgAfPU5XPHTqAmw4zYTXjU+yQLWw+p6YdJcxBlC+X
 r6Kg==
X-Gm-Message-State: AC+VfDy4I5F314YNC/XakAuLbmOXYFv86guc1iBTWajTyT5ldZrw8Awy
 dXhr30tts+oSWCm3f/cao10=
X-Google-Smtp-Source: ACHHUZ4d6pQtgPOnkrdYmLewDbGO7OORqWFgbVaAc4t6wvk7r5UnsOH4lgn0ralKZK/mjqnClmj90w==
X-Received: by 2002:aa7:d501:0:b0:50b:c982:51fc with SMTP id
 y1-20020aa7d501000000b0050bc98251fcmr6734857edq.36.1683126566308; 
 Wed, 03 May 2023 08:09:26 -0700 (PDT)
Received: from localhost.localdomain
 (088156139023.dynamic-2-waw-k-2-3-0.vectranet.pl. [88.156.139.23])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a056402515400b00509d1c6dcefsm809872edd.13.2023.05.03.08.09.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 08:09:25 -0700 (PDT)
From: Mateusz Krawczuk <mat.krawczuk@gmail.com>
To: 
Cc: Mateusz Krawczuk <mat.krawczuk@gmail.com>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH] Add information how to fix common build error on Windows in
 symlink-install-tree
Date: Wed,  3 May 2023 17:08:55 +0200
Message-Id: <20230503150855.1182-1-mat.krawczuk@gmail.com>
X-Mailer: git-send-email 2.40.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=mat.krawczuk@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 03 May 2023 11:31:26 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

By default, Windows doesn't allow to create soft links for user account and only administrator is allowed to do this. To fix this problem you have to raise your permissions or enable Developer Mode, which available since Windows 10. Additional explanation when build fails will allow developer to fix the problem on his computer faster.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1386
Signed-off-by: Mateusz Krawczuk <mat.krawczuk@gmail.com>
---
 scripts/symlink-install-tree.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/symlink-install-tree.py b/scripts/symlink-install-tree.py
index 67cb86dd52..bb3a2d708c 100644
--- a/scripts/symlink-install-tree.py
+++ b/scripts/symlink-install-tree.py
@@ -7,12 +7,14 @@
 import subprocess
 import sys
 
+
 def destdir_join(d1: str, d2: str) -> str:
     if not d1:
         return d2
     # c:\destdir + c:\prefix must produce c:\destdir\prefix
     return str(PurePath(d1, *PurePath(d2).parts[1:]))
 
+
 introspect = os.environ.get('MESONINTROSPECT')
 out = subprocess.run([*introspect.split(' '), '--installed'],
                      stdout=subprocess.PIPE, check=True).stdout
@@ -28,5 +30,8 @@ def destdir_join(d1: str, d2: str) -> str:
         os.symlink(source, bundle_dest)
     except BaseException as e:
         if not isinstance(e, OSError) or e.errno != errno.EEXIST:
+            if os.name == 'nt':
+                print('\nPlease enable Developer Mode to support soft link '
+                      'without Administrator permission\n')
             print(f'error making symbolic link {dest}', file=sys.stderr)
             raise e
-- 
2.40.1.windows.1


