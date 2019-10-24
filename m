Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAF7E3590
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 16:29:00 +0200 (CEST)
Received: from localhost ([::1]:44214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNe6k-00044Q-Jo
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 10:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34590)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iNdif-0006pQ-TJ
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 10:04:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iNdic-0007aV-Cj
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 10:04:04 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:38958)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1iNdic-0007Zt-5T
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 10:04:02 -0400
Received: by mail-wr1-x432.google.com with SMTP id a11so10151735wra.6
 for <qemu-devel@nongnu.org>; Thu, 24 Oct 2019 07:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fuQszgdPGBPwvusB1Bd3Ai26mEtUdVTfTTnv1HWpc9k=;
 b=fk89SAkAlx/Nn/JW1Za5RwIaD5V7z2cnkGECtpxrIQJaCIrQj+knp6U+tJVdYroGYn
 jWTcnOxv8pBrpV8M0nTqLO6nrMf1p9U6oYLfI1aC5j4SQCtsdBeMBcSH7JNWaNO/EHKl
 kP83FpPfv+geS8yPLQQ/uwGFkmCLio/QowGCx7XeZr8WUlMKDFsnfA9n7oQbIUBurtQI
 sW6ys+tTSVTCgpDhzvWoT9atn3sDNoaTK3vcyH885GjFDNN8sm9p1gR4BMxY2ditH07A
 jQIrchnHQnATyyyaUjm8mPGtcsFNM/e8izVK5DiSK9G5mP1EzI2gefe8P1DiuMU9+9rU
 E3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fuQszgdPGBPwvusB1Bd3Ai26mEtUdVTfTTnv1HWpc9k=;
 b=jKCp+zCZa30Uk5R3B6LlaPaT/zV9jXV6IhHS3zS6CBWHeXQ99RCtAmNDW6OZD6s1jp
 4M8+hFt0Lk3+a+AFpGHk9TNsRz0icaiHqbkPO3eeVjPNbxkM3CZ/WGNajSiOn9UVkNwE
 2sk5/J/F1eZJdvvW3eRpzO3F4BQAiqIw9lCTrRLovR9+BwPRyT9AGJERpeV/ZBoEKn1z
 9TlZvLQyXUXoqydAhlqqjLgINTOh6T4xNrlawd8cDgZXas+JRKU20EegQn8TP+pGh0Nj
 yvuLQyyDGiZDvqi8RasJ+RGjqStHtajx76tR4OupsoGCV4CwBGURBArTl5WZ0jSqpeyi
 tbvQ==
X-Gm-Message-State: APjAAAUjTaZy02VyPLom5lKidEHnAQqKtXMHGDMdidaPgJSbPTUc+ErD
 UGWLJYEGB+cda3aweBDI9cYFEtNt
X-Google-Smtp-Source: APXvYqzRkWulffXzHasD8OjUDZJBDhorCjTD/nzYF1DSfQKnkBKYvbSDUj/bMc7A2ufMMAk19ycEbQ==
X-Received: by 2002:a5d:674f:: with SMTP id l15mr4388528wrw.80.1571925840725; 
 Thu, 24 Oct 2019 07:04:00 -0700 (PDT)
Received: from 640k.localdomain ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id b7sm10610155wrn.53.2019.10.24.07.03.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 24 Oct 2019 07:03:59 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/39] Updated Bulgarian translation (19) - 4.1.0
Date: Thu, 24 Oct 2019 16:03:19 +0200
Message-Id: <1571925835-31930-4-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1571925835-31930-1-git-send-email-pbonzini@redhat.com>
References: <1571925835-31930-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::432
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
Cc: Alexander Shopov <ash@kambanaria.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Shopov <ash@kambanaria.org>

Signed-off-by: Alexander Shopov <ash@kambanaria.org>
Message-Id: <20191019120534.27479-2-ash@kambanaria.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 po/bg.po | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/po/bg.po b/po/bg.po
index 3d8c353..98c57e5 100644
--- a/po/bg.po
+++ b/po/bg.po
@@ -1,14 +1,14 @@
 # Bulgarian translation of qemu po-file.
-# Copyright (C) 2016 Alexander Shopov <ash@kambanaria.org>
+# Copyright (C) 2016, 2019 Alexander Shopov <ash@kambanaria.org>
 # This file is distributed under the same license as the qemu package.
-# Alexander Shopov <ash@kambanaria.org>, 2016.
+# Alexander Shopov <ash@kambanaria.org>, 2016, 2019.
 #
 msgid ""
 msgstr ""
-"Project-Id-Version: QEMU 2.6.50\n"
+"Project-Id-Version: QEMU 4.1.0\n"
 "Report-Msgid-Bugs-To: qemu-devel@nongnu.org\n"
 "POT-Creation-Date: 2018-07-18 07:56+0200\n"
-"PO-Revision-Date: 2016-06-09 15:54+0300\n"
+"PO-Revision-Date: 2019-10-19 13:14+0200\n"
 "Last-Translator: Alexander Shopov <ash@kambanaria.org>\n"
 "Language-Team: Bulgarian <dict@ludost.net>\n"
 "Language: bg\n"
@@ -66,7 +66,7 @@ msgid "Detach Tab"
 msgstr "Към самостоятелен подпрозорец"
 
 msgid "Show Menubar"
-msgstr ""
+msgstr "Лента за менюто"
 
 msgid "_Machine"
 msgstr "_Машина"
-- 
1.8.3.1



