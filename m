Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D593088C5
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 13:02:56 +0100 (CET)
Received: from localhost ([::1]:43544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5SUJ-0004Jg-8d
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 07:02:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnQ-0004dX-Pe
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:36 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:39691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnP-00061q-3N
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:36 -0500
Received: by mail-ed1-x52f.google.com with SMTP id b21so10123412edy.6
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dXD7Fo2yC7I86y7CAeIND3a3JrzMld9M7rvgq9x0zxI=;
 b=ATNbgjGcl0rFVREg1CSkfROb3x1pblYT6oVOvV6lupoQTjo3FP/euhTEMm8OKwKaD3
 XG2CY5kJ1jbwBWqshtUlz8mIHJTZ2QFU5vcP8bfcZZOGO/JvhTD8rSxQWV82YCmiS3gq
 EceCvup3vuvbGJ8kgGC+HkAQZPWPGGXVGiZwBgasErS3JohiBkPMOmBTPVBkURltvDsh
 JPRpogaaUf3FfbjbvjxF1yV89snEO7H0zc4dDsn+YFLcTwhgN9Zxzw/1L6/LEBexgt0n
 EtknXehtu0d8xtBkVFg0aNqLa+Mp9TUjqJ9ErW7QQ6nYVQrJ5OxxopHBAPg1SafQ2+sY
 4R3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dXD7Fo2yC7I86y7CAeIND3a3JrzMld9M7rvgq9x0zxI=;
 b=A6gW0QDg+I74SYOBA3OPE3Va9zHfmcJWLLBZzfdt2w2x7wLPUOvDfmzwPlR1q5GsFA
 vyWf6guR4d/94Hjj+oChkOdxQ+/IJppowvrecyIpqaihvf9Aka+CU7HE/QBe6FMtuEBJ
 mMjEOUM6xbXwSZJFPj8xkuThae7Y8rUDCFM0twUQFpoRr7Q2Z9OCiK9nhP1bssIWB8Iq
 /pTiNBT6UEbAPkYXn+bV8tJ1Z9V8SKzO/3d4oFao6eUPWTerhrsWb1qdZigU1Ws9rDsj
 nTn0V31hSOG3JYNkExkOm8I0kYXqFOcOpxQlynZdO86hsm6mTn12DHsvHslE3Z38XUAc
 zExw==
X-Gm-Message-State: AOAM533iCMLCKT+qJBPoBZFZjqdEIw978L6/FxwRU9JUh9yignBeXH6I
 pgbkJzgNY9WW3Aby9SriNZh0SEWXUrl8mw==
X-Google-Smtp-Source: ABdhPJxYhMjbxdEhvA/KWIdiwQwvcin2imGYH5/YR+xaNCa4TLM7VSZ8Jejrfz/+vfAhRQy+IpL+ow==
X-Received: by 2002:aa7:c308:: with SMTP id l8mr4584950edq.246.1611919113831; 
 Fri, 29 Jan 2021 03:18:33 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:33 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/36] configure: Improve TCI feature description
Date: Fri, 29 Jan 2021 12:17:58 +0100
Message-Id: <20210129111814.566629-21-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Users might want to enable all features, without realizing some
features have negative effect. Mention the TCI feature is slow
and experimental, hoping it will be selected knowingly.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20210125144530.2837481-3-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure         | 2 +-
 meson_options.txt | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 8f3c4a6a5c..21369efc63 100755
--- a/configure
+++ b/configure
@@ -1748,7 +1748,7 @@ Advanced options (experts only):
   --with-trace-file=NAME   Full PATH,NAME of file to store traces
                            Default:trace-<pid>
   --disable-slirp          disable SLIRP userspace network connectivity
-  --enable-tcg-interpreter enable TCG with bytecode interpreter (TCI)
+  --enable-tcg-interpreter enable TCI (TCG with bytecode interpreter, experimental and slow)
   --enable-malloc-trim     enable libc malloc_trim() for memory optimization
   --oss-lib                path to OSS library
   --cpu=CPU                Build for host CPU [$cpu]
diff --git a/meson_options.txt b/meson_options.txt
index 95f1079829..675a9c500a 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -40,7 +40,7 @@ option('xen_pci_passthrough', type: 'feature', value: 'auto',
 option('tcg', type: 'feature', value: 'auto',
        description: 'TCG support')
 option('tcg_interpreter', type: 'boolean', value: false,
-       description: 'TCG bytecode interpreter (TCI)')
+       description: 'TCG with bytecode interpreter (experimental and slow)')
 option('cfi', type: 'boolean', value: 'false',
        description: 'Control-Flow Integrity (CFI)')
 option('cfi_debug', type: 'boolean', value: 'false',
-- 
2.29.2



