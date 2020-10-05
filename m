Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E18AB283230
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 10:38:18 +0200 (CEST)
Received: from localhost ([::1]:60460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPM0f-0006PD-5Z
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 04:38:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kPLmx-0008KO-Ph
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 04:24:07 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:52414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kPLmv-0007Li-Vy
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 04:24:07 -0400
Received: by mail-wm1-x32a.google.com with SMTP id q9so7630894wmj.2
 for <qemu-devel@nongnu.org>; Mon, 05 Oct 2020 01:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L5bnLnRgyCXqmqskotXFSaPQP0wUnC9+XJCdXnSYiEg=;
 b=QK0bhUArJ3zQ2fkKIhCuPPtr44mgAtE1ReX4YlvhlIwvo8pDTnIyT5KH8BbClSrect
 7ENURDa0HEdl4ld0NVwxGVYT920RWp1s2c1T6mc0HaRf6sUBaNrgdXM9f5pDeefRUTJr
 b8xTKPfr6L/CY66kfhRJtA9sWmDx/AY3z346UXhhH3BSejHhNwSSSd/AhwI8X3i+3XaN
 p8LMAIjacbS0j8N9oUON0CsnGIgMBz1XrHk9tw9izKLBeRJhL7xtqM3DrDM9EJPHL4Ab
 mKjK8z/9x0tg4e9i8qBB3xjYFR/nld98s3YrJhGpRH7bm5q1uxmzY+oHoufm1RQmXDMe
 4saA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=L5bnLnRgyCXqmqskotXFSaPQP0wUnC9+XJCdXnSYiEg=;
 b=UYkDvx3VIO2fopjm+vnALf4YVE2x9z6ePOM+HThpLiMcoYAPIB3Z8TJ6ZaKo+97ePz
 znBjvR45imIcZHhKqFIZBgJUL+VgkLk8cUn/3GEGZR7QVr4EVuE3X+uSFh+LdMXfvyay
 WkDCYd0rCU0dyRRP8TH36vWZe3SziNBCMZepe6fCK64oLbZqyKs4yjEIalfu5pPekEOM
 11D+pOeRuehWgA0/zGVwKXXUJYsuF3SnJYZRkkCplA01hMx4xQPETuRUpqvW8HVwrMko
 GD0PmtElTdXtOJHB7Ld4RzDITzLd8KFi2TH7WVB/96YE1HhcfglRWqIkOS0ijVGyd+FJ
 O2yw==
X-Gm-Message-State: AOAM5325jgWJUomIeH3IAAJmA8/Wq9Xdqt6pdKt0ZDe0NO8xSUM/mMFb
 BCxqrbi5KJiK6XpSC32R4ae9bREk8Lo=
X-Google-Smtp-Source: ABdhPJzXYc19fsQC4V6lqb+Pu2fkC89+n82+TotAcB1+Xdyo1YuNHcUvOBBFss4lktO9iS0/6Cp8tw==
X-Received: by 2002:a1c:9885:: with SMTP id a127mr15655749wme.8.1601886244466; 
 Mon, 05 Oct 2020 01:24:04 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6468:f312:2e86:3d8b:8b70:920c])
 by smtp.gmail.com with ESMTPSA id z15sm11931434wrv.94.2020.10.05.01.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 01:24:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/19] dockerfiles: add diffutils to Fedora
Date: Mon,  5 Oct 2020 10:23:49 +0200
Message-Id: <20201005082349.354095-20-pbonzini@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201005082349.354095-1-pbonzini@redhat.com>
References: <20201005082349.354095-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Neal Gompa <ngompa13@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For some reason diffutils is not included in the Fedora containers anymore,
causing the build to fail.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Neal Gompa <ngompa13@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20201003085054.332992-2-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/docker/dockerfiles/fedora.docker | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
index 71e4b56977..ec783418c8 100644
--- a/tests/docker/dockerfiles/fedora.docker
+++ b/tests/docker/dockerfiles/fedora.docker
@@ -11,6 +11,7 @@ ENV PACKAGES \
     cyrus-sasl-devel \
     dbus-daemon \
     device-mapper-multipath-devel \
+    diffutils \
     findutils \
     gcc \
     gcc-c++ \
-- 
2.26.2


