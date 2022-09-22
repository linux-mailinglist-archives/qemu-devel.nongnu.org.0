Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AD95E6B73
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 21:06:46 +0200 (CEST)
Received: from localhost ([::1]:51004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obRX3-0001Yh-Bq
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 15:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPBQ-0002Kt-5Z
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:16 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1obPBE-0005TS-LP
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 12:36:15 -0400
Received: by mail-wr1-x42a.google.com with SMTP id s14so14443944wro.0
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 09:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=RoU2tXSDAF3jVU6D2jreLTh5a4JsfPrQiPOOPrFAmFI=;
 b=pPoLztbEDqwmQGPOmR9lkJlsz26Ye7G07N/zLl9RQTULcgCKelXaWhMV7uYB2DbbvG
 0/whkJGEgL+GggAfM5/XKbK+L8VSjEkr5pUNphrzoEITgN/yQgci6xm87p6Rl+Q9Q8Ly
 yHWnHwgPN0biNCh6SsvOLYqJUr9BE/YNDkHxx+3jECgySFiZxiA0YwJJD8UFmzddOS5C
 dIScTEpvxPrAqrf/ekfk3ifYqWjUaFgG7lFWXl2qvzEHI3ngyzLINE2lHZslGdJUn+o/
 O0I3J/RORsb/A5+/Xiw96HSKnejYLabQIbKFE8HGyQggV52GMroWfeKfwjrhvV3Vn58p
 8jhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=RoU2tXSDAF3jVU6D2jreLTh5a4JsfPrQiPOOPrFAmFI=;
 b=lwQkr3gxHzQO3xrYIhAM+jZ1/oAsP4Hd+nFtoDjJ/EuS8vDjicrzv+G/EQBDkO4nNz
 YjkVaUVopJfb2OS4WRQqGKHb9ogEyBoMXxZ+zgqnav+UGPgFtl3GY1RGFWRCgFlzhgL3
 CVigBQPAa3ZSymtjyQaJFQEsjYOh5YESzQEtAyyzhlh5pdmiU1KYOcgnAPD1J7ShfMOx
 xkXt8gAU8UfwcaBt1LIsQaEysRcBahfEk6tv6nHmFeDTHyK36Z1SI/hHI1Rzg3pB/5IT
 ZKc8UhdyroisWBDp+ahCie4NdDfC6gWP0CVeLdqiTSErf4MuqsIPyTNw3NQHd+OKK/mZ
 vq4w==
X-Gm-Message-State: ACrzQf1uwXABFFxK0O1EZmlub9mcfxk0Zx2QhZN4yCBVvP5M1h4xrd8g
 Gi6VAusaLh04h0hSini2JUNVcQd7mRQE2Q==
X-Google-Smtp-Source: AMsMyM72N9BxMj9Miw8NHkl9L7eRByV38zfE8e1XEDoVELR6YB1xBNegV4ZdqugkqQSWdOmE0H6B4g==
X-Received: by 2002:a5d:6a07:0:b0:228:dba4:2138 with SMTP id
 m7-20020a5d6a07000000b00228dba42138mr2581211wru.346.1663864561374; 
 Thu, 22 Sep 2022 09:36:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 iw1-20020a05600c54c100b003b3401f1e24sm6452599wmb.28.2022.09.22.09.36.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 09:36:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/39] configure: Add './' on front of glob of
 */config-devices.mak.d
Date: Thu, 22 Sep 2022 17:35:33 +0100
Message-Id: <20220922163536.1096175-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922163536.1096175-1-peter.maydell@linaro.org>
References: <20220922163536.1096175-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Shellcheck warns that in
 rm -f */config-devices.mak.d
the glob might expand to something with a '-' in it, which would
then be misinterpreted as an option to rm. Fix this by adding './'.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20220825150703.4074125-5-peter.maydell@linaro.org
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 86cc6259181..482497e9743 100755
--- a/configure
+++ b/configure
@@ -1093,7 +1093,7 @@ exit 0
 fi
 
 # Remove old dependency files to make sure that they get properly regenerated
-rm -f */config-devices.mak.d
+rm -f ./*/config-devices.mak.d
 
 if test -z "$python"
 then
-- 
2.25.1


