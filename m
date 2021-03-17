Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6F933EA72
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 08:23:47 +0100 (CET)
Received: from localhost ([::1]:57458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMQWw-0005Hs-PP
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 03:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMQVh-0003Zp-Fe
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:22:29 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:43757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lMQVf-0007uo-Um
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 03:22:29 -0400
Received: by mail-ed1-x531.google.com with SMTP id e7so964264edu.10
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 00:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rOvOpng9pl80hnu05BmVHMESelx8rLsVtqsYPb3j22s=;
 b=FQqUNzxOE6I0/9DHE8+Zuwg2PSFKku2HQYvQOWd5xwH/J+XaXGb5KeXH+qupO9uLWQ
 goP2WbFjlW3ydSBitXslhQT1wkuqicERkvQ2fs5CI64l2Ip/hVyzuKzsmSxQlbHng7PI
 oUMM/UGTW4JZJXhgrRQagA8Yc93Enr/pl74SXroseFQr6nRfVkly5mNVNwLS70Sosuyx
 y0YlRgggVYAEk0Plil0z35EU4XMrM18s2CZcBe9VPBje7MG5/BkVCD8WhbFjRugVo9Vo
 jgs7Q3F0rn94yH72Uj6ZoUQLcWzOKYqmquML184ctFUW5f4NfjgKyuTS6GF/pE5Qokez
 oSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rOvOpng9pl80hnu05BmVHMESelx8rLsVtqsYPb3j22s=;
 b=GzIL/ANjCrQfa69hWO7ATVREehiYv7KqnRhpdS9s+xssYWvj2qIaoyIrZxEMhxacRU
 MXW4c36/aIKmnwGHHFtY6Fy0gr+IUStQ1F895NpTUPxcZPJQWyd3DevtFaO99f3xYuZq
 VWwyFJRGnfvcjGXIPyseYzeJKdsYIV+72fgCTFFmAQbEhP200kGYUQIvLfphUFvhAAKJ
 20/7SFXA++s+AISlug0Dq7i4TEErYJfn0RtE02gNaFcXy6IqZmvptDPA2wptzEXVeaSp
 S5yUcSzh/J3Wom3QPigCKmXrnfSJziAVoww1dvbT3V30uU8Pb6IG3tZUv+0InprYUNFn
 JwDg==
X-Gm-Message-State: AOAM532AkjB5AqBmU31JLUtM+/dqdTlq+ommNDyaub/gkE6O/8WJhygY
 imGaUEfGcm/7fmEhZwcZ4h9pOJW7ua+bIrH5
X-Google-Smtp-Source: ABdhPJxDwOlJmd8XJ5GrfhRGEjSsqrUsbwp1ApEZ10u93Ezfl9oM05X5D49chAfSDnqOQ5SiCGaWBQ==
X-Received: by 2002:a05:6402:447:: with SMTP id
 p7mr40402399edw.89.1615965746649; 
 Wed, 17 Mar 2021 00:22:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id br13sm10728949ejb.87.2021.03.17.00.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 00:22:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2761B1FF91;
 Wed, 17 Mar 2021 07:22:17 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL v2 05/15] plugins: cleanup kernel-doc for qemu_plugin_install
Date: Wed, 17 Mar 2021 07:22:06 +0000
Message-Id: <20210317072216.16316-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210317072216.16316-1-alex.bennee@linaro.org>
References: <20210317072216.16316-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x531.google.com
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

kernel-doc doesn't like multiple Note sections. Also add an explicit
Return.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210312172821.31647-6-alex.bennee@linaro.org>

diff --git a/include/qemu/qemu-plugin.h b/include/qemu/qemu-plugin.h
index 4b84c6c293..ac1bb318da 100644
--- a/include/qemu/qemu-plugin.h
+++ b/include/qemu/qemu-plugin.h
@@ -85,15 +85,15 @@ typedef struct qemu_info_t {
  * @argc: number of arguments
  * @argv: array of arguments (@argc elements)
  *
- * All plugins must export this symbol.
- *
- * Note: Calling qemu_plugin_uninstall() from this function is a bug. To raise
- * an error during install, return !0.
+ * All plugins must export this symbol which is called when the plugin
+ * is first loaded. Calling qemu_plugin_uninstall() from this function
+ * is a bug.
  *
  * Note: @info is only live during the call. Copy any information we
- * want to keep.
+ * want to keep. @argv remains valid throughout the lifetime of the
+ * loaded plugin.
  *
- * Note: @argv remains valid throughout the lifetime of the loaded plugin.
+ * Return: 0 on successful loading, !0 for an error.
  */
 QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
                                            const qemu_info_t *info,
-- 
2.20.1


