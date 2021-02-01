Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 168B530B2FF
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 23:56:19 +0100 (CET)
Received: from localhost ([::1]:33654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6i7G-0007Ns-5c
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 17:56:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l6i5G-00064G-Qd
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 17:54:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1l6i5D-000245-DU
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 17:54:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612220050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=az4sdLdgyiV9UN1GjEJmlcUXtom4ZZy7Mb5kEaY5AdI=;
 b=A1jQkTnD5xBfgh8EmQ3WcZkN6XqYru6Wz4E1jX6gEnuMJ/oYggGKyx4pek8vbwdplTZ1lj
 Nd1cm7HdxLaABvbkvhWA04xitTDdJFVZ/Y8P8sNsU1ad3Zn9XYDgzxITnyz11Pd4+woujH
 fi0Qni9EN3CTnBKY7MFwWQpaT4mkCCI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200--QQCP0EYMge3drSu5aY99g-1; Mon, 01 Feb 2021 17:54:08 -0500
X-MC-Unique: -QQCP0EYMge3drSu5aY99g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92B8D59;
 Mon,  1 Feb 2021 22:54:07 +0000 (UTC)
Received: from localhost (ovpn-3-197.rdu2.redhat.com [10.22.3.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52A0D5C1A1;
 Mon,  1 Feb 2021 22:54:07 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] i386: Add missing "vmx-ept-wb" feature name
Date: Mon,  1 Feb 2021 17:54:02 -0500
Message-Id: <20210201225404.3941395-2-ehabkost@redhat.com>
In-Reply-To: <20210201225404.3941395-1-ehabkost@redhat.com>
References: <20210201225404.3941395-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Babu Moger <babu.moger@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Not having a feature name in feature_word_info breaks error
reporting and query-cpu-model-expansion.  Add the missing feature
name to feature_word_info[FEAT_VMX_EPT_VPID_CAPS].feat_names[14].

Fixes: 0723cc8a5558 ("target/i386: add VMX features to named CPU models")
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ae89024d366..2bf3ab78056 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -1262,7 +1262,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
             "vmx-ept-execonly", NULL, NULL, NULL,
             NULL, NULL, "vmx-page-walk-4", "vmx-page-walk-5",
             NULL, NULL, NULL, NULL,
-            NULL, NULL, NULL, NULL,
+            NULL, NULL, "vmx-ept-wb", NULL,
             "vmx-ept-2mb", "vmx-ept-1gb", NULL, NULL,
             "vmx-invept", "vmx-eptad", "vmx-ept-advanced-exitinfo", NULL,
             NULL, "vmx-invept-single-context", "vmx-invept-all-context", NULL,
-- 
2.28.0


