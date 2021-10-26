Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8720143B018
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:34:16 +0200 (CEST)
Received: from localhost ([::1]:56552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJmZ-00027h-Kx
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:34:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJi1-000245-Kv
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:29:33 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJhz-0004gG-QK
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:29:33 -0400
Received: by mail-wr1-x42e.google.com with SMTP id d3so14149625wrh.8
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IWjl9w4dID69sKeC7KjvTFMgg0FURy0JhRq2ek25mvM=;
 b=Iuj37JoqoPeHkFb+bSOa/3uF8dQdtrCn5V4MFgXZc5xIlJtc4Tn8wGD7n65IYvNecX
 3ty3W2j3KnUgTVSWeZlNArmV8Lwblqy6YTxYmnXb8fschAE3ZIOZqoVfefmBBioEcapZ
 dmP6I5UC2MEC76fbj+RPAUArwFd0guBEMp1RABhJYR/WhKSE6mALliJcWdKS3/qmoBYy
 JwUzt2ZWUDcJ6pkwqpT0i6VxKPWFdVwRRQSFOprdZRRbYXhESWsDsGaoItq7LNJQy9rQ
 TduFzQWup2EoA86NxICPnG4WNwNFto+Zx0k+lJ+7sDLOwKcsTKdJd4RbYc/n7BxV2hTZ
 kLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IWjl9w4dID69sKeC7KjvTFMgg0FURy0JhRq2ek25mvM=;
 b=QqJqxAm9sb1cahTiH+U1NKvFk0Nhl0WhkDsTofKvxP7PSCA4hyxFaCCBtWRoKzc4+9
 o9ul4PbApESE/lA4IOwImTbKyfEzSrv/oGqYIpbeBJ3ceS0AvOKUSG9ac/phZKS+VBDN
 XNr3gyMK5YX2L46Ffy+Wzkbckldm9NwPBvEkdF+Fwx1+M+UjtP4168HCQdkdXlA7EY3F
 ggcGPgnzFXGKGBYk/gY21eSm/PtDAgqTBblYv8d4hts/wkINfVwioYOqnVJKlO4CFKu2
 nwgPdT81OqA2c7/LxjhALUE1FknNizDpvpUvGLXMdyrq8cUzNQVFYoRMHPz5koE+Bb+s
 jVpQ==
X-Gm-Message-State: AOAM533NibYaPShEQ78vdA3a6fumT05URcXZDhew3SmlvNQZ9Uv+FTI9
 7l8hrHMs2TOahBE02H/njmTPWA==
X-Google-Smtp-Source: ABdhPJykZIHPvBhz8yXXGCRTMc4MYC5jwojoMTqYj10rtaNSy2Uql1fXV7PyC6XPxaUKK51pjOhhoA==
X-Received: by 2002:adf:f9c6:: with SMTP id w6mr30877350wrr.415.1635244169553; 
 Tue, 26 Oct 2021 03:29:29 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e9sm18858787wrn.2.2021.10.26.03.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:29:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DE9781FFAB;
 Tue, 26 Oct 2021 11:22:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 13/28] plugins/cache: freed heap-allocated mutexes
Date: Tue, 26 Oct 2021 11:22:19 +0100
Message-Id: <20211026102234.3961636-14-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026102234.3961636-1-alex.bennee@linaro.org>
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210810134844.166490-2-ma.mandourr@gmail.com>
---
 contrib/plugins/cache.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/contrib/plugins/cache.c b/contrib/plugins/cache.c
index a1e03ca882..a255e26e25 100644
--- a/contrib/plugins/cache.c
+++ b/contrib/plugins/cache.c
@@ -614,6 +614,9 @@ static void plugin_exit(qemu_plugin_id_t id, void *p)
     caches_free(dcaches);
     caches_free(icaches);
 
+    g_free(dcache_locks);
+    g_free(icache_locks);
+
     g_hash_table_destroy(miss_ht);
 }
 
-- 
2.30.2


