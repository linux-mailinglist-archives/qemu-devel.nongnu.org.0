Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A35363DF088
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 16:42:48 +0200 (CEST)
Received: from localhost ([::1]:56328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAvd1-0005wQ-Kc
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 10:42:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mAvbr-0004BA-Tp
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:41:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mAvbq-00044q-EG
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:41:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628001693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nE7gMZy7mhKlHKZ61JdGFBo+x2i64OUzcjUJAoe9f+I=;
 b=IgxlF5v8CElI7Xo7Bu/oKv5hj/F0aJCV69Oi5g85mHRuXXAvWP6IHNV8bFpencf6t7vS4T
 BF3TWMX+qJFnvFfOMp17n6qN2COQ/wndONEPmEI9py8sfXV49AjRCPwq+UvlKSAZHyrXsd
 Pd5gALN9HVupKZ+QxVpkb8Vh61ajEZo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-ViBHdz6bPMOxXeawfmshyw-1; Tue, 03 Aug 2021 10:41:32 -0400
X-MC-Unique: ViBHdz6bPMOxXeawfmshyw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96218801E72;
 Tue,  3 Aug 2021 14:41:31 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8AD785D9DC;
 Tue,  3 Aug 2021 14:41:30 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 0/1] Block layer patches
Date: Tue,  3 Aug 2021 16:41:24 +0200
Message-Id: <20210803144125.51097-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 7f1cab9c628a798ae2607940993771e6300e9e00:

  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-08-02 17:21:50 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to 87ab88025247b893aad5071fd38301b67be76d1a:

  block: Fix in_flight leak in request padding error path (2021-08-03 15:43:30 +0200)

----------------------------------------------------------------
Block layer patches

- Fix hang after request padding error (Windows + 512-on-4k emulation)

----------------------------------------------------------------
Kevin Wolf (1):
      block: Fix in_flight leak in request padding error path

 block/io.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)


