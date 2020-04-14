Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C91AB1A84DF
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Apr 2020 18:29:40 +0200 (CEST)
Received: from localhost ([::1]:34028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOORP-0002Jf-SR
	for lists+qemu-devel@lfdr.de; Tue, 14 Apr 2020 12:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51658)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jOOOI-00057g-RC
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 12:26:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jOOOD-0007Ah-Bl
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 12:26:26 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39641)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jOOOD-0007A4-5q
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 12:26:21 -0400
Received: by mail-wr1-x435.google.com with SMTP id b11so3681943wrs.6
 for <qemu-devel@nongnu.org>; Tue, 14 Apr 2020 09:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xINSNigMYarXwX5/BhM4LUoIhEq1H+iUx4YSxS6L/Cc=;
 b=f/B4EbYeNkIaChrTAPdThS3sNrFdhkrN38rPqJBbHatN1Wi6F8+vr6OSsYRmhTF/Ds
 7rsVD4+UT9iw0un33x1k4r7H9EdniDZt6uj/+e6BFPBDtECjKSXmNym7Ibf5s6jshK+V
 Fwc3hcZ55CCY6n0a81C7rmuP4CogCw+CeQADabHiPHrgQR9J34xhjT4FjQGJI0fO3BC6
 H75FBpwFferp7lEtxXhgbD9GtNy/icduqJPPwqEOy3pgXpoZhocWb3JJEEKYmiEkF9f7
 1qfWkaNza53CCHrd/1iTz9Fq0o/Bh3M5RkE1+naQnW6Ung67ikyz8t6ahZdq1SEYmcs3
 ZTGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xINSNigMYarXwX5/BhM4LUoIhEq1H+iUx4YSxS6L/Cc=;
 b=rTvK+vd2sFJkyS6hTK05PmaHGuruN3zEWeij76uBS0IEYY4SCv/vmBRs6q4xi0ln7U
 TVbohImOsHaYsHXupsay3sSwV2Q8KQBpUioIEumvgX8y9uUnxMZ2F3Lw9BRXqFFVCk8X
 jmojDm/S7vjThUvBWchJ2fchMY/yzU0jGSWd4vFgTnLNUwJpIfZapqOXUzpCyFfcKYHx
 gl+TAI9AujKyxA3zgH4hA7LGORxnws2Xrc5IsoprRV6pePXwfl3uroPrD8LPXMo0nSQe
 mN5LmNqZV36yNZNv/vh8eVv1X8isDlfXB784UPTLr6DqzqlDsxT5INu+/d+TCkokpCM8
 vucQ==
X-Gm-Message-State: AGi0Puaq1U5DLxXqkUOWfTP8JwSmxsxMdbBpbFr6Ud1l6K4c/kqqI4C/
 Q4KnW5jkoLDTB3ZVjcyEHAC1RGf/vhdIrA==
X-Google-Smtp-Source: APiQypLFtUE+gz9YHNidkMdLOBc5U2yNoEB9u6rQPGqufMVJogW0fem6O8xskoHi5gRKEnMxdNjg7Q==
X-Received: by 2002:adf:e403:: with SMTP id g3mr23992501wrm.121.1586881579945; 
 Tue, 14 Apr 2020 09:26:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i129sm20003802wmi.20.2020.04.14.09.26.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 09:26:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/12] linux-user/flatload.c: Use "" for include of QEMU header
 target_flat.h
Date: Tue, 14 Apr 2020 17:26:05 +0100
Message-Id: <20200414162613.4479-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200414162613.4479-1-peter.maydell@linaro.org>
References: <20200414162613.4479-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::435
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The target_flat.h file is a QEMU header, so we should include it using
quotes, not angle brackets.

Coverity otherwise is unable to find the header:

"../linux-user/flatload.c", line 40: error #1712: cannot open source file
          "target_flat.h"
  #include <target_flat.h>
                          ^

because the relevant directory is only on the -iquote path, not the -I path.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-id: 20200319193323.2038-5-peter.maydell@linaro.org
---
 linux-user/flatload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/flatload.c b/linux-user/flatload.c
index 0122ab3afe6..66901f39cc5 100644
--- a/linux-user/flatload.c
+++ b/linux-user/flatload.c
@@ -37,7 +37,7 @@
 
 #include "qemu.h"
 #include "flat.h"
-#include <target_flat.h>
+#include "target_flat.h"
 
 //#define DEBUG
 
-- 
2.20.1


