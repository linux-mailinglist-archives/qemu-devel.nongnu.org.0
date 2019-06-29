Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0035AB50
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jun 2019 15:10:43 +0200 (CEST)
Received: from localhost ([::1]:39532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hhD7q-0005Nw-N1
	for lists+qemu-devel@lfdr.de; Sat, 29 Jun 2019 09:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41296)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hhCyC-0007zU-4F
 for qemu-devel@nongnu.org; Sat, 29 Jun 2019 09:00:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hhCy9-0003cY-0W
 for qemu-devel@nongnu.org; Sat, 29 Jun 2019 09:00:43 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:35288)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hhCy8-0003JK-JL
 for qemu-devel@nongnu.org; Sat, 29 Jun 2019 09:00:40 -0400
Received: by mail-wr1-x444.google.com with SMTP id c27so1283289wrb.2
 for <qemu-devel@nongnu.org>; Sat, 29 Jun 2019 06:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Yi73HVrC7Sm+295fhwI84+ARAx5vKPXoBaHMWk35YIc=;
 b=n2oCf4BZdTLFgsDY4rI89eN6rlkmxOiwaUfxLgUfqwPB8jqBRHix0OkkHDH3lm1sq2
 gTdvwf9Yw+pxAb6kQTYeUuqHCFsoLWPHTtaMA2bg1knkatDPMfhFWP/48ePtlyFisrDA
 vCwSvtvnd0bS2WB7IeEMartmTBjDJxPuX1ZnhyHIimWRwXKrCGM8gRNQgLSZMSeH+6lH
 UYxD3WnRVhl2VPCWRMfMEruShvA2ws2CMDTYXErAtdr5GY9jQq/lANORVpqYcgdlr+D5
 EPDwOBy5B/sM6NmGfqDvVfajNfm6hrj0BuPxIpdBzzsxMi8euJPDk8jAiKJFxa9Ukbgk
 2+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Yi73HVrC7Sm+295fhwI84+ARAx5vKPXoBaHMWk35YIc=;
 b=Wca8OM+OnKCh0e9t9550pcrwn6SEF3F9KO3SiY7rvf1NR+uIuI+2sQOTKoxu5bHQ4A
 4Scel3B2OCJ7et4O2TzWRNM2PusM0o2scciOGxj3S43TonYwMyB8UiOggbUBIYUKtPiV
 YdkpZGj9xHmW9PPfPgooOr2AlJAsEF8tcFNA+1+lnoF6VHsR8+nXUd7iXgU+bSUzIcSF
 q5RgD8JvZ/AU93uIKJ2mCzrLBA+Knx6JcYtY9iP97NwCvx1xcPz/ebUVqFndU+de8041
 5Mmjb/LXT43V+EXpOhfN3g/DJwCsE3DP4W2jEeG60EDkv7LkLa+hlU0QC9NUZ8DDRCIT
 Bf5g==
X-Gm-Message-State: APjAAAVKnhHOfY0DtETohLZi3BhvI5kuqM3fHoIUT00v1h1I7piLWQKh
 8T3oBMfNJuwMtat4QUiRTsEN4nn+2VnRRA==
X-Google-Smtp-Source: APXvYqymNI9Av8qCi9+dFUxtZ6oRFgdTZrS2BU38XAMKKxroG7fJZnwnT2CD97xV16ELsZVPu43JMg==
X-Received: by 2002:a05:6000:128d:: with SMTP id
 f13mr3287432wrx.39.1561813221047; 
 Sat, 29 Jun 2019 06:00:21 -0700 (PDT)
Received: from localhost.localdomain (93-34-153-63.ip50.fastwebnet.it.
 [93.34.153.63])
 by smtp.gmail.com with ESMTPSA id d10sm4937676wro.18.2019.06.29.06.00.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 29 Jun 2019 06:00:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 29 Jun 2019 15:00:03 +0200
Message-Id: <20190629130017.2973-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190629130017.2973-1-richard.henderson@linaro.org>
References: <20190629130017.2973-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH v6 02/16] tcg/ppc: Introduce macro VX4()
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
Cc: mark.cave-ayland@ilande.co.uk, amarkovic@wavecomp.com, hsp.cat7@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce macro VX4() used for encoding Altivec instructions.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
---
 tcg/ppc/tcg-target.inc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tcg/ppc/tcg-target.inc.c b/tcg/ppc/tcg-target.inc.c
index 8e1bba7824..9e560db993 100644
--- a/tcg/ppc/tcg-target.inc.c
+++ b/tcg/ppc/tcg-target.inc.c
@@ -319,6 +319,7 @@ static int tcg_target_const_match(tcg_target_long val, TCGType type,
 #define XO31(opc) (OPCD(31)|((opc)<<1))
 #define XO58(opc) (OPCD(58)|(opc))
 #define XO62(opc) (OPCD(62)|(opc))
+#define VX4(opc)  (OPCD(4)|(opc))
 
 #define B      OPCD( 18)
 #define BC     OPCD( 16)
-- 
2.17.1


