Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07909264484
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Sep 2020 12:47:23 +0200 (CEST)
Received: from localhost ([::1]:44662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGK6s-0001oD-1T
	for lists+qemu-devel@lfdr.de; Thu, 10 Sep 2020 06:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kGJy1-0002fh-FE; Thu, 10 Sep 2020 06:38:13 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:45147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kGJxz-0003lh-PD; Thu, 10 Sep 2020 06:38:13 -0400
Received: by mail-pl1-x643.google.com with SMTP id bh1so710946plb.12;
 Thu, 10 Sep 2020 03:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sqy+D6SedHdu7xWl6iOu7jkM8eZQH/mrLi9LGlLAHEU=;
 b=Ke4nXKj3ppscP03T+QY7nx73quvnUmKX8zcT2p6fPmEHD2J461mab1LH5Msg4NB36+
 zCC8A9wiiwcjDDptbDAtlv9b+7Q8pIECFqunbR4Z7XSbqUZ/57oTGgSi/Ic3AX6YSUBE
 lY6lZ1l9geV+Y2pdmtCCqa8osY5s3fJH+Jn92KM7GtGo/MAd0Tryxb6WdvwZK4/4djiw
 QV4SbUZgmIci84ngcVGVk9CRh/3A/ZPotn7wA+opTzqltCF7x6alUKxTiprhu9oAs7kS
 jY3jhQYHxy1R3KfEeKa/GMeFP8zkFmMuXG+2CNo2DVz+5RFT5tQI8ukqmdAykg/Vlhe2
 moAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sqy+D6SedHdu7xWl6iOu7jkM8eZQH/mrLi9LGlLAHEU=;
 b=AEA7vjmryQ4mQTQKiS8aUK98GMUTc2UxLvsoNXW0yG/flKvvyzjP1wz0pga0/g4dr4
 EiA1e+Qmm4F2mauU2R33Sk+t3RVEZPGMQ4/F/9NF6e5chbCKH0tdcHJ0TI1dOLmmQaxB
 zPXtv6kXnx+Jv06FHzkOxeRgNHnw8JFErK08OrWLU+z9OdOBfmUkmAkwd5RM1v7GpZhO
 3lZ0un/6jQHfD0Dr8JT/uVrn4KIN3w48LdSSnwRH0HUAVnS9LX9qJhm6kYay76QSjrCm
 0zrsJ2EyOh9Yfi8iaHI13jPkTrBwbjaHb33Wg2n/EFqduOpD7ViwYB+Y2EGsAo7b82s1
 Z61w==
X-Gm-Message-State: AOAM533Uz8C9AylkTAkO++hJOKrIe+dsEB1wzU3vbwZiUDZWyRzXfURW
 hTbkBJww6XOeYA/UWzl3YJXTnGaNsQutH16xaQw=
X-Google-Smtp-Source: ABdhPJzSzIDlVVImBXQNpijHcA4hqj5ipH4ru3/N2ZZ68PWrVfjgQrp+Ll2/nWE18Os45x3Jd7Wrjg==
X-Received: by 2002:a17:90a:db0f:: with SMTP id
 g15mr4699812pjv.145.1599734289711; 
 Thu, 10 Sep 2020 03:38:09 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id 99sm1781191pjo.40.2020.09.10.03.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 03:38:09 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 23/25] tests: Fixes test-qdev-global-props.c
Date: Thu, 10 Sep 2020 18:37:23 +0800
Message-Id: <20200910103725.1439-7-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
In-Reply-To: <20200910103725.1439-1-luoyonggang@gmail.com>
References: <20200910103725.1439-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=luoyonggang@gmail.com; helo=mail-pl1-x643.google.com
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
 Xie Changlong <xiechanglong.d@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Peter Lieven <pl@kamp.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On win32 the line ending are \r\n, so we skip the \n in function test_dynamic_globalprop

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/test-qdev-global-props.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/test-qdev-global-props.c b/tests/test-qdev-global-props.c
index 1e6b0f33ff..d8762a9756 100644
--- a/tests/test-qdev-global-props.c
+++ b/tests/test-qdev-global-props.c
@@ -250,10 +250,10 @@ static void test_dynamic_globalprop(void)
     g_test_trap_assert_passed();
     g_test_trap_assert_stderr_unmatched("*prop1*");
     g_test_trap_assert_stderr_unmatched("*prop2*");
-    g_test_trap_assert_stderr("*warning: global dynamic-prop-type-bad.prop3 has invalid class name\n*");
+    g_test_trap_assert_stderr("*warning: global dynamic-prop-type-bad.prop3 has invalid class name*");
     g_test_trap_assert_stderr_unmatched("*prop4*");
-    g_test_trap_assert_stderr("*warning: global nohotplug-type.prop5=105 not used\n*");
-    g_test_trap_assert_stderr("*warning: global nondevice-type.prop6 has invalid class name\n*");
+    g_test_trap_assert_stderr("*warning: global nohotplug-type.prop5=105 not used*");
+    g_test_trap_assert_stderr("*warning: global nondevice-type.prop6 has invalid class name*");
     g_test_trap_assert_stdout("");
 }
 
-- 
2.28.0.windows.1


