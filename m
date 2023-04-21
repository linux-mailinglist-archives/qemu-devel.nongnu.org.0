Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E33396EAC18
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:54:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pprCy-0005BZ-CF; Fri, 21 Apr 2023 09:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ZJVCZAcKCsEwlmvsl5nvvnsl.jvtxlt1-kl2lsuvunu1.vyn@flex--pefoley.bounces.google.com>)
 id 1pprCv-0005BO-Vy
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:53:50 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ZJVCZAcKCsEwlmvsl5nvvnsl.jvtxlt1-kl2lsuvunu1.vyn@flex--pefoley.bounces.google.com>)
 id 1pprCn-0000hF-SG
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:53:46 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-b8c875f2eb9so3702372276.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 06:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1682085220; x=1684677220;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=jSgiFvITwsLN0TxSwL7B/TOLGURzBlxd047PRdtRZZE=;
 b=fmMAVP/ApeqKjzlFwuyaWurVENtvJQw/HSS2QJGQLWvvvMYTEKgJePOCvBcaIghwVU
 wUqBVg7k7dsXQZgeOemtyyDTyg78pVEUyY/g88+jnRhF820z3mXFp/qTC12u7QYhRZBR
 OSpBZV0cfhBt7VfBglm1S2VXAXs2RzdXcFb7T3crG11wWzK2C+X0y0bO+f97gBRZV/5/
 9Gmq0ll3JpRuzEJfGpMPyPC9S9fN8l7onTbCQy5yE0DzusUqx/ZZzkG/Pu5z/rn2My/g
 PMphw+QnKCtuAb6df1yeiPNFijVGMf02msrmFHipN7S1s3WQuMm0ILVo/ZHeAvWbiQcW
 hpPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682085220; x=1684677220;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jSgiFvITwsLN0TxSwL7B/TOLGURzBlxd047PRdtRZZE=;
 b=LsYfJgd6PwpqYtLAKg2y/og8oAUSc+U9TgzbrKuGqbMsRmelgp9FnYQPBh437u1BPk
 7zxBzZcafUDH6r16cygv9sXDtDU6gKkWcVzvtaqBpLXbhGnYa4mh/FW0DH4LEChuhexh
 o7nIFZuFSaN/sIaFfxySxuFxZiFwpFnj/c36ypLLZULdNbWqM/xpi58fWxTMjESOg0GO
 XD6kk+GQbmJDeWX1fRcBh6NaVef45OIwUmlY/+oeYLEr/EXEuXjJo3mc0DjQrbkC9bdY
 GIJJnfuas9g4L5rFOk5Yif89sSjaWByH8r1+zGcbxmQIKUnPFokqHeiB1ktmkP8LLVS/
 nYOA==
X-Gm-Message-State: AAQBX9d9a3dQg0wqRyYjzsdIsPdIFovcpFyqT6J0UXXzFQzC0cOXHGmc
 NDw9HMk5F/PuOwwvAcyt0x3qhnKIp9QF2YDm8OY3X7AaTiXgjbvvMgxFiHX/q5SJzoBiXgmInp9
 HQSn2Hv7hdPQoS6BVxR+OsCGn4jHA+vtKXFDhzITMbYDNHjQ4VmBf8JCqLIDE3qQ=
X-Google-Smtp-Source: AKy350b4YZF+xnwU9r0HicSXEspIw1FVbRnmvCCI1XGse63tafqJ8lYFweF0HVWC4XavI667FH8u390s5FqX
X-Received: from pefoley.res.corp.google.com
 ([2620:15c:4d:200:23f1:58b3:2e97:787a])
 (user=pefoley job=sendgmr) by 2002:a25:cc89:0:b0:b8f:6b84:33cb with SMTP id
 l131-20020a25cc89000000b00b8f6b8433cbmr1281164ybf.11.1682085220197; Fri, 21
 Apr 2023 06:53:40 -0700 (PDT)
Date: Fri, 21 Apr 2023 09:53:27 -0400
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
Message-ID: <20230421135327.1778365-1-pefoley@google.com>
Subject: [PATCH] Don't require libcap-ng for virtfs support
From: Peter Foley <pefoley@google.com>
To: qemu-devel@nongnu.org
Cc: venture@google.com, Peter Foley <pefoley@google.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 "=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?=" <marcandre.lureau@redhat.com>, 
 "=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?=" <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 "=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3ZJVCZAcKCsEwlmvsl5nvvnsl.jvtxlt1-kl2lsuvunu1.vyn@flex--pefoley.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

It's only required for the proxy helper.

Signed-off-by: Peter Foley <pefoley@google.com>
---
 meson.build | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meson.build b/meson.build
index c44d05a13f..1d4888b1c0 100644
--- a/meson.build
+++ b/meson.build
@@ -1759,12 +1759,12 @@ have_virtfs = get_option('virtfs') \
              error_message: 'virtio-9p (virtfs) requires Linux or macOS') \
     .require(targetos == 'linux' or cc.has_function('pthread_fchdir_np'),
              error_message: 'virtio-9p (virtfs) on macOS requires the presence of pthread_fchdir_np') \
-    .require(targetos == 'darwin' or (libattr.found() and libcap_ng.found()),
-             error_message: 'virtio-9p (virtfs) on Linux requires libcap-ng-devel and libattr-devel') \
+    .require(targetos == 'darwin' or libattr.found(),
+             error_message: 'virtio-9p (virtfs) on Linux requires libattr-devel') \
     .disable_auto_if(not have_tools and not have_system) \
     .allowed()
 
-have_virtfs_proxy_helper = targetos != 'darwin' and have_virtfs and have_tools
+have_virtfs_proxy_helper = targetos != 'darwin' and have_virtfs and have_tools and libcap_ng.found()
 
 if get_option('block_drv_ro_whitelist') == ''
   config_host_data.set('CONFIG_BDRV_RO_WHITELIST', '')
-- 
2.40.0.634.g4ca3ef3211-goog


