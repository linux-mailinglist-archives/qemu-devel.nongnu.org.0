Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6924A9C13
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 16:38:22 +0100 (CET)
Received: from localhost ([::1]:51512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG0fF-0004Di-Uw
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 10:38:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nG0X9-0003tt-K6
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 10:29:59 -0500
Received: from [2607:f8b0:4864:20::1032] (port=42641
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nG0X8-0004DA-1f
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 10:29:59 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 my12-20020a17090b4c8c00b001b528ba1cd7so6470214pjb.1
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 07:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vViy72WIqKVDTBMZhoKE8b8CYqiaPsCIpqcsGPJantY=;
 b=IID5SAkPY4u+Ew6oYfIlhL4sEW4KywMUvMoN6+sUegBGXLgGvs9JcoK7//c6/f94HH
 rWeFrnBRdvjuyiT4A9Df6bKz4txAr+JnJL4R6hcZ3H0y1Ei6KSD8dH3m+Rh5AC0rbTlW
 1yfPuIGBrOVcm5PlWBiv7MuBTyg1AJo6mFPPu/SabHGDdMjDlCM0ZyXGvQnXOgwrtaD6
 7Hd7rWY3FAjoFUgPIaf7s8Wq+ZvrDeAn3lbsgNqIMZ6WaQkfF8LdHqF8X1DZxYreEpzO
 y5Z9CAxebdGL5+Q7WRKLrUp2I107OUP1xXwmDkaN3451QFDHxl2meY43qb4xYpmK3jIc
 PpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vViy72WIqKVDTBMZhoKE8b8CYqiaPsCIpqcsGPJantY=;
 b=qRsCk9TTrhx1GLrMUlmymZfNuUeyort+SH6bue3eIH+857imLdC3gfvTpbEArXWXfq
 vxgitWNIl68jjePMSnNX7OOCW1B9tiC5CosZlRY7+aONLyYWedIeYgVWLDA2c+yHrOoc
 lNLcbQdY48iJ7o/Sieb6gUY/y7woThaJC7zFH1tJ6+9xtuauTTG9Ud/phUoGX+k0XuwQ
 tfyIOkHwSM2VkUSCOG/lY30JxuxIcgK8JpRDf0fWfxAA1Etv+TlEF7nyIlRupnqoXLWa
 K9WmukExtGrakoZ6/70D8dXLdXppHcjX1R4xYsQwGwwqrtNj62g/3AhoHLnUIcaVM3lj
 EUVg==
X-Gm-Message-State: AOAM531/2ideJLYnRBdrapP89Mp7qe55OkhtoOPaABGaE/cEMDpw7Zza
 INaSQJcFHSomVLyK7fm2ltbIHaciUbY=
X-Google-Smtp-Source: ABdhPJy3SGnRY4dDsowxPMeZI4AJ4X49/uSAr8XnP5awhjrELwe/U1lZ8EG05QM91RiRp8rnIAbKPg==
X-Received: by 2002:a17:902:d918:: with SMTP id
 c24mr3476259plz.1.1643988579843; 
 Fri, 04 Feb 2022 07:29:39 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id m20sm3114019pfk.215.2022.02.04.07.29.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 04 Feb 2022 07:29:39 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 1/4] configure: Restrict TCG to emulation
Date: Fri,  4 Feb 2022 16:29:21 +0100
Message-Id: <20220204152924.6253-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220204152924.6253-1-f4bug@amsat.org>
References: <20220204152924.6253-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

If we don't need to emulate any target, we certainly don't need TCG.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 configure | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 9f40d60196..4002f81ac9 100755
--- a/configure
+++ b/configure
@@ -370,7 +370,7 @@ slirp="auto"
 default_devices="true"
 
 # 3. Automatically enable/disable other options
-tcg="enabled"
+tcg="auto"
 cfi="false"
 
 # 4. Detection partly done in configure
@@ -1777,7 +1777,7 @@ EOF
   fi
 fi
 
-if test "$tcg" = "enabled"; then
+if test "$tcg" != "disabled"; then
     git_submodules="$git_submodules tests/fp/berkeley-testfloat-3"
     git_submodules="$git_submodules tests/fp/berkeley-softfloat-3"
 fi
@@ -1819,6 +1819,14 @@ case " $target_list " in
   ;;
 esac
 
+if test "$tcg" = "auto"; then
+  if test -z "$target_list"; then
+    tcg="disabled"
+  else
+    tcg="enabled"
+  fi
+fi
+
 feature_not_found() {
   feature=$1
   remedy=$2
-- 
2.34.1


