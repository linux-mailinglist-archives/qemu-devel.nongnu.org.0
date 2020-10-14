Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B54C328E1C8
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Oct 2020 15:58:48 +0200 (CEST)
Received: from localhost ([::1]:35816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kShIl-0001Ti-P5
	for lists+qemu-devel@lfdr.de; Wed, 14 Oct 2020 09:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kShEf-0005y7-5f
 for qemu-devel@nongnu.org; Wed, 14 Oct 2020 09:54:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kShEc-0000cU-3W
 for qemu-devel@nongnu.org; Wed, 14 Oct 2020 09:54:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602683669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7iWXDfvyXvYhnFDcGM/wNE99WJJT6Ar7wiO1/fJ0Kz0=;
 b=i7lrQRjj1WgA9cG3+XfnokDbfglOgAwZGcyhDIwW1Ig6rqDdAC9D7N/fdmYKNttnDPq6b3
 JsNMIs+4dKcb3xnVlzfo559D7HBVxcckIQ58TvTdk8YaG9KCS1P2Q5J1PoJn8B26znt9x4
 wbX46IyrmRAy1rvf9prpNK0365nnqJI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-bS8o7aa_OSOpJHCFhm85qQ-1; Wed, 14 Oct 2020 09:54:27 -0400
X-MC-Unique: bS8o7aa_OSOpJHCFhm85qQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DCC159;
 Wed, 14 Oct 2020 13:54:26 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8508560C0F;
 Wed, 14 Oct 2020 13:54:23 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/7] dockerfiles: enable Centos 8 PowerTools
Date: Wed, 14 Oct 2020 09:54:14 -0400
Message-Id: <20201014135416.1290679-6-pbonzini@redhat.com>
In-Reply-To: <20201014135416.1290679-1-pbonzini@redhat.com>
References: <20201014135416.1290679-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/14 03:37:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: berrange@redhat.com, alex.bennee@linaro.org, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ninja is included in the CentOS PowerTools repository.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/docker/dockerfiles/centos8.docker | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 0fc2697491..e31d366fc1 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -1,6 +1,9 @@
 FROM centos:8.1.1911
 
+RUN dnf -y install dnf-plugins-core
+RUN dnf config-manager --set-enabled PowerTools
 RUN dnf -y update
+
 ENV PACKAGES \
     SDL-devel \
     bzip2 \
-- 
2.26.2



