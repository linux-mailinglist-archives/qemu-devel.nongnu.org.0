Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D6A186CC7
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 15:04:30 +0100 (CET)
Received: from localhost ([::1]:38748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDqM1-0005rS-Br
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 10:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48798)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jDoR7-0004rd-Rp
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 08:01:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jDoR6-0002hw-FZ
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 08:01:37 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:41844
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jDoR6-0002Yk-9I
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 08:01:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584360095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BKSSwdYJPbb4uWxYFI4KLBXnduxOuP5K8YYFHLhNPUQ=;
 b=BZEsv8NVqWMvGIO5rMLM/8p2p6dV46YF6KPgFCaa6m+VqLeJmA0pszQ3beB9MJN3cG5kwK
 xMIrlU2U6gg4BFpo2uzZ0kWhFhqWv3vWQyD1dnSFkUxQjn4x9pnkqxc15OuZBzDOD8BqkC
 BFOQ6PaymWAqFVg6JLa0Wr6xsR68m2U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-oSx4aRQuOHiMBx-sV0oaLw-1; Mon, 16 Mar 2020 08:01:32 -0400
X-MC-Unique: oSx4aRQuOHiMBx-sV0oaLw-1
Received: by mail-wr1-f72.google.com with SMTP id p2so6381082wrw.8
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 05:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ylBxkMSvWixSUv3eUrtex/sRwwpJbll3EWs6AmFjBwc=;
 b=EZ7CCH3OrNqG9+ukiRMyhq+bSWdTP1x1R2r/r7kXBFeW3u0lwKu0u5Y3chgOs5IinJ
 E9tneswC3RKtSHMh4ewmfS2eXZfLYGnHLhViGqBpVCW9DzE66yXuhsIwvU1TtLsObIKJ
 NOakAKWI4S1gV9aFfYrVsfi+WVXinxeoXkcxoiQgm0R37xGmHf+NT02GhhCvKoiklYD4
 9f0KrQW0jw2l2skYoKyh7PinH8Q7lL9lA6ME6kMK9GpbJ6AkTF9Nukm87rP6AzVYG1KV
 P4ODLkx1XqBtu49zZNf++4epB9VyPoisYoWXagNUgG0giAmuhU6ABvn5+W/aswXUt1aO
 Rsjw==
X-Gm-Message-State: ANhLgQ1Ah1/Ie3NLp1yNALmW/7X3YMEVvvecYAN61LIIgsuyWqNlCriW
 UIpom5mq2LaLs6fRYkC0TQkIuMxwdnAVOaptiDkmpI7cIioAm3GAWUK4rb/sBsVajQ7JtjP7kfI
 XLMKNtp51UOJPkf8=
X-Received: by 2002:a1c:9658:: with SMTP id y85mr18536330wmd.63.1584360091192; 
 Mon, 16 Mar 2020 05:01:31 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvgH/LCRRK5hjnAH0MnxUIJFYgZJRhg6C/xMUSn1N/pliNnfO/ap89kxvNeMIXgbKnqazxTUQ==
X-Received: by 2002:a1c:9658:: with SMTP id y85mr18536305wmd.63.1584360091007; 
 Mon, 16 Mar 2020 05:01:31 -0700 (PDT)
Received: from localhost.localdomain (191.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.191])
 by smtp.gmail.com with ESMTPSA id 133sm30707476wmd.5.2020.03.16.05.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 05:01:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/11] accel/Kconfig: Add the TCG selector
Date: Mon, 16 Mar 2020 13:00:45 +0100
Message-Id: <20200316120049.11225-8-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316120049.11225-1-philmd@redhat.com>
References: <20200316120049.11225-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Expose the CONFIG_TCG selector to let minikconf.py uses it.

When building with --disable-tcg build, this helps to deselect
devices that are TCG-dependent.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 Makefile      | 1 +
 accel/Kconfig | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index d1e2ec10e7..1cf9d76ce7 100644
--- a/Makefile
+++ b/Makefile
@@ -405,6 +405,7 @@ endif
 MINIKCONF_ARGS =3D \
     $(CONFIG_MINIKCONF_MODE) \
     $@ $*/config-devices.mak.d $< $(MINIKCONF_INPUTS) \
+    CONFIG_TCG=3D$(CONFIG_TCG) \
     CONFIG_KVM=3D$(CONFIG_KVM) \
     CONFIG_SPICE=3D$(CONFIG_SPICE) \
     CONFIG_IVSHMEM=3D$(CONFIG_IVSHMEM) \
diff --git a/accel/Kconfig b/accel/Kconfig
index c21802bb49..2ad94a3839 100644
--- a/accel/Kconfig
+++ b/accel/Kconfig
@@ -1,3 +1,6 @@
+config TCG
+    bool
+
 config KVM
     bool
=20
--=20
2.21.1


