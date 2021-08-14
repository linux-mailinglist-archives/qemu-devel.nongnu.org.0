Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C62553EC0DD
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 08:16:05 +0200 (CEST)
Received: from localhost ([::1]:45924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEmxg-0002Mk-HC
	for lists+qemu-devel@lfdr.de; Sat, 14 Aug 2021 02:16:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mEms8-0006np-Dm
 for qemu-devel@nongnu.org; Sat, 14 Aug 2021 02:10:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mEms6-0004PJ-Vm
 for qemu-devel@nongnu.org; Sat, 14 Aug 2021 02:10:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628921418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H1tCNKAJuItS9bOlpXodEVR/2YMuanOg2cGj/pMW63Q=;
 b=i6K+vx73gYZX0psuXpIOYYNY15Ne9EwWdTBaPBuIiODqRRcHQr9j44fbsQtFu27dsPgHKt
 kA8C/uOSeLerQLQS3ofra1TxBAplOQTMMHrLckd7XKRLPtACOSvPPMf3k2sqIAMJzG2Pb+
 USpD/jWOoRZNOgB06SVaXUPwjMXZ9/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-hNi918YzMP-qT-iCAovbrw-1; Sat, 14 Aug 2021 02:10:15 -0400
X-MC-Unique: hNi918YzMP-qT-iCAovbrw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0780F101C8A0;
 Sat, 14 Aug 2021 06:10:15 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2CC105D9D5;
 Sat, 14 Aug 2021 06:10:14 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 07/11] docs/about/removed-features: Document removed CLI
 options from QEMU v3.0
Date: Sat, 14 Aug 2021 08:09:52 +0200
Message-Id: <20210814060956.12852-8-thuth@redhat.com>
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

These CLI options had been removed/replaced in QEMU v3.0. Still, some
people might want to update from older versions to the recent QEMU version,
so we should give some recommendations for the replacements in our
documentation.

Message-Id: <20210811084103.74832-3-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/removed-features.rst | 35 +++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index c18af3c76f..c4b702968e 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -44,6 +44,41 @@ behaviour that could be changed by this option in qemu-kvm is now the default
 when using the KVM PIT. It still can be requested explicitly using
 ``-global kvm-pit.lost_tick_policy=delay``.
 
+``-drive secs=s``, ``-drive heads=h`` & ``-drive cyls=c`` (removed in 3.0)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The drive geometry should now be specified via
+``-device ...,drive=dr,cyls=c,heads=h,secs=s`` (together with
+``-drive if=none,id=dr,...``).
+
+``-drive serial=``, ``-drive trans=`` & ``-drive addr=`` (removed in 3.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Use ``-device ...,drive=dr,serial=r,bios-chs-trans=t,addr=a`` instead
+(together with ``-drive if=none,id=dr,...``).
+
+``-net ...,vlan=x`` (removed in 3.0)
+''''''''''''''''''''''''''''''''''''
+
+The term "vlan" was very confusing for most users in this context (it's about
+specifying a hub ID, not about IEEE 802.1Q or something similar), so this
+has been removed. To connect one NIC frontend with a network backend, either
+use ``-nic ...`` (e.g. for on-board NICs) or use ``-netdev ...,id=n`` together
+with ``-device ...,netdev=n`` (for full control over pluggable NICs). To
+connect multiple NICs or network backends via a hub device (which is what
+vlan did), use ``-nic hubport,hubid=x,...`` or
+``-netdev hubport,id=n,hubid=x,...`` (with ``-device ...,netdev=n``) instead.
+
+``-no-kvm-irqchip`` (removed in 3.0)
+''''''''''''''''''''''''''''''''''''
+
+Use ``-machine kernel_irqchip=off`` instead.
+
+``-no-kvm-pit-reinjection`` (removed in 3.0)
+''''''''''''''''''''''''''''''''''''''''''''
+
+Use ``-global kvm-pit.lost_tick_policy=discard`` instead.
+
 ``-net ...,name=...`` (removed in 5.1)
 ''''''''''''''''''''''''''''''''''''''
 
-- 
2.27.0


