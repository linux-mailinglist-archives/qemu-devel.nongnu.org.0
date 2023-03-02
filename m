Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F22306A866E
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:33:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlpy-0006Xu-F3; Thu, 02 Mar 2023 11:31:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXlpw-0006Uw-BO
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:31:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pXlpt-0006bG-O5
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:31:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677774677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mrgkRdNE+AcdsZ+zHYLBFAXiQu5tjayM7At8EKmQNNc=;
 b=QLeZ4PRx6vhhCfbNA/Unc/x+XfiDpaoYx7xuVDdhyKh3f3yotpDQRU9rAp9QKHFjXWyBhO
 x9gDScMeKlRUdNCQDou1VYIuntooHC7eKrfYR5Au8DoKaAsCKeEtbygmnRZ+k6IHICpAZ2
 NmjiO+8HupRYMVgimGA6x84uIOxvhMY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-323-YDXKNcPTNsmtB1atJEVCHg-1; Thu, 02 Mar 2023 11:31:13 -0500
X-MC-Unique: YDXKNcPTNsmtB1atJEVCHg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 25DA51C04349;
 Thu,  2 Mar 2023 16:31:13 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9A7440B3F12;
 Thu,  2 Mar 2023 16:31:10 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>
Subject: [PATCH v2 1/6] docs/about/deprecated: Deprecate the qemu-system-i386
 binary
Date: Thu,  2 Mar 2023 17:31:01 +0100
Message-Id: <20230302163106.465559-2-thuth@redhat.com>
In-Reply-To: <20230302163106.465559-1-thuth@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hardly anybody really requires the i386 binary anymore, since the
qemu-system-x86_64 binary is a proper superset. So let's deprecate
the 32-bit variant now, so that we can finally stop wasting our time
and CI minutes with this.

With regards to 32-bit KVM support in the x86 Linux kernel,
the developers confirmed that they do not need a recent
qemu-system-i386 binary here:

 https://lore.kernel.org/kvm/Y%2ffkTs5ajFy0hP1U@google.com/

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 15084f7bea..11700adac9 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -34,6 +34,18 @@ deprecating the build option and no longer defend it in CI. The
 ``--enable-gcov`` build option remains for analysis test case
 coverage.
 
+``qemu-system-i386`` binary (since 8.0)
+'''''''''''''''''''''''''''''''''''''''
+
+The ``qemu-system-i386`` binary was mainly useful for running with KVM
+on 32-bit x86 hosts, but most Linux distributions already removed their
+support for 32-bit x86 kernels, so hardly anybody still needs this. The
+``qemu-system-x86_64`` binary is a proper superset and can be used to
+run 32-bit guests by selecting a 32-bit CPU model, including KVM support
+on x86_64 hosts. Thus users are recommended to reconfigure their systems
+to use the ``qemu-system-x86_64`` binary instead.
+
+
 System emulator command line arguments
 --------------------------------------
 
-- 
2.31.1


