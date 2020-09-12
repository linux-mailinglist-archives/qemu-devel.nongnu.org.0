Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34680267CBE
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Sep 2020 00:53:51 +0200 (CEST)
Received: from localhost ([::1]:35158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHEP0-0001C1-AX
	for lists+qemu-devel@lfdr.de; Sat, 12 Sep 2020 18:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kHEHK-0003bx-MC; Sat, 12 Sep 2020 18:45:54 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:43586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kHEHI-0004Tb-FB; Sat, 12 Sep 2020 18:45:54 -0400
Received: by mail-pf1-x431.google.com with SMTP id f18so9678220pfa.10;
 Sat, 12 Sep 2020 15:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UOybM336wZrHDVa8vHMHL6WwtS3s2ZpunZ+4tQm7evs=;
 b=C2uSbmc3f3mUS+MbiJE0gervjcd8bDGHie2dPkzIacK3vJkGHcgL4SUN+xgOQ8D8PK
 6nM8FlovZ5xOzoSfTSnX5T3/90O7GwFlPTSzeORD868GYdzX2jOk3Cwgx5gI+g4DaREv
 qG0yFT1jLw/JwhkIv172zF4OzdFmnYOQw9m2SBiF87LblA/Wz4zYcfppnF8+i7kMKfCt
 V98h+MwUpApT3aZsjtcqDVxa20qAikEu7hJVkUk0pEGPin09tNo3IET2BsWuljov2Yfz
 2p2EZufSVXb61VHEsprwLaC/dRTRSseD5+wK63eA3/bLSR0dKgzTXPiznbnhWyntwLf9
 3Gtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UOybM336wZrHDVa8vHMHL6WwtS3s2ZpunZ+4tQm7evs=;
 b=bUbZAZH33O1RAIbj4C0P4LmlHwASBgoHiNJmLKXA17F+5ExmHhxnT+B66YEoVWpUZC
 wB4wz3P77Rhg0dlatuVhOhKwVd3XzokCELLKXaZJaZTxlUBVDAbwHv2faeAGCJZZlm1+
 AzfSo3ntzcupubncfyYqjwmfogIraeSF0/AMpg0g2qZKcPRCg0qpzTFS9Yc8FZRwlki0
 7woleDTp12uwmfXN6OYchz3A1pDI/r018jn5Sd9G7gR4bi+CTwuOHOYJedDRlJ6kTOXL
 GeraXMcYrLWBkKXtVN/m+IOP8DnNzdJlNF8ihGpbOvTgwCJwQKDGzY6DtDQ8JSczSzd9
 PgAw==
X-Gm-Message-State: AOAM533zPUlrLU1QlP128UPzN9wCzimNCv8TbhRp1Jd022jhlMXhvWgY
 I9O5ZDXZRyc12lhBkkrO1xmKKTDvRk2aDDPfQec=
X-Google-Smtp-Source: ABdhPJwVaFSwp8g3pMh+aXpnHkqHDAgOTqClBoang1bIP063jwcGbKWX7OHrzYi++G1Gfcg6PhQClA==
X-Received: by 2002:a63:4a0a:: with SMTP id x10mr1265030pga.21.1599950750212; 
 Sat, 12 Sep 2020 15:45:50 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id t10sm4639266pgp.15.2020.09.12.15.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 15:45:49 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 14/27] meson: remove empty else and duplicated gio deps
Date: Sun, 13 Sep 2020 06:44:18 +0800
Message-Id: <20200912224431.1428-15-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20200912224431.1428-1-luoyonggang@gmail.com>
References: <20200912224431.1428-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=luoyonggang@gmail.com; helo=mail-pf1-x431.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 qemu-block@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 Xie Changlong <xiechanglong.d@gmail.com>, Peter Lieven <pl@kamp.de>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 meson.build | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meson.build b/meson.build
index bd84a1e777..a725b66a83 100644
--- a/meson.build
+++ b/meson.build
@@ -317,7 +317,6 @@ opengl = not_found
 if 'CONFIG_OPENGL' in config_host
   opengl = declare_dependency(compile_args: config_host['OPENGL_CFLAGS'].split(),
                               link_args: config_host['OPENGL_LIBS'].split())
-else
 endif
 gtk = not_found
 if 'CONFIG_GTK' in config_host
@@ -344,11 +343,6 @@ if 'CONFIG_ICONV' in config_host
   iconv = declare_dependency(compile_args: config_host['ICONV_CFLAGS'].split(),
                              link_args: config_host['ICONV_LIBS'].split())
 endif
-gio = not_found
-if 'CONFIG_GIO' in config_host
-  gio = declare_dependency(compile_args: config_host['GIO_CFLAGS'].split(),
-                           link_args: config_host['GIO_LIBS'].split())
-endif
 vnc = not_found
 png = not_found
 jpeg = not_found
-- 
2.28.0.windows.1


