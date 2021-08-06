Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9B03E2D47
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 17:12:14 +0200 (CEST)
Received: from localhost ([::1]:35308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC1W9-0002GJ-Ju
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 11:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mC1UT-00087T-Fq
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 11:10:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mC1UQ-0008H8-53
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 11:10:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628262624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2z4Nc0rY5tszXvtxHxnmBE2w0m4oMyRRqFBDObi+xyM=;
 b=OxSzWMqjd9oZ10G3NoJpTfLAToNcIS44K32GVUk7uiezsCepC78qtzqf2PsbstYmKBNZSn
 WZah0I9ISl4/2FkMeEoMEhi0r9TVwfjEfATPPAwD4xRGwDQUhYBA3mRE+y4fHU5gdiDPYj
 d8VAp7cmUnqmQ7nYjMxKMfS4jBCMmxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-aPU6d_8ZPROVDx1z_SGEVg-1; Fri, 06 Aug 2021 11:10:22 -0400
X-MC-Unique: aPU6d_8ZPROVDx1z_SGEVg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCC1B107B7C4;
 Fri,  6 Aug 2021 15:10:21 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CAC518AD4;
 Fri,  6 Aug 2021 15:10:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] Document removed features from older QEMU versions
Date: Fri,  6 Aug 2021 17:10:06 +0200
Message-Id: <20210806151012.103108-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Before we started to gather the information about removed features
in the git repo, we collected the information in the Wiki here:

 https://wiki.qemu.org/Features/RemovedFeatures

Since it's rather confusing for the users to have two sources where to
look up the related information, let's add the features from the Wiki
into the documentation in our git repo instead (and then remove the
Wiki page once these patches here have been merged).

Thomas Huth (6):
  docs/about/removed-features: Document removed CLI options from QEMU
    v2.12
  docs/about/removed-features: Document removed CLI options from QEMU
    v3.0
  docs/about/removed-features: Document removed CLI options from QEMU
    v3.1
  docs/about/removed-features: Document removed HMP commands from QEMU
    v2.12
  docs/about/removed-features: Document removed devices from older QEMU
    versions
  docs/about/removed-features: Document removed machines from older QEMU
    versions

 docs/about/removed-features.rst | 180 +++++++++++++++++++++++++++++++-
 1 file changed, 176 insertions(+), 4 deletions(-)

-- 
2.27.0


