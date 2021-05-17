Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 726E1383A3F
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 18:42:30 +0200 (CEST)
Received: from localhost ([::1]:52718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligK5-00033m-7b
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 12:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lig8H-00048g-Tr
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:30:17 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lig8D-0005xy-HO
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:30:17 -0400
Received: by mail-wr1-x430.google.com with SMTP id z17so7070981wrq.7
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 09:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aArNQrBNJ1XP3sxmOTGdE9hYoqsnx7QPKTcrKqVX3cY=;
 b=tv5boI8O0DNknjgn9AkC77mEaZs8G2DbbAlJEQxY0quzurzjAY1kaiwMUhhffb+SYv
 i/hsGWZrztRxV8sUfZbOwzXehWxkGlqnwW1zqvM4E4xUnlPEvzFF6VpFAEezTGCK00MI
 g7QyTK1+ihAJmE8/3sG1mVoclpvCj+qf9gIDkjZaRIHp08U80TLAGCQmgnkhKMsrREQ4
 GztgSk8X5YSOgqI7ZdoM4QYcFZZJAskaVgcSp95FxWZzcmLqCoLRirXRIHgupdHt0+c3
 EaUtmQ1cIIEf/P57MbSY4lBxdHLs5UhDeh1KgnY1i6UnTX3MWHc+giG1oC6vkPj2GuEB
 Ua3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aArNQrBNJ1XP3sxmOTGdE9hYoqsnx7QPKTcrKqVX3cY=;
 b=PPAW49sk4scx+f3ABW5zu03QNb44IbjrVyvHs4bNfdK0jbJCgUYAI9KB01ewcjD15b
 G8PyFetDZg0MuI6qEucZKrv7HxqTcGs2gs+OA4XjikdJ4x0UXGRG/DaRBgUvkqPEyW3c
 qafSAKfmLIDzd8Ft/IoB+cqcK9go8Ys+yenvQRr4o7N1yDq0h1wAgA1c4BL/+SyvUXSl
 wz3eP9m2tRHJFJEsRMaLQx9ZtfeLOFDNSRqZB+GlTB1WHXCmh/eggo0FFJe43UEuK3b4
 rV9JwZ7wmtgEzM/q5kkrxL4Xy3iFzmB78MaklOpv0MlCyVrS1ZCxGF66EcgI8uV0diau
 ubQQ==
X-Gm-Message-State: AOAM533W+9sW30yOMztkKxA9A6i9rSxFaQy6pxNm3aEFY/hx09MeRxWt
 Fco1QiFUVC/4saBGe++3LC90yw==
X-Google-Smtp-Source: ABdhPJyZxR2BST7lBSDX8vpHmWPBJ1rAroiTws/YALBRP6mKtoEWhuH7/ZfRVTY51zuTiphPSfY9SA==
X-Received: by 2002:a5d:6c61:: with SMTP id r1mr596553wrz.151.1621269011120;
 Mon, 17 May 2021 09:30:11 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e8sm17745240wrt.30.2021.05.17.09.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 09:30:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8E0EE1FFAE;
 Mon, 17 May 2021 17:10:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 25/29] configure: use cc,
 not host_cc to set cross_cc for build arch
Date: Mon, 17 May 2021 17:10:18 +0100
Message-Id: <20210517161022.13984-26-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210517161022.13984-1-alex.bennee@linaro.org>
References: <20210517161022.13984-1-alex.bennee@linaro.org>
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Otherwise you run into hilarity like trying when cross compiling a 32
bit ARM build on a 64 bit system trying to use host_cc to build 32 bit
test cases.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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


