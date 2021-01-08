Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA302EF59D
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 17:16:59 +0100 (CET)
Received: from localhost ([::1]:50260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxuRe-0007ea-H5
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 11:16:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxuPA-0006Oe-GP
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:14:24 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:38219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxuP7-0000Qu-J9
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 11:14:24 -0500
Received: by mail-wm1-x334.google.com with SMTP id g185so8880664wmf.3
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 08:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O028dnlMv5NS+Rmaj3Ia6Zadv1Cc6n7rptblmwTUcIA=;
 b=QChpvsNS15XwhER+0Z0h7QZYYhVddgTT91HV0m65N7dyIt/mO2hL3B+Mfx2GoBxtRv
 SkMOkHcnjkrK0h3Gp/nJPvyAk5tNAWwignZKn8MknYbvo3AHKqrYmj6feJ97BLjh6TRv
 lHoVRcAgW+zQDcdpr5M85WxqhoYhXZMKFvGp0f1UlwfrCAq3pIjz9tHvECCrjzhn9vc+
 Dvn4xMhPhKNps/KA4E7OPH/Zg2x9LxM06seX/3n+ZpkdHWEtHbCxYdHfwMQsTmtGPdpB
 LQ/OzOOkQMf3rwX21ekWqk9aGBUIpb2MEDE5SeTOSy4YRTvTYyDvUOJCgnB7ArFeTDO9
 HhFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O028dnlMv5NS+Rmaj3Ia6Zadv1Cc6n7rptblmwTUcIA=;
 b=BA5QdM4NQ4RKfC9X4SOBVGEPD6+2wqiBCs9fyIe2aRS8KeOpzSNSRPn4sec6/X0982
 ArHzvEXkG6Zhh+QyjhjT/qM6RQwdqXAyB2qn5njPadHle5Tsu0G6Qc+eZ2LEoT1CodHI
 OgSIk+xAHnpoN6y4VXZpWiyCMPBIJO0soPDDMQ8XcafqrIMgGyY3/wnuasynRs0Zm/nW
 HRAD3CxwjoB5Os7ZsPR/BX2Odvk6wrtPCvSa6hKFEpF8dfX2iRGJG4F/zS0KgrLr0m9f
 MssMNGNpU6ki6s613AOiBrBIvPzXofMsHxqd9+4oPjRDjtayTqcA4JeN9owzOJoYJCiC
 xuTQ==
X-Gm-Message-State: AOAM532sV1BGucvZB/UR9tQxvD5tTe8XNS4H2i4yrRdoKrPDNuHUr1l5
 R3y4Xxv2RrW9HB2Sdmq/4yJ+X2fZ0W3f9g==
X-Google-Smtp-Source: ABdhPJwsCotJ0yrchHqEPQA2skE9QCNqILqJDYjnxWM6tFds/n1UvqmHNZTba3aEwCvD2y6RAeEcig==
X-Received: by 2002:a05:600c:410d:: with SMTP id
 j13mr3680809wmi.95.1610122459844; 
 Fri, 08 Jan 2021 08:14:19 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m8sm13261765wmc.27.2021.01.08.08.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 08:14:19 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] docs: Add qemu-storage-daemon(1) manpage to meson.build
Date: Fri,  8 Jan 2021 16:14:15 +0000
Message-Id: <20210108161416.21129-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108161416.21129-1-peter.maydell@linaro.org>
References: <20210108161416.21129-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit 1982e1602d15 we added a new qemu-storage-daemon(1) manpage.
At the moment new manpages have to be listed both in the conf.py for
Sphinx and also in docs/meson.build for Meson. We forgot the second
of those -- correct the omission.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/meson.build b/docs/meson.build
index 71641b4fe07..fae9849b79b 100644
--- a/docs/meson.build
+++ b/docs/meson.build
@@ -62,6 +62,7 @@ if build_docs
         'qemu-img.1': (have_tools ? 'man1' : ''),
         'qemu-nbd.8': (have_tools ? 'man8' : ''),
         'qemu-pr-helper.8': (have_tools ? 'man8' : ''),
+        'qemu-storage-daemon.1': (have_tools ? 'man1' : ''),
         'qemu-trace-stap.1': (config_host.has_key('CONFIG_TRACE_SYSTEMTAP') ? 'man1' : ''),
         'virtfs-proxy-helper.1': (have_virtfs_proxy_helper ? 'man1' : ''),
         'virtiofsd.1': (have_virtiofsd ? 'man1' : ''),
-- 
2.20.1


