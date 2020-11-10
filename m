Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3462ADB64
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 17:15:14 +0100 (CET)
Received: from localhost ([::1]:49742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcWIb-0004qw-BA
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 11:15:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW6q-0000Qg-RJ
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:03:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW6o-0003mF-MG
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:03:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605024181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kZMAg9/6h7CS50hiH1TVVmXwkor3bovFoTLfJFHXvYM=;
 b=OJA/BilRQ74/yd4Ja3CyJQ340XMVzRBhhoZH34zLbej4jYXtswbhku68tMHh/xNyhtXHnd
 l0vJnU9KuKIPPqvIYX0Ljk6nOZxidhORQ/TO2nPFj6mmG1XnLmKQMKy+Zb52Kc+WVmwYb3
 TViIYPYQUvgWdWCjiMNiuff8c5e8Wyc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-1_izX2Q_MSusthl4oSkpiw-1; Tue, 10 Nov 2020 11:02:59 -0500
X-MC-Unique: 1_izX2Q_MSusthl4oSkpiw-1
Received: by mail-wr1-f69.google.com with SMTP id x16so5844827wrg.7
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 08:02:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kZMAg9/6h7CS50hiH1TVVmXwkor3bovFoTLfJFHXvYM=;
 b=jaHe8gSyJBzH7kAGjOasE+LTbLFO4UK/3MZxz8yXyBOrkPZpANNwNRC0+gCnh4fkA4
 9yZeBycmnMDfHMuRxJvwzXw2limCLhdDvT3OKpMjRQgomKtItB2AtvKmhEnQwdSjM7Xm
 1VTYWgybvluPTR8FU17TtPZ3pHc5LBPBREdRP+ZLoEMSHbfkvXNBGrFCabG0ZmRZp6Me
 6hSqltRifUxAnjuzmJVfqd+qw/miPb+NaaD3oe1VvLTph+iVOA+QMQZjIjrlC0PmymPL
 5QXiFpQl9GYiF65MqhT9HaU+V+hNL/H0jZkh/ef8TCRwr/EHfJlOH0tEdywmLeGAFLw7
 IdEw==
X-Gm-Message-State: AOAM531oi07Lz4chMtShouUg+Q3oWcct4l1VTIPBeR8EzMNtVs4QOzq+
 IK6MsJn51Ni1nQ0scGmnK1V2JlGKnBKPhsGHE2i4S3uuot3mqIwFJOdIsv0cPZTFUb4M6AgCoeP
 9l6eifHxbl26l47Z3txydsjgB35MTT3HsEMkLdmXk0iHeSpobXBB945fmwsjuN3zg
X-Received: by 2002:a7b:cb82:: with SMTP id m2mr367882wmi.75.1605024177111;
 Tue, 10 Nov 2020 08:02:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx8YsoBeKDdbos5wzAgHfbjLByBkjZCtBwsI63p8LcL1EnUSJPKd8bPN7U0lFoalYpIfz39jQ==
X-Received: by 2002:a7b:cb82:: with SMTP id m2mr367839wmi.75.1605024176863;
 Tue, 10 Nov 2020 08:02:56 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id t2sm18225187wrq.56.2020.11.10.08.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 08:02:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 14/16] gitlab-ci: Mark Stefan Weil maintainer of the TCI
 job
Date: Tue, 10 Nov 2020 17:01:38 +0100
Message-Id: <20201110160140.2859904-15-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201110160140.2859904-1-philmd@redhat.com>
References: <20201110160140.2859904-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Bin Meng <bin.meng@windriver.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 virt-ci-maint-team@redhat.com, Bin Meng <bmeng.cn@gmail.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Stefan Weil is interested the TCI feature does not bitrot.

Cc: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index bafbdc0e1a7..4df45214620 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -358,6 +358,8 @@ build-oss-fuzz:
 build-tci:
   extends: .native_build_job
   variables:
+    JOB_MAINTAINER_NAME: "Stefan Weil"
+    JOB_MAINTAINER_EMAIL: sw@weilnetz.de
     IMAGE: fedora
   script:
     - TARGETS="aarch64 alpha arm hppa m68k microblaze moxie ppc64 s390x x86_64"
-- 
2.26.2


