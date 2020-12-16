Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7582DC4A6
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 17:53:14 +0100 (CET)
Received: from localhost ([::1]:39916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpa37-0004la-TU
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 11:53:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpZyf-0007t4-51
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:48:37 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:40064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kpZyc-0002O2-BD
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 11:48:36 -0500
Received: by mail-wm1-x32a.google.com with SMTP id a3so3086659wmb.5
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 08:48:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xvd5cwUEsReYgSHxH/1uQMQYxXOkYhe+6MJd4PByyeM=;
 b=Xa7p3vhJy5ecJPcHZofB+SH1OSGhZ793TPx+oKntzIJXk5PZtEOifU++gkej/b5Xp3
 e0inNg8hBIYkhGXDB4pTpWPYk34HNLIgGCbk3dtQReFqC1cbj9a9Sf6XJ/Ea9Llk9dBl
 nPfFDYhU8uYObl/qTR+K9CiqC+5xSz+e1CuorhuOKY5Jln4MgTsBlFAifL4tIY2PqHA9
 yau/kTezDzD01Ir76M+1zmZwM2ODgxGomG3Q/yP5hej8eqnlt++hdKSAZjpnFsoESHfo
 aJb+wpT3jXboaBfpjBn9W8+NYo57bXolGnrwrAQZhPXfInKYhMKuXttPqSH4/8JBqfEO
 SzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xvd5cwUEsReYgSHxH/1uQMQYxXOkYhe+6MJd4PByyeM=;
 b=FY2ZpM42QQGnm5yjhdWh/+kwHgdjuDNMmwZaDNlWwZov5E9y2MnjVYKZAfGah9ICmo
 z1OowbGlPRYVp5KCWwsQGIHcaSg8D402df8U53PnzBK08ZH5Po5utn95tqhtvwVkRvx4
 dTimmZi/kHAkyCVbehrEjfzlJQBJGkNW7Qf4yDRxNy/t0tLsShIVB7lztfo9w3VxjF2O
 x1hYGo6dg8cuDEBudyYFcJTyodPfPqZDHx5Fh6N3Uv3eTKEluITCuhTHq5ylBBODOmtf
 wd0wV6K92PU39d0pf1tnrQv8tzycfqwbbiNhQVz2kkTt8pJ+tEdd+97MAaQzlQYW8o2H
 bnOg==
X-Gm-Message-State: AOAM532IktjoxMQqjOC4PGtngkgM2lEJ9Fjc0/0g6DHpLhQiGqHiQm4J
 VqxZ8zYbtUFVVF8AUzPDVoDD+g==
X-Google-Smtp-Source: ABdhPJyQCqmvSfqHiVzd/xIOURaRRvTMCtKlN/Skj+URkenBXZ5sJYW9Fp/e25pf+5ZYVTV6M9szZA==
X-Received: by 2002:a7b:c4d5:: with SMTP id g21mr4236349wmk.92.1608137312532; 
 Wed, 16 Dec 2020 08:48:32 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j10sm3948429wmj.7.2020.12.16.08.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 08:48:28 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 134871FF8C;
 Wed, 16 Dec 2020 16:48:28 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 02/11] gitlab: include aarch64-softmmu and ppc64-softmmu
 cross-system-build
Date: Wed, 16 Dec 2020 16:48:18 +0000
Message-Id: <20201216164827.24457-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201216164827.24457-1-alex.bennee@linaro.org>
References: <20201216164827.24457-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Otherwise we miss coverage of KVM support in the cross build. To
balance it out add arm-softmmu (no kvm, subset of aarch64),
cris-softmmu and ppc-softmmu to the exclude list which do get coverage
elsewhere.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-Id: <20201210190417.31673-3-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index bd6473a75a..fcc1b95290 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -7,9 +7,9 @@
     - cd build
     - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
       ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-user
-        --target-list-exclude="aarch64-softmmu i386-softmmu microblaze-softmmu
-          mips-softmmu mipsel-softmmu mips64-softmmu ppc64-softmmu sh4-softmmu
-          xtensa-softmmu"
+        --target-list-exclude="arm-softmmu cris-softmmu i386-softmmu
+          microblaze-softmmu mips-softmmu mipsel-softmmu mips64-softmmu
+          ppc-softmmu sh4-softmmu xtensa-softmmu"
     - make -j$(expr $(nproc) + 1) all check-build
 
 # Job to cross-build specific accelerators.
-- 
2.20.1


