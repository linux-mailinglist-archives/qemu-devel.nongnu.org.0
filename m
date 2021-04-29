Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD5336E365
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 04:44:28 +0200 (CEST)
Received: from localhost ([::1]:42418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbwfD-0003Mn-72
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 22:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <uenobk@gmail.com>)
 id 1lbweB-0002q5-JF; Wed, 28 Apr 2021 22:43:23 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:35349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <uenobk@gmail.com>)
 id 1lbwe8-0007o2-5F; Wed, 28 Apr 2021 22:43:23 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id i4so39018258ybe.2;
 Wed, 28 Apr 2021 19:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=gci5i1+hQufS0h/hOtuUBaMqZfB0YNfN1Ntl3zJI+eI=;
 b=FrxUumVqndcXZ68TS1xoHNRKLwYeAveCKoY3KAmvWawon8WdbUeiTWMXGB2n8JZc0S
 CuYSzEJvfnfKUAAA2qpYqbFPQjZbeKVBVFqHyezIkRNP3TYeQoAXTB2eInyLqWI+rW9S
 eRBo9EfA/Al8Nd51EFLAIfLXzjYuHc3GxJU54NIYurK41kPZK0/W5c6JFCr0ZCHvhSMQ
 zud48MPybMtiifXVEiHlZhIQogeSIyaB1+TAbzCEcC4JU+g5sw7j2ZdrV0jv4j8LwCGq
 H+eQJb01f9XZ2aSJRkRQTYNMAhkjdtOuZiqFVTzEkLyK941gHxFFO9iBuC8JFEvB/B9j
 zeTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=gci5i1+hQufS0h/hOtuUBaMqZfB0YNfN1Ntl3zJI+eI=;
 b=RjyDa5kdShueCUUvEouaTP6gKMxq8jo6odjX72D8Y+CJO3UgAxtCNjYInJcdOQHXq/
 PjaNNQPV/+e+eYmdShAMNxrxzRtInsto/xFpEfTTrgrM3IJ8Wypa/WVKgcAYK6YxD2Mh
 ql/qJB3fjNk5CV7WXkIA10E5Hdf6MJnZhllpCGuyY3/k8Ww+a0Z0q2aieKDwoFm/SR03
 a7bzR2Rvats+P6QfMk0DHyLir4y+J9HCPUNOtUb1lE7sUGLCZFu/noagaCoJybFDRw2d
 ASUwYQD/B8yQ3j1OnzGprXvzSsfUNhrJNrmoPs6eg4mYN5O1Aeb7k7jGuYIa0D5+Vh+r
 Vpyw==
X-Gm-Message-State: AOAM530+O/W1ovXQLLT+r8ZAzMkU+o4OR1jt6eB4cTva3HdajzI3T9Tl
 2LFHdh7N1JSbDz3pZuFMKTfOAd+MQho+JeIPcr6wSSRP1P11Ww==
X-Google-Smtp-Source: ABdhPJwf9rRIBLPblE4cO3rLuQOQWf65LAqNjNKrCM7QjzgbRaqA+TuowEkJd01BEZoxzmStvXscQmRNF8y2xYD2MDk=
X-Received: by 2002:a5b:44e:: with SMTP id s14mr46191927ybp.11.1619664197791; 
 Wed, 28 Apr 2021 19:43:17 -0700 (PDT)
MIME-Version: 1.0
From: Katsuhiro Ueno <uenobk@gmail.com>
Date: Thu, 29 Apr 2021 11:43:07 +0900
Message-ID: <CA+pCdY09+OQfXq3YmRNuQE59ACOq7Py2q4hqOwgq4PnepCXhTA@mail.gmail.com>
Subject: [PATCH] meson: Set implicit_include_directories to false
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=uenobk@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without this, libvixl cannot be compiled with macOS 11.3 SDK due to
include file name conflict (usr/include/c++/v1/version conflicts with
VERSION).

Signed-off-by: Katsuhiro Ueno <uenobk@gmail.com>
---
 meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meson.build b/meson.build
index c6f4b0cf5e..d007bff8c3 100644
--- a/meson.build
+++ b/meson.build
@@ -2129,6 +2129,7 @@ common_all = common_ss.apply(config_all, strict: false)
 common_all = static_library('common',
                             build_by_default: false,
                             sources: common_all.sources() + genh,
+                            implicit_include_directories: false,
                             dependencies: common_all.dependencies(),
                             name_suffix: 'fa')

-- 
2.30.1 (Apple Git-130)

