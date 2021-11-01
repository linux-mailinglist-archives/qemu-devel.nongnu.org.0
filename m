Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6F0441F91
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 18:50:00 +0100 (CET)
Received: from localhost ([::1]:58428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhbRX-0008KC-Oj
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 13:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb63-0003iB-ST
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:47 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:40615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb5x-0000c9-70
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:27:47 -0400
Received: by mail-qt1-x82f.google.com with SMTP id 19so14949679qtt.7
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gSr02Sd1ztBN32tTKGrZscSunLegESBnCl09IIG3Qgg=;
 b=TxSSZ2rzDd1MVzTpsbz7nMhyU05MyChncIz43o3/9/6dugeMJgZwQLAbl4wU+NAGjp
 8voqhRgSMa6xAfe2ps1sREiwNdcwOGw8W0z8eP56tG8UC6t3ebdx5xBIki2S6+YYmvJA
 koUMpA+VfBBRgXbgFA2G0uWRCn6tn9cCOwieyZNY/3Beg4WD8o6jj+k9uA1iLosdEt9V
 U4PN41FD5vmLw/bVsC3kkfds5+gxbcEgapUUcObKPRTHDKWDT7OpMs+HnLpHVqbOXeqy
 d/0YV0RHMwfM3OscC+QNXeP0Exopjr3JkgdNw9SrhvDp75Bg5Hv6238yy3DmWUOggzuK
 WYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gSr02Sd1ztBN32tTKGrZscSunLegESBnCl09IIG3Qgg=;
 b=a8mt3xbxV4FyHKV97TvqarOV9O7/eGwsJCBflqQ0aXt5xWvGduSMxgnduMQF4nj82U
 F3nd1O/K5UyJeUvloqyQpgwbcNFYhXHMSt3jtB+C/eOYqFVVfn5IGo+NtcWa5Tzh2JMR
 BnwJTfIw2kdRAG6sSt4B0dpGz0m/xiAAcVJm3Iyv0+XltTQXkGH61GzaZByhCONORkYu
 9oePfbBvzueRHer3cd7w6IAt0qpeUcF8kAwt2Qu6q8UNWXDucdbBS3sa17hpUbPKDfjD
 zzq39IyXAZzYQ5nakSjiCAMpwslQim6GFeConFnhR8yWBB2TNHWOPwAldcF9FOLa49X8
 xRYQ==
X-Gm-Message-State: AOAM5301K+JRrREo6xh6RvDcGIxuk6l7I2x38opoJv9T0TuniWFPQy3d
 xg2BBoa5vYcjP6WskhgGb0PlTkyY0y5YyA==
X-Google-Smtp-Source: ABdhPJyd6seCk5vJVNrDexaNdtSYinZmMaFWnfJLR6/8basJEY2zZZOhNitUs17H4oTBusokASVf8w==
X-Received: by 2002:ac8:7fd3:: with SMTP id b19mr3530483qtk.235.1635787660353; 
 Mon, 01 Nov 2021 10:27:40 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id t5sm6075331qkf.34.2021.11.01.10.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:27:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 16/60] target/arm: Fixup comment re handle_cpu_signal
Date: Mon,  1 Nov 2021 13:26:45 -0400
Message-Id: <20211101172729.23149-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The named function no longer exists.
Refer to host_signal_handler instead.

Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index dab5f1d1cd..07be55b7e1 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -6118,7 +6118,7 @@ DO_LDN_2(4, dd, MO_64)
  * linux-user/ in its get_user/put_user macros.
  *
  * TODO: Construct some helpers, written in assembly, that interact with
- * handle_cpu_signal to produce memory ops which can properly report errors
+ * host_signal_handler to produce memory ops which can properly report errors
  * without racing.
  */
 
-- 
2.25.1


