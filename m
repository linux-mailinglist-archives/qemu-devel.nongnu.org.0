Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D334EA326
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 00:44:15 +0200 (CEST)
Received: from localhost ([::1]:60508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYy5u-0006S5-6H
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 18:44:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYy2l-0002i3-4k
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:41:00 -0400
Received: from [2607:f8b0:4864:20::102f] (port=35686
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nYy2j-0007uH-Eb
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 18:40:58 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 mj15-20020a17090b368f00b001c637aa358eso607677pjb.0
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 15:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=URKrjrpnGxI0MyeXnOmurYPvs0k0h5uuEh4aJLoXJic=;
 b=CYkpQG1USvcOm5kMC8nweoWQLV1/pk1byUj/+/3Eibsu/wtPeOjILuQnV1GyB71+AK
 Rsg7xP0i9OwfLxUwXcMAhDofRg/q9Y45cHhbz3qgipgWGZkOv18JUDVLMzBL9r+QHWzl
 n8OYGBViB4pDk2Db6Re+zbWO/rD9Hqszm6wih5PdpzK0mocqKMRMJ13AEJoMTwRA8fit
 4pU5cU75uq4Re3nFgHUz0kbl5+Qkfnze3wKuhnyEBdqaTJBVVRLZ/s69HNcF/llqMmRM
 UNDABrJUBOG8zShveDspGHnzw7whHJ7V5HhwpgoD6r0GSsycB/SDrc+J7Ll6HiRtdiqA
 4CaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=URKrjrpnGxI0MyeXnOmurYPvs0k0h5uuEh4aJLoXJic=;
 b=XwY24Ik0CWIBGfRgZGNvNChHZ2ypcjqvBtUDYEUry8QqZjs/soH8t56Sxqz2xPWq7d
 ZLW0nrKl94UuCtZXP9pxqGnuE+ESfUL67C2fsrYNq/OSgA9fD8lYeBn/KgnAl9+w3t4m
 copg3uA0cbq6ebAKDj2VagZ0B2GDLcttlBjkc6wXe4I1snulr37V9bxB3wFTfsvOXqk8
 cm4MaJfW+dvZkNcuPgXYKtBD5IYdoJMc6TViBWe8Px6Z6szkHqZRiizLOxlfeC9JFSxn
 VnjPT6QMC7vEy4zWk+wEgXk9/bdW6GNyHEAtb2t6AbDBHxJOWQ1mCtmibEVsvorpJySi
 3/Qw==
X-Gm-Message-State: AOAM531rA3C8EmUzx9nLCpVulSL0812mBfJtUzpbip2au0+cv+yKYKma
 igd+ZCGgkMxkrj4L/rby6Xy9ofWCu6DtUg==
X-Google-Smtp-Source: ABdhPJwvDUwQL7Iq3a3lNAXlPqQDhFedKLOopt/Madc4zWI431hf20l9607IyE8tOxH7/tLQPM99Kw==
X-Received: by 2002:a17:902:ecc6:b0:154:5393:aa98 with SMTP id
 a6-20020a170902ecc600b001545393aa98mr28540635plh.88.1648507256055; 
 Mon, 28 Mar 2022 15:40:56 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a056a00114d00b004c122b90703sm17201808pfm.27.2022.03.28.15.40.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 28 Mar 2022 15:40:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/4] ui/cocoa: Respect left-command-key option
Date: Tue, 29 Mar 2022 00:40:11 +0200
Message-Id: <20220328224012.32737-4-philippe.mathieu.daude@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328224012.32737-1-philippe.mathieu.daude@gmail.com>
References: <20220328224012.32737-1-philippe.mathieu.daude@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Akihiko Odaki <akihiko.odaki@gmail.com>

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
Fixes: 4797adce5f ("ui/cocoa: add option to swap Option and Command")
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220317152949.68666-1-akihiko.odaki@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 ui/cocoa.m | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index cb6e7c41dc..c4e5468f9e 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -923,7 +923,8 @@ - (bool) handleEventLocked:(NSEvent *)event
                 /* Don't pass command key changes to guest unless mouse is grabbed */
                 case kVK_Command:
                     if (isMouseGrabbed &&
-                        !!(modifiers & NSEventModifierFlagCommand)) {
+                        !!(modifiers & NSEventModifierFlagCommand) &&
+                        left_command_key_enabled) {
                         if (swap_opt_cmd) {
                             [self toggleKey:Q_KEY_CODE_ALT];
                         } else {
-- 
2.35.1


