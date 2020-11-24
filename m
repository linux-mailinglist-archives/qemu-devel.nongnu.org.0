Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E312C2995
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 15:29:57 +0100 (CET)
Received: from localhost ([::1]:53300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khZKO-0004lY-Fj
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 09:29:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1khZFo-0000h8-10
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 09:25:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1khZFm-0004pM-3E
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 09:25:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606227909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6QXXQi1LNDQkOAwAYps943PqGx0+TW5Sxd6Y3xBxCrY=;
 b=O6I06TYGrntoCqQ/Co8ihmeGCVwvas3sRgMd/IJiqc6QroQskgNinkoxnG8fBkIE9Jamtr
 u0iPsBqhUT4odhlL0Q4EPLX6WqteZ9seQ/ABTNaJfBkucE8diy03dQ7NFpv9gCNtMU2p6C
 b6oc2dkfc5WQJAYrG/Mjok/x1eJEqQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-WGE8uSeMMPeonT7h3cz-dg-1; Tue, 24 Nov 2020 09:25:04 -0500
X-MC-Unique: WGE8uSeMMPeonT7h3cz-dg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E21871006C81;
 Tue, 24 Nov 2020 14:25:02 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-111.ams2.redhat.com [10.36.114.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC8BC60864;
 Tue, 24 Nov 2020 14:25:01 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 0/1] Block layer patches for 5.2.0-rc3
Date: Tue, 24 Nov 2020 15:24:58 +0100
Message-Id: <20201124142459.298166-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The following changes since commit 23895cbd82be95428e90168b12e925d0d3ca2f06:

  Merge remote-tracking branch 'remotes/awilliam/tags/vfio-update-20201123.0' into staging (2020-11-23 18:51:13 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/kevin.git tags/for-upstream

for you to fetch changes up to c8bf9a9169db094aaed680cdba570758c0dc18b9:

  qcow2: Fix corruption on write_zeroes with MAY_UNMAP (2020-11-24 11:29:41 +0100)

----------------------------------------------------------------
Patches for 5.2.0-rc3:

- qcow2: Fix corruption on write_zeroes with MAY_UNMAP

----------------------------------------------------------------
Maxim Levitsky (1):
      qcow2: Fix corruption on write_zeroes with MAY_UNMAP

 block/qcow2-cluster.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)


