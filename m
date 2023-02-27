Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9E76A403E
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:12:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWbPO-0001S9-DU; Mon, 27 Feb 2023 06:11:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWbPM-0001RV-DE
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:11:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWbPK-0000nq-O7
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:11:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677496261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wU7XSs59OHmkrBANt2Ig03ayelNixYK5a46ZpJhqPYA=;
 b=Odrd57fuhDhIUT+pE6rvXYS1iiIxWCo/up6d7W1Loz5Ox3uQhcHZ0cgReVd0G5t0RAK3+u
 PpyzGZvVV2sod3ps344yQOUg1A2n3MTcEZbLguZxy40OI+0CB+MoAC1JjLZgMOjVNPVLCa
 6GDWT5753fMd+UZaGYdIhz+mLcpjzkg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-gGMehePCNs6EjNRatlKlsA-1; Mon, 27 Feb 2023 06:10:58 -0500
X-MC-Unique: gGMehePCNs6EjNRatlKlsA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E28DB3C10682;
 Mon, 27 Feb 2023 11:10:57 +0000 (UTC)
Received: from thuth.com (unknown [10.45.227.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FFFB40C6EC4;
 Mon, 27 Feb 2023 11:10:55 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
 libvir-list@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 1/2] docs/about: Deprecate 32-bit x86 hosts and
 qemu-system-i386
Date: Mon, 27 Feb 2023 12:10:49 +0100
Message-Id: <20230227111050.54083-2-thuth@redhat.com>
In-Reply-To: <20230227111050.54083-1-thuth@redhat.com>
References: <20230227111050.54083-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

Hardly anybody still uses 32-bit x86 hosts today, so we should
start deprecating them to finally have less test efforts.
With regards to 32-bit KVM support in the x86 Linux kernel,
the developers confirmed that they do not need a recent
qemu-system-i386 binary here:

 https://lore.kernel.org/kvm/Y%2ffkTs5ajFy0hP1U@google.com/

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 15084f7bea..98517f5187 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -196,6 +196,19 @@ CI coverage support may bitrot away before the deprecation process
 completes. The little endian variants of MIPS (both 32 and 64 bit) are
 still a supported host architecture.
 
+32-bit x86 hosts and ``qemu-system-i386`` (since 8.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Testing 32-bit x86 host OS support takes a lot of precious time during the
+QEMU contiguous integration tests, and considering that most OS vendors
+stopped shipping 32-bit variants of their x86 OS distributions and most
+x86 hardware from the past >10 years is capable of 64-bit, keeping the
+32-bit support alive is an inadequate burden for the QEMU project. Thus
+QEMU will soon drop the support for 32-bit x86 host systems and the
+``qemu-system-i386`` binary. Use ``qemu-system-x86_64`` (which is a proper
+superset of ``qemu-system-i386``) on a 64-bit host machine instead.
+
+
 QEMU API (QAPI) events
 ----------------------
 
-- 
2.31.1


