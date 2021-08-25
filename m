Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC73F3F7431
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 13:15:50 +0200 (CEST)
Received: from localhost ([::1]:38036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqsi-0008Br-Tb
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 07:15:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mIqe1-0007ki-4i
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 07:00:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mIqdz-0004iq-Gn
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 07:00:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629889230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F6GGmholXce/jmshIj3aM2wC9Cu1U7pcQ2HOug7EZ3Y=;
 b=WqJ1EWPLWqEEcSpsblO2YJGJ7DAfvAuocyH5uQhehYaNen8mIjocjFr85ry7pPDn73OmF7
 1xt1mIhy/XZRaDXKP3U0LZnc6q87R20pgn+IAD+R+K212344tP818ycLboIfVclSM48aEh
 Dt1cQdfmI0A/A4l3jHo7tDlWxb3aLZc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-8O6manzzNUWatuuO2Nv_yg-1; Wed, 25 Aug 2021 07:00:29 -0400
X-MC-Unique: 8O6manzzNUWatuuO2Nv_yg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BEC51018F72;
 Wed, 25 Aug 2021 11:00:28 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F6D15D741;
 Wed, 25 Aug 2021 11:00:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 1/6] docs/about: Remove the duplicated doc
Date: Wed, 25 Aug 2021 13:00:13 +0200
Message-Id: <20210825110018.100913-2-thuth@redhat.com>
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

There are two places describing the same thing about deprecation
of invalid topologies of -smp CLI, so remove the duplicated one.

Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210823030005.165668-2-wangyanan55@huawei.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/removed-features.rst | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index cbfa1a8e31..6a9c5bb484 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -647,19 +647,6 @@ as ignored. Currently, users are responsible for making sure the backing storage
 specified with ``-mem-path`` can actually provide the guest RAM configured with
 ``-m`` and QEMU fails to start up if RAM allocation is unsuccessful.
 
-``-smp`` (invalid topologies) (removed 5.2)
-'''''''''''''''''''''''''''''''''''''''''''
-
-CPU topology properties should describe whole machine topology including
-possible CPUs.
-
-However, historically it was possible to start QEMU with an incorrect topology
-where *n* <= *sockets* * *cores* * *threads* < *maxcpus*,
-which could lead to an incorrect topology enumeration by the guest.
-Support for invalid topologies is removed, the user must ensure
-topologies described with -smp include all possible cpus, i.e.
-*sockets* * *cores* * *threads* = *maxcpus*.
-
 ``-machine enforce-config-section=on|off`` (removed 5.2)
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
-- 
2.27.0


