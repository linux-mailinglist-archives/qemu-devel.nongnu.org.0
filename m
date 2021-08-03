Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F13C13DEB8B
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 13:05:36 +0200 (CEST)
Received: from localhost ([::1]:60434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAsEq-0002KM-1p
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 07:05:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAsC6-0005g0-5i
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 07:02:46 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAsC3-0003fy-9c
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 07:02:45 -0400
Received: by mail-wr1-x435.google.com with SMTP id b11so19528049wrx.6
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 04:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ckjd59sQpmqKYyW4+FEhhz62Vn4zdt4oG7Bt5gvCPPw=;
 b=iZSq1V1cfiL5yFH6unp6nwEsgTZbugFAPZy7dv0cYXtjYfQGORZaF/DawabrudqawO
 DE6vnBa4qf3XkVNlE/pGf6yOTMvHa2BwVFHSCpo9LuY4kTi81fUzxmIPXV2MZ5zeWWqT
 Cb5P1GoY4H+uvXYK7P3RrfC4EWAOZ4juhhfIm/KFSLW9aRRQ4Zqo971xGrOkIpHMEu0c
 3yhnhDbwP68exGAWheV5F4TKGxVEtcDoSxCbT/qu10nUxakSgMnM3b3z58Q8lf2Lk6Ev
 aZsQcRQe3azLhQJLgD9fu7D7bvrUAWIo3gBbBkv6HFh3+kO707WPqTaB6akdNZ2BNpKl
 2pgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ckjd59sQpmqKYyW4+FEhhz62Vn4zdt4oG7Bt5gvCPPw=;
 b=bEizfxpNZ1VFQ35amSRaMT5zJJXzSNd9pA/wUZT5as8U/QH95wlXULAhDqEDIsVaI8
 g3/7PiFcg2fqtFR9rpCcPkwsDEy+stKc0VG57q+qxDtDdZTPT1jXp4CVWMH1BpPAySgf
 5jk6zBSItNxiZratUcFiPb9cqP9jlQGRfN3SUU0m5KN75X1RKnxX0kqBRzi1dKHpsxuR
 fSh43S6CdTMex7BJT51cNSH8ZvJLrBY0rKWHPWecrcxx+SIS8KXhkVORyCmHAdOA7hWx
 q3nTuxQMSopO/oD/d3M3JuLxCkJFr0qi4t9neQC0xudTzGKTOfdJNN4dKXM6Rgrdst5E
 oeUw==
X-Gm-Message-State: AOAM530DQrWPMKZIm2JlUlywHkWgSf7AyaFK0JwqhBM6V8Um0SmZuXqV
 eZIXfwcYz/lUOFTBBHeyLLzp4w==
X-Google-Smtp-Source: ABdhPJy8a0MoAdmrZlVsJkEAmsUEAhdfnpXxSt16prAFOPciR54XU/kxYaJX9Oe43N8z916jwhj3uA==
X-Received: by 2002:adf:f4ca:: with SMTP id h10mr22069240wrp.3.1627988560518; 
 Tue, 03 Aug 2021 04:02:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v15sm2287209wmj.39.2021.08.03.04.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 04:02:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F36CF1FF99;
 Tue,  3 Aug 2021 12:02:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH  2/3] tests/tcg/sha1: remove endian include
Date: Tue,  3 Aug 2021 12:02:36 +0100
Message-Id: <20210803110237.1051032-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210803110237.1051032-1-alex.bennee@linaro.org>
References: <20210803110237.1051032-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, imp@bsdimp.com,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This doesn't exist in BSD world and doesn't seem to be needed by
either.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Warner Losh <imp@bsdimp.com>
---
 tests/tcg/multiarch/sha1.c | 1 -
 1 file changed, 1 deletion(-)

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


