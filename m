Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E64EA3F7415
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 13:08:41 +0200 (CEST)
Received: from localhost ([::1]:46928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqls-0002tC-UI
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 07:08:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mIqe5-0007yn-Kq
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 07:00:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mIqe3-0004lK-AF
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 07:00:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629889234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bzq6iZWC3RUvSniMXJvrslApm8yLzaYYlXZvBru7tvs=;
 b=ddT0lEFMpY5XQDZpO7tMFwaHp+BTlJDkSJL2ZSPBiliaJDMeX5mhSk+n5Orj6hE00foUOv
 hu4oYpXWUpOS77vM/o+nAdNTXLneamoG4X+Q/8ic21b72IClHPEdM7apMrH+6sZfL1vmrZ
 4cQug1mMPmrlpc5kJAN53VztsE54E40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-vXYBPbcIPIWHp9IPdBD7Yg-1; Wed, 25 Aug 2021 07:00:32 -0400
X-MC-Unique: vXYBPbcIPIWHp9IPdBD7Yg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEE198799EB;
 Wed, 25 Aug 2021 11:00:31 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C84BA5D741;
 Wed, 25 Aug 2021 11:00:30 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 4/6] docs/about/removed-features: Move some CLI options to the
 right location
Date: Wed, 25 Aug 2021 13:00:16 +0200
Message-Id: <20210825110018.100913-5-thuth@redhat.com>
In-Reply-To: <20210825110018.100913-1-thuth@redhat.com>
References: <20210825110018.100913-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
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

Some of the removed CLI options have been added to the wrong section
in the "Removed features" chapter - they've been put into the
"Related binaries" section instead. Move them now into the correct
"System emulator command line arguments" section.

Message-Id: <20210818112908.102205-1-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/removed-features.rst | 124 ++++++++++++++++----------------
 1 file changed, 61 insertions(+), 63 deletions(-)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 8feeead449..08f9e625ce 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -146,12 +146,73 @@ Replaced by ``-rtc base=date``.
 The "tls-creds" option should be used instead to point to a "tls-creds-x509"
 object created using "-object".
 
