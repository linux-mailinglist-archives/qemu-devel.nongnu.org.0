Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6853AA8F8
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 04:32:59 +0200 (CEST)
Received: from localhost ([::1]:48504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lthpy-0005GU-SK
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 22:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lthol-0003r5-8K
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 22:31:43 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:45728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lthoh-0001Ek-9H
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 22:31:42 -0400
Received: by mail-pf1-x42e.google.com with SMTP id k6so3729270pfk.12
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 19:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6ElA2s/dwdZTqEagDH/fKjJiOk0IWl/tGEfGfAY2ZZg=;
 b=MULW7jOGZ2jjNZ6oECeWOGpiqMcyRV/8qlLZ9x2cor+Olk98lWda6WXzmzbKOplMGr
 gizKU2iHNWKzBPShD+HDUcp1ApBNA1vlRYWos8dgSiX1TJceKmV+PzFtRCELYGaoW7iq
 QtO8chB4U+B8RTYKhro0irPYupF3LzjDaD8TTfZoJA/t6Td/JGaRyJl6k/mOst9+H0Gn
 4fPwq6gC6033ob4vLYTbq21Sq3OiuJA7rfqkYP0obKLDxB0QtEchQIByfzduDxTVJ3R1
 1NSyhSM+f0mv4wagNItpqOd5PlunsT+f8tJoY0rCNS13bzTPfC6E4hV2ebNGwG7+M7Iw
 dK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ElA2s/dwdZTqEagDH/fKjJiOk0IWl/tGEfGfAY2ZZg=;
 b=YpTTzF36+2DZpN3EV0x+12ba6NDd0aLKKTP4wHziqWBosPairG0+zb7U9a/O/RqQUT
 faYHifs8tb6iY/OYPA6/yxHlVaKO79lgvugRR656OGSu2XIn4ZpF1X+5mdf7jk0DhA3t
 Aa6DZ8lMOmKBd9ozSgpGRyVomOu4iYkAsziS//6hDg3rqIYvOm5vH9O/Kobxw+7KabzL
 9g2EQpTbHdcptskXLMpiMSFmE6aDhb3wWWD14HJnUbumZAp5a/Tuy9CGqeADBddKRGwE
 q1hu16NjpigAK6ONWtwwu1TZ2yddEYla1H9h3c0kzwMqr36ce+qBkfi6I6uSv5zrj3gb
 raSQ==
X-Gm-Message-State: AOAM532AAV3NI34dlQYhJEJOR0vvdlrv7xgzCIMvcBEowGfl9lxvtszN
 VMVimobUucJbU7c+vlRjgZseVERVir0aYA==
X-Google-Smtp-Source: ABdhPJxNqrQb54s3//K+oe3tFmDgS2fYasJlOEhDnOh7w9lG6hcAogGdkVWNPmo3AeQaNwxxfjxQag==
X-Received: by 2002:a62:62c2:0:b029:2fb:af56:f1c5 with SMTP id
 w185-20020a6262c20000b02902fbaf56f1c5mr2893706pfb.30.1623897097684; 
 Wed, 16 Jun 2021 19:31:37 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:95b0:bc6c:a6df:1b30])
 by smtp.gmail.com with ESMTPSA id l201sm3352474pfd.183.2021.06.16.19.31.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Jun 2021 19:31:37 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Subject: [PATCH v2 1/1] input: Add lang1 and lang2 to QKeyCode
Date: Thu, 17 Jun 2021 11:31:13 +0900
Message-Id: <20210617023113.2441-2-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
In-Reply-To: <20210617023113.2441-1-akihiko.odaki@gmail.com>
References: <20210617023113.2441-1-akihiko.odaki@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pf1-x42e.google.com
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
index ee6fde46d59..269a180a7e2 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -786,6 +786,9 @@
 # @muhenkan: since 2.12
 # @katakanahiragana: since 2.12
 #
+# @lang1: since 6.1
+# @lang2: since 6.1
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


