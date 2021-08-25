Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 312883F7400
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 13:05:19 +0200 (CEST)
Received: from localhost ([::1]:39778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqiS-0006EB-6J
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 07:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mIqe4-0007wK-PZ
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 07:00:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mIqe1-0004ke-NL
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 07:00:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629889233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cwuBEI7wFDBxPMDfVnLw+Puvmf67IU4A6SAHula/ydA=;
 b=WSVsS0i+6Q5lkLa8+hN35lyLCcm2cI7F750V6wOYo0d8xD+eMmlmiALvgNZdeoN2bh5BNn
 7pF28BSTIf1BQaV7LfHPQIcy4+7Lm5LLOgMvEoLjZXKvdMRqprqO1m1tfeACbqf+sFudd7
 fUwXwszZUzpYw5mmQYh3ba981xER6bw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-ccwO5qqxMNyeszqPGH6Stg-1; Wed, 25 Aug 2021 07:00:31 -0400
X-MC-Unique: ccwO5qqxMNyeszqPGH6Stg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7777E190A7A2;
 Wed, 25 Aug 2021 11:00:30 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B67B05D741;
 Wed, 25 Aug 2021 11:00:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 3/6] docs/about: Add the missing release record in the subject
Date: Wed, 25 Aug 2021 13:00:15 +0200
Message-Id: <20210825110018.100913-4-thuth@redhat.com>
In-Reply-To: <20210825110018.100913-1-thuth@redhat.com>
References: <20210825110018.100913-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.745,
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

From: Yanan Wang <wangyanan55@huawei.com>

Commit 29e0447551
(docs/about/removed-features: Document removed CLI options from QEMU v3.1)
has recorded some CLI options as replaced/removed from QEMU v3.1, but one
of the subjects has missed the release record. Let's fix it.

Reported-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210823030005.165668-4-wangyanan55@huawei.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/removed-features.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 1c926a8bc1..8feeead449 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -140,8 +140,8 @@ Use ``-rtc driftfix=slew`` instead.
 
 Replaced by ``-rtc base=date``.
 
-``-vnc ...,tls=...``, ``-vnc ...,x509=...`` & ``-vnc ...,x509verify=...``
-'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+``-vnc ...,tls=...``, ``-vnc ...,x509=...`` & ``-vnc ...,x509verify=...`` (removed in 3.1)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
 The "tls-creds" option should be used instead to point to a "tls-creds-x509"
 object created using "-object".
-- 
2.27.0


