Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DBC16F8A1
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 08:41:07 +0100 (CET)
Received: from localhost ([::1]:39220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6rJa-00027p-Ex
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 02:41:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45857)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1j6rI6-0000Hr-VI
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 02:39:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1j6rI5-0002IP-Ur
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 02:39:34 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:50835)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1j6rI5-0002CQ-NB
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 02:39:33 -0500
Received: by mail-wm1-x333.google.com with SMTP id a5so1814110wmb.0
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 23:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PEusqV+iSam5oPlEHJm/4+oO4jkqYDYbQ2T0jjTNlWc=;
 b=UHSlJRZwFm811dsIW88A4qrnuIJbq9kMI5j1TQh72MfAi7u9BD28PA/1pRH90KPIrk
 CsZLqW162WhSw0hCsTwF+tFa9/Ss52JOjtNmy0hk//tfERsBRLhf0OhOjZh+3P1Ys9jv
 C4F4m9xo9wZoGCQcgsZebdx6i+cZiaaNi7EQkWdlY01BWT28YJ2Chn5ygovpZ19saNb4
 RXs8YSxZywDheSIZrhCPBRXnUkAsury3iTpiL91TdKdUOf/JBq1ngiU49ILgOe+DW8vV
 zqfmjWZVOBltLXqbV5532LyLqMQycLl0jcV/uOgRPdJDc7/tVke/DqJZYnzqiLce2ZaC
 +94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PEusqV+iSam5oPlEHJm/4+oO4jkqYDYbQ2T0jjTNlWc=;
 b=lzfZt7LDsiXiSYwTRG1ch5ZfkJ+lKi9+RQjRIqQ4HkRamTmNhB2l+Bb3Rzn0S8vKF5
 YkBmnYQHH6Cxl76kRTd4e4hWdY3+PMwzCqwdKJoAb/2/j4rDMUS2qgFMUTHr79wlIWIN
 WkuzUkXXqmxtvrd9E50s13H9y/3tuAe/R2Knk7MoCjhA0yIPgEjQ+vaHAPJQrrBaFTLL
 c2rdhTRdF0gbdgwo9P7N3yn2nIW6i7OWB6WKykebwYd8Llfbza2UgSLyvKrGOfPKvt36
 +N/pj82fRTTcb5QA5WPHCG3R20kdLw2btqXR+xjRQ0xKM9ksZY9xNUeeVMP6VToXsYIR
 +b/A==
X-Gm-Message-State: APjAAAUfAI6FsgwGf6Upk2u/tQ6cNj/MoSaYMtfS1WLBHVAZYFqNaNBh
 6ycXxMTWl0iShttYsidJXUU9zQ==
X-Google-Smtp-Source: APXvYqx5WlIaRSGft+KXLXXBQhaUm8p7j6q54FPbnJ77ELFG1aN3bUUn1HZgfG71dPr5yjJxIrKSTw==
X-Received: by 2002:a7b:c19a:: with SMTP id y26mr4010388wmi.152.1582702771855; 
 Tue, 25 Feb 2020 23:39:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y7sm6732756wmd.1.2020.02.25.23.39.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 23:39:30 -0800 (PST)
Received: from zen.home.arpa (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 58DD61FF8C;
 Wed, 26 Feb 2020 07:39:29 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 01/19] tests/tcg: include a skip runner for pauth3 with plugins
Date: Wed, 26 Feb 2020 07:39:11 +0000
Message-Id: <20200226073929.28237-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200226073929.28237-1-alex.bennee@linaro.org>
References: <20200226073929.28237-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::333
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
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Robert Foley <robert.foley@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If we have plugins enabled we still need to have built the test to be
able to run it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Robert Foley <robert.foley@linaro.org>
Message-Id: <20200225124710.14152-2-alex.bennee@linaro.org>

diff --git a/tests/tcg/aarch64/Makefile.softmmu-target b/tests/tcg/aarch64/Makefile.softmmu-target
index d2299b98b76..71f72cfbe34 100644
--- a/tests/tcg/aarch64/Makefile.softmmu-target
+++ b/tests/tcg/aarch64/Makefile.softmmu-target
@@ -70,4 +70,6 @@ pauth-3:
 	$(call skip-test, "BUILD of $@", "missing compiler support")
 run-pauth-3:
 	$(call skip-test, "RUN of pauth-3", "not built")
+run-plugin-pauth-3-with-%:
+	$(call skip-test, "RUN of pauth-3 ($*)", "not built")
 endif
-- 
2.20.1


