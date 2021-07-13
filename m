Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 306423C74A0
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 18:34:38 +0200 (CEST)
Received: from localhost ([::1]:38076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3LMj-0005VU-71
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 12:34:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3LJG-00061E-KA
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:31:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m3LJE-0006Qz-5n
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 12:31:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626193859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=54jzWDH0rmayboNsH5snM/GCZMQ13iGyrjAmAAagVHo=;
 b=gFlU+C0yUUjxuUBJye+9wmH3VCxx/51oFpAIwAA9Y+as9cx9tQ6Ab8gEuB6H+g9ccjRakP
 El/zFebqZ1adwpy6SgqjerhczhM4013xokTuD+jwu45YBxHD5Y0t6z+/0pjXU7/0Pe7BrM
 bS54Pm/+3DyI4BfyBAJPpfR/6pAtwEE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-FucOSBqCOF-KduvGtjyc5Q-1; Tue, 13 Jul 2021 12:30:58 -0400
X-MC-Unique: FucOSBqCOF-KduvGtjyc5Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCBE718414A0;
 Tue, 13 Jul 2021 16:30:56 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-113-1.ams2.redhat.com
 [10.36.113.1])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A4A7E60C05;
 Tue, 13 Jul 2021 16:30:54 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] docs: fix typo s/Intel/AMD/ in CPU model notes
Date: Tue, 13 Jul 2021 17:30:48 +0100
Message-Id: <20210713163051.2133045-2-berrange@redhat.com>
In-Reply-To: <20210713163051.2133045-1-berrange@redhat.com>
References: <20210713163051.2133045-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
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


