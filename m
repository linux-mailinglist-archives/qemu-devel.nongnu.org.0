Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 468666A39E
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 10:13:37 +0200 (CEST)
Received: from localhost ([::1]:46176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnIad-0007fA-KS
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 04:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59857)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hnIYa-00083Y-M8
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 04:11:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1hnIYZ-0003DF-Gm
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 04:11:28 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36702)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1hnIYZ-0003C0-9K
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 04:11:27 -0400
Received: by mail-wr1-x430.google.com with SMTP id n4so19888468wrs.3
 for <qemu-devel@nongnu.org>; Tue, 16 Jul 2019 01:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+32n/IoD0ak6GwOMjZAOIGkFQH5HbXPvE/EKhfKdV7c=;
 b=CWIZzN3lQxMNN8dfzRaWUSRbf4CoOynaCGlRUE7gIRtGPw/fw2L4UMWfIIsMNifG4z
 /9ZWsgGdoWqd/f9cCgWlsVQEyN3aA6EUX0d7pjVIDQGEchv4aZTLsRwIMG/9kxdOtO5b
 RNUVrHGuaFV48hq3AEAUgnkj5XYvuREXwM3SAKFhiHY86tA/rF9rmnvbiAsp1yDScor1
 9FFeNCt3HPsGL7Tm+C+3iXfcA8y+ofV5Yd42f8eQGDOek1srSi4HrPEi2QicQtDwqDAn
 XhZIcysnooKSGJdblMOSwSGGBH8/v2BPzxDESfvELvVaFg3r3E8Q6WhBrOTg1KG1W2+L
 NX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+32n/IoD0ak6GwOMjZAOIGkFQH5HbXPvE/EKhfKdV7c=;
 b=sUxF1FGEhJEWaca1a4mx+rTY8gN4ZGfDomg7AU1Vp/thmHaAnupXjZ0S+hRH2PHwQT
 XRXR/VCvIJuaq3Hb9+3QjmmJDmGF5N/Z98vurNVm9vOlrmLvOUK266sCx77RY97kqYBM
 50MceO7KpT68Widn1AFT+NjW4SzS5obX41RXA88noepGpLP5a4xU5wuWZJTSUwM4Ppqe
 EXRQ+WBldrRKItfVBRI80PqF5k036aADSd6XX+vpx4Ii0/d60iqHNRM6WE4mV0Q18s2W
 LnHtVxysbRmeCVLD2AhJqKpMYt4kUXSSNlRrHA3N/RvM+ZZIFrjGL7iAn70dhQ/sAlSa
 v/dA==
X-Gm-Message-State: APjAAAWKNkw/QAKc6ZxkNFG/fK0ml8DNCYVBt/2K89SvhbkFsutTA+ZH
 t/XdBNJprXDQ8qpvN+LbPwvQOTNNRPw=
X-Google-Smtp-Source: APXvYqzuxUElIQeV4zbI6LsxnHIjeH9D3JwfdFkuPwNZLUKiloXEqM4rs/Rg4tKa1Bc8tPHrYolPhQ==
X-Received: by 2002:adf:aac8:: with SMTP id i8mr24008157wrc.56.1563264686180; 
 Tue, 16 Jul 2019 01:11:26 -0700 (PDT)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id c1sm37723879wrh.1.2019.07.16.01.11.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jul 2019 01:11:25 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Jul 2019 10:11:04 +0200
Message-Id: <1563264677-39718-7-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1563264677-39718-1-git-send-email-pbonzini@redhat.com>
References: <1563264677-39718-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::430
Subject: [Qemu-devel] [PULL 06/19] build-sys: remove slirp cflags from
 main-loop.o
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

Left over from c2d63650d962612cfa1b21302782d4cd12142c74.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20190712172743.17632-1-marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/Makefile.objs | 1 -
 1 file changed, 1 deletion(-)

diff --git a/util/Makefile.objs b/util/Makefile.objs
index 3817820..68af3cd 100644
--- a/util/Makefile.objs
+++ b/util/Makefile.objs
@@ -3,7 +3,6 @@ util-obj-y += bufferiszero.o
 util-obj-y += lockcnt.o
 util-obj-y += aiocb.o async.o aio-wait.o thread-pool.o qemu-timer.o
 util-obj-y += main-loop.o iohandler.o
-main-loop.o-cflags := $(SLIRP_CFLAGS)
 util-obj-$(call lnot,$(CONFIG_ATOMIC64)) += atomic64.o
 util-obj-$(CONFIG_POSIX) += aio-posix.o
 util-obj-$(CONFIG_POSIX) += compatfd.o
-- 
1.8.3.1



