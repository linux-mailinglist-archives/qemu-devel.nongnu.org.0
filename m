Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 395E047C4C7
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 18:14:32 +0100 (CET)
Received: from localhost ([::1]:47890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mziid-0003UP-BN
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 12:14:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziJC-00014a-2h
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:14 -0500
Received: from [2607:f8b0:4864:20::529] (port=34560
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mziJ5-0007fn-BX
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 11:48:13 -0500
Received: by mail-pg1-x529.google.com with SMTP id g22so1065902pgn.1
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 08:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bsfEKlYqYyVVIZAQxrO42ZoY7uXuqNeBFTeiKhl2LqI=;
 b=bFwnFJsi7hGliIJK+j4FHZsusrSxSBIavzzPuUiC+wp8dw7KnWAKuDHRaSOfi4kJ+u
 HfQKvKQY//R6V8LAGpTfr7dnsqk/2Uw3FQTYUmR175Riby7XZdzbTOxPoa2Qh79ZAxvl
 bofZqTNR489OtFYteMUrFcLPm7xBqtUIeP8Ej+YMoButWARIL5TcJ9fANRYKbb+CkKwb
 SHVLevjeLMOa/qpoVa9sbsv2mQXUrNMtDovr2Eh+K186xEPO1kYA76I1S/ORiOliKoQz
 lxYlSKY/PcmfxlXOd9rVlh59/6zZULU6PCQk3FWC7221bCUc1w26TFKh3VetF9ndyL7d
 oohQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bsfEKlYqYyVVIZAQxrO42ZoY7uXuqNeBFTeiKhl2LqI=;
 b=n7FUtbeSc3FunRJDv4AQVllYobRTh8bQdVxqbfmVuZAnQBgQXlCr+CuKu08JYXBCGv
 ZJpBjd+lb3r3rzfEqlDAjzYFHXOmUYtm3FU4L9TRXNqFWBvTZ8fo2aXvLUt+r6u/ZbxQ
 3qo/lSMyjb+lJzOIrc80osDOBQENDsumcDRdm4aucaZOaLElU4+V3JMzWtvt7CVWkNIv
 MHcP+5D4hX46OjFZfrMMA4P9YFXbyiqBzqL+VFUa1KcnJBGeJfvXDm70klaix2oLHJY+
 UvsKN2GKLstDiTXiWLhaaQLc1C7wZ7xRi5RrKb3tslMAkYCs0wV8HtUHKCS8VZXP/G9B
 k7fw==
X-Gm-Message-State: AOAM531j9/1jWTW36fmn15IK7le+r/vfplkUbYztMof6ergSvmltVyZx
 qZ+blUTHHxbyRaR31SWuEJ6kQpNrZ4Wipg==
X-Google-Smtp-Source: ABdhPJxUQyMVRPLww6Wk1qEAWyPd3Tq6EXdboRcGqQPtGvFWfuPRibnXO6MSlD6pcNiEL7n76T3//Q==
X-Received: by 2002:a65:6488:: with SMTP id e8mr3662440pgv.416.1640105286148; 
 Tue, 21 Dec 2021 08:48:06 -0800 (PST)
Received: from localhost.localdomain ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id b192sm2256818pga.35.2021.12.21.08.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 08:48:05 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/31] configure,
 meson.build: Mark support for loongarch64 hosts
Date: Tue, 21 Dec 2021 08:47:36 -0800
Message-Id: <20211221164737.1076007-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221164737.1076007-1-richard.henderson@linaro.org>
References: <20211221164737.1076007-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: WANG Xuerui <git@xen0n.name>

Example output of `uname -a` on an initial Gentoo LA64 port, running
the upstream submission version of Linux (with some very minor patches
not influencing output here):

> Linux <hostname> 5.14.0-10342-g37a00851b145 #5 SMP PREEMPT Tue Aug 10 12:56:24 PM CST 2021 loongarch64 GNU/Linux

And the same on the vendor-supplied Loongnix 20 system, with an early
in-house port of Linux, and using the old-world ABI:

> Linux <hostname> 4.19.167-rc5.lnd.1-loongson-3 #1 SMP Sat Apr 17 07:32:32 UTC 2021 loongarch64 loongarch64 loongarch64 GNU/Linux

So a name of "loongarch64" matches both, fortunately.

Signed-off-by: WANG Xuerui <git@xen0n.name>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211221054105.178795-31-git@xen0n.name>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 configure   | 5 +++++
 meson.build | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 8ccfe51673..9724631609 100755
--- a/configure
+++ b/configure
@@ -631,6 +631,8 @@ elif check_define __arm__ ; then
   cpu="arm"
 elif check_define __aarch64__ ; then
   cpu="aarch64"
+elif check_define __loongarch64 ; then
+  cpu="loongarch64"
 else
   cpu=$(uname -m)
 fi
@@ -3719,6 +3721,9 @@ if test "$linux" = "yes" ; then
   aarch64)
     linux_arch=arm64
     ;;
+  loongarch*)
+    linux_arch=loongarch
+    ;;
   mips64)
     linux_arch=mips
     ;;
diff --git a/meson.build b/meson.build
index f45ecf31bd..6d7c02bad7 100644
--- a/meson.build
+++ b/meson.build
@@ -56,7 +56,7 @@ python = import('python').find_installation()
 
 supported_oses = ['windows', 'freebsd', 'netbsd', 'openbsd', 'darwin', 'sunos', 'linux']
 supported_cpus = ['ppc', 'ppc64', 's390x', 'riscv', 'x86', 'x86_64',
-  'arm', 'aarch64', 'mips', 'mips64', 'sparc', 'sparc64']
+  'arm', 'aarch64', 'loongarch64', 'mips', 'mips64', 'sparc', 'sparc64']
 
 cpu = host_machine.cpu_family()
 
-- 
2.25.1


