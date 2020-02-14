Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF24315F11B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Feb 2020 19:02:42 +0100 (CET)
Received: from localhost ([::1]:43114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2fIX-00005i-Uv
	for lists+qemu-devel@lfdr.de; Fri, 14 Feb 2020 13:02:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56217)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2f7w-00064v-Cn
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 12:51:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2f7u-0000yV-4l
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 12:51:43 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:42751)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2f7t-0000vY-UJ
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 12:51:42 -0500
Received: by mail-wr1-x444.google.com with SMTP id k11so11876547wrd.9
 for <qemu-devel@nongnu.org>; Fri, 14 Feb 2020 09:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5mQrhAitCaw5RJP1dOPrlxLmDz4jgnDL2MRmgAJnH5M=;
 b=mhVWUbZC1r417E2WBJRppYnXh+oa3UhaBZaPXQ2um10Xhq0mDR/gQIll9X5WyBzlyA
 jzGcm33iRJu6CIaab75gZ03feDNF9W8K393MpXCTzbcLdfXX+hhuSZpHxoROw2ffwufs
 7fzQQtXtXuKtSaVoJLOhpaZzQ9BrNlZW0C7PN0HV7n3sn3WZnZOUZaYyLSAq1MtCUQ90
 iFFlmy7l/Fu82NEDs6qN3vlDB1RHw7/Pf2m+sm4oZZx1fE0Szpp09uoMmhpHaLG/hHZD
 cz5HvdcAcehr74vmH+TXhtzgrXkKq9wjUU2jZA+VzlKn6Ozxi9MSssUJb54/ZVeR9+Ex
 03wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5mQrhAitCaw5RJP1dOPrlxLmDz4jgnDL2MRmgAJnH5M=;
 b=H9m6IgsvP6REkKkp50kLTmvRGJRujsOpgUMt/Pqhr26OJYCYm+tzxwJk4VCnhvzNv2
 fCsr7jeVdpKeo0qzfy4AdjYf+uDuZvT+0M13fZfYefW/AKjVQDC/6qWWpVpTfzsKDrx9
 jvTSfj0cxd6LqRK7hKJIresclbGY6zUNSnHSqwQvdvWooaxi6AsA+Ic19oKrdxCVTXaY
 YT/DZrNUPKoT4zIfaVVAWbInQlkufY3s5dRLZLj5Q4LUcMF6Y3Ro0ID9dAUl3miH17QV
 BMR+ujA/201AUxdYruPLxSL7jRfDpKD08bz0D1gRSOQR8xbU4eQQ0odgh5xzZZ/I9me0
 A32w==
X-Gm-Message-State: APjAAAUZcGCjkYn3cXAAQcwxHCOiaKv4KNndCKN0MX6ul6OEYZIU2LNo
 RZLWD5npqlKbMlcji9sT63kHpghL1I4=
X-Google-Smtp-Source: APXvYqz3gYgWNr/GT/bTIJCoA3+GqfVcQNpY6DAOrtW7VGOn3P0MYHWrvWmZ8b0Vdah47HB0lkiEDQ==
X-Received: by 2002:a5d:474b:: with SMTP id o11mr5342789wrs.255.1581702701013; 
 Fri, 14 Feb 2020 09:51:41 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id v8sm8001857wrw.2.2020.02.14.09.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 09:51:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 16/21] target/arm: Correct definition of PMCRDP
Date: Fri, 14 Feb 2020 17:51:11 +0000
Message-Id: <20200214175116.9164-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214175116.9164-1-peter.maydell@linaro.org>
References: <20200214175116.9164-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PMCR_EL0.DP bit is bit 5, which is 0x20, not 0x10.  0x10 is 'X'.
Correct our #define of PMCRDP and add the missing PMCRX.

We do have the correct behaviour for handling the DP bit being
set, so this fixes a guest-visible bug.

Fixes: 033614c47de
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2feded1518c..2ebfa6c6545 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1017,7 +1017,8 @@ static const ARMCPRegInfo v6_cp_reginfo[] = {
 #define PMCRN_MASK  0xf800
 #define PMCRN_SHIFT 11
 #define PMCRLC  0x40
-#define PMCRDP  0x10
+#define PMCRDP  0x20
+#define PMCRX   0x10
 #define PMCRD   0x8
 #define PMCRC   0x4
 #define PMCRP   0x2
-- 
2.20.1


