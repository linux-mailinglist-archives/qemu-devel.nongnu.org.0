Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8783396BA
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 19:37:17 +0100 (CET)
Received: from localhost ([::1]:40132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKmex-0007MN-Tn
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 13:37:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKljx-0003pH-BF
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:38:21 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:38061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lKljs-0006Ka-LF
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 12:38:21 -0500
Received: by mail-ej1-x635.google.com with SMTP id mj10so54869950ejb.5
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 09:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vL7/zplSiqfJqI6VGtUOhvXp9xtLO6YD7KZP8afIyD8=;
 b=G7gVM1MTwDMnCl+moqElpQxHQSDepMb0RtkaPc74hADKyD+GzpIiJ6wPkk1HrL0TLh
 LDTUnNufqjylGHUfgW/n5wINbXJPZ9mU3oAyHbOqJs+jtNTOOqdSLZsxLbtfWygGWupI
 LIoNWQjXmy54ZuvsJRfP0s1ut4RzLOwcmE64Memo1+qB4lp/fIPAJJbBg4mcB+m3Ziax
 niAAeY6+/37nCNfU6ozm7XgTwo23C6hCNUKFNFmZ42h4zzuT4bbg3DC+8fEMFRANSAPI
 z551TyziTHqHkYuBUNZN7WWgUlMgUESicCmkDPwEyKcZ/uOmTLGlf5COUkhTna+uCGv8
 zmQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vL7/zplSiqfJqI6VGtUOhvXp9xtLO6YD7KZP8afIyD8=;
 b=R7aKfyQF9O4zqMXRPHlPVj3JxvKxhWKyckFp2JwvpNQqs8XXZ9PmLjEpgAs/8mv2De
 u6agSmyHLIyUoaO63MlZfrYYOUF+5AAeX+RTzbWQQI9Vg65MqbmpavUDsIn21kkZyg/P
 EfWjWp6xgW3BitgMxvNrkcRx7WDPd3qvHKERMp6vMHNdbrdbJcyfdUTA1PfUUhyONm5g
 ZlSSf+i6/opzVfC324hUuM+Wa6soI91pNDudg00SlOMjzUuoEjj0SRkylsK1rMGAZg0u
 w/ouJxOTwyZus7asnmqRiGGqeobJq0pu0EwrSD1MBsjpfm3kKCEVrImGI+5VOkYiLyXA
 6EPw==
X-Gm-Message-State: AOAM5322dXk256dqBlOSVJMo6XVlwHR6uh4J4BnkC0VULNILsPHCpity
 WejDnS3pni2L8h9HezIJj7Z0FQ==
X-Google-Smtp-Source: ABdhPJwIVzcwCstpWFFgUhE40IyJdYUeczOCAuqS7VtEOpeAsOF1BEUkCp1PUiDI/zjoyxO+aEtGxw==
X-Received: by 2002:a17:906:e16:: with SMTP id
 l22mr9734408eji.173.1615570694758; 
 Fri, 12 Mar 2021 09:38:14 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a12sm3014420ejj.121.2021.03.12.09.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 09:38:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 032421FF9D;
 Fri, 12 Mar 2021 17:28:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 14/14] plugins: Fixes typo in qemu-plugin.h
Date: Fri, 12 Mar 2021 17:28:21 +0000
Message-Id: <20210312172821.31647-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312172821.31647-1-alex.bennee@linaro.org>
References: <20210312172821.31647-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x635.google.com
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
Cc: Yonggang Luo <luoyonggang@gmail.com>, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 kuhn.chenqun@huawei.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yonggang Luo <luoyonggang@gmail.com>

Getting the comment consistence with the function name

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20201013002806.1447-3-luoyonggang@gmail.com>
---
 include/qemu/qemu-plugin.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index aed868d42a..19e77e345b 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -256,7 +256,7 @@ void qemu_plugin_register_vcpu_tb_trans_cb(qemu_plugin_id_t id,
                                            qemu_plugin_vcpu_tb_trans_cb_t cb);
 
 /**
- * qemu_plugin_register_vcpu_tb_trans_exec_cb() - register execution callback
+ * qemu_plugin_register_vcpu_tb_exec_cb() - register execution callback
  * @tb: the opaque qemu_plugin_tb handle for the translation
  * @cb: callback function
  * @flags: does the plugin read or write the CPU's registers?
@@ -282,7 +282,7 @@ enum qemu_plugin_op {
 };
 
 /**
- * qemu_plugin_register_vcpu_tb_trans_exec_inline() - execution inline op
+ * qemu_plugin_register_vcpu_tb_exec_inline() - execution inline op
  * @tb: the opaque qemu_plugin_tb handle for the translation
  * @op: the type of qemu_plugin_op (e.g. ADD_U64)
  * @ptr: the target memory location for the op
-- 
2.20.1


