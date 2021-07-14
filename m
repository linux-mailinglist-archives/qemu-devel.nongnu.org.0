Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E563C87CD
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 17:36:03 +0200 (CEST)
Received: from localhost ([::1]:49838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3gva-0002Me-7n
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 11:36:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3geS-0004yH-Pz
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:18:20 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3geN-0002K7-NB
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 11:18:20 -0400
Received: by mail-wr1-x433.google.com with SMTP id a13so3648647wrf.10
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 08:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WoVJbMpdTXEKpoS9CcsUeUTDWRvb4b0qm9ZvuinWlrU=;
 b=Nr/KqIIETXj/XVOmlheUpmGvJxz0TgQP3T1Res71n6xPE5vi1PyT20pzgOCE9ZBpeB
 91BMIzdEsmEYAy5icOj/a2XgulXtISjjjptopwCXtAG9b5g9Oj4FeQvi9nHn0CNM55/q
 P4QbvU8NBc/u1JteXuCJDHEnsV4HyJO1VN4GclnDobD+8VqUXDVm8/1Ln+BAovlYkEkS
 YpR8EgOOxgJx4x9AwGc8f9CY0biHNoV89BIJdte40/3zYmSf/r0zFusGiaz4rOeRpMSo
 kqqPnQhavpAxDrswTCeLEP+llvPv0ek/8Xc9Dk7NvOJwlbhSaYeBRvDVmcelY0zD0wv4
 K5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WoVJbMpdTXEKpoS9CcsUeUTDWRvb4b0qm9ZvuinWlrU=;
 b=OVTm54Gjsi841kMe2uq7hL1OqTgNq2IxrlJ0jCZnee/5t5ypa7dEJugFW1kLvxiOwR
 OxLH05CX7hoKbCOin3OQavOVstZ54R4xFIiQZRKi5cpUztxeWRrwrEG7LgajbzcFUunt
 7+69iuuMX6fcIe4MD2DGOz+u+0iW9ef9Zkj14Rpqu1NgukrLX6WEK69E7Rm6Dgx8fhMS
 g9XrNHn+hMrgtNiPCOFARy782C16XjgnWu3kxsb6dedBCtpgjw8OAzRcgGaZooq3tscH
 uThRn9WIn9GiMyEuBB/pP1rUrNHG6b0H1zvcj2yUYX4YEcQL/Au7238j625McHG6gFu/
 sTWA==
X-Gm-Message-State: AOAM530ba9cOO5lDwsYdfnT1hmSDWb5CcIhYrg827kievkZVRcJRcTHM
 21N6FlWFlcs6FxBg/rPujIYUrw==
X-Google-Smtp-Source: ABdhPJxSnNTtuxw9ZZJR5YmB1NUeiILVQGsFWQxDdg4eVEE1rTSpcJqz9duJQu/uspEP0zTLzjxMEQ==
X-Received: by 2002:adf:eb82:: with SMTP id t2mr13570452wrn.337.1626275894352; 
 Wed, 14 Jul 2021 08:18:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o14sm3122138wrj.66.2021.07.14.08.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 08:18:07 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A896C1FFBF;
 Wed, 14 Jul 2021 16:00:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v5 37/44] contrib/plugins: enable -Wall for building plugins
Date: Wed, 14 Jul 2021 16:00:29 +0100
Message-Id: <20210714150036.21060-38-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210714150036.21060-1-alex.bennee@linaro.org>
References: <20210714150036.21060-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Lets spot the obvious errors.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210709143005.1554-34-alex.bennee@linaro.org>

diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index b9d7935e5e..3431bc1ce9 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -24,7 +24,7 @@ SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
 # The main QEMU uses Glib extensively so it's perfectly fine to use it
 # in plugins (which many example do).
 CFLAGS = $(GLIB_CFLAGS)
-CFLAGS += -fPIC
+CFLAGS += -fPIC -Wall $(filter -W%, $(QEMU_CFLAGS))
 CFLAGS += $(if $(findstring no-psabi,$(QEMU_CFLAGS)),-Wpsabi)
 CFLAGS += -I$(SRC_PATH)/include/qemu
 
-- 
2.20.1


