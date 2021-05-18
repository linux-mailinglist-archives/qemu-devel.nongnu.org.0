Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB0238752D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 11:33:04 +0200 (CEST)
Received: from localhost ([::1]:37848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liw63-0007Xx-UD
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 05:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livp9-00056w-GK
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:15:35 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:55852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1livoz-00013i-NW
 for qemu-devel@nongnu.org; Tue, 18 May 2021 05:15:32 -0400
Received: by mail-wm1-x329.google.com with SMTP id b7so4403240wmh.5
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 02:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZOEe6cez6SEgngPy3li6Y4fZAWFWB0XRBjyTyqxtFds=;
 b=DOx608YGH1geHMpq1CWoN8aclQUGU02rm6CZbGHRD+d4Fu/6TyNZbDHCAp4yG9GxFf
 UU6j7xob04VeTAZSFVcvvspEhVjMSvIwp0iXbP6517W2mGWaSM1wsaMxGSK4ADey1tKY
 6oECEdfAsGi/+T8XV2BSRbG9EEY6GbBzDO0tWFcDkw5WktnwO3IBKzbkmXP01YSakUxP
 rIKcwGK9CYyF1YCKSCm9OYGbRNmY4N3U+QKCTCMY/i6GP3V55gCxtkXF2JtRXQ5lCx8g
 nNxJuPWgf1Hb8/s1nRh+Bx+Ki5MHctkayp6xQiK3oUcqpT9TXhyfMx2Mk93R76v1BeMZ
 ylpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZOEe6cez6SEgngPy3li6Y4fZAWFWB0XRBjyTyqxtFds=;
 b=IhBjlPqyrlEqmRgmA2mDD7+1+Eojof/aJGaYkQPJpG1NIe/nXDr8OG3q75TaFRcnMt
 hquvDwfbs+QkGz2I0dvQXjKt1ksm34LC2+qDAkl0Bk0nd1uf9OZ4QVTnZw1+2pXSZJNk
 HGFZhTJfjoelPercGM/VhmJGTYblQQQZNTmByvF+8CWvWT6pAQnxq+/apu7BdrpNclDa
 nRkJznBGYUe59DnwnfzZ1ES8csUpcHxREyKHpT21aLM1pfq42symj8uL3tSodjAAoj0V
 omONaQh4o9S0+Ky6STCws/doiD+ycvyGwwtjlnKZq19yL1bMKZxuMAJ5WLTW2hEwIMXl
 Pz1A==
X-Gm-Message-State: AOAM533W3sox2OjtCDmtxai9f5Shf0jMcbb896so1l+s2t/mqzVNoBLZ
 Vda3NHNAS2bhlScFQoCuMAkU8A==
X-Google-Smtp-Source: ABdhPJzzQl4ixKj58/6a4YLZchvsQz2t6hVA2kIU74JcH+6/uDDmnwvI9umd+ezQh4lC/C0k0dZI6A==
X-Received: by 2002:a1c:4482:: with SMTP id r124mr3827256wma.42.1621329322369; 
 Tue, 18 May 2021 02:15:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r2sm21822189wrv.39.2021.05.18.02.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 02:15:18 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AD8951FF87;
 Tue, 18 May 2021 10:07:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 29/29] configure: use cc,
 not host_cc to set cross_cc for build arch
Date: Tue, 18 May 2021 10:07:20 +0100
Message-Id: <20210518090720.21915-30-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210518090720.21915-1-alex.bennee@linaro.org>
References: <20210518090720.21915-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Otherwise you run into hilarity like trying when cross compiling a 32
bit ARM build on a 64 bit system trying to use host_cc to build 32 bit
test cases.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210512102051.12134-32-alex.bennee@linaro.org>

diff --git a/configure b/configure
index df11c8bad0..9470fff09a 100755
--- a/configure
+++ b/configure
@@ -1651,7 +1651,7 @@ case "$cpu" in
     # No special flags required for other host CPUs
 esac
 
-eval "cross_cc_${cpu}=\$host_cc"
+eval "cross_cc_${cpu}=\$cc"
 cross_cc_vars="$cross_cc_vars cross_cc_${cpu}"
 QEMU_CFLAGS="$CPU_CFLAGS $QEMU_CFLAGS"
 
-- 
2.20.1


