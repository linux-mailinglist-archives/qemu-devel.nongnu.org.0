Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0026508F92
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 20:37:28 +0200 (CEST)
Received: from localhost ([::1]:54018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhFCh-0000gI-Ns
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 14:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEl0-00025X-M8
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:08:51 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:45695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nhEky-0001Zu-Vl
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 14:08:50 -0400
Received: by mail-ed1-x534.google.com with SMTP id v15so3324228edb.12
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mhm8hNOSmeNAC6AOr4tb9voA4zkUjSftfCb/z/0LuF0=;
 b=Iu2bpYx7luCV1UA87q2dg0ZUeGJQPVyj7xnwKwHe2oioYaFdMnaKP/TP0ZMf8XuqvH
 9kqet0jpprKcXdNKZhzs2dp4+cNrDQOI5hfkMuTxAgfBGIrGlvMXSBgvcSBJpGK8CNpS
 Uxm63MtZWZ6koyv7HSDIr0PsxJ5VhiZJhexZuxWRi/oYUXTdcOpnFORS+5GPsZggC8u6
 si6HNVMB7YLCVOkI4v8KJk56v9c3g3/OxizmBH28Uv8aAUYrZjFhw5E7zA4i/LtnoTZT
 D1K6K5jFisi2aLWEwPy+D89JuyBxz/oVSXBs09GUFy0Ow6ygD6USGqEhIoAfljvthoAN
 vxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mhm8hNOSmeNAC6AOr4tb9voA4zkUjSftfCb/z/0LuF0=;
 b=5kIWMQt7zvAB8xsi5EfiW8GINc20J5RHXMDTiU5I2dM6BzWm/U2afrp4rWtQiKIJHt
 y3towiXZulACjKKe61ZWFKtYASgHtBAWTC39IDAI79syMl2FSUqliUD1GLIbO4cz9uXw
 nvDp+KH70SMb8u2zIbZaiXIHR/nDFfKQEYJPH2Ee49J5FXyt6ZTls5V2BHyIvfuOKcTA
 xHz/j5OJnXvQIVJuaLm6vK0MCPUVHOQdVycSoWsFxSRPTZsGi/Vfv2wFJXe94L3leGT/
 Avoh/eJelzbXaw4veOsLaxrp2ZW6Dx6AP+v962xYGvQAbqRcMnJzLJZnIJpShlNwj5AV
 epJA==
X-Gm-Message-State: AOAM532TjF/+ogVsFzsRD/LxgqxJoI9+U3x5CB2kQxavzdDkjtcnlxtZ
 nHwW/LbIInqKSCqd1uJhyvaL6g==
X-Google-Smtp-Source: ABdhPJxQg0VManokPiXcMMZF9GDnUhuOBeduB9AQ3xTDblPlU7Oe53p+d7QsbbgtfzjSNByGbVlUEg==
X-Received: by 2002:aa7:d553:0:b0:416:4dfc:126d with SMTP id
 u19-20020aa7d553000000b004164dfc126dmr24384418edr.213.1650478127688; 
 Wed, 20 Apr 2022 11:08:47 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 q8-20020a056402040800b004227b347ee3sm8456012edv.56.2022.04.20.11.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 11:08:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0C6431FFC1;
 Wed, 20 Apr 2022 19:08:33 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Subject: [PULL 09/25] tests/docker: remove unnecessary filtering of
 $(DOCKER_IMAGES)
Date: Wed, 20 Apr 2022 19:08:16 +0100
Message-Id: <20220420180832.3812543-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220420180832.3812543-1-alex.bennee@linaro.org>
References: <20220420180832.3812543-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

Now that DOCKER_IMAGES is only defined after DOCKER_VIRTUAL_IMAGES is
complete, there is no need to re-filter DOCKER_IMAGES against it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20220401141326.1244422-7-pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220419091020.3008144-10-alex.bennee@linaro.org>

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 9b4d1cf837..3b5ebd5567 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -201,7 +201,7 @@ __TESTS := $(notdir $(shell find $(SRC_PATH)/tests/docker/ -name 'test-*' -type
 DOCKER_TESTS := $(if $(TESTS), $(filter $(TESTS), $(__TESTS)), $(__TESTS))
 
 # Expand all the pre-requistes for each docker image and test combination
-$(foreach i,$(filter-out $(DOCKER_PARTIAL_IMAGES) $(DOCKER_VIRTUAL_IMAGES),$(DOCKER_IMAGES)), \
+$(foreach i,$(filter-out $(DOCKER_PARTIAL_IMAGES),$(DOCKER_IMAGES)), \
 	$(foreach t,$(DOCKER_TESTS), \
 		$(eval .PHONY: docker-$t@$i) \
 		$(eval docker-$t@$i: docker-image-$i docker-run-$t@$i) \
-- 
2.30.2


