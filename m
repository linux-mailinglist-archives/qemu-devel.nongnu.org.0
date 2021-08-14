Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 180733EC0E1
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 08:18:42 +0200 (CEST)
Received: from localhost ([::1]:50546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEn0D-0005Zd-6K
	for lists+qemu-devel@lfdr.de; Sat, 14 Aug 2021 02:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mEmsB-0006ra-A9
 for qemu-devel@nongnu.org; Sat, 14 Aug 2021 02:10:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mEms8-0004Qg-Rr
 for qemu-devel@nongnu.org; Sat, 14 Aug 2021 02:10:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628921419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HhcsdYY6kUJ/SgrdvlnvKOYVRp5EfdM+aR0N963zIFk=;
 b=h7Go/YbTZt0JHDl8IsA6d3SwRTrjTqXB/yaOsIYCixP8nUEPSl3h+rxZAZpC5Bst6sajuk
 PC17cSXuZVHhuvMvq5qY2+pf7XpNm1e6hI8jlwYcRfd5WFaLz5bE0HxEIjtJWo5aWfkmy+
 QCpfc7dF5XY/TbLPp+mHW6SYAxjOIXE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-LI5cZ4XCNquP11Rho8bDmA-1; Sat, 14 Aug 2021 02:10:16 -0400
X-MC-Unique: LI5cZ4XCNquP11Rho8bDmA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17C5287D549;
 Sat, 14 Aug 2021 06:10:16 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F7AD5D9FC;
 Sat, 14 Aug 2021 06:10:15 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 08/11] docs/about/removed-features: Document removed CLI
 options from QEMU v3.1
Date: Sat, 14 Aug 2021 08:09:53 +0200
Message-Id: <20210814060956.12852-9-thuth@redhat.com>
In-Reply-To: <20210814060956.12852-1-thuth@redhat.com>
References: <20210814060956.12852-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These CLI options had been removed/replaced in QEMU v3.1. Still, some
people might want to update from older versions to the recent QEMU version,
so we should give some recommendations for the replacements in our
documentation.

Message-Id: <20210811084103.74832-4-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/removed-features.rst | 67 +++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index c4b702968e..40d2cc4ffa 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -79,6 +79,73 @@ Use ``-machine kernel_irqchip=off`` instead.
 
 Use ``-global kvm-pit.lost_tick_policy=discard`` instead.
 
+``-balloon`` (removed in 3.1)
+'''''''''''''''''''''''''''''
+
+The ``-balloon virtio`` option has been replaced by ``-device virtio-balloon``.
+The ``-balloon none`` option was a no-op and has no replacement.
+
+``-bootp`` (removed in 3.1)
+'''''''''''''''''''''''''''
+
+The ``-bootp /some/file`` argument is replaced by either
+``-netdev user,id=x,bootp=/some/file`` (for pluggable NICs, accompanied with
+``-device ...,netdev=x``), or ``-nic user,bootp=/some/file`` (for on-board NICs).
+The new syntax allows different settings to be provided per NIC.
+
+``-redir`` (removed in 3.1)
+'''''''''''''''''''''''''''
+
+The ``-redir [tcp|udp]:hostport:[guestaddr]:guestport`` option is replaced
+by either ``-netdev
+user,id=x,hostfwd=[tcp|udp]:[hostaddr]:hostport-[guestaddr]:guestport``
+(for pluggable NICs, accompanied with ``-device ...,netdev=x``) or by the option
+``-nic user,hostfwd=[tcp|udp]:[hostaddr]:hostport-[guestaddr]:guestport``
+(for on-board NICs). The new syntax allows different settings to be provided
+per NIC.
+
+``-smb`` (removed in 3.1)
+'''''''''''''''''''''''''
+
+The ``-smb /some/dir`` argument is replaced by either
+``-netdev user,id=x,smb=/some/dir`` (for pluggable NICs, accompanied with
+``-device ...,netdev=x``), or ``-nic user,smb=/some/dir`` (for on-board NICs).
+The new syntax allows different settings to be provided per NIC.
+
+``-tftp`` (removed in 3.1)
+''''''''''''''''''''''''''
+
+The ``-tftp /some/dir`` argument is replaced by either
+``-netdev user,id=x,tftp=/some/dir`` (for pluggable NICs, accompanied with
+``-device ...,netdev=x``), or ``-nic user,tftp=/some/dir`` (for embedded NICs).
+The new syntax allows different settings to be provided per NIC.
+
+``-localtime`` (removed in 3.1)
+'''''''''''''''''''''''''''''''
+
+Replaced by ``-rtc base=localtime``.
+
+``-nodefconfig`` (removed in 3.1)
+'''''''''''''''''''''''''''''''''
+
+Use ``-no-user-config`` instead.
+
+``-rtc-td-hack`` (removed in 3.1)
+'''''''''''''''''''''''''''''''''
+
+Use ``-rtc driftfix=slew`` instead.
+
+``-startdate`` (removed in 3.1)
+'''''''''''''''''''''''''''''''
+
+Replaced by ``-rtc base=date``.
+
+``-vnc ...,tls=...``, ``-vnc ...,x509=...`` & ``-vnc ...,x509verify=...``
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The "tls-creds" option should be used instead to point to a "tls-creds-x509"
+object created using "-object".
+
 ``-net ...,name=...`` (removed in 5.1)
 ''''''''''''''''''''''''''''''''''''''
 
-- 
2.27.0


