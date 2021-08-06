Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD503E2D49
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 17:12:17 +0200 (CEST)
Received: from localhost ([::1]:35634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC1WC-0002TZ-On
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 11:12:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mC1UV-0008AA-Id
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 11:10:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mC1UT-0008KB-Ue
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 11:10:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628262629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T7AP2ihtGZdlD/w745gzAIAF7rJhlHSrJ5tDVk5RkxY=;
 b=FimaqoXnBa6YKxMehpvZhB2Iv2yR+tKL70w9KxMl5d23Y5TNdGVazCx2ouLoj7FDVpcMIg
 chZR0OoNVXPtVNlayxpUavH9T7cEX0/MX2K+bV9h9s9ZJN2SqmJ2kobROmy9r8GxL1XB/H
 OwtIgiuWO9/rOxHqGtcioTbZlKJYCEI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-ysiX4C2eO6KujaE5ncz2Sw-1; Fri, 06 Aug 2021 11:10:27 -0400
X-MC-Unique: ysiX4C2eO6KujaE5ncz2Sw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA8EE190B2A1;
 Fri,  6 Aug 2021 15:10:26 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C809318AD4;
 Fri,  6 Aug 2021 15:10:25 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/6] docs/about/removed-features: Document removed CLI options
 from QEMU v3.1
Date: Fri,  6 Aug 2021 17:10:09 +0200
Message-Id: <20210806151012.103108-4-thuth@redhat.com>
In-Reply-To: <20210806151012.103108-1-thuth@redhat.com>
References: <20210806151012.103108-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These CLI options had been removed/replaced in QEMU v3.1. Still, some
people might want to update from older versions to the recent QEMU version,
so we should give some recommendations for the replacements in our
documentation.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/removed-features.rst | 66 +++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index c8fa0faadd..af4f286f73 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -77,6 +77,72 @@ Use ``-machine kernel_irqchip=off`` instead.
 
 Use ``-global kvm-pit.lost_tick_policy=discard`` instead.
 
+``-balloon`` (removed in 3.1)
+'''''''''''''''''''''''''''''
+
+The ``-balloon option`` has been replaced by ``-device virtio-balloon``.
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


