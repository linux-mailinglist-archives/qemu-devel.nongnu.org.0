Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA62248C363
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 12:42:33 +0100 (CET)
Received: from localhost ([::1]:34186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7c1Q-00064k-Ss
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 06:42:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bn0-0002dP-KO
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:38 -0500
Received: from [2607:f8b0:4864:20::936] (port=41717
 helo=mail-ua1-x936.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1n7bmx-0003OR-HR
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:27:37 -0500
Received: by mail-ua1-x936.google.com with SMTP id p37so4066074uae.8
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 03:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZPSrgeAEIEWLNDIcyiDEWRDV8JlcYpaOgHU5hBm3XlU=;
 b=avNCG5IeBdAAWh9ikif7+a1hmSPzgfOpKSIXak4uDGw8/912O6yAVHHTspVDtiKhR+
 HhjYKMYGS0lHuaxZKucBZERC6S4gULaXwGBh+i8agn4s2cYRloIkcQBkiKEZcU8eIJIf
 RH0PvxcsIvA1zr0Qig32GoC7UvzmENp7gwoVAJMzKpNEKI5rZUHxBfuJNDHXvT5YJ9Hr
 H5N7m7a/tc9BQ592Mwh2n2buyZSmiDMnPSU5ytWOBGHZkaS9sNweZhrel4b8BdxPa82C
 oc9ZCd0yMNQ6TAAMDbhvcHd7KmczBq064VbYPGcpjSL0Nj95xSsHQ/IoeRz4hmN709qA
 yccQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZPSrgeAEIEWLNDIcyiDEWRDV8JlcYpaOgHU5hBm3XlU=;
 b=o7YZ1c/DZjLZyO0qOuLLJUdTQ+KcM4FUrFO9a94Oh4rwktlO+Ngt6MQnVTDVEv9PYx
 CCLKpzfdCa1OjPdvR3JiQ0rXIqszrxEIm+VcDqX8R+R0/P0g+wgmui9uCRZ9T/Ho/jdt
 uKZzFJ4XNBNxjdyJWNPfkh8rzjEexs5yXcs22SdK3Jp5wYR9hwGEVdH8PYaF2HOZ3y2o
 3+wxIMTWauAnT0WAwOFw+Vz2/bOOQ2TRTknlFqEp1qkwG/O4KzzOdV8uaJDpzpPVJDJk
 vHNz23LF4noRTjQKPqo6PF0yZ/U4eOeJad4Za9Rjqp5/gCSIO/G8dtSF43Ziy3OJjk3x
 wPcQ==
X-Gm-Message-State: AOAM530VRhJqspqLxXbG0NAqabufVKJ09HHyWMj6adRo3sHRMwcJWuMl
 W/gEu5qOPP2gnaZTRUseGQ0eUw==
X-Google-Smtp-Source: ABdhPJyzgrnJjfOObY9X1GGBmY0Ug6kytAawYwyCyu/RsIHmhBx4bSCGmY/aeTTANy6PBxVaBPtC/A==
X-Received: by 2002:a67:c81c:: with SMTP id u28mr4196623vsk.71.1641986854225; 
 Wed, 12 Jan 2022 03:27:34 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n15sm6736788vkf.35.2022.01.12.03.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 03:27:34 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B475F1FFBD;
 Wed, 12 Jan 2022 11:27:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 05/31] ci: explicitly skip I/O tests on alpine
Date: Wed, 12 Jan 2022 11:26:56 +0000
Message-Id: <20220112112722.3641051-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220112112722.3641051-1-alex.bennee@linaro.org>
References: <20220112112722.3641051-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::936
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=alex.bennee@linaro.org; helo=mail-ua1-x936.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The block I/O tests don't work on Alpine because their alternative libc
impl emits different strings for errnos, which breaks the expected
output matching. e.g.

=== IO: pattern 102
 wrote 512/512 bytes at offset 512
 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-qemu-img: Error while reading offset 0 of blkdebug:TEST_DIR/blkdebug.conf:TEST_DIR/t.IMGFMT: Input/output error
+qemu-img: Error while reading offset 0 of blkdebug:TEST_DIR/blkdebug.conf:TEST_DIR/t.IMGFMT: I/O error
 4
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824
 Formatting 'TEST_DIR/t.IMGFMT.2', fmt=IMGFMT size=0

Currently the I/O tests are skipped as a side effect of the Alpine image
containing a minimal busybox 'sed' binary, rather than GNU sed. This is
a fragile assumption that will be invalidated when the dockerfile is
changed to be autogenerated from a standardized package list that
includes GNU sed.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211215141949.3512719-6-berrange@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220105135009.1584676-6-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 12fb1130fe..8f2a3c8f5b 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -24,7 +24,7 @@ check-system-alpine:
       artifacts: true
   variables:
     IMAGE: alpine
-    MAKE_CHECK_ARGS: check
+    MAKE_CHECK_ARGS: check-unit check-qtest
 
 avocado-system-alpine:
   extends: .avocado_test_job_template
-- 
2.30.2


