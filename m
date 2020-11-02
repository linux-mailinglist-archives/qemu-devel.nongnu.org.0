Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6062A25F3
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Nov 2020 09:18:26 +0100 (CET)
Received: from localhost ([::1]:45314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kZV2n-0007qK-V5
	for lists+qemu-devel@lfdr.de; Mon, 02 Nov 2020 03:18:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kZV0V-0006V1-PJ
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 03:16:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kZV0U-0005kR-1X
 for qemu-devel@nongnu.org; Mon, 02 Nov 2020 03:16:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604304960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rpMyzUcOPK6RVXohSIf6XEJEbeNM2FEsvATa+Qe26/o=;
 b=hns2Anl0SSxViCg1kb5a7tcTqoUtwrTUP3+DKVN0LpS52wBJQZyjca98Rb/VIcsY8fjjYW
 IrYOkHI9+Gk97itmupbbxqnhp5BSIn67GapTsqjP+ea5ArSgsvQHI6C/1mooqqIMOIoQtz
 SjUkIsNUk6CMcjk1YY9n4IjUWfnIQcI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-0S-Z74O_Nam8cYI3g5R5hg-1; Mon, 02 Nov 2020 03:15:59 -0500
X-MC-Unique: 0S-Z74O_Nam8cYI3g5R5hg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36A951018F81
 for <qemu-devel@nongnu.org>; Mon,  2 Nov 2020 08:15:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 73C57109F1AF;
 Mon,  2 Nov 2020 08:15:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E1E7911329AB; Mon,  2 Nov 2020 09:15:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] MAINTAINERS: Add QAPI schema modules to their subsystems
Date: Mon,  2 Nov 2020 09:15:49 +0100
Message-Id: <20201102081550.171061-2-armbru@redhat.com>
In-Reply-To: <20201102081550.171061-1-armbru@redhat.com>
References: <20201102081550.171061-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/02 03:02:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the relevant QAPI schema modules to section Audio, QMP, Tracing,
Cryptography.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8c744a9bdf..b4b6b36542 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1907,6 +1907,7 @@ Rocker
 M: Jiri Pirko <jiri@resnulli.us>
 S: Maintained
 F: hw/net/rocker/
+F: qapi/rocker.json
 F: tests/rocker/
 F: docs/specs/rocker.txt
 
@@ -2109,6 +2110,7 @@ S: Maintained
 F: audio/
 F: hw/audio/
 F: include/hw/audio/
+F: qapi/audio.json
 F: tests/qtest/ac97-test.c
 F: tests/qtest/es1370-test.c
 F: tests/qtest/intel-hda-test.c
@@ -2488,7 +2490,9 @@ F: monitor/monitor-internal.h
 F: monitor/qmp*
 F: monitor/misc.c
 F: monitor/monitor.c
+F: qapi/control.json
 F: qapi/error.json
+F: qapi/introspect.json
 F: docs/devel/*qmp-*
 F: docs/interop/*qmp-*
 F: scripts/qmp/
@@ -2549,6 +2553,7 @@ S: Maintained
 F: trace/
 F: trace-events
 F: docs/qemu-option-trace.rst.inc
+F: qapi/trace.json
 F: scripts/tracetool.py
 F: scripts/tracetool/
 F: scripts/qemu-trace-stap*
@@ -2608,6 +2613,7 @@ M: Daniel P. Berrange <berrange@redhat.com>
 S: Maintained
 F: crypto/
 F: include/crypto/
+F: qapi/crypto.json
 F: tests/test-crypto-*
 F: tests/benchmark-crypto-*
 F: tests/crypto-tls-*
-- 
2.26.2


