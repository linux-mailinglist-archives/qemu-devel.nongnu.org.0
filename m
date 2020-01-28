Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A847914C0C5
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 20:16:03 +0100 (CET)
Received: from localhost ([::1]:35840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwWLC-0005JO-Jz
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 14:16:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38722)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iwV8h-0005Mv-54
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 12:59:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iwV8f-0001vm-Us
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 12:59:03 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:50764)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1iwV8f-0001su-Nl
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 12:59:01 -0500
Received: by mail-wm1-x32e.google.com with SMTP id a5so3537223wmb.0
 for <qemu-devel@nongnu.org>; Tue, 28 Jan 2020 09:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S2BwddqM4KyEVlQnjNFvdzFycjeND7cyvTUeQLgDTTs=;
 b=Sz7RcOcrjl9IB3PtZC14PcihXqhH3w7rg3n09nKJOSgusvKEuvacTzHtn0Dit26Z93
 mD8/jWVRpO/EStt6gPthcp//XpK86sDrp2dcxK0GBr3VNFZnCPXP03RlWy9DMI7ZTRUG
 YD5D7G86ZtfwCF8+Bn07yDPU+4FOpmhLqGWBW8MOa3jOGKWQ81RCWbCUyeYE51XdvVKu
 30sP4qBwcD5pK4eguWBbL0DQMMxZoRNMDhpxPnslCueVe4+3tSD2qoMC0phifxJYbqFt
 FrK9Excikre86QTI/VbYo7NG2DPZ3NYKhDBDV5ZTkbmXGvDS4a13h6N08XWGWBg2wJb1
 dNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=S2BwddqM4KyEVlQnjNFvdzFycjeND7cyvTUeQLgDTTs=;
 b=HRpvJu485RzrXFYhoV0rY2dDzrZTtbJ3OHZMsjZiiwZ8W5KcHa991DlnyIYpZArqNQ
 3ttAKNJwQDP/2t/jeHptgNJjeW+2C4mnbg5ditomWSk/kAIsVmjA565mZegy0L03FJrg
 78vFvkGbRU+qpiKsXwd1DwrZrwZW9fvHxfpLqRDT+uK17eLknCPG7U0A6N/lXt6A0XjB
 zFknLJ8v1/vhHzidHDYY6oiz41vJRQZATTxDcwRTIf7NsJOlRkJ1F7WYQyVdfzj9LmIS
 nTyjEv+31HfxSIrFrYoOggk/EVQjsHSt+Awbi99mKqqCSayvDYV0Bv5niXbFAr7hmSkq
 wSOw==
X-Gm-Message-State: APjAAAXKmyaqWvvbEbeYzQ2SB2vFV4dd0LXcmnTn0GgqWpxBH6goazYP
 SGHtTPXP9BgF7B2j+GACH8n7Eb/t
X-Google-Smtp-Source: APXvYqybloEqI3Ro+mNzl0NAhNupOn3aTZaU1dlmkmT+6ikp2p58TdI/vE6hqU8i83o3QCNtLSpGNw==
X-Received: by 2002:a7b:cc14:: with SMTP id f20mr6257925wmh.58.1580234340496; 
 Tue, 28 Jan 2020 09:59:00 -0800 (PST)
Received: from localhost.localdomain (93-36-56-206.ip58.fastwebnet.it.
 [93.36.56.206])
 by smtp.gmail.com with ESMTPSA id o4sm27046968wrx.25.2020.01.28.09.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2020 09:59:00 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 132/142] meson: install desktop file
Date: Tue, 28 Jan 2020 18:53:32 +0100
Message-Id: <20200128175342.9066-133-pbonzini@redhat.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200128175342.9066-1-pbonzini@redhat.com>
References: <20200128175342.9066-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32e
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 Makefile       | 3 ---
 ui/meson.build | 2 ++
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 898949ded6..474aaeb1a9 100644
--- a/Makefile
+++ b/Makefile
@@ -230,9 +230,6 @@ endif
 endif
 
 install: all install-datadir install-localstatedir
-	mkdir -p "$(DESTDIR)$(qemu_desktopdir)"
-	$(INSTALL_DATA) $(SRC_PATH)/ui/qemu.desktop \
-		"$(DESTDIR)$(qemu_desktopdir)/qemu.desktop"
 ifdef CONFIG_GTK
 	$(MAKE) -C po $@
 endif
diff --git a/ui/meson.build b/ui/meson.build
index 1d87b975e1..024aa18bac 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -110,4 +110,6 @@ endforeach
 subdir('shader')
 subdir('icons')
 
+install_data('qemu.desktop', install_dir: config_host['qemu_desktopdir'])
+
 modules += {'ui': ui_modules}
-- 
2.21.0



