Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2293EC0D8
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Aug 2021 08:12:49 +0200 (CEST)
Received: from localhost ([::1]:60020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEmuW-0001Om-DV
	for lists+qemu-devel@lfdr.de; Sat, 14 Aug 2021 02:12:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mEms7-0006nb-5x
 for qemu-devel@nongnu.org; Sat, 14 Aug 2021 02:10:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mEms5-0004NE-BI
 for qemu-devel@nongnu.org; Sat, 14 Aug 2021 02:10:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628921416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0dY6WaGDr2ZRdRvbmma//qXTHJLBwkJp3/TuXyumrAI=;
 b=h+dovHlRq+uV9BYN3mOrM+5gMg5hfn1n1UmvBMli/AaK+6x/13TkxIv7tTq3stpByihfSq
 H5m0z0z6mQE08JF0hlSOV3HBh1QDFsnapp9K85fREzmHAy4W8/79/kpWsQLBme0wAapuMa
 CWEJmhosO/mXjFkl63k0sCtm5K05GVk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-_P_OIzZwO027mr_P3tx13g-1; Sat, 14 Aug 2021 02:10:14 -0400
X-MC-Unique: _P_OIzZwO027mr_P3tx13g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D410787D544;
 Sat, 14 Aug 2021 06:10:13 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E97875D9D5;
 Sat, 14 Aug 2021 06:10:12 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 06/11] docs/about/removed-features: Document removed CLI
 options from QEMU v2.12
Date: Sat, 14 Aug 2021 08:09:51 +0200
Message-Id: <20210814060956.12852-7-thuth@redhat.com>
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

These CLI options had been removed/replaced in QEMU v2.12. Still, some
people might want to update from older versions to the recent QEMU version,
so we should give some recommendations for the replacements in our
documentation.

Message-Id: <20210811084103.74832-2-thuth@redhat.com>
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


