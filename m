Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AEC3C861F
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 16:27:20 +0200 (CEST)
Received: from localhost ([::1]:52514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3fr5-00068V-Dx
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 10:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3fdp-0001DW-V4
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:13:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3fdm-00012J-Tx
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 10:13:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626272014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wwTF4pLPQDzIxRPMede2nLTlrrmx85HvFIv+DrT1nCA=;
 b=T5SR/0kPPCs3UsuhUFUsZc19/s0RaRThWsgIF4z/WGnb3JSaTQswX0h0v8xpJMY4jcTc3Z
 Vko0ZOYcYbJ1P1Xrmqf1dMi1TZUu4gl6HTNkLO/iIl7MXe5aG2hrsW1aP0UG++jUDm5wQg
 +siNLmHZa+5hR3CTUccdCZb7teaji3o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-xwzUvY9NPf6FW8wcK-SX4A-1; Wed, 14 Jul 2021 10:13:32 -0400
X-MC-Unique: xwzUvY9NPf6FW8wcK-SX4A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EEAC8CE4A8;
 Wed, 14 Jul 2021 14:12:49 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-160.ams2.redhat.com
 [10.36.114.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51A2E69CB4;
 Wed, 14 Jul 2021 14:12:46 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/26] qemu-options: rewrite help for -smp options
Date: Wed, 14 Jul 2021 15:08:58 +0100
Message-Id: <20210714140858.2247409-27-berrange@redhat.com>
In-Reply-To: <20210714140858.2247409-1-berrange@redhat.com>
References: <20210714140858.2247409-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Eduardo Otubo <otubo@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 Gerd Hoffmann <kraxel@redhat.com>, Pankaj Gupta <pankaj.gupta@ionos.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The -smp option help is peculiarly specific about mentioning the CPU
upper limits, but these are wrong. The "PC" target has varying max
CPU counts depending on the machine type picked. Notes about guest
OS limits are inappropriate for QEMU docs. There are way too many
machine types for it to be practical to mention actual limits, and
some limits are even modified by downstream distribtions. Thus it
is better to remove the specific limits entirely.

The CPU topology reporting is also not neccessarily specific to the
PC platform and descriptions around the rules of usage are somewhat
terse. Expand this information with some examples to show effects
of defaulting.

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 qemu-options.hx | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 14ff35dd4e..214c477dcc 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -207,14 +207,27 @@ DEF("smp", HAS_ARG, QEMU_OPTION_smp,
         QEMU_ARCH_ALL)
 SRST
 ``-smp [[cpus=]n][,maxcpus=maxcpus][,sockets=sockets][,dies=dies][,cores=cores][,threads=threads]``
-    Simulate an SMP system with n CPUs. On the PC target, up to 255 CPUs
-    are supported. On Sparc32 target, Linux limits the number of usable
-    CPUs to 4. For the PC target, the number of cores per die, the
-    number of threads per cores, the number of dies per packages and the
-    total number of sockets can be specified. Missing values will be
-    computed. If any on the three values is given, the total number of
-    CPUs n can be omitted. maxcpus specifies the maximum number of
-    hotpluggable CPUs.
+    Simulate a SMP system with '\ ``n``\ ' CPUs initially present on
+    the machine type board. On boards supporting CPU hotplug, the optional
+    '\ ``maxcpus``\ ' parameter can be set to enable further CPUs to be
+    added at runtime. If omitted the maximum number of CPUs will be
+    set to match the initial CPU count. Both parameters are subject to
+    an upper limit that is determined by the specific machine type chosen.
+
+    To control reporting of CPU topology information, the number of sockets,
+    dies per socket, cores per die, and threads per core can be specified.
+    The sum `` sockets * cores * dies * threads `` must be equal to the
+    maximum CPU count. CPU targets may only support a subset of the topology
+    parameters. Where a CPU target does not support use of a particular
+    topology parameter, its value should be assumed to be 1 for the purpose
+    of computing the CPU maximum count.
+
+    Either the initial CPU count, or at least one of the topology parameters
+    must be specified. Values for any omitted parameters will be computed
+    from those which are given. Historically preference was given to the
+    coarsest topology parameters when computing missing values (ie sockets
+    preferred over cores, which were preferred over threads), however, this
+    behaviour is considered liable to change.
 ERST
 
 DEF("numa", HAS_ARG, QEMU_OPTION_numa,
-- 
2.31.1


