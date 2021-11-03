Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EA44446F0
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 18:20:45 +0100 (CET)
Received: from localhost ([::1]:33840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miJwK-00060W-Fo
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 13:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJiO-0003xv-RV
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:06:20 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:40471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1miJiL-0003nA-So
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 13:06:20 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 j128-20020a1c2386000000b003301a98dd62so5152314wmj.5
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 10:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VsOqJgkZe7opATttK+pb9o0h59FfEOaRn+sckMRUzQ8=;
 b=pYzaaqWTP4FJJKTLCUF0setiPezIBfA8lHmre57bj9uNQ0BFJxrcDm1RTMeqchL7qm
 Jo7Oz50S8rZh5tGhdYOX1H9bmFV5W2lIKDgJm+eRJwmu/UNppwdm0fI5AXrhX+FRFx3L
 CRvm9ilcaHDoy10p4Mg83Xn1hP62awyOBnBujzLQ6VOx3pomESCKVTa/m+XNOE3DAtyg
 j/GsuHOa/X/x9C4EYDk3e4pkkxMqQDX3nov1S2I2LdmWfvyt0Rm4buZfvI2IA/O8x/kz
 3NdpVqTsont/3OYZKjzWF35baXy3Njr2z1ROu7YikDqOGUCi1OaoU7/Qu7RdKJyfsMG7
 OehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VsOqJgkZe7opATttK+pb9o0h59FfEOaRn+sckMRUzQ8=;
 b=XQyHJypnKQHCjDswOIXC0nhkgSpv32F6HR0HPVTcmja0XsaUm03IuNlbCgMIoH6NNU
 Kp3sqvkXfhvsJFQxmN0+x6Ja65gTEcMyeLWO8MDEsJCN7F7qwSf+tXDsLScuIVezY+1b
 akZ1JVLEX+Ew6ELyIqWnS2pKs0d2hyi5VzT5FRAaL22yx8qH6LUkQn362XFEBfmrpqqd
 /dDGmZTs7gG/9D2TNvwbCoIR0egTYoUnzo8rBwbmK4Nl8hsG5Tnj8tV9u/kZvIgzfA8B
 IoiHSwsLHwNIHl4gXWuhmV0LEoup9iFboZVUoKM74ifz1tzsU18+LR2HYsU3UOV6LcK1
 9oVQ==
X-Gm-Message-State: AOAM533c4cT0OGG9yDpqwe3P5PIkVJA+IfWPoSLdeJZhOh6bI3SMpVf5
 fOKVIqBHj9DFwpiUfUmjrJIGDw==
X-Google-Smtp-Source: ABdhPJxUD8DuxQz6S4q/AoFEwmJFFCTJi0vyvuUH1RuxBQOzNcp0k0THUFXZ3Amps3YxoTQLtH+Auw==
X-Received: by 2002:a05:600c:2195:: with SMTP id
 e21mr16914411wme.187.1635959176475; 
 Wed, 03 Nov 2021 10:06:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d24sm2333154wmb.35.2021.11.03.10.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 10:06:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 557211FFA6;
 Wed,  3 Nov 2021 17:05:59 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 10/21] plugins/cache: freed heap-allocated mutexes
Date: Wed,  3 Nov 2021 17:05:47 +0000
Message-Id: <20211103170558.717981-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211103170558.717981-1-alex.bennee@linaro.org>
References: <20211103170558.717981-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: richard.henderson@linaro.org, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210810134844.166490-2-ma.mandourr@gmail.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211026102234.3961636-14-alex.bennee@linaro.org>

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


