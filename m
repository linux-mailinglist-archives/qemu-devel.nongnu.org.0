Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E6B3E8C11
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 10:42:42 +0200 (CEST)
Received: from localhost ([::1]:36036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDjov-0007QZ-K5
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 04:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mDjnU-0004lm-Lc
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 04:41:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mDjnT-0007cV-2T
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 04:41:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628671270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bkJuGuEEXYqH2gGhPDMUKGJlcidQ9cI8jMRXKc9FdPg=;
 b=TyUBxXSgrHRW96TaP912Vv6qOgusyDvB9mtzx6sNJ64zXTY0MJ2CuMZIIndERRgq/yTMAr
 EkIdqW8MH4vWk6O1Lnw6l8v+LwiE4WqUXPL10i5n7SDXSspDlxafc8f9sYWg9CNCo1r7vk
 Vl/sTn3Nj0p7IhL6KAcHUH7VEF2r0sI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-kN4VIsBkOpylhIA4AWwc2Q-1; Wed, 11 Aug 2021 04:41:09 -0400
X-MC-Unique: kN4VIsBkOpylhIA4AWwc2Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43B20760C0;
 Wed, 11 Aug 2021 08:41:08 +0000 (UTC)
Received: from thuth.com (reserved-198-128.str.redhat.com [10.33.198.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 088381B5C0;
 Wed, 11 Aug 2021 08:41:06 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	pbonzini@redhat.com
Subject: [PATCH v2 1/6] docs/about/removed-features: Document removed CLI
 options from QEMU v2.12
Date: Wed, 11 Aug 2021 10:40:58 +0200
Message-Id: <20210811084103.74832-2-thuth@redhat.com>
In-Reply-To: <20210811084103.74832-1-thuth@redhat.com>
References: <20210811084103.74832-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
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

These CLI options had been removed/replaced in QEMU v2.12. Still, some
people might want to update from older versions to the recent QEMU version,
so we should give some recommendations for the replacements in our
documentation.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/removed-features.rst | 39 +++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 07d597847c..c18af3c76f 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -9,8 +9,43 @@ trouble after a recent upgrade.
 System emulator command line arguments
 --------------------------------------
 
-``-net ...,name=``\ *name* (removed in 5.1)
-'''''''''''''''''''''''''''''''''''''''''''
+``-hdachs`` (removed in 2.12)
+'''''''''''''''''''''''''''''
+
+The geometry defined by ``-hdachs c,h,s,t`` should now be specified via
+``-device ide-hd,drive=dr,cyls=c,heads=h,secs=s,bios-chs-trans=t``
+(together with ``-drive if=none,id=dr,...``).
+
+``-net channel`` (removed in 2.12)
+''''''''''''''''''''''''''''''''''
+
+This option has been replaced by ``-net user,guestfwd=...``.
+
+``-net dump`` (removed in 2.12)
+'''''''''''''''''''''''''''''''
+
+``-net dump[,vlan=n][,file=filename][,len=maxlen]`` has been replaced by
+``-object filter-dump,id=id,netdev=dev[,file=filename][,maxlen=maxlen]``.
+Note that the new syntax works with netdev IDs instead of the old "vlan" hubs.
+
+``-no-kvm-pit`` (removed in 2.12)
+'''''''''''''''''''''''''''''''''
+
+This was just a dummy option that has been ignored, since the in-kernel PIT
+cannot be disabled separately from the irqchip anymore. A similar effect
+(which also disables the KVM IOAPIC) can be obtained with
+``-M kernel_irqchip=split``.
+
+``-tdf`` (removed in 2.12)
+''''''''''''''''''''''''''
+
+There is no replacement, the ``-tdf`` option has just been ignored since the
+behaviour that could be changed by this option in qemu-kvm is now the default
+when using the KVM PIT. It still can be requested explicitly using
+``-global kvm-pit.lost_tick_policy=delay``.
+
+``-net ...,name=...`` (removed in 5.1)
+''''''''''''''''''''''''''''''''''''''
 
 The ``name`` parameter of the ``-net`` option was a synonym
 for the ``id`` parameter, which should now be used instead.
-- 
2.27.0


