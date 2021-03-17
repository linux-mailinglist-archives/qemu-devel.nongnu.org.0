Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47DB833EA8F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 08:31:43 +0100 (CET)
Received: from localhost ([::1]:53382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMQec-0006je-C4
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 03:31:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMQVk-0003fm-3W
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:22:32 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:40924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMQVi-0007wG-Ho
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:22:31 -0400
Received: by mail-ed1-x52c.google.com with SMTP id b16so977600eds.7
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 00:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8reQeX3pGa2B4FJO8BMXlygofe+ASszosdyj7RtuxBU=;
 b=lu7JtU8bg7I/BC4Rt5wNHFQ6WWC58SSihpK6CiFGrW0tH2ROZTLZlfAklfdot/Ba4c
 i3ciYfFBPd7IJAVJpT9/DiWOLgedY1BeJymKlEtv6Pna8NKBcjX+qIdF1Rp+KwkFPEtT
 LMb85CxvDYo+MKN7OMugkMKPIZCkJXMgrSaTY0nImPoTiiqRQESV8YE5Fpgon+c6JZcC
 MtyySOk+zPqdqAPBc/Y//gX5I4dd/VE46Eg5z/xFW47rtY5D6MDN0MohpMyXasIuHwf3
 ivbOUJXLd/U/Rxfr4s16SiKk4plfxCKsyLICwqoQGbzWfqfcDDQNRcwQoj7IcknbX4EQ
 adeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8reQeX3pGa2B4FJO8BMXlygofe+ASszosdyj7RtuxBU=;
 b=RoX4t1lWSr4F3zgOZ92L+hT69ztun8ROzTPUb/sUZEjeuIyOBDxBr7lve/g6QaEiig
 s4P/pi4nS6QtlJbWb/sTXtycLZOvbw6mPFNp/e+HkKeK9u2QzSBWhOow6fG2NFy5BPbF
 MXe3s2iNaqs5Infe97FGxC+meBdxIRxeNqQZXVkqW9TO2VASP3aAm0hWBJCH1wvZ/UQj
 SZQJHlIF7F9JanZX042D+prZh2yHWDe18ueqIM4xsk3VJZG4xLF+CwwTi2zc87zY1tf6
 hfXGfoiJTxwpdz48rwGU2J6/4rpP8WeDmpRkw69WvueZvx4Lx9/FOPxO9iHQhpxl/FCf
 ySCQ==
X-Gm-Message-State: AOAM530W42Ii6Ax9S72rvGUuDuZzs7kF0gY44kFzt/HxWdr+ugxu60xz
 +q3sAz/K95OXcxuZHyBzL4qKew==
X-Google-Smtp-Source: ABdhPJxHSG4x9CYkU2MssABgEvzoL9Rl9A7mdcQwcpoyHc5C88nWi5HRSInMyKk2HaSYchsXtDKkyQ==
X-Received: by 2002:a50:f9c8:: with SMTP id a8mr40649492edq.270.1615965749213; 
 Wed, 17 Mar 2021 00:22:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id bi26sm10778079ejb.120.2021.03.17.00.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 00:22:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3C0641FF92;
 Wed, 17 Mar 2021 07:22:17 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 06/15] plugins: expand the callback typedef kernel-docs
Date: Wed, 17 Mar 2021 07:22:07 +0000
Message-Id: <20210317072216.16316-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317072216.16316-1-alex.bennee@linaro.org>
References: <20210317072216.16316-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52c.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210312172821.31647-7-alex.bennee@linaro.org>

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index ac1bb318da..09b235f0b4 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -99,17 +99,36 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
                                            const qemu_info_t *info,
                                            int argc, char **argv);
 
-/*
- * Prototypes for the various callback styles we will be registering
- * in the following functions.
+/**
+ * typedef qemu_plugin_simple_cb_t - simple callback
+ * @id: the unique qemu_plugin_id_t
+ *
+ * This call-back passes no information aside from the unique @id.
  */
 typedef void (*qemu_plugin_simple_cb_t)(qemu_plugin_id_t id);
 
+/**
+ * typedef qemu_plugin_udata_cb_t - callback with user data
+ * @id: the unique qemu_plugin_id_t
+ * @userdata: a pointer to some user data supplied when the call-back
+ * was registered.
+ */
 typedef void (*qemu_plugin_udata_cb_t)(qemu_plugin_id_t id, void *userdata);
 
+/**
+ * typedef qemu_plugin_vcpu_simple_cb_t - vcpu callback
+ * @id: the unique qemu_plugin_id_t
+ * @vcpu_index: the current vcpu context
+ */
 typedef void (*qemu_plugin_vcpu_simple_cb_t)(qemu_plugin_id_t id,
                                              unsigned int vcpu_index);
 
+/**
+ * typedef qemu_plugin_vcpu_udata_cb_t - vcpu callback
+ * @vcpu_index: the current vcpu context
+ * @userdata: a pointer to some user data supplied when the call-back
+ * was registered.
+ */
 typedef void (*qemu_plugin_vcpu_udata_cb_t)(unsigned int vcpu_index,
                                             void *userdata);
 
-- 
2.20.1


