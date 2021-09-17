Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D66B940FE1A
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 18:43:36 +0200 (CEST)
Received: from localhost ([::1]:41956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRGxZ-00011k-26
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 12:43:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRGeY-0003aZ-G6
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:23:54 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mRGeU-0005ab-8w
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:23:54 -0400
Received: by mail-wr1-x42a.google.com with SMTP id t8so16085849wrq.4
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 09:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h2a/fqMAvfvd62I27PQxa6vTnXLDXdirz0neaQPZpwY=;
 b=H13w2seVe30qGiqpDyrDiy4MnZQ2JjvG3CJ5p5v77tygYXqSF7HQ9yfnsoMAmX1lK1
 JBr389uuWq7ecLuQ03qVzUMKwm65HdyQqqvQR5rQ7Bq7z+U57t0z9wkvYCjltG2mggbj
 lChRIU4/fTJE94795l8i0EFP19uimjLyhPc2SLb/Gng6GkqyDMRBGUEHt2/uilFLErnc
 +DIQzOiQdy1wV9CXyCAACXUzLT5WEDYZbl7cVVNXSWttDh6Zsfcnq6g8Clj+1ZLYq9+2
 Z41VVN515iLREDZGJ6vncBprR10IDHxVYQeyBRwPE5jWnNEFydhjkoonjqtrCb/eO2c5
 1YpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h2a/fqMAvfvd62I27PQxa6vTnXLDXdirz0neaQPZpwY=;
 b=kIYDXF99gj7/4iF6ZJbJgozGZn+0eFSpTBTCaRLKV6Ku+oq2k1u7L3Jbl/ktAHxPB9
 OwVKbP2kxxcDJ64cV2uhS9p4zuA+MSzL41Qc6xBXtTmuXFXOs3BV4EzgBt1qmRi6dwxl
 R0u+Eiiz34QbuKdxt3RQPPK+TubvUp2OBfFxsmue84dcv+zF4+SkGQjB9Ajpf2YFl5HR
 ZNP3NOFPz7yuNimDgaxAv0OJEdQyp6vSevEKHPjO5G+dKyTEa6Low/2+8UCgDbi/ig7p
 uzRu+JlguhJrh2vXxcLk/OLMjvtWHQIeS+eRO7taHJCxJYnLXSdbhFLI/lsa4r6L6ZCb
 DT6Q==
X-Gm-Message-State: AOAM531/AF5ItCbnk/mPkWesoRv3mmU93wBACW46cc4S1hrPbfm1hxD1
 E5R9kjt7dUyLGoWd+sI1sd7rBw==
X-Google-Smtp-Source: ABdhPJyMUKRfer1bzF9RaYqLy5SawJVql6L9O7hi1vVx009oxsj4D6G/D8Ohd43Jr8fbJhqD/SnTAw==
X-Received: by 2002:a5d:5408:: with SMTP id g8mr13391466wrv.34.1631895828577; 
 Fri, 17 Sep 2021 09:23:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y1sm7318128wmq.43.2021.09.17.09.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 09:23:40 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 114811FFA6;
 Fri, 17 Sep 2021 17:23:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 10/11] plugins/: Add missing functions to symbol list
Date: Fri, 17 Sep 2021 17:23:31 +0100
Message-Id: <20210917162332.3511179-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210917162332.3511179-1-alex.bennee@linaro.org>
References: <20210917162332.3511179-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 =?UTF-8?q?Lukas=20J=C3=BCnger?= <lukas.junger@greensocs.com>,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Lukas Jünger <lukas.junger@greensocs.com>

Some functions of the plugin API were missing in
the symbol list. However, they are all used by
the contributed example plugins. QEMU fails to
load the plugin if the function symbol is not
exported.

Signed-off-by: Lukas Jünger <lukas.junger@greensocs.com>
Message-Id: <20210905140939.638928-2-lukas.junger@greensocs.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 plugins/qemu-plugins.symbols | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
index 67b309ea2a..4834756ba3 100644
--- a/plugins/qemu-plugins.symbols
+++ b/plugins/qemu-plugins.symbols
@@ -1,11 +1,14 @@
 {
   qemu_plugin_bool_parse;
   qemu_plugin_get_hwaddr;
+  qemu_plugin_hwaddr_device_name;
   qemu_plugin_hwaddr_is_io;
+  qemu_plugin_hwaddr_phys_addr;
   qemu_plugin_insn_data;
   qemu_plugin_insn_disas;
   qemu_plugin_insn_haddr;
   qemu_plugin_insn_size;
+  qemu_plugin_insn_symbol;
   qemu_plugin_insn_vaddr;
   qemu_plugin_mem_is_big_endian;
   qemu_plugin_mem_is_sign_extended;
-- 
2.30.2


