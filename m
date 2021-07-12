Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F693C5C88
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 14:43:11 +0200 (CEST)
Received: from localhost ([::1]:59096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2vHC-00063t-Mf
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 08:43:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v1z-0004VA-Mu
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:27:31 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:50862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m2v1w-0008Ia-Dz
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 08:27:27 -0400
Received: by mail-wm1-x335.google.com with SMTP id l6so2996294wmq.0
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 05:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WoVJbMpdTXEKpoS9CcsUeUTDWRvb4b0qm9ZvuinWlrU=;
 b=qLJ6uCig4bym35vyKp/twqzW3HESa/Ri591f3yFejsD654FNqeOU0UqLxn1Xd1zHIB
 bBRvyoD8w9Vem+jRpN5ihKH+re/zrLYRsF/5AFGbpAUWWhF2CYDSkqifbK6/b/BnYy5+
 s3wNz/w/udcfYsvZK0ukrthh397dGNwVd5RHhyDBBaGkX9jDDsc/ney6BtSsKrieddib
 k9Ws25SlIcD/8q0RrcvkjocHCtxXSU9unEZMKYrSryHB2TgGBKQjZWe0qbRgsstTnvkv
 tthev7jvASY6j/pzhnSvBQkjYzSikLCFoVjkiIB7FLWk7IsSYcUyO3q/QWwjY/Rwqdek
 zVzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WoVJbMpdTXEKpoS9CcsUeUTDWRvb4b0qm9ZvuinWlrU=;
 b=am5F7hKQMbjAxUxC/rg0c4FouKglUWWtD2I0ZQOS3yKQB5BMqwfMF7HDhZ8c1k7VBO
 cxKmGh4Zl0Y49jCMFMsNuSjQYhUqJntT8dk28kis7vn+PRApomLYTWINc1EdUEZurJE1
 KbgjyBfAAcccTEY0VUIVRUH6ECuU70E5sICFoYkMrj/QCQgYbck47t5rsj7YJDXsNbuS
 jz8xlEMY2ydi1YOGqnzWoI/S3Z1bdn16c6tgq9zQnuEcBE5dzHVfCAQJQZ4WzGket2sI
 jdv4cID0vM8aeM7irOVF+y5fRoz3Wih8JeOq4vuJhw+5765kSOLzzYasUA5suehr21xd
 6fCg==
X-Gm-Message-State: AOAM5312ZIXtfmeo38sGTTcIimws1ZCYxQdTePtnNEXFw0h5f8kjb75Y
 lDIIvhumCo+62kK5TVxwmyZ03Q==
X-Google-Smtp-Source: ABdhPJxkfCuqixqPp4gtdY2Tr0XUeYny7e4Ce498bgH37OmdR1dIYJFyziNSlyfDdF3PEXIM5HOyPg==
X-Received: by 2002:a05:600c:4f53:: with SMTP id
 m19mr52936321wmq.176.1626092842376; 
 Mon, 12 Jul 2021 05:27:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a8sm10337396wrt.61.2021.07.12.05.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 05:27:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4FCA41FFBB;
 Mon, 12 Jul 2021 13:26:57 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 33/40] contrib/plugins: enable -Wall for building plugins
Date: Mon, 12 Jul 2021 13:26:46 +0100
Message-Id: <20210712122653.11354-34-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210712122653.11354-1-alex.bennee@linaro.org>
References: <20210712122653.11354-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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


