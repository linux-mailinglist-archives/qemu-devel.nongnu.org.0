Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6603B5D2E
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 13:33:45 +0200 (CEST)
Received: from localhost ([::1]:54652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxpWK-0004xg-KC
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 07:33:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lxpTg-0002a1-MW
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 07:31:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lxpTd-0000mw-O2
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 07:31:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624879857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l90BQnyphvoGcujHSJRQvPGNtWu/W3tVXlVHA0mg2bc=;
 b=SlTaNXMmMVchTtu7AbYeBzuyyTPRVZFUFf6TEWzGn6o9a+230otSrzYtUgn6SbXWoyU4Mc
 Y7bWNjr3S62iFdPFvFqGXAU5WeiEq4cfSc8LmkmiDhx6obbQwUFaFz0GMk4d0KZ/pOz2R4
 h2zbWCXoVW13mEL/LrUwpf8QLOn/DCw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-MDt7rAw4Ocql-qUBcFhOOg-1; Mon, 28 Jun 2021 07:30:55 -0400
X-MC-Unique: MDt7rAw4Ocql-qUBcFhOOg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB5F419057A4;
 Mon, 28 Jun 2021 11:30:54 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-35.ams2.redhat.com
 [10.36.115.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C881360C9F;
 Mon, 28 Jun 2021 11:30:52 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] docs: fix typo s/Intel/AMD/ in CPU model notes
Date: Mon, 28 Jun 2021 12:30:44 +0100
Message-Id: <20210628113047.462498-2-berrange@redhat.com>
In-Reply-To: <20210628113047.462498-1-berrange@redhat.com>
References: <20210628113047.462498-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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
Cc: Andrew Jones <drjones@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "wangyanan \(Y\)" <wangyanan55@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 docs/system/cpu-models-x86.rst.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/cpu-models-x86.rst.inc b/docs/system/cpu-models-x86.rst.inc
index f40ee03ecc..9119f5dff5 100644
--- a/docs/system/cpu-models-x86.rst.inc
+++ b/docs/system/cpu-models-x86.rst.inc
@@ -227,7 +227,7 @@ features are included if using "Host passthrough" or "Host model".
 Preferred CPU models for AMD x86 hosts
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
 
-The following CPU models are preferred for use on Intel hosts.
+The following CPU models are preferred for use on AMD hosts.
 Administrators / applications are recommended to use the CPU model that
 matches the generation of the host CPUs in use. In a deployment with a
 mixture of host CPU models between machines, if live migration
-- 
2.31.1


