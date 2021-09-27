Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EED5E41A2D0
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 00:18:03 +0200 (CEST)
Received: from localhost ([::1]:49544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUywk-00045S-UJ
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 18:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1mUyt5-00016w-0u
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 18:14:15 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:42896)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mathieu.poirier@linaro.org>)
 id 1mUyt3-00060q-9T
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 18:14:14 -0400
Received: by mail-pf1-x430.google.com with SMTP id q23so17141351pfs.9
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 15:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KtS1hmH2XT8liprRsgtkHnkZYg8FqiZUr8kHkqHwVa4=;
 b=bPu2JdAKwnEoX96XuF+rVS0NoinCGh0+AmP21DGaLZmzABNYqZ3IeJ91Uz8N6GDuKx
 qwq8ccMj+x0xMMMJZI/TC8vwzyAZfqjqdfBL43K0oYxnw2p38n2SDn3F+Vlt85phruTf
 JjVPuhcQ5doK1z+arNb3TewWw4pfNQ9OrDHQgSfn/CQf7hfRHF3bkBFktyPOWrQj8KIw
 BTzhJAN8CjW/AThNHG8OXXzGc3JyfNxQ5CmHt3cK5wPgMkYALI8QXDRIpz1tVtsGPFFc
 pPbGTe3/WMPpRVArD+gQF0pklZgAr8WTHhqV4ANg+QCjT3Dc2eH0d5RxD7dC47aSoN1+
 MqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KtS1hmH2XT8liprRsgtkHnkZYg8FqiZUr8kHkqHwVa4=;
 b=pBfCroHuUfw2wKBMwD2owSS6Wlr/7ctL6UjvkUKfeWG+yzUlINBgtXTiANxgbZqL3y
 FosAxeweYLSagx3l6sRKFqUZk5AQY9l9U+2WcEEtVrJLoH5olVuEZzOGOSiGufzrLeO6
 OuharXFTfWdKctx1Dq9vq/GSO9vr08laAAu1LgaQmKdcoLTKnkIf66Uau4Pib41U/QLe
 3By4UpnQv2MdNp+hk3M3cbT+/nkjvjE4hMAatX1OeZBdSXheZIoO2sM3hFCMOA8UMDi8
 Pmcw+wWwwCmaLA2We31Ql+jUYCayDzK38t1jpMcFN9Xom33a38M4/2GdP2gEvz4U3iRh
 Q/JQ==
X-Gm-Message-State: AOAM530czA3cNmjRYFlGxfXCUnx11STC/pHf1183hPqJWPKp1KP+pO6q
 bjY/FIM6DstMvyYKMuRbU0m9QNa0pUGnAw==
X-Google-Smtp-Source: ABdhPJyERro6Y5a7gIXGUkGEcBTorIsrENTZEMNoc4K9bhqLEmjf/pZgQ21XLhr49+kcW4hwC2jT1g==
X-Received: by 2002:aa7:954e:0:b0:438:a1c2:340d with SMTP id
 w14-20020aa7954e000000b00438a1c2340dmr2230188pfq.30.1632780851964; 
 Mon, 27 Sep 2021 15:14:11 -0700 (PDT)
Received: from p14s.cg.shawcable.net (S0106889e681aac74.cg.shawcable.net.
 [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id g27sm18817742pfk.173.2021.09.27.15.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 15:14:10 -0700 (PDT)
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: mst@redhat.com
Subject: [PATCH v4 3/3] docs: Add documentation for vhost based RNG
 implementation
Date: Mon, 27 Sep 2021 16:13:59 -0600
Message-Id: <20210927221359.2917482-4-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210927221359.2917482-1-mathieu.poirier@linaro.org>
References: <20210927221359.2917482-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=mathieu.poirier@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add description and example for the vhost-user based RNG implementation.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 docs/system/devices/vhost-user-rng.rst | 39 ++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 docs/system/devices/vhost-user-rng.rst

diff --git a/docs/system/devices/vhost-user-rng.rst b/docs/system/devices/vhost-user-rng.rst
new file mode 100644
index 000000000000..a145d4105c1a
--- /dev/null
+++ b/docs/system/devices/vhost-user-rng.rst
@@ -0,0 +1,39 @@
+QEMU vhost-user-rng - RNG emulation
+===================================
+
+Background
+----------
+
+What follows builds on the material presented in vhost-user.rst - it should
+be reviewed before moving forward with the content in this file.
+
+Description
+-----------
+
+The vhost-user-rng device implementation was designed to work with a random
+number generator daemon such as the one found in the vhost-device crate of
+the rust-vmm project available on github [1].
+
+[1]. https://github.com/rust-vmm/vhost-device
+
+Examples
+--------
+
+The daemon should be started first:
+
+::
+
+  host# vhost-device-rng --socket-path=rng.sock -c 1 -m 512 -p 1000
+
+The QEMU invocation needs to create a chardev socket the device can
+use to communicate as well as share the guests memory over a memfd.
+
+::
+
+  host# qemu-system								\
+      -chardev socket,path=$(PATH)/rng.sock,id=rng0				\
+      -device vhost-user-rng-pci,chardev=rng0					\
+      -m 4096 									\
+      -object memory-backend-file,id=mem,size=4G,mem-path=/dev/shm,share=on	\
+      -numa node,memdev=mem							\
+      ...
-- 
2.25.1


