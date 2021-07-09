Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5313C1EBA
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:02:18 +0200 (CEST)
Received: from localhost ([::1]:57176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ieX-0000zD-4v
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1m1icu-0007lV-7O
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 01:00:36 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:46665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1m1ics-0001sx-Hi
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 01:00:35 -0400
Received: by mail-pg1-x52e.google.com with SMTP id w15so8737891pgk.13
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 22:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wcw1UFkZsY7Ce0CwmOfy1sRz7X0d/zWB8c6zN8lHge8=;
 b=Xv0edohQyxgKtXUWIfriMALfyx7xBrRjr/JhW9wLfhptZ/vw35afxT8IIVBB/HOuAB
 1FG9f1SnKZYxJdjapBMzl3rTmRwP+Wu5JDgt9Peaz/aA0wvGHunEtF/C51fqYjWwMYkd
 n65EQmwpX9QyhAO9awUuYgZiLFoEAjwqo40NcIowk42DH4UEyoY5uiM6U+3Uhu8VGDFx
 9RK724bh6ehpNnbA3Ca3LfZwbNonhHS8s5hB/CeKyV4zrNJIVy27qAqqWvS18Li32ZDx
 vF421Fr2p08rUH/PcjihqxvFynB1dKHHbmSN/yiZ+DUm9XwunG9bd/BSiNsa77adEbN5
 rhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wcw1UFkZsY7Ce0CwmOfy1sRz7X0d/zWB8c6zN8lHge8=;
 b=tuFKVzlhzxdTy2ppMHOSGt0MHGjLGMjlBInbEsKcVKhnN/3aAD4DZwbYLgLtS93QsP
 RAdSR//cxCY8U6vVeWJJgW1Uru2GgXMqnKX4L+tlr3hRWYCYoeF2g3OC/3g4Ju4anJXP
 IdaQF0TKsrd3mviv74L1jxsPg5prt3WXC/aB88wwU30jcsBJSVoxqxuqBwve8qqPF0nh
 bVCirFMPnaycAP+OWW+WeJ59tygduIzDg+YZE6U3Pd7LC6is0cmKqw8HqSlj3gNHENS+
 nM9ip9E9TGu37ONluU4RE/UIWLaOLQFxnXkEgFmfATFsBCBtvMMR0y67Rb0SqCLb1Igz
 +Ztw==
X-Gm-Message-State: AOAM530cZ0tOAiprYCISqKNW2aq/o1YAf8rnQy07FoGNg/OlVtjWPD/p
 jmZbQzR2dxhf402INarZMb9vYq17dqs9Nw==
X-Google-Smtp-Source: ABdhPJw1TF7VgUDccVTHxm8MHhNZS9n1a3o+VS6/fQDNuchAcclt+4vn0w2cCSFSRp7HpdEJsB1VpQ==
X-Received: by 2002:a62:7b8b:0:b029:31d:8034:7c37 with SMTP id
 w133-20020a627b8b0000b029031d80347c37mr27815890pfc.62.1625806833177; 
 Thu, 08 Jul 2021 22:00:33 -0700 (PDT)
Received: from localhost ([106.201.108.2])
 by smtp.gmail.com with ESMTPSA id u13sm4389132pfi.54.2021.07.08.22.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 22:00:32 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH V2 3/3] MAINTAINERS: Add entry for virtio-i2c
Date: Fri,  9 Jul 2021 10:30:18 +0530
Message-Id: <270484de4be7d0cddfecac4e8bf9b9abe756d9e8.1625806763.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1625806763.git.viresh.kumar@linaro.org>
References: <cover.1625806763.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pg1-x52e.google.com
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
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds entry for virtio-i2c related files in MAINTAINERS.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 684142e12eaa..2869fb185253 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2143,6 +2143,13 @@ F: docs/interop/vhost-user-gpu.rst
 F: contrib/vhost-user-gpu
 F: hw/display/vhost-user-*
 
+vhost-user-i2c
+M: Viresh Kumar <viresh.kumar@linaro.org>
+S: Supported
+F: hw/virtio/vhost-user-i2c.c
+F: hw/virtio/vhost-user-i2c-pci.c
+F: include/hw/virtio/vhost-user-i2c.h
+
 Cirrus VGA
 M: Gerd Hoffmann <kraxel@redhat.com>
 S: Odd Fixes
-- 
2.31.1.272.g89b43f80a514


