Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB8E3DBF94
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 22:21:40 +0200 (CEST)
Received: from localhost ([::1]:59578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Z0l-0008TG-Jd
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 16:21:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m9YyK-0004CJ-4e
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:19:08 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:55813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m9YyI-0000ps-N0
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:19:07 -0400
Received: by mail-pj1-x102e.google.com with SMTP id ca5so16807675pjb.5
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 13:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=1DPcV7mS//zf94TYad0tRK5Q1rQ+GfV9pqZ5+VAHcjM=;
 b=ElfmrPGTMGVbnQDXfE8GsIevNXzgQuABTeZMKiXn1AVg1YP72uFBWznJjtB5i4qC5j
 W+InBlMbAFVetozH5jtj6cYrr8giK5HTIDCsW7oEuqulwhCA9zflnNz1CeTpUjPZMtnH
 obv7rtWsh+vBSs7b7JEyu5kAyQiylkEvTlniXdZmpuUUmnSGDKYOH/YkBh5Fgpw5jGnx
 aPjl5jEqfdSjw99J1aNZP0gDl+pb58RMcryHRcceegIBtoSFjsWKl+CeCJKJUXyA12oQ
 K/5Uanq5Q8ifrLp3duyUtthE4GfVam5dJeLwI3eAJg25abPfe5f6H+MIeXJNy3QHpyll
 Sftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=1DPcV7mS//zf94TYad0tRK5Q1rQ+GfV9pqZ5+VAHcjM=;
 b=hld7ZnAWk8/g97Dk737C6r3jZnhPjfTucxLDtaVbrwD0HHbuSO3+BWnKPWh43942Iq
 mQ5UYLdSWHlR3VX2UmB6YzZhsMpijOYGTALfTx4kfIz4szRHXuTMoAGSW8gAVprDY+vb
 mz+WbvNk0x2gygjbOXAdMRz5kgZFv0fd3/xsLhN3YW7vyi1FkNbsOwfb++huten1hXRT
 SeOoxBPOSWcD1yr4D8M7o9nyuvVeEK0WZiexD7EJRTW2nhtkQu0U+/zUML9EXkHzPoCv
 okkb591dDdAlaS56xu+YhOAJQJldEg9/n4fPe2yJ7+Cy/wm+eOg/+9a0/2jnypkl0MBX
 +hZg==
X-Gm-Message-State: AOAM530KpI4mhPx49y13tCVA59ii9jHpbO76v3On15m4xooxwWJzcfvp
 wRQh40yjb7TRPt+cF+JtvAHxOjfHj4Pvkw==
X-Google-Smtp-Source: ABdhPJxEn/QBRBDR343a+nuWBm5jsNXo25hLrZ44CyXIB8VLwxrVNRDXOfzbmHNKmrcedDVFtJs/OQ==
X-Received: by 2002:a17:90a:fef:: with SMTP id
 102mr4788892pjz.148.1627676345315; 
 Fri, 30 Jul 2021 13:19:05 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.243])
 by smtp.gmail.com with ESMTPSA id s50sm3256842pfw.212.2021.07.30.13.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 13:19:05 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/13] python: disable pylint errors for aqmp-tui
Date: Sat, 31 Jul 2021 01:48:35 +0530
Message-Id: <20210730201846.5147-3-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210730201846.5147-1-niteesh.gs@gmail.com>
References: <20210730201846.5147-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pj1-x102e.google.com
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
Cc: ehabkost@redhat.com, kchamart@redhat.com, jsnow@redhat.com,
 armbru@redhat.com, wainersm@redhat.com,
 G S Niteesh Babu <niteesh.gs@gmail.com>, stefanha@redhat.com, crosa@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Disable missing-docstring and fixme pylint warnings.
This is because since the AQMP is just a prototype
it is currently not documented properly and lot
of todo and fixme's are still in place.

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
---
 python/setup.cfg | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/python/setup.cfg b/python/setup.cfg
index 2573cd7bfb..7a30dd5b09 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -90,6 +90,8 @@ ignore_missing_imports = True
 # --disable=W".
 disable=too-many-function-args,  # mypy handles this with less false positives.
         no-member,  # mypy also handles this better.
+        missing-docstring, # FIXME
+        fixme, # FIXME
 
 [pylint.basic]
 # Good variable names which should always be accepted, separated by a comma.
-- 
2.17.1


