Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB3943B01C
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:35:50 +0200 (CEST)
Received: from localhost ([::1]:58562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJo5-0003SE-LC
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:35:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJbb-00010k-87
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:22:55 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJbZ-0007Rh-Nd
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:22:55 -0400
Received: by mail-wr1-x433.google.com with SMTP id p14so12283311wrd.10
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oZR6/Tiw8Q+UAG2d4njIYEaAK7iRYsQbROUxHKy6lVM=;
 b=l70xVdjtyc0rliTfYnKbZnf0ROUfznKJ3+EedS+02rsEyyfMEnCO54tv+2rVyOrD8y
 fK60+Qe9mDsyLq3gpDmqiBnkIz3fYAgP7lAPeraIqqBaPxEj8qP9fCaMG4i5h1o8r/Yj
 63xfoxcXRjsqU/I/GwTLEWpheY8Slikeoz96e2kSpDbJr+KCBU91vO1ohnpN2UvitIWh
 hP0+sXexcruB/W9bbo8ehHG/RM7MOOIGWXl+BJrfC5zU7S5IrWp/mVVEbMFh/hOaEH6N
 N3dJzNSDwZKOaRyWCEzJ2Xs5QKghBXg5P9Q6Py9tiU/Ge/zMTd1LZihK2/zeYPqTKtoI
 wCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oZR6/Tiw8Q+UAG2d4njIYEaAK7iRYsQbROUxHKy6lVM=;
 b=n8t83CLsGQzqYLKeVFgLIxBdvrjZgUOC1isFHPGHNP8aJYPBXXsa5jKcOWfuefCaNR
 ueIQ+wolq7p3MmRe4ej5Gf1Ffv0eo0be+a22Bon/TFf26ofW3O2SoBuJWFXl3i53/zkJ
 cFh0GGtfSzvlty/tKewtx5p0+lH9+vV1gObVVM19eignlhHfmPE+H6FbfWwMjN7PuDy9
 vASWKn0VhY26kkoVswdK5CGXspT/3QbMoogPLq6uui4RB89ohCDUGNtoWEKOSXsjro7F
 FUMGBmJI4cqP5bwJ+e3F6lsmVa5DOh4pk439I97xriQ5JcVEhj+6ixa8rkDtqQjYsAPg
 M84Q==
X-Gm-Message-State: AOAM531ofRXsuSCrr/jL6d0AU/0NSL9/AQo3anjU6ZwOctmDcDWL2Md2
 5HUmgAAYK10wPgqn7cFNGs2n5A==
X-Google-Smtp-Source: ABdhPJzyLafbXL4heJOu2LuaLotWGlKV8tXPtGQA6sVmAXENvYzfsOcKj0hQb3ksBqSwYXx6KxSkQA==
X-Received: by 2002:a05:6000:1107:: with SMTP id
 z7mr16770053wrw.370.1635243772231; 
 Tue, 26 Oct 2021 03:22:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l2sm212833wmc.3.2021.10.26.03.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:22:48 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D2FB71FFAA;
 Tue, 26 Oct 2021 11:22:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v1 12/28] ebpf: really include it only in system emulators
Date: Tue, 26 Oct 2021 11:22:18 +0100
Message-Id: <20211026102234.3961636-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026102234.3961636-1-alex.bennee@linaro.org>
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
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
Cc: fam@euphon.net, minyihh@uci.edu, berrange@redhat.com,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Paolo Bonzini <pbonzini@redhat.com>

eBPF libraries are being included in user emulators, which is useless and
also breaks --static compilation if a shared library for libbpf is
present in the system.

Reported-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211012162252.263933-1-pbonzini@redhat.com>
---
 meson.build | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meson.build b/meson.build
index 2c5b53cbe2..bc520b579c 100644
--- a/meson.build
+++ b/meson.build
@@ -2610,8 +2610,6 @@ subdir('bsd-user')
 subdir('linux-user')
 subdir('ebpf')
 
-common_ss.add(libbpf)
-
 specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
 
 linux_user_ss.add(files('thunk.c'))
-- 
2.30.2


