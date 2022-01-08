Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9174882A0
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 09:52:40 +0100 (CET)
Received: from localhost ([::1]:52634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n67Sp-0004Ri-F2
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 03:52:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Iv-0005Vc-OP
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:21 -0500
Received: from [2607:f8b0:4864:20::d36] (port=35711
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n66Iu-0003X3-4b
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 02:38:21 -0500
Received: by mail-io1-xd36.google.com with SMTP id y70so10125472iof.2
 for <qemu-devel@nongnu.org>; Fri, 07 Jan 2022 23:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GioDY4nXC7yuWDiwWaq62PITdulW8xkFyjlazyzw9XU=;
 b=rru1w7eBKWXhreoaZEqlbA2dTXFPSQu7FWyAFtG/VLg24WKVmc99AnOf9V5ECAzR62
 Xi6DUVqAGddIQMW5ccms5NP45ZfF3UbLTtfHHn8vKfjGwqCheJmgb7SR+po7PbRbww2J
 gIDUbxfqhuHv1/fy7AoXYSy/q2fUp9vD7XD5aM3/UknDISpTqO7xAkUO9pSu+9h2idvh
 4NBIFOwhHt+W4mU/oW8of3hD+xUXWgDv1FCYX3xgXe1k1GGNm5R6Y0YRGWeoXoRw5Osq
 RATbSx4NmmuoLjIklY4gdh1Hdn9h780oMn3GLCiur7nNhd5/7Sratpyrg0iYLEspZs3s
 7UqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GioDY4nXC7yuWDiwWaq62PITdulW8xkFyjlazyzw9XU=;
 b=IRD9xfZOjn1zu0TTXnnWcup6CG3975x3qu8IHuPkuTbktdkzBaGMBXRuyxQwAzn+j7
 eS1lOpuJMSnqrmXDPxctlmErXrfy4HkS0vuoOz1s2k/p5+QQoOvGnak1lZBrY5/4al8P
 30yZxzkOHh7CFDVCqf0jg75mkDZ/jXuv80UhwRYmrTuT02PwMkxfVk4sS8TSTyEI8Gjg
 NJrDUkjjCIeMeg4ijxzAGU5cwlrkmezDkSHv26V7Ss8Ji7GCUwXygU5XTwMorSFzwZDy
 x+uLU5WMjllkbjzQQWhIqdL1RLd+wBjBEnU9gUPuA+iVGnefiDDo14SUcfQlljU2pSp0
 6WHA==
X-Gm-Message-State: AOAM532tOSMJfI3p7yN87F40LQvoVMeuoWJX5BXhAPT4go/5IKVDfapA
 f9tCPLJvcFH5JcFXIFcdFPMlSvoRfjfsAiQE
X-Google-Smtp-Source: ABdhPJxwXYe89r2T56E7Y97q3T/NDImQxG2h2OBNPyBAfjyxwzf/8hRtLzs6QprWhiyN4eUnxJDsSg==
X-Received: by 2002:a02:ca02:: with SMTP id i2mr32443596jak.42.1641627498884; 
 Fri, 07 Jan 2022 23:38:18 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w19sm613022iov.12.2022.01.07.23.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 23:38:18 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 37/37] bsd-user: add arm target build
Date: Sat,  8 Jan 2022 00:37:37 -0700
Message-Id: <20220108073737.5959-38-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220108073737.5959-1-imp@bsdimp.com>
References: <20220108073737.5959-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d36
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Kyle Evans <kevans@FreeBSD.org>,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CC: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Acked-by: Kyle Evans <kevans@FreeBSD.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 configs/targets/arm-bsd-user.mak | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 configs/targets/arm-bsd-user.mak

diff --git a/configs/targets/arm-bsd-user.mak b/configs/targets/arm-bsd-user.mak
new file mode 100644
index 00000000000..cb143e6426a
--- /dev/null
+++ b/configs/targets/arm-bsd-user.mak
@@ -0,0 +1,2 @@
+TARGET_ARCH=arm
+TARGET_XML_FILES= gdb-xml/arm-core.xml gdb-xml/arm-vfp.xml gdb-xml/arm-vfp3.xml gdb-xml/arm-vfp-sysregs.xml gdb-xml/arm-neon.xml gdb-xml/arm-m-profile.xml gdb-xml/arm-m-profile-mve.xml
-- 
2.33.1


