Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CA5144A17
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 03:56:58 +0100 (CET)
Received: from localhost ([::1]:35788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iu6CP-0005lg-Nn
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 21:56:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45188)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iu65g-0005Wh-Ps
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 21:50:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iu65f-0002jk-PI
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 21:50:00 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:50544)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iu65f-0002jS-JQ
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 21:49:59 -0500
Received: by mail-pj1-x1033.google.com with SMTP id r67so2396172pjb.0
 for <qemu-devel@nongnu.org>; Tue, 21 Jan 2020 18:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9qn6/Kr8nQny0P1ZY5wKZEoB92qxHxFg7JpuXIVQ1XE=;
 b=LCVfjbU0gmt3EUpnAgy7NnhvVDgePmiawksVZ3kWjVxACMPBMBd6+ayyi6ojYmntX1
 zgQ3EWdxUVtKrlkdI0WzFVuMdPD0xuJg9vTqArJUlJLmSE1LI/0X5khMaE3DAtJn2A3r
 au8JkBH08V6eGD9zOhrAaoaosq15XXlvo55SQL0YkDeh0vnVbezuUeWk5OGSgMBsN1I8
 JM89ZSkMJb0KwIa5JwjVMbbW4GaAsN0kh43nuUF4YAYX8vXdnh09RSUjgQoSYSsL+sQX
 Q/umWw5q2fl1F6dC95VOBKwt7XS2izv6EfhrKpL4lb2fbwXUhCBkfYm/o/aUNRw9CETs
 ARyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9qn6/Kr8nQny0P1ZY5wKZEoB92qxHxFg7JpuXIVQ1XE=;
 b=dPM9NyuPw3UFHBiue8ziUo9SKHAICND6cJ1pD/G7XI4hoWVPpw9KJDIEHVGjS2UMqY
 Uwkc3Vpten92SKHU9GCbX5QIETmbaXkdFm6SESltypX2HlTXx9Sb0MX3q12o2UPCtIl1
 veBWRjFX3ooHNFiTYK1ZgL8xCkyuqkbVL8GPVEGzW97+izaKL8x0b0q+p8T4bV23Ku68
 klsJTqZHt4XeV/bppDhm4Fp3NrHyc1irqxKimyQuzegqSlC2iPUrrqFZMttbLQ0TKnPe
 A1SmPorIbvziW+NsOfM7oOVzy6W+idNfhyAhVMzR/5I6pd1CdUa34IhLg5ji4UiRLaiW
 9kjw==
X-Gm-Message-State: APjAAAW+OO3SJPDRh9MRMlqIuw+ErAQ7VgS+SDgjJK3fH50vcJ2fbbWb
 +hhgO+SBaVavSsx8QxEs6y6FFAiUcI0=
X-Google-Smtp-Source: APXvYqxGaUeSwg1dZYHi/srigCpDgoKrzzDErpTPuhM/YQ8uHtooGsnpt51dvP84wT8o5WGbFWF//A==
X-Received: by 2002:a17:902:7009:: with SMTP id
 y9mr8665732plk.254.1579661398385; 
 Tue, 21 Jan 2020 18:49:58 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-198-77-92.west.biz.rr.com.
 [173.198.77.92])
 by smtp.gmail.com with ESMTPSA id c22sm44149883pfo.50.2020.01.21.18.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 18:49:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 05/16] vl: Remove useless test in configure_accelerators
Date: Tue, 21 Jan 2020 16:49:35 -1000
Message-Id: <20200122024946.28484-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200122024946.28484-1-richard.henderson@linaro.org>
References: <20200122024946.28484-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1033
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The result of g_strsplit is never NULL.

Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed by: Aleksandar Markovic <amarkovic@wavecomp.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/vl.c b/vl.c
index 94c9301e7f..1e5e9b9aeb 100644
--- a/vl.c
+++ b/vl.c
@@ -2783,7 +2783,7 @@ static void configure_accelerators(const char *progname)
 
         accel_list = g_strsplit(accel, ":", 0);
 
-        for (tmp = accel_list; tmp && *tmp; tmp++) {
+        for (tmp = accel_list; *tmp; tmp++) {
             /*
              * Filter invalid accelerators here, to prevent obscenities
              * such as "-machine accel=tcg,,thread=single".
-- 
2.20.1


