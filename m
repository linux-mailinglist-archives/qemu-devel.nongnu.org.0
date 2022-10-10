Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3215A5F9AB5
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 10:12:49 +0200 (CEST)
Received: from localhost ([::1]:40826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohnu4-0007LW-05
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 04:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ohnfW-0003w8-1l
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 03:57:49 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:44908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ohnfS-0005ni-JK
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 03:57:45 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 t10-20020a17090a4e4a00b0020af4bcae10so9677940pjl.3
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 00:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y+mbzYy1Q1oZuY5uZEiYrQi387FoTPWdvVr/MliLmJM=;
 b=onIpA47lxzywgYl9xA4H+x+Dyg3dV/y937ryYvp1SzRpZ10iWp486MxFM6kH/emZCe
 Qv3SEEsNu49dhOFLqu4tGUupD6dg5hJwlqwkVp0MQwHRsPgEn1xnLd1dsyp+btc0B+pI
 uHFmhpHfzaW1PwxLP7E3Be5GSFAysvRBkXGs0hDXVMPWJ3BonbUn2sX6r114p6YYgAkA
 rL8f3Cced6lHEcXu1ENK95qM2omqlH8gY7ceWhKu/lXhNso3PyAwuQWjNSX++y4fT+wA
 AwqnExhP4eA6SbdnBMAJWwm1MyhSjL68DcvQgYAhRdicbngc1IOT1x9TRoERnIQ9AEMt
 JdCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y+mbzYy1Q1oZuY5uZEiYrQi387FoTPWdvVr/MliLmJM=;
 b=eD3G981sj9rjgMRdrHGBXDLS/hGpOHhM8MRs2K9oJZK8H4ZpKzF9NDhHNpitJktb0W
 DU62TIaCCb2dKk9h3VzfMOzLeEeG+5g1hbLdYI+WCdXUwnSApmnb0OAUWu4uMRwQVGs5
 ktpHDJl+pItK/OOm2A1K+RNp4Y03+VucYsHiXEUx/O2zDhI1xaR0xKQrjKs/HSjqVYbs
 wRk+I7pQ6NhEP5DqMOPZcrR0CnoNUS8W9C27atsq3CzjIFQ2e3kfD2THwUerCLTkKTuv
 TTibnFBv3C9Iy188SEU8TTB1StG5CO+g49Zrx7Tpi8PpMEBqK0qQQxv1nC6IlVyRmg8R
 TLIQ==
X-Gm-Message-State: ACrzQf3vVsyBbJGdHAhT8Ot9n2SxB6vIJrJaTvU98XASERPBph7Wnmjd
 Zq4KzaePrklCep3Km93+Ip2AJ/K8Z7w/tg==
X-Google-Smtp-Source: AMsMyM7lN4XgUdI4CSAx+6l+TxFmIQnl73AOuBvE8wks/xZ2oKs7VUMHb8VmD2+YnZwrRxUdSr+fAg==
X-Received: by 2002:a05:6a00:a8c:b0:558:991a:6691 with SMTP id
 b12-20020a056a000a8c00b00558991a6691mr18556034pfl.53.1665388651394; 
 Mon, 10 Oct 2022 00:57:31 -0700 (PDT)
Received: from anisinha-lenovo.ba.nuagenetworks.net ([203.163.239.238])
 by smtp.googlemail.com with ESMTPSA id
 s2-20020a625e02000000b005624b4bd738sm6200379pfb.156.2022.10.10.00.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 00:57:31 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: mst@redhat.com, imammedo@redhat.com, Ani Sinha <ani@anisinha.ca>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Maydell Peter <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 05/10] acpi/tests/avocado/bits: add SPDX license
 identifiers for bios bits smilatency tests
Date: Mon, 10 Oct 2022 13:26:14 +0530
Message-Id: <20221010075619.4147111-6-ani@anisinha.ca>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221010075619.4147111-2-ani@anisinha.ca>
References: <20221010075619.4147111-2-ani@anisinha.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1034;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Added the SPDX license identifier for smilatency tests.
Also added a comment indicating that smilatency test is run from within the
biosbits environment/VM and hence is not subjected to QEMU build/test
environment dependency fulfilments or QEMU maintanance activities.

Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Maydell Peter <peter.maydell@linaro.org>
Cc: John Snow <jsnow@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 tests/avocado/acpi-bits/bits-tests/smilatency.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/avocado/acpi-bits/bits-tests/smilatency.py b/tests/avocado/acpi-bits/bits-tests/smilatency.py
index fb1b7228e3..d616970b31 100644
--- a/tests/avocado/acpi-bits/bits-tests/smilatency.py
+++ b/tests/avocado/acpi-bits/bits-tests/smilatency.py
@@ -1,6 +1,8 @@
 # Copyright (c) 2015, Intel Corporation
 # All rights reserved.
 #
+# SPDX-License-Identifier: BSD-3-Clause
+#
 # Redistribution and use in source and binary forms, with or without
 # modification, are permitted provided that the following conditions are met:
 #
@@ -24,6 +26,8 @@
 # (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 # SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 
+# This script runs only from the biosbits VM.
+
 """SMI latency test."""
 
 import bits
-- 
2.34.1


