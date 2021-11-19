Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A894568EA
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 05:06:42 +0100 (CET)
Received: from localhost ([::1]:44192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnvAf-0002Ki-40
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 23:06:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mnv7u-0000U9-4O
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 23:03:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mnv7q-00069i-Fv
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 23:03:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637294624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vuh1jLAnYLOXE9D/Bw08ZuN5OlHGXievbVlXm8DebZA=;
 b=C49fxs25SSMMI353av/qMLQIMq3dgX/27jFnkekcU5v+5E7QB1rV1MTCMo9KxG3Om/oi0i
 DadJC8dge9zBd0qn4tjBTa8frfxFn9FnejdV9MD4+Ad+vb/bm2gn7K4piEg5t+VXZ91nv8
 ylNHAg8814pc1BXlOGHioQmOlyK8CcU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-02bfBmlXMH6cs-6SO57E2Q-1; Thu, 18 Nov 2021 23:03:42 -0500
X-MC-Unique: 02bfBmlXMH6cs-6SO57E2Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02C82824F83;
 Fri, 19 Nov 2021 04:03:41 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-18.pek2.redhat.com [10.72.13.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 99BD160BF1;
 Fri, 19 Nov 2021 04:03:38 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Subject: [PULL 0/3] Net patches
Date: Fri, 19 Nov 2021 12:03:33 +0800
Message-Id: <20211119040336.14460-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 44a3aa0608f01274418487b655d42467c1d8334e:

  Merge tag 'sev-hashes-pull-request' of https://gitlab.com/berrange/qemu into staging (2021-11-18 15:06:05 +0100)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to 0656fbc7ddccdade1709742a9b56ae07dd3c280a:

  net/colo-compare.c: Fix incorrect return when input wrong size (2021-11-19 11:44:22 +0800)

----------------------------------------------------------------

----------------------------------------------------------------
Prasad J Pandit (1):
      net: vmxnet3: validate configuration values during activate (CVE-2021-20203)

Zhang Chen (2):
      net/colo-compare.c: Fix ACK track reverse issue
      net/colo-compare.c: Fix incorrect return when input wrong size

 hw/net/vmxnet3.c   | 13 +++++++++++++
 net/colo-compare.c |  8 +++++---
 2 files changed, 18 insertions(+), 3 deletions(-)



