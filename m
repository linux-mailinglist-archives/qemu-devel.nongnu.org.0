Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E4B372338
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 00:50:32 +0200 (CEST)
Received: from localhost ([::1]:53690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhOZ-0000bq-97
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 18:50:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1ldhIQ-0002Zd-1Y
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:44:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1ldhIG-0007K3-Ma
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:44:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620081839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KBxptsirqWb42qHL38h+a1bt+GldxVZqVHh2gUbIJ8Y=;
 b=hUKXp0FM3tIfqGHKzTyy90dWXVliOKap+v25LK4ZPQ2Y1hP0KwoEOKe5cdxH3L5/AfQxA4
 R0/r+vr2cKWCL5lWueasxRmGwZePoAEXeKmzqFyz9u9HW6N9j2ioS7dX4J99H0kJAPMbro
 pu2d+vP24EY1dCV8X87Nn6mm4+MJYW8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-kxiLUSQ1PAmh6tTiFPvzNw-1; Mon, 03 May 2021 18:43:57 -0400
X-MC-Unique: kxiLUSQ1PAmh6tTiFPvzNw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB01C107ACCA
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 22:43:56 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-116-131.gru2.redhat.com
 [10.97.116.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0B17E60937;
 Mon,  3 May 2021 22:43:50 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] tests/acceptance: Sun4uMachine: Remove dependency to
 LinuxKernelTest
Date: Mon,  3 May 2021 19:43:23 -0300
Message-Id: <20210503224326.206208-5-wainersm@redhat.com>
In-Reply-To: <20210503224326.206208-1-wainersm@redhat.com>
References: <20210503224326.206208-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: willianr@redhat.com, philmd@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Sun4uMachine class inherit from LinuxKernelTest to effectively only use
the KERNEL_COMMON_COMMAND_LINE attribute. This change remove that unneeded
dependency, making Sun4uMachine self-content.

I took the occasion to delint the code: the unused os import was
removed, imports were reordered, and the module has a docstring now.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 tests/acceptance/machine_sparc64_sun4u.py | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/tests/acceptance/machine_sparc64_sun4u.py b/tests/acceptance/machine_sparc64_sun4u.py
index 458165500e..c7ad474bdc 100644
--- a/tests/acceptance/machine_sparc64_sun4u.py
+++ b/tests/acceptance/machine_sparc64_sun4u.py
@@ -1,4 +1,4 @@
-# Functional test that boots a Linux kernel and checks the console
+"""Functional test that boots a Linux kernel and checks the console"""
 #
 # Copyright (c) 2020 Red Hat, Inc.
 #
@@ -8,16 +8,15 @@
 # This work is licensed under the terms of the GNU GPL, version 2 or
 # later. See the COPYING file in the top-level directory.
 
-import os
-
-from avocado_qemu import wait_for_console_pattern
 from avocado.utils import archive
-from boot_linux_console import LinuxKernelTest
+from avocado_qemu import Test
+from avocado_qemu import wait_for_console_pattern
 
-class Sun4uMachine(LinuxKernelTest):
+class Sun4uMachine(Test):
     """Boots the Linux kernel and checks that the console is operational"""
 
     timeout = 90
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
 
     def test_sparc64_sun4u(self):
         """
-- 
2.29.2


