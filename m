Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9653F41F151
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 17:36:29 +0200 (CEST)
Received: from localhost ([::1]:38078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWKaK-0000G5-Lw
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 11:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWKXs-0006Ii-2P
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:33:56 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b]:36803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWKXq-0007gX-7e
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 11:33:55 -0400
Received: by mail-qt1-x82b.google.com with SMTP id l13so9319484qtv.3
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 08:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=77S8PHNNwp8gzL3C6UYKL3B8n68oD4JCUCVjCK3xRFU=;
 b=PxP9QKmVaDWj+uaYhx0NqN3D+jNsTE1j9dODCmn//aCuUMjSyNjpJfxGLe3S9MCvkx
 2lm/HfzpWTD6h0EQdeo5xtE/BQVtpTo1NXrVGaSZt2NP4y17lcCz3c7eDFqfjU8rAhtZ
 2S7pd0ubDlJD/OcuU0cWAJoqhSc1AIlkaVKHzEvBDPPoJGVNgv7Tmq8waW2eFIjGZK62
 2KmOh2rJMv8itqHW3A0nMNzcdTqz7MdSGs9WCdqo45FzFLCEHSU8A0LQrW0cD3Cep+Jn
 o+jvlRHJM3bYBuSR/sBe8xvnlOwoQRyXepzgJDL7ILJjV75Fpio+N+Ms49a65/pvxqaQ
 F95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=77S8PHNNwp8gzL3C6UYKL3B8n68oD4JCUCVjCK3xRFU=;
 b=B8TURckuq14xEJYwV6ssoN84V09krsAF7hHpijW8hCu74wqgwRmMPQ5MpKEenAL1+v
 pCddS06oSZwHG+6ApuNwzLVaDtc9ozotsCnac0iKPSl8ZGK+DFE7o9eczmskmwZ3Kelz
 WzA2+xv8B4KzO9qHWlomSBilI3NJ6WlT/7A7bNpZu+ioAo+EdrU2tR4UGeDocR9Rq8yO
 pqz+Bwk7rjBfBLls9qKWPNUuO01MKwWyQw02uFj3qm3+RVdaBOLcGPteyQc/qrn542m7
 bsNOgfKQN+IQuYgpnjwPwxoUXBlZE8YX1B+zQAT/EwuRYc2bv0a5sINslVhG9xM4dcmS
 j2nA==
X-Gm-Message-State: AOAM533t7t9cl381d5OqYM7aEMxEwcpXkGr0/+dXsIz35sHEJs7X6HWo
 wCVSWDE84HV929idql1jBeEoKTEQFb/DCw==
X-Google-Smtp-Source: ABdhPJy61Bw1yaYn5jS79d7bStmAN2GBSHDR4U0UCLXZtSmd/jeMCxlzpURt6nZ/wVi58YUWCGe4wg==
X-Received: by 2002:ac8:7769:: with SMTP id h9mr13916374qtu.156.1633102433287; 
 Fri, 01 Oct 2021 08:33:53 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id x8sm3484823qtv.5.2021.10.01.08.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 08:33:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] tests/docker: Fix fedora-i386-cross
Date: Fri,  1 Oct 2021 11:33:40 -0400
Message-Id: <20211001153347.1736014-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001153347.1736014-1-richard.henderson@linaro.org>
References: <20211001153347.1736014-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82b.google.com
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
Cc: marex@denx.de,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 crwulff@gmail.com, laurent@vivier.eu,
 "Richard W . M . Jones" <rjones@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By using PKG_CONFIG_PATH instead of PKG_CONFIG_LIBDIR,
we were still including the 64-bit packages.  Install
pcre-devel.i686 to fill a missing glib2 dependency.

By using --extra-cflags instead of --cpu, we incorrectly
use the wrong probing during meson.

Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Richard W.M. Jones <rjones@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/docker/dockerfiles/fedora-i386-cross.docker | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/docker/dockerfiles/fedora-i386-cross.docker
index dbb8195eb1..820740d5be 100644
--- a/tests/docker/dockerfiles/fedora-i386-cross.docker
+++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
@@ -17,12 +17,13 @@ ENV PACKAGES \
     glibc-static.i686 \
     gnutls-devel.i686 \
     nettle-devel.i686 \
+    pcre-devel.i686 \
     perl-Test-Harness \
     pixman-devel.i686 \
     zlib-devel.i686
 
-ENV QEMU_CONFIGURE_OPTS --extra-cflags=-m32 --disable-vhost-user
-ENV PKG_CONFIG_PATH /usr/lib/pkgconfig
+ENV QEMU_CONFIGURE_OPTS --cpu=i386 --disable-vhost-user
+ENV PKG_CONFIG_LIBDIR /usr/lib/pkgconfig
 
 RUN dnf install -y $PACKAGES
 RUN rpm -q $PACKAGES | sort > /packages.txt
-- 
2.25.1


