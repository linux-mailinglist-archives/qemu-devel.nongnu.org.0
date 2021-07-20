Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653153D05C7
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 01:44:00 +0200 (CEST)
Received: from localhost ([::1]:42688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5zP5-0001yN-BT
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 19:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5zG1-0004Uy-2W
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:34:37 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:37728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5zFz-0001lO-Ea
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 19:34:36 -0400
Received: by mail-wr1-x430.google.com with SMTP id i94so186581wri.4
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 16:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gjZgmgZbPTvx09P0zXVcDrhQjzm5+UMh0Me4L3tfy30=;
 b=ReSNqZdytulaGebTLFaXNvJzkzGKnb8IAQj3NssvIxuVr6aqf9zwOvZuZhE5/gnuu2
 +DC5tvCLLw/1G5HTms8pDVIvYl6NJapRH8HfGE0eec4cUMnRllI4IGEE4GzfL2qv2Yn+
 QAnDaUMGouCayfQqVulFMNqeetfOXunaFBihPzf6vu63DTxSqT3B5gnkafz+xfcVwxgN
 X6d1qM8lEuy0mrVSvEryGke/NCCZYjmCSceH7enxQj76p5edDf+tj33dS5lKCUHYfHvk
 Cp/uMv0ZCHjFsO1LUTwbjf+iD9s+pyPIcrvK5rMmQiK1aehePyoXGuhJ4jk2jj38FFZ5
 DbkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gjZgmgZbPTvx09P0zXVcDrhQjzm5+UMh0Me4L3tfy30=;
 b=hcWyVcX7JTxZWncMhJiUBPzh2YwMWGQ2N/ibQc5hn1nMNgWB55vRzAtOuQkZ3uSD10
 xo9v7wmfp3ULqEMwcT8ECxNe9EgwetP6d7KqEaIS7ach80i6cSOZC/XWg5y4c4GsoBTO
 bbwWySUQVZ1ubtxpfi3x8ZBSSLL1xVkJGvWiRwblUQdT0pmEHrpq6MHErwcb2wMZwD2k
 vMYYoGqVgjG2vbOjWyCtc9b8L+h64rV/iJoX9SW1IBNItT1EZsPZPQJEC0yDCLq4vDd4
 Ysn4cK2uFAg7+61fOVDI09oEfhYmJY4J2ZRvQ2uEgVYL7CAyHBiHBoT21oz4S4glXyrV
 n0FQ==
X-Gm-Message-State: AOAM530ylFRRqd5QiCJn+d9ZN6hAws1vONxFow1CDjKUDVLvY796Yijc
 D1dYUsI+C0pW5h5YMK5yFee1LA==
X-Google-Smtp-Source: ABdhPJzoGlXG3hVLOpN4yj5d5XPo8ENTOQWWB95kALbsxiQKDv9MsVm4MPALEmj4nIkiFHx0ce08Xg==
X-Received: by 2002:a5d:6189:: with SMTP id j9mr39844435wru.196.1626824074111; 
 Tue, 20 Jul 2021 16:34:34 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d14sm25214245wrs.49.2021.07.20.16.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 16:34:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7A8151FF7E;
 Wed, 21 Jul 2021 00:27:05 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 18/29] contrib/gitdm: add a new interns group-map for
 GSoC/Outreachy work
Date: Wed, 21 Jul 2021 00:26:52 +0100
Message-Id: <20210720232703.10650-19-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.32.0.264.g75ae10bc75
In-Reply-To: <20210720232703.10650-1-alex.bennee@linaro.org>
References: <20210720232703.10650-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: fam@euphon.net, berrange@redhat.com,
 =?UTF-8?q?C=C3=A9sar=20Belley?= <cesar.belley@lse.epita.fr>, f4bug@amsat.org,
 Ahmed Karaman <ahmedkhaledkaraman@gmail.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It makes sense to put our various interns in a group so we can see the
overall impact of GSoC and Outreachy on the project.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Cc: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
Cc: César Belley <cesar.belley@lse.epita.fr>
Message-Id: <20210714182056.25888-21-alex.bennee@linaro.org>
---
 contrib/gitdm/group-map-interns | 13 +++++++++++++
 gitdm.config                    |  3 ++-
 2 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 contrib/gitdm/group-map-interns

diff --git a/contrib/gitdm/group-map-interns b/contrib/gitdm/group-map-interns
new file mode 100644
index 0000000000..fe33a3231e
--- /dev/null
+++ b/contrib/gitdm/group-map-interns
@@ -0,0 +1,13 @@
+#
+# Group together everyone working as an intern via one of the various
+# outreach programs.
+#
+
+# GSoC 2020 Virtual FIDO/U2F security key
+cesar.belley@lse.epita.fr
+
+# GSoC 2020 TCG performance
+ahmedkhaledkaraman@gmail.com
+
+# GSoC 2021 TCG plugins
+ma.mandourr@gmail.com
diff --git a/gitdm.config b/gitdm.config
index 5d5e70fe5f..288b100d89 100644
--- a/gitdm.config
+++ b/gitdm.config
@@ -40,9 +40,10 @@ GroupMap contrib/gitdm/group-map-redhat Red Hat
 GroupMap contrib/gitdm/group-map-wavecomp Wave Computing
 
 # Also group together our prolific individual contributors
-# and those working under academic auspices
+# and those working under academic or intern auspices
 GroupMap contrib/gitdm/group-map-individuals (None)
 GroupMap contrib/gitdm/group-map-academics Academics (various)
+GroupMap contrib/gitdm/group-map-interns GSoC/Outreachy Interns
 
 # Group together robots and other auto-reporters
 GroupMap contrib/gitdm/group-map-robots Robots (various)
-- 
2.32.0.264.g75ae10bc75


