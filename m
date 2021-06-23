Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D38A3B19BE
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 14:19:03 +0200 (CEST)
Received: from localhost ([::1]:33288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw1qQ-0002pO-AR
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 08:19:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lw1m2-0003rC-NF
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:14:30 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:43593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lw1m0-0001zU-Ul
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 08:14:30 -0400
Received: by mail-ej1-x62c.google.com with SMTP id nb6so3656369ejc.10
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 05:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VP9s5JyOxdlmVpItLUdNGhW5j1cHS9B8ambxVV+LEbo=;
 b=QN+7lVSaXDYlyuHIYEFz38wryx2Goi/L+OhqI0p1d4tv24ZSmj8dyxUBgIhXGolswO
 aRhIvEYJJf4/I8fF4XcgxuCz+58J/ammr2hXIs6RtYxiA7PTYMdd9JYIy6UTSonaue/b
 pbVl0PgG5JkP+4A83Y5GBlgR4kOcJdwSSvseY8PmD95i4Ov/KM7W/HJuMgD/9lZbojJA
 JKWvRpuKtNNdr38Fsmv4yiF7RXJUzUGg8bXnjjqQOFSP0b0YAYqLyrGfSdnaxk1nxohX
 j3dLA6jNURfRVC2ySaQnqh3GGwOJgONeJPX3/0MavFj52LCZ0NFZm2teLzATgs/pQsk7
 5oJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VP9s5JyOxdlmVpItLUdNGhW5j1cHS9B8ambxVV+LEbo=;
 b=as1T95eu+GZQRCAdtQyafcsQixLQ42NgSMGawQkU2kqeI2B4gZm4Ky7LGdQDdyCXGH
 36mRq8CnEwmjP4Q7xz4q17ngcrI9tmKzZnvlaPcX6Tu2zqRkZN0VjEerQl1P0XtDPpbl
 /39YitMtijhPvSLpT/SSuNuo81MvZ0UkdIk19U16kafV23+2WRkkq1Xfp+8d6kLooGN8
 KrZQp82agAfKOX7xrSGenxFki0qn5h/bp/8tR3lF5S0eayC77nYfXqzCo3osYCW17dX4
 ycKeHSXTCjnf4G6PaDWlAfZ2EeTPHfDg5NPP1tkPkyQT7a/czIDQ0hB+7CxTZ+ZBDdk1
 Ab9A==
X-Gm-Message-State: AOAM5330i+HWR2S/Qfq8krET4k+Bb4XPhWzfWQF6nPrexrSwHP1JD47y
 p4/UtJEPaRCg7X9gPwOogoLiaOWOSl0=
X-Google-Smtp-Source: ABdhPJzLokrNpVGMZ5zQapMe5Sn0K9Kyd4RrmaFWM/pprsehLU2MVIxLSn0TRUhyrFolKvMZFLfgUg==
X-Received: by 2002:a17:906:1681:: with SMTP id
 s1mr9631162ejd.321.1624450467715; 
 Wed, 23 Jun 2021 05:14:27 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id o5sm1680778edt.44.2021.06.23.05.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 05:14:27 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/12] configure: drop unused variables for xts
Date: Wed, 23 Jun 2021 14:14:15 +0200
Message-Id: <20210623121424.1259496-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623121424.1259496-1-pbonzini@redhat.com>
References: <20210623121424.1259496-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@liaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All XTS configuration uses qemu_private_xts.  Drop other variables as
they have only ever been used to generate the summary (which has since
been moved to meson.build).

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@liaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/configure b/configure
index 38704b4e11..00e7dd749a 100755
--- a/configure
+++ b/configure
@@ -406,9 +406,7 @@ gtk="auto"
 tls_priority="NORMAL"
 gnutls="$default_feature"
 nettle="$default_feature"
-nettle_xts="no"
 gcrypt="$default_feature"
-gcrypt_xts="no"
 qemu_private_xts="yes"
 auth_pam="$default_feature"
 vte="$default_feature"
@@ -2897,7 +2895,6 @@ int main(void) {
 }
 EOF
         if compile_prog "$nettle_cflags" "$nettle_libs" ; then
-            nettle_xts=yes
             qemu_private_xts=no
         fi
     fi
@@ -2938,7 +2935,6 @@ int main(void) {
 }
 EOF
         if compile_prog "$gcrypt_cflags" "$gcrypt_libs" ; then
-            gcrypt_xts=yes
             qemu_private_xts=no
         fi
     elif test "$gcrypt" = "yes"; then
-- 
2.31.1



