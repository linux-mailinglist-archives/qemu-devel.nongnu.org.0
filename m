Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88868120FF2
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Dec 2019 17:47:16 +0100 (CET)
Received: from localhost ([::1]:56800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igtWd-0001WB-Gq
	for lists+qemu-devel@lfdr.de; Mon, 16 Dec 2019 11:47:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56939)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1igtFI-0005Ho-Bh
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 11:29:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1igtFH-0007n3-8f
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 11:29:20 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:38735)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1igtFH-0007kp-2Y
 for qemu-devel@nongnu.org; Mon, 16 Dec 2019 11:29:19 -0500
Received: by mail-wm1-x331.google.com with SMTP id u2so7397073wmc.3
 for <qemu-devel@nongnu.org>; Mon, 16 Dec 2019 08:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=HDTYKQfotEZNCNNOb0BXo5V66sef5b68rxGZly+OEbw=;
 b=FfTfG4QnS8FCA3JjBua14YB4XpB7UPYrxvIvldeyPg7XNkAjXADvRhghiosyXmO9WS
 kMxWsZ30XGytBBn2gVZA89NHwgpLjh0Z9OwO6792fParpQH9vEQRZubESSIpRXoJ0n8z
 bag5BvPR9/9nnQykB5oTn62Y1lmZ1ToXAgxov8ptB/CUYh/eUBRDYQKuph3J35FMDt4q
 yCJRA32b/y49/SmvdQwHaY47CDD5NIjMXFx9g0zyHpybn6m1QUGcdk0KJjKEpR0mq5B6
 MUvFhPd77tB2AFPVtf4X/uuOdc6CvjFvzNZVkvJGiUpQESyGfSA5T1/fCWqmCzGp5kVK
 DxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=HDTYKQfotEZNCNNOb0BXo5V66sef5b68rxGZly+OEbw=;
 b=a7prZWpRdjpZWnQUsNuxFUjAbK+ieJFXAfWgEivHt1/p/MMFLZZw2Gek7qe2fC5uMR
 xwDRXQ2X2X0fXbKhDUiMUqmSOw44xlzmVbUTjizYEWCk87Z2lAZiF0hWBZ48ASNIwbUl
 yqlAzHON12to+lId1Rf/TURvxqSVo7NDl5EUbgsTnfLrCpRFrSKV2JvpQO2GWj8r3AzY
 kmkjlX4sA0wt75PQ8H0v+LZycwJRzJWqQskkXuoJrqRZboUC6a6dAis4DPya3QgTcaXZ
 5hU4DB329qyKjCeqJcxZWuYEH3w7oW7RJ9i7v40669I3XAuzPZEvAfNXxCWszF9BHvgx
 2udg==
X-Gm-Message-State: APjAAAX8xNUV2WuPro02y1uznEPcjYd21MOz0bUrtEzOIjRPJJ/ebZAc
 fo+LM2M0PHcF2dTavMQKESRky2fG
X-Google-Smtp-Source: APXvYqxjXlUSYI18dwV38IvVOIFYUJJAMJ2ZyPQ0UWBydkl8z0mVxa7hNmK+t3zL3JaYbhu7bCccbQ==
X-Received: by 2002:a1c:1f51:: with SMTP id f78mr29874454wmf.60.1576513757911; 
 Mon, 16 Dec 2019 08:29:17 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id q68sm19962334wme.14.2019.12.16.08.29.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 16 Dec 2019 08:29:17 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/62] Makefile: remove unused variables
Date: Mon, 16 Dec 2019 17:28:14 +0100
Message-Id: <1576513726-53700-31-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576513726-53700-1-git-send-email-pbonzini@redhat.com>
References: <1576513726-53700-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::331
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Makefile b/Makefile
index 1361def..a2acef3 100644
--- a/Makefile
+++ b/Makefile
@@ -445,10 +445,6 @@ dummy := $(call unnest-vars,, \
                 io-obj-y \
                 common-obj-y \
                 common-obj-m \
-                ui-obj-y \
-                ui-obj-m \
-                audio-obj-y \
-                audio-obj-m \
                 trace-obj-y)
 
 include $(SRC_PATH)/tests/Makefile.include
-- 
1.8.3.1



