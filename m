Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E6F2468A0
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 16:47:15 +0200 (CEST)
Received: from localhost ([::1]:54962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7gPp-0002V0-VD
	for lists+qemu-devel@lfdr.de; Mon, 17 Aug 2020 10:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1k7gGe-0003QE-7d
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 10:37:44 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1k7gGc-000632-NY
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 10:37:43 -0400
Received: by mail-wr1-x42c.google.com with SMTP id r2so15265803wrs.8
 for <qemu-devel@nongnu.org>; Mon, 17 Aug 2020 07:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rgLa8OOgysOf7Sl9OK2QDbGQukQVDXrVrkDaQKpgc84=;
 b=WDdu53j1/HqGCSmA24j6T2i6BO10XlWivf8LT0NGawMq1hj2RDeAUQXEdHuzJVLzTc
 Fe+Hp7UAQ9J1dymtnH1V7ALC3RbZ2QIF6ogMPYcQhKWhhBBEz/m+rfwkZa1eNKyK34A1
 nAApt+HUCQY83FttnmFwWaK6xm3ZeeS0Ij9ZaMEMsgfpUxZskC3X/4PaWtt2D8UQdWlZ
 v8919NHp/+DyjXEIm8u1Hj36Q/Zb75MNBebmxj2b4aD2NvmuQYBLMuhoIEggrktXNv9l
 E1fDqpoG0AOYwl2R9xuyPWKryb1ZsKJLrneQ1JHc6ZWL8Ays/4bP2IdTJBGXio+fxlkM
 YEwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rgLa8OOgysOf7Sl9OK2QDbGQukQVDXrVrkDaQKpgc84=;
 b=UURCEV7bs34h5/d0d11p2XWJJ/p8V7wy7AI4ohTZzwFtpF75LSBuhKFJDT+82Y+7QD
 a/FKslpHuzsviFPJOUiPVgofppH+2XUT5j2UWOps3X+K4xT9Qqbufeb+DOVwUfvOe+oM
 JTH2ZZhka9HNZq6vtGVHWAxTQa0eOlZOTz9xX+kEzz0cbfgGZsYkIctNcr92XiWeXVIK
 C989y8LZ4y9F6WpIgtRPhghQi4QXENtzGqTgETYsuOUjyqF9vXjdh1ib4mq1xcxiJA9H
 QBpPMqsEAuRZytJ3H67AP3p7cAOZiPxwN5q3ydRFd2T5xO9iyk4cJYNNvg4nSB7cEWr/
 MITA==
X-Gm-Message-State: AOAM5328yFW7+fwlufqdPyOaVqbin0HJ1k+mM8H6ZdGupbtYgHKZXZb2
 eb+QHuHiwURnhJv8mv3cn+ZRLoJqZrE=
X-Google-Smtp-Source: ABdhPJxqQdGi6zhP66UvnblEr48QUQKDlhgpmIrAp+PAdmdp9Te3pWF/kqh4zXtJ5fWhpFVG2xJXpQ==
X-Received: by 2002:adf:e704:: with SMTP id c4mr16990308wrm.81.1597675061038; 
 Mon, 17 Aug 2020 07:37:41 -0700 (PDT)
Received: from donizetti.redhat.com ([2001:b07:6468:f312:a0d1:fc42:c610:f977])
 by smtp.gmail.com with ESMTPSA id
 i22sm34966603wrb.45.2020.08.17.07.37.40 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 07:37:40 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 014/150] tests/vm: include setuptools
Date: Mon, 17 Aug 2020 16:35:07 +0200
Message-Id: <20200817143723.343284-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817143723.343284-1-pbonzini@redhat.com>
References: <20200817143723.343284-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

They are a dependency of Meson, so install them.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/vm/freebsd | 1 +
 tests/vm/netbsd  | 1 +
 tests/vm/openbsd | 1 +
 3 files changed, 3 insertions(+)

diff --git a/tests/vm/freebsd b/tests/vm/freebsd
index 29252fa4a6..b34b14fc53 100755
--- a/tests/vm/freebsd
+++ b/tests/vm/freebsd
@@ -33,6 +33,7 @@ class FreeBSDVM(basevm.BaseVM):
         "pkgconf",
         "bzip2",
         "python37",
+        "py37-setuptools",
 
         # gnu tools
         "bash",
diff --git a/tests/vm/netbsd b/tests/vm/netbsd
index 2e87199211..93d48b6fdd 100755
--- a/tests/vm/netbsd
+++ b/tests/vm/netbsd
@@ -31,6 +31,7 @@ class NetBSDVM(basevm.BaseVM):
         "pkgconf",
         "xz",
         "python37",
+        "py37-setuptools",
 
         # gnu tools
         "bash",
diff --git a/tests/vm/openbsd b/tests/vm/openbsd
index dfe633e453..7e27fda642 100755
--- a/tests/vm/openbsd
+++ b/tests/vm/openbsd
@@ -30,6 +30,7 @@ class OpenBSDVM(basevm.BaseVM):
         "git",
         "pkgconf",
         "bzip2", "xz",
+        "py3-setuptools",
 
         # gnu tools
         "bash",
-- 
2.26.2



