Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2222CD931
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 15:32:30 +0100 (CET)
Received: from localhost ([::1]:47000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkpeo-0002D2-13
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 09:32:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kkpdh-0001i9-BO
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 09:31:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1kkpde-0008Al-5K
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 09:31:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607005875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=h6/Re8fkqc/GBf7jXGWVIhTCkdntcTpRvm64gWGU1M4=;
 b=NbZH9PmdXRMInpLebDVwe/9iSIKtw7OryXMmQWlVoceZZRLxyF8LR1S+TRfoQ192TDTy9P
 pXK0oucvpZD1+yZeShd+b4mEZ/qoMEsXpyq1850NcS7dDVTD8oconD8P5ZKBKfyfwFeuOc
 FAh0P/Q1HFXgKvIkpLVdPZNg4bTYHLE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-YFkyHpiqNiS-CUFGqp9Uuw-1; Thu, 03 Dec 2020 09:31:12 -0500
X-MC-Unique: YFkyHpiqNiS-CUFGqp9Uuw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB927100ED02;
 Thu,  3 Dec 2020 14:31:10 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.74.9.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B49A260854;
 Thu,  3 Dec 2020 14:31:06 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: [PATCH v2 0/1] security-process: update with mailing list details
Date: Thu,  3 Dec 2020 19:59:01 +0530
Message-Id: <20201203142902.474883-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ppandit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Petr Matousek <pmatouse@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

Hello,

* After upstream discussions and considering various options like
  LaunchPad bugs, GitLab issues etc.

  -> https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg04266.html
  -> https://lists.nongnu.org/archive/html/qemu-devel/2020-10/msg00059.html

  We are about to introduce a 'qemu-security' mailing list to receive and
  triage upstream QEMU security issues.

* Intention is to allow more community participation in handling and
  triaging of the QEMU security issues.

* This change relieves current set of individual contacts from the
  responsibility of handling upstream QEMU issues. Of course they are
  welcome to the new 'qemu-security' mailing list.

* To simplify the encrypted communication process, we keep only a single
  contact of <secalert@redhat.com> from our previous list of contacts.

  This way reporters need not look for and manage GPG keys of multiple
  contacts.

v1:
* This patch v1 updates the QEMU security-process web page with detailed
  process.
  -> https://lists.nongnu.org/archive/html/qemu-devel/2020-11/msg06234.html

v2:
* Incorporate further inputs and suggestions from upstream reviews.
  -> https://lists.nongnu.org/archive/html/qemu-devel/2020-12/msg00568.html
  -> https://lists.nongnu.org/archive/html/qemu-devel/2020-12/msg00584.html

I'd appreciate if you have any inputs and/or suggestions for this change.

Thank you.
--
Prasad J Pandit (1):
  security-process: update process information

 contribute/security-process.md | 154 ++++++++++++++++++++-------------
 1 file changed, 95 insertions(+), 59 deletions(-)

--
2.28.0


