Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B60173A9E0B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 16:48:34 +0200 (CEST)
Received: from localhost ([::1]:51980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltWqH-0006as-PV
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 10:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ltWnh-0003t5-WE
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 10:45:54 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:41851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1ltWnV-0006vh-OO
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 10:45:53 -0400
Received: by mail-pg1-x52b.google.com with SMTP id l184so2139542pgd.8
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 07:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xASViynPy0qq+U6HlrQXZ1RH4HIuGP9OKmMwWbApixY=;
 b=cg3r4Olb0W5QycFEPwloERaRFsCarAw0gXb3PPx1Qn2zIimJ3zoG2LCAlHSpJJDqzH
 Ezcvvzdj1NWILORlkX4sApLIlD2I3A53DF62VzHAj9skt0rAeJyYN+JZP82fBY9gZ1Tg
 rpVR/rcjhmkjlJwEvPtcFr1Lb25/Bs1mwK8nZA9q1Mvv8uhMfv3H/qif5a3qwXMyjzZC
 UpTroNp5OzHRouJZvlT3th/z6NrBts+ekItNkRodrKZX4O1jCUZPAougCGuJWXBwmwr/
 BtSZxIQZZCvapfDl7nOOkOAuRJU9szRxlKKPQmvQ35fuSET7BFkSu3JgpfEiePz0MGTl
 vBSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xASViynPy0qq+U6HlrQXZ1RH4HIuGP9OKmMwWbApixY=;
 b=Kn7rWBKJAC+GF1vE4lOL0BazoczEV3IKKyiTshBoTLU5atNbMGb+VQkoWN8pTpEa1J
 5Mo+FCXZps/ZmA1QHluKH41CfSZoATfiYSMZIdfgbxpxpuYGeQBCutAGUeO6R8llnCTj
 l5Ks3mxTFvybmYQczsZKsiZt/lyhxMBw9m2RVCH0M5O2CtZFpElGqqjGROIDsTAJzrkc
 iggWAALQNCT9cvOWW1sXcw9Cax00dYtuXglO4xPCSr0JQQ7Wk6lsbLtiFipR2O4uMLf9
 0b0aRII9FGB0bh8BJvp7ic3+gJIZKOVeu3LPdgmRijM/Ph0yasAvH6l97EzGLwojG/Gz
 LxLw==
X-Gm-Message-State: AOAM5305Ty8zco9uG9uBXX+DGiovenh/cjvioaxsBNUPoN4MKZjj9vNO
 sUwSG5O2LzgvUp3VGcvUkptirbP6bAoQ0w==
X-Google-Smtp-Source: ABdhPJyULNN1rIvNCbJeMECxC/AeA6/EotnaEh7IXDAK815OZRgW1CS1qgVfKvMYPPOe2E9dAZpkuQ==
X-Received: by 2002:a63:4906:: with SMTP id w6mr5362543pga.212.1623854738339; 
 Wed, 16 Jun 2021 07:45:38 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:40bd:72ed:2c81:7963])
 by smtp.gmail.com with ESMTPSA id c207sm2443027pfb.86.2021.06.16.07.45.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Jun 2021 07:45:38 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH 1/1] input: Add lang1 and lang2 to QKeyCode
Date: Wed, 16 Jun 2021 23:45:22 +0900
Message-Id: <20210616144522.55643-2-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210616144522.55643-1-akihiko.odaki@gmail.com>
References: <20210616144522.55643-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x52b.google.com
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

lang1 and lang2 represents the keys with the same names in the
keyboard/keypad usage page (0x07) included in the "HID Usage Tables for
Universal Serial Bus (USB)" version 1.22. Although the keys are
described as "Hangul/English toggle key" and "Hanja conversion key" in
the specification, the meaning depends on the variety of the keyboard,
and it will be used as the representations of Kana and Eisu keys on
Japanese Macs in qemu_input_map_osx_to_qcode, which is used by ui/gtk.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 qapi/ui.json | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index ee6fde46d59..3b16b2191cc 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -786,6 +786,9 @@
 # @muhenkan: since 2.12
 # @katakanahiragana: since 2.12
 #
+# @lang1: since 6.0.50
+# @lang2: since 6.0.50
+#
 # 'sysrq' was mistakenly added to hack around the fact that
 # the ps2 driver was not generating correct scancodes sequences
 # when 'alt+print' was pressed. This flaw is now fixed and the
@@ -818,7 +821,8 @@
             'audionext', 'audioprev', 'audiostop', 'audioplay', 'audiomute',
             'volumeup', 'volumedown', 'mediaselect',
             'mail', 'calculator', 'computer',
-            'ac_home', 'ac_back', 'ac_forward', 'ac_refresh', 'ac_bookmarks' ] }
+            'ac_home', 'ac_back', 'ac_forward', 'ac_refresh', 'ac_bookmarks',
+            'lang1', 'lang2' ] }
 
 ##
 # @KeyValue:
-- 
2.30.1 (Apple Git-130)


