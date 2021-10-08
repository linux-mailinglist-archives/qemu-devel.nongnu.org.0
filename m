Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33437426AD7
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 14:31:02 +0200 (CEST)
Received: from localhost ([::1]:48488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYp1g-0005qX-RI
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 08:31:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYows-0002wT-IC
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 08:26:02 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYowq-0006rc-Nk
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 08:26:02 -0400
Received: by mail-wr1-x42e.google.com with SMTP id e12so29298381wra.4
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 05:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UNCvOhfMcVb2T//uqDjRHKJRqdy+NSIyFeLv88Ae7MA=;
 b=q+p8t3q581UjKQZj7LYMqQx/Fbm2bNkC5uuY9vIruH9dIKdrpSZizgR6C826R90UJg
 KiVLeR4XOPM0GPMzZTXo9ziwioAlmRfrSoa0czEzGKfXDRf0jm8I5sGVYvpZW3tTIxGh
 dFqgjgQQ1yDLQ3Bd2bMHfi1+dJtGHK9oSJrkSJmmkMlI7jQTPWN8mIvXABX2Z8l3ctsM
 r1RoHRzfZaXeU6XIh0JVCpD1C2zJGLHOUEBA2QFl4E6Xl6Kf2+FlQhPs+KWk43Idfauk
 aHvXWL9AXmks1BnTOAO3R43tAypgqSRbInIZJ4BbSMfFujEF/q2FTez6bpUNcQehr/Ig
 JNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UNCvOhfMcVb2T//uqDjRHKJRqdy+NSIyFeLv88Ae7MA=;
 b=UovVqS5KdlRFp+yy+7FLOth+bBGeeNJ7fXawhq9QwGJjU2VMt/S8q7uCiZzErX2hMs
 ei4GFllOE2aKQzgK45DYeyUxmWL6eJg+acYNdXT7e4NV2H+j4B+3Cnmwo9ILpdgb6IIZ
 qzaLko+yZCBBKWtq3i/n77FgE6Yk5CcU6YdURobCtTWZnXUq7EpSIXp8xnSXwvXhpGZ9
 6iP1fW3kkwkAtUkmgDQS5Du1RTMv1WfoGBhYX/rmp+FF4Wl8DbvWh+skMG98Lp7o+2yz
 w1drV7cu/sNddVd6ShAQ4w9ajvUqecq21DfA1pNoc3ZWCb9bDWFBe+8KyHteEEkEOr02
 m8rQ==
X-Gm-Message-State: AOAM531u/JY9/9s+kC1UKCJkkf0i0wu/+UUWSGUhh7fzquDbGFYZrszV
 SjMZpkjs4w2MMCURnW7d/DUYEA==
X-Google-Smtp-Source: ABdhPJwoZEBH+yaTCmjmkMgp3mb+NC7rKGZ622TH+Y3F7I1X8XZsv5q0nGgpaqrrJnQ8I0jH8LtqPA==
X-Received: by 2002:a05:600c:4fd0:: with SMTP id
 o16mr3064019wmq.73.1633695958584; 
 Fri, 08 Oct 2021 05:25:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w26sm2199168wmk.34.2021.10.08.05.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 05:25:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5A6A71FF99;
 Fri,  8 Oct 2021 13:25:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Subject: [PULL 02/12] tests/tcg/sha1: remove endian include
Date: Fri,  8 Oct 2021 13:25:46 +0100
Message-Id: <20211008122556.757252-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008122556.757252-1-alex.bennee@linaro.org>
References: <20211008122556.757252-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This doesn't exist in BSD world and doesn't seem to be needed by
either.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Message-Id: <20210917162332.3511179-3-alex.bennee@linaro.org>

diff --git a/tests/tcg/multiarch/sha1.c b/tests/tcg/multiarch/sha1.c
index 87bfbcdf52..0081bd7657 100644
--- a/tests/tcg/multiarch/sha1.c
+++ b/tests/tcg/multiarch/sha1.c
@@ -43,7 +43,6 @@ void SHA1Init(SHA1_CTX* context);
 void SHA1Update(SHA1_CTX* context, const unsigned char* data, uint32_t len);
 void SHA1Final(unsigned char digest[20], SHA1_CTX* context);
 /* ================ end of sha1.h ================ */
-#include <endian.h>
 
 #define rol(value, bits) (((value) << (bits)) | ((value) >> (32 - (bits))))
 
-- 
2.30.2


