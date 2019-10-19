Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FC3DD8C2
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Oct 2019 14:59:50 +0200 (CEST)
Received: from localhost ([::1]:54262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iLoKj-0003MQ-SZ
	for lists+qemu-devel@lfdr.de; Sat, 19 Oct 2019 08:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35699)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lists@kambanaria.org>) id 1iLoGc-0000fe-GP
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 08:55:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lists@kambanaria.org>) id 1iLoGb-0007tK-6k
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 08:55:34 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37012)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <lists@kambanaria.org>)
 id 1iLoGa-0007q6-Mq
 for qemu-devel@nongnu.org; Sat, 19 Oct 2019 08:55:32 -0400
Received: by mail-wr1-x42c.google.com with SMTP id e11so246145wrv.4
 for <qemu-devel@nongnu.org>; Sat, 19 Oct 2019 05:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kambanaria-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ygocjr+N9fo46tpDkGFVA7itYtRMHALl4g3G6c148DQ=;
 b=ZvqjedIHcB56PJcMSYFkeapr+lu9L9CX3sajVQK6cTnBcRnqxnH8Ve42xsQeDTIE7s
 aDudmfh4iyIP+tYth1QZxCHEFz7iHBNUdGFY2cmVkPO56aE/znneVVwfoVuJpkQFwOo4
 Tpf3apN6KqjxAsWxJ7y1iYTZv48gEiWenEX/fJNu/+DD3MXdcuPm8Y9U9De8OEj9yPc4
 jUTpQCCsvxcI9s8fQTv47D2+36ru/q2fpdKI/nI1OUV7kYERTe59y1oNlZeeZVpbVO1i
 9wi1Jh9wSEVloav7HpLSfL5A4waC6skDFPRAy62iFLwa3YlddOezK+9lMQ3wceWDSV4z
 Oahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ygocjr+N9fo46tpDkGFVA7itYtRMHALl4g3G6c148DQ=;
 b=YHoaekU+rZakO5rURqiAT7/y3nTB9QhD4Q/XhaWHjF1EnGAEbm+eclkXYPPwS22gWz
 dKDbaTpuZXw6j143MdundfxTi9fhYuKLPYanSKGCisyqsVxFg/msm/UzAW6YXMR7cn7q
 H/4qC9et5KPhu3UsQGgA3jU6qyi2rCM3VvenGeqQ2MrUH3oL2eHpIMT+8hXeWXXk/hQQ
 lt/Kpy5a6MSg7fWm3nF9rn0DpyiyiP/YT1Rr/IZ5JM1Y5sO3SFIfzjYCBnFVA87u73oa
 qf7A/wHAAW3XdHxESgkzkspfs8I1++rNnqqqb19DqhHoil/jrRSeUTwIAftWiz5A0omz
 YfTw==
X-Gm-Message-State: APjAAAUskNM5zAmIQIkOYyd0/gYTfP+TYFYNx0WXaA4x8MTshWi7sZq5
 u7HsFYxUiXKSdc8bhUwJsIGnpultYwOj5A==
X-Google-Smtp-Source: APXvYqyK0oDj5HLYBJekZTiTxHkLyZqGMm8nptqPyYbwIQmoJvuhLYzI10BCM2YYk5+cuyKlHKX+AQ==
X-Received: by 2002:adf:82d2:: with SMTP id 76mr8866901wrc.52.1571489731008;
 Sat, 19 Oct 2019 05:55:31 -0700 (PDT)
Received: from ashopov-C02X544YJHD3.home (ip4da0f75a.direct-adsl.nl.
 [77.160.247.90])
 by smtp.gmail.com with ESMTPSA id b22sm9285402wmj.36.2019.10.19.05.55.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 19 Oct 2019 05:55:30 -0700 (PDT)
From: Alexander Shopov <lists@kambanaria.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] Updated Bulgarian translation (19) - 4.1.0
Date: Sat, 19 Oct 2019 14:55:20 +0200
Message-Id: <20191019125520.29056-2-lists@kambanaria.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191019125520.29056-1-lists@kambanaria.org>
References: <20191019125520.29056-1-lists@kambanaria.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42c
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
Cc: qemu-trivial@nongnu.org, Alexander Shopov <ash@kambanaria.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexander Shopov <ash@kambanaria.org>

Signed-off-by: Alexander Shopov <ash@kambanaria.org>
---
 po/bg.po | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/po/bg.po b/po/bg.po
index 3d8c353372..98c57e5b22 100644
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
2.23.0


