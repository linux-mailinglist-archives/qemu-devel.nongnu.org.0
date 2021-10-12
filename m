Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D956042A9E3
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 18:47:21 +0200 (CEST)
Received: from localhost ([::1]:49112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maKvw-0004ck-EX
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 12:47:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1maKbM-0005h9-AD
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:26:04 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1maKbJ-0007do-Rj
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 12:26:04 -0400
Received: by mail-wr1-x42f.google.com with SMTP id r10so68657049wra.12
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 09:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xg4Oky05y1+VSmoVzrKShYUh/WjP+0Z/IvaHAjn2j2I=;
 b=P6saEEJcHe7Yvw2zhaW0d1Dts/MEUZz3nyYiu2JlN8ui5ydLEEqMq7UVnND0U5UEtT
 LdC3zo8VYn2durKnIxXXdTkk1IOzFUmAigry8t2ocNu5PSGqqFkAf1nqHuFiV5blHwRR
 XMLUw9ZlwHgj4DvBTKsJoOPiWi/3GPbze+2JNFlkj4VPdUOPtGngCIdBgRbJhCcqOwcP
 hosJ689a7TUv+Cyx8mVV9fqsBKdMhZcY/M7Yw7aE/OW4+AGcRGp0yA05iYHg5AOvBZ76
 vRHgF6hs8knyiUvO+K/GGl8817fypTHlQvv3lsVm2ZsLT/mIY1KQ41sqzxR+bdSzcR/L
 VSWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Xg4Oky05y1+VSmoVzrKShYUh/WjP+0Z/IvaHAjn2j2I=;
 b=DrMFRKbIcOV1gbvDrwsmb1bgs2R3Uf/qvzUQvqXkoRR+1bkkwKIZBVLkJvwbMtwC6O
 Irzfnfnjkr6U5FIgry26/W8sjCb5SjqlwqHWrak6WX/6LqY+6laHOWlKvJD71CEQ+IzE
 PJmKxEVGuX4QPK5DgVRxDb9iKZAbS4WYONHy9qdPojZUpJxKClFGeWJIYAZ7xLFmdkCb
 QHCkWM97+Et62ew/2PU015QAvqW+mr+BOUuRI7blGKg350fnd80zWeUa/Q7+navy6CEZ
 l4mz9zvc5UC6hoPQljy/wXxEC+QsQ0Ovx4RBCSN5KQE45VNc1OG+eM/hQVQEmSEFNcRe
 rEcQ==
X-Gm-Message-State: AOAM531UIE5/92Yw0Hmdm7zzUhDRcon038sq7mMNYMidBS1DDJrV1NgH
 vFV5InAmK1Gk7eNSsdxpx16P6w==
X-Google-Smtp-Source: ABdhPJzT74fJnX8Bg52bU5uFjbbfaV1ypOrkA/cUfNdfpuYtbjfdcRZ5ihysJWQGqoB9eqBFL9GRtw==
X-Received: by 2002:a05:600c:3546:: with SMTP id
 i6mr6861648wmq.146.1634055959851; 
 Tue, 12 Oct 2021 09:25:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id p11sm3295708wmi.0.2021.10.12.09.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 09:25:58 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 27D701FF96;
 Tue, 12 Oct 2021 17:25:58 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] meson.build: don't include libbpf in the common source set
Date: Tue, 12 Oct 2021 17:25:52 +0100
Message-Id: <20211012162552.16865-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This library is only needed for the softmmu targets and as such
break static *-user builds where libbpf is detected and it tries to
link it into the user binaries. In fact ebpf/meson.build already
brings libbpf into the softmmu build so we can delete the common_ss
line altogether.

Fixes: 46627f41b6 ("ebpf: Added eBPF RSS loader.")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211005182443.2954499-1-alex.bennee@linaro.org>

--
v2
  - delete common_ss altogether instead of replacing with softmmu_ss
---
 meson.build | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meson.build b/meson.build
index 99a0a3e689..42b7ba360d 100644
--- a/meson.build
+++ b/meson.build
@@ -2301,8 +2301,6 @@ subdir('bsd-user')
 subdir('linux-user')
 subdir('ebpf')
 
-common_ss.add(libbpf)
-
 bsd_user_ss.add(files('gdbstub.c'))
 specific_ss.add_all(when: 'CONFIG_BSD_USER', if_true: bsd_user_ss)
 
-- 
2.30.2