+``-mem-path`` fallback to RAM (removed in 5.0)
+''''''''''''''''''''''''''''''''''''''''''''''
+
+If guest RAM allocation from file pointed by ``mem-path`` failed,
+QEMU was falling back to allocating from RAM, which might have resulted
+in unpredictable behavior since the backing file specified by the user
+as ignored. Currently, users are responsible for making sure the backing storage
+specified with ``-mem-path`` can actually provide the guest RAM configured with
+``-m`` and QEMU fails to start up if RAM allocation is unsuccessful.
+
 ``-net ...,name=...`` (removed in 5.1)
 ''''''''''''''''''''''''''''''''''''''
 
 The ``name`` parameter of the ``-net`` option was a synonym
 for the ``id`` parameter, which should now be used instead.
 
+``-numa node,mem=...`` (removed in 5.1)
+'''''''''''''''''''''''''''''''''''''''
+
+The parameter ``mem`` of ``-numa node`` was used to assign a part of guest RAM
+to a NUMA node. But when using it, it's impossible to manage a specified RAM
+chunk on the host side (like bind it to a host node, setting bind policy, ...),
+so the guest ends up with the fake NUMA configuration with suboptiomal
+performance.
+However since 2014 there is an alternative way to assign RAM to a NUMA node
+using parameter ``memdev``, which does the same as ``mem`` and adds
+means to actually manage node RAM on the host side. Use parameter ``memdev``
+with *memory-backend-ram* backend as replacement for parameter ``mem``
+to achieve the same fake NUMA effect or a properly configured
+*memory-backend-file* backend to actually benefit from NUMA configuration.
+New machine versions (since 5.1) will not accept the option but it will still
+work with old machine types. User can check the QAPI schema to see if the legacy
+option is supported by looking at MachineInfo::numa-mem-supported property.
+
+``-numa`` node (without memory specified) (removed in 5.2)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Splitting RAM by default between NUMA nodes had the same issues as ``mem``
+parameter with the difference that the role of the user plays QEMU using
+implicit generic or board specific splitting rule.
+Use ``memdev`` with *memory-backend-ram* backend or ``mem`` (if
+it's supported by used machine type) to define mapping explicitly instead.
+Users of existing VMs, wishing to preserve the same RAM distribution, should
+configure it explicitly using ``-numa node,memdev`` options. Current RAM
+distribution can be retrieved using HMP command ``info numa`` and if separate
+memory devices (pc|nv-dimm) are present use ``info memory-device`` and subtract
+device memory from output of ``info numa``.
+
+``-smp`` (invalid topologies) (removed in 5.2)
+''''''''''''''''''''''''''''''''''''''''''''''
+
+CPU topology properties should describe whole machine topology including
+possible CPUs.
+
+However, historically it was possible to start QEMU with an incorrect topology
+where *n* <= *sockets* * *cores* * *threads* < *maxcpus*,
+which could lead to an incorrect topology enumeration by the guest.
+Support for invalid topologies is removed, the user must ensure
+topologies described with -smp include all possible cpus, i.e.
+*sockets* * *cores* * *threads* = *maxcpus*.
+
+``-machine enforce-config-section=on|off`` (removed in 5.2)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The ``enforce-config-section`` property was replaced by the
+``-global migration.send-configuration={on|off}`` option.
+
 ``-no-kvm`` (removed in 5.2)
 ''''''''''''''''''''''''''''
 
@@ -590,69 +651,6 @@ enforce that any failure to open the backing image (including if the
 backing file is missing or an incorrect format was specified) is an
 error when ``-u`` is not used.
 
-Command line options
---------------------
-
-``-smp`` (invalid topologies) (removed in 5.2)
-''''''''''''''''''''''''''''''''''''''''''''''
-
-CPU topology properties should describe whole machine topology including
-possible CPUs.
-
-However, historically it was possible to start QEMU with an incorrect topology
-where *n* <= *sockets* * *cores* * *threads* < *maxcpus*,
-which could lead to an incorrect topology enumeration by the guest.
-Support for invalid topologies is removed, the user must ensure
-topologies described with -smp include all possible cpus, i.e.
-*sockets* * *cores* * *threads* = *maxcpus*.
-
-``-numa`` node (without memory specified) (removed in 5.2)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-Splitting RAM by default between NUMA nodes had the same issues as ``mem``
-parameter with the difference that the role of the user plays QEMU using
-implicit generic or board specific splitting rule.
-Use ``memdev`` with *memory-backend-ram* backend or ``mem`` (if
-it's supported by used machine type) to define mapping explicitly instead.
-Users of existing VMs, wishing to preserve the same RAM distribution, should
-configure it explicitly using ``-numa node,memdev`` options. Current RAM
-distribution can be retrieved using HMP command ``info numa`` and if separate
-memory devices (pc|nv-dimm) are present use ``info memory-device`` and subtract
-device memory from output of ``info numa``.
-
-``-numa node,mem=``\ *size* (removed in 5.1)
-''''''''''''''''''''''''''''''''''''''''''''
-
-The parameter ``mem`` of ``-numa node`` was used to assign a part of
-guest RAM to a NUMA node. But when using it, it's impossible to manage a specified
-RAM chunk on the host side (like bind it to a host node, setting bind policy, ...),
-so the guest ends up with the fake NUMA configuration with suboptiomal performance.
-However since 2014 there is an alternative way to assign RAM to a NUMA node
-using parameter ``memdev``, which does the same as ``mem`` and adds
-means to actually manage node RAM on the host side. Use parameter ``memdev``
-with *memory-backend-ram* backend as replacement for parameter ``mem``
-to achieve the same fake NUMA effect or a properly configured
-*memory-backend-file* backend to actually benefit from NUMA configuration.
-New machine versions (since 5.1) will not accept the option but it will still
-work with old machine types. User can check the QAPI schema to see if the legacy
-option is supported by looking at MachineInfo::numa-mem-supported property.
-
-``-mem-path`` fallback to RAM (removed in 5.0)
-''''''''''''''''''''''''''''''''''''''''''''''
-
-If guest RAM allocation from file pointed by ``mem-path`` failed,
-QEMU was falling back to allocating from RAM, which might have resulted
-in unpredictable behavior since the backing file specified by the user
-as ignored. Currently, users are responsible for making sure the backing storage
-specified with ``-mem-path`` can actually provide the guest RAM configured with
-``-m`` and QEMU fails to start up if RAM allocation is unsuccessful.
-
-``-machine enforce-config-section=on|off`` (removed in 5.2)
-'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-The ``enforce-config-section`` property was replaced by the
-``-global migration.send-configuration={on|off}`` option.
-
 qemu-img amend to adjust backing file (removed in 6.1)
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
-- 
2.27.0


