Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2685F6AB8C2
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 09:48:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ6VY-0006xW-C4; Mon, 06 Mar 2023 03:47:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZ6V2-0006uu-17
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 03:47:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZ6Uy-00067X-LM
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 03:47:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678092432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=37MyqIGrJ8NDqQYDY+IFgkqLJhkh+Oz/+/sGdhCxVu4=;
 b=F5jl5nqqbGZgIyXayYl+h8fC0zTEUfF8fd5QitER3o9i4Vtv6kLWzGHRwW5E8wTCj9GAMh
 FqE5unG36gfTsP/T2bI2fdPpOB+5DpnlzA6/FglC7UClbHW3Y76guM16LEG8S8E+cuPNo6
 s0Z9ggoqjPD0SKMwvgevl3srKNwZ+AE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-NkXWXKrvNS6cNOE-ISoWlA-1; Mon, 06 Mar 2023 03:47:08 -0500
X-MC-Unique: NkXWXKrvNS6cNOE-ISoWlA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 027C487A391;
 Mon,  6 Mar 2023 08:47:08 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC35A175AD;
 Mon,  6 Mar 2023 08:47:05 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: [PATCH v4 2/5] docs/about/deprecated: Deprecate the qemu-system-i386
 binary
Date: Mon,  6 Mar 2023 09:46:55 +0100
Message-Id: <20230306084658.29709-3-thuth@redhat.com>
In-Reply-To: <20230306084658.29709-1-thuth@redhat.com>
References: <20230306084658.29709-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

Aside from not supporting KVM on 32-bit hosts, the qemu-system-x86_64
binary is a proper superset of the qemu-system-i386 binary. With the
32-bit host support being deprecated, it is now also possible to
deprecate the qemu-system-i386 binary.

With regards to 32-bit KVM support in the x86 Linux kernel,
the developers confirmed that they do not need a recent
qemu-system-i386 binary here:

 https://lore.kernel.org/kvm/Y%2ffkTs5ajFy0hP1U@google.com/

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 1ca9dc33d6..c4fcc6b33c 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -34,6 +34,20 @@ deprecating the build option and no longer defend it in CI. The
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
+to use the ``qemu-system-x86_64`` binary instead. If a 32-bit CPU guest
+environment should be enforced, you can switch off the "long mode" CPU
+flag, e.g. with ``-cpu max,lm=off``.
+
+
 System emulator command line arguments
 --------------------------------------
 
-- 
2.31.1


