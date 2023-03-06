Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1416AC0F4
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:30:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZAvL-0002H0-Pz; Mon, 06 Mar 2023 08:30:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZAus-0002DC-3Q
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:30:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pZAuq-0007Se-F6
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:30:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678109411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dU6+qv0UcWDwkP6bN+TjXZd2hebGsXxnHQ2DJ1WX2nU=;
 b=iB9z54kacW7YoCSZZ32RW5Eo+nQKMeFHwh1wUU4Qx0eq68gcidJ5x+Hju2PucPTRQYRunz
 aAqYDJseTaDYT5WH6ferd+GYi3pH3trMS7tdiuTs7eT+5fF0vzfcdKZNQegruuE+0F/l/F
 ElqbqbKf6Kgy/U6m70u/clRM1BP3WYU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-tjjs29M3NF2tpbAyrbAR3g-1; Mon, 06 Mar 2023 08:30:10 -0500
X-MC-Unique: tjjs29M3NF2tpbAyrbAR3g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47AA4100F908;
 Mon,  6 Mar 2023 13:30:10 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0B9D40C10FA;
 Mon,  6 Mar 2023 13:30:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 07/16] docs/about/deprecated: Deprecate 32-bit arm hosts for
 system emulation
Date: Mon,  6 Mar 2023 14:29:53 +0100
Message-Id: <20230306133002.418421-8-thuth@redhat.com>
In-Reply-To: <20230306133002.418421-1-thuth@redhat.com>
References: <20230306133002.418421-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

For running QEMU in system emulation mode, the user needs a rather
strong host system, i.e. not only an embedded low-frequency controller.
All recent beefy arm host machines should support 64-bit now, it's
unlikely that anybody is still seriously using QEMU on a 32-bit arm
CPU, so we deprecate the 32-bit arm hosts here to finally save use
some time and precious CI minutes.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Message-Id: <20230306084658.29709-5-thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 1ca9dc33d6..7cf6e14614 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -206,6 +206,15 @@ be an effective use of its limited resources, and thus intends to discontinue
 it. Since all recent x86 hardware from the past >10 years is capable of the
 64-bit x86 extensions, a corresponding 64-bit OS should be used instead.
 
+System emulation on 32-bit arm hosts (since 8.0)
+''''''''''''''''''''''''''''''''''''''''''''''''
+
+Since QEMU needs a strong host machine for running full system emulation, and
+all recent powerful arm hosts support 64-bit, the QEMU project deprecates the
+support for running any system emulation on 32-bit arm hosts in general. Use
+64-bit arm hosts for system emulation instead. (Note: "user" mode emulation
+continuous to be supported on 32-bit arm hosts, too)
+
 
 QEMU API (QAPI) events
 ----------------------
-- 
2.31.1


