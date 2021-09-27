Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B356D419B65
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 19:16:21 +0200 (CEST)
Received: from localhost ([::1]:51598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUuEm-0005Xe-Ox
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 13:16:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu2o-0004LH-QB
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:03:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUu2n-0003nj-2g
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 13:03:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632762236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5bFkDFbIjMJzau3RcdY7C5P6hQBBwhKKwN7KGrhpIBI=;
 b=XVYCrrdErJkMrepVJjT6YxcRx9F/CqGFaa4H0YXUHrJeHpIYPQjju1I+thoIphQfS3UyAe
 IwPMQElPx8s2q4tQM8oiFk2WFuOYe6KUPB9te8TvIVnLrn3mkmeYlbcKXbpZPX0+kb/6VC
 pLqKAmjyqzIZ+y72s1IH/6JDiWsa71c=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-zDAHD9XwMsC0uA3jjWmoxA-1; Mon, 27 Sep 2021 13:03:55 -0400
X-MC-Unique: zDAHD9XwMsC0uA3jjWmoxA-1
Received: by mail-wr1-f69.google.com with SMTP id
 j15-20020a5d564f000000b00160698bf7e9so1027484wrw.13
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 10:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5bFkDFbIjMJzau3RcdY7C5P6hQBBwhKKwN7KGrhpIBI=;
 b=5Hejg25C7jskEoC/Kv/b5W03ygT6HyiVkXrhM0Ns2QA7PEQipXi9gVkMupNBlguj0K
 jibCI2sQGSmnIDI/vNyTO1j9gsFPRsD8c1k01rpY3OPozvwiImHuQfpkOl+NvQTFHWyG
 jchTGrC7ue+Sqmd5P8cU3JasOvvtox5z6QWdPpXYOaRmxc73oHBtD166ZqCEoTF6ANYz
 z7zYAYSFmVbQDdSqUvPOQ0LE69dEWwkt/9IjzSPyoEg2GAd/Aco5B66DOU+PdiKVilVG
 IcrPxucPAHuw402soUusbh5Vz1fz2NjJ2FLDvDkxOtFh67ewkG4a9v8l2EznNE1vx4to
 lB7Q==
X-Gm-Message-State: AOAM530R1bIvd0nnx716dD5eJQMaxAFrmvQzILyIOpPPC35x/G17KRIi
 yZet/ZBF+Nbfc1UrbYQ6D0IMmdCZkOzds7PqdUG44Dgj2XFhGRSySCIt0YbWhCb/CXW+Jqeicpr
 pseXIswYssougNt7RU0fD2qb2l4Bgs1nuMhnoePaRzr6NYQeIz6mSSbGLlDs///NV
X-Received: by 2002:adf:d1cf:: with SMTP id b15mr1076525wrd.181.1632762233836; 
 Mon, 27 Sep 2021 10:03:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYAPC7o5YQgfkQeFvr3poZzoX0VCp521vrpnKth7pmsfmIEzVpF0AviSpvh7rlbp3P6/8+jQ==
X-Received: by 2002:adf:d1cf:: with SMTP id b15mr1076500wrd.181.1632762233653; 
 Mon, 27 Sep 2021 10:03:53 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id x9sm8564611wrv.82.2021.09.27.10.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 10:03:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/21] tests/acceptance/boot_xen.py: removed unused import
Date: Mon, 27 Sep 2021 19:02:25 +0200
Message-Id: <20210927170227.2014482-20-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927170227.2014482-1-philmd@redhat.com>
References: <20210927170227.2014482-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cleber Rosa <crosa@redhat.com>

Just a clean up for an unused import.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210924185506.2542588-13-crosa@redhat.com>
---
 tests/acceptance/boot_xen.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/acceptance/boot_xen.py b/tests/acceptance/boot_xen.py
index 3479b5233b8..fc2faeedb55 100644
--- a/tests/acceptance/boot_xen.py
+++ b/tests/acceptance/boot_xen.py
@@ -13,7 +13,6 @@
 
 import os
 
-from avocado import skipIf
 from avocado_qemu import wait_for_console_pattern
 from boot_linux_console import LinuxKernelTest
 
-- 
2.31.1


