Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B43CF3FFD36
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:35:59 +0200 (CEST)
Received: from localhost ([::1]:44954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5c6-000468-RO
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:35:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM5F3-0003d8-N4
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:12:09 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:55031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM5F1-0003u8-9X
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:12:09 -0400
Received: by mail-wm1-x336.google.com with SMTP id g138so3031004wmg.4
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 02:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1bVEVWhNaQF2veQzCYIds6OQeILaCkMmELL9XjWUDS0=;
 b=UgRNCkOWAWGZnfKwkulV/UT0wLptUwmz4/ZuxWARi+dMENZ9kYFVqVF6INdAX1qqen
 Ii/33CpFZo5/g5usb9mYdoPXdYhLtWutANLZK8ZmI3ZM+U75Mg7B2S+3+whoe6heT306
 BF19TUa0dDFEtV9JpnclFsh93ZFap6AOASTROCNSRx9b46ANODMLanMyp4AVmlENecXA
 wO4vU35YL65czPcMWNxkHFMYxnCrCmkwNXsOq6Pu/xWasEwbYwFvWEflK449FDfrJKfF
 yzexCHc+OjN/ri0gJo+SbBzyZsqBvUW1giGFh3kUh25pO9yB/uNg4hqpk4+t6n4wmygF
 oayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1bVEVWhNaQF2veQzCYIds6OQeILaCkMmELL9XjWUDS0=;
 b=gqlqUwqQxanOJGBp7WqXo1gtjjcqfVfntrSNLzQDBJ/GEjWFhKLdb7jkTRMoequvvi
 PIVTMnZvv5LN//QvfsOP1HMqxd9iqWZRCAQDzrkooMwamWL1kAFNd7IJGSpy90S9rUx0
 5bSj7Nw0k1iGaZta0z20TpeujcgxA98b9sP2ZQDh4yA+AxutIqHkRra9CjqxCjHNVm5J
 HlhI3c1EjJlzq9o8ZaRoIKCRWI/RTO3KkzdOp/H54jjibzbanMGavAglTITzY8D1FuzN
 PelivyYeBJfF6pstwwHKjncj5aZ1omBfaZihD078Rj6H6MroiF0fpDfZSbNRe9bhtdh6
 4QWg==
X-Gm-Message-State: AOAM530KClmzst/5wIceHr3VVsOoHjMHGuxKUxtjkWzdNsW5jg8Ju2mq
 aDvlv+I83ave4pX2AT66ulQDnoYK7+lUMA==
X-Google-Smtp-Source: ABdhPJyuTA7T/tH+knrXPW0jGCJM5kqbSNf9yaL8tiHUlv2zzxZjGeKLKV7TURjSB3hwJ+e9rKAeDg==
X-Received: by 2002:a05:600c:350b:: with SMTP id
 h11mr2283763wmq.101.1630660325417; 
 Fri, 03 Sep 2021 02:12:05 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id x11sm3805781wmk.21.2021.09.03.02.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 02:12:03 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A60981FFA6;
 Fri,  3 Sep 2021 10:03:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 10/22] plugins/api: added a boolean parsing plugin api
Date: Fri,  3 Sep 2021 10:03:27 +0100
Message-Id: <20210903090339.1074887-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210903090339.1074887-1-alex.bennee@linaro.org>
References: <20210903090339.1074887-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

This call will help boolean argument parsing since arguments are now
passed to plugins as a name and value.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210730135817.17816-3-ma.mandourr@gmail.com>
[AJB: add to symbols]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index e6e815abc5..5f1017201f 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -577,4 +577,17 @@ int qemu_plugin_n_max_vcpus(void);
  */
 void qemu_plugin_outs(const char *string);
 
+/**
+ * qemu_plugin_bool_parse() - parses a boolean argument in the form of
+ * "<argname>=[on|yes|true|off|no|false]"
+ *
+ * @name: argument name, the part before the equals sign
+ * @val: argument value, what's after the equals sign
+ * @ret: output return value
+ *
+ * returns true if the combination @name=@val parses correctly to a boolean
+ * argument, and false otherwise
+ */
+bool qemu_plugin_bool_parse(const char *name, const char *val, bool *ret);
+
 #endif /* QEMU_PLUGIN_API_H */
diff --git a/plugins/api.c b/plugins/api.c
index 2d521e6ba8..acff9ce8ac 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -383,3 +383,8 @@ void qemu_plugin_outs(const char *string)
 {
     qemu_log_mask(CPU_LOG_PLUGIN, "%s", string);
 }
+
+bool qemu_plugin_bool_parse(const char *name, const char *value, bool *ret)
+{
+    return name && value && qapi_bool_parse(name, value, ret, NULL);
+}
diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
index dee7610387..67b309ea2a 100644
--- a/plugins/qemu-plugins.symbols
+++ b/plugins/qemu-plugins.symbols
@@ -1,4 +1,5 @@
 {
+  qemu_plugin_bool_parse;
   qemu_plugin_get_hwaddr;
   qemu_plugin_hwaddr_is_io;
   qemu_plugin_insn_data;
-- 
2.30.2


