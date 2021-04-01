Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDD63514C7
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 14:27:07 +0200 (CEST)
Received: from localhost ([::1]:60516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRwPi-00080K-VW
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 08:27:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lRwCR-0000g1-V6
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:13:23 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:43791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1lRwCQ-0004X0-BE
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 08:13:23 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 x21-20020a17090a5315b029012c4a622e4aso921767pjh.2
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 05:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=weqa3lPAgEacE8uK3uE+OTNHEhHG1VPxu0/697D38p8=;
 b=IM2AbVlAHGcniWNrJX3wPQ548M8EC5CqAcf8COZGr0gqqXZVC87AKbeR+h0kd8qcYx
 iOB00TTcpBEznt9mCRjiCTs9w77DQhbBMvgcNqL2LTMs70MojtuYefbj0lR8uO4sIaC7
 FJjxhjoDg5pXpHco+f9Uxup5tbqo4UBiCT+hQViBP7c7kZTLzCv2qGYS28FxwtGHlp9Z
 BVX8bgw+f54AYoDipo6lzro5YHdxVfNewIGysjoQQgJ9I0nzgAP5gCXS2NK/WTo8Lmy5
 BlBuUXAg0CJqUI+eA8lsZgPQEr1hQJ7JGGPkCXfGxd1qYFWOQ07jj+3IX3OfwGeVyLXT
 A7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=weqa3lPAgEacE8uK3uE+OTNHEhHG1VPxu0/697D38p8=;
 b=jxT1MbmWW+YTgHMPfCKsalLbLHjhZx1/8DUtbbCIv/5Cc2R9m550tkoLUeO9wxL9rP
 RXZ8saHwZa7Y7e8JeD1cWvXbgj5qz4zfH3fu5ToIewwdYO3YzXDk0FP01NllHgAwyp1d
 iTaYKjXjD7Mf5VPkdide32Eo1avZnwsb3BmclpVkuquLVB12ux44BSuugGDslnYWhzDc
 64+/HXE3ZelhuZqmzocWcKzZt/m/XVhwJJKWN9jHAxkoRc3YEdUTwI24mj40wok1ZsAD
 nB/p5oSXrzbHxyLb29YF6GfUKPl6Uelc4jR9aZfl32qgD2z/zrGSUJjbihdXdLchiO2K
 OO4g==
X-Gm-Message-State: AOAM530WqQqju6GnNG6wTYqOCojiUotkmeXrUbwWk9YtDMgZIF/EUDTs
 hsItH04NaBZQbfxE12VPWsoqYbHRZZLdkA==
X-Google-Smtp-Source: ABdhPJw160tp3wTLcCmShmfV8iy9UQhuACh0HIbq1SGktDuefijmXJO5BoHLSdDVgB4QYE/oFUmGxA==
X-Received: by 2002:a17:90a:1502:: with SMTP id
 l2mr8397999pja.149.1617279201179; 
 Thu, 01 Apr 2021 05:13:21 -0700 (PDT)
Received: from localhost ([136.185.154.93])
 by smtp.gmail.com with ESMTPSA id t205sm5260304pgb.37.2021.04.01.05.13.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 01 Apr 2021 05:13:20 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH V2 6/6] MAINTAINERS: Add entry for virtio-i2c
Date: Thu,  1 Apr 2021 17:42:35 +0530
Message-Id: <f099da1eed0d8de3b72a4f8d21ad7e6cba6ac86d.1617278395.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1617278395.git.viresh.kumar@linaro.org>
References: <cover.1617278395.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Jie Deng <jie.deng@intel.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Bill Mills <bill.mills@linaro.org>,
 Arnd Bergmann <arnd.bergmann@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds entry for virtio-i2c related files in MAINTAINERS.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9147e9a429a0..34e1b26c985a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2136,6 +2136,15 @@ F: docs/interop/vhost-user-gpu.rst
 F: contrib/vhost-user-gpu
 F: hw/display/vhost-user-*
 
+vhost-user-i2c
+M: Viresh Kumar <viresh.kumar@linaro.org>
+S: Supported
+F: docs/tools/vhost-user-i2c.rst
+F: hw/virtio/vhost-user-i2c.c
+F: hw/virtio/vhost-user-i2c-pci.c
+F: include/hw/virtio/vhost-user-i2c.h
+F: tools/vhost-user-i2c/*
+
 Cirrus VGA
 M: Gerd Hoffmann <kraxel@redhat.com>
 S: Odd Fixes
-- 
2.25.0.rc1.19.g042ed3e048af


