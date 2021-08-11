Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C017F3E8C14
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 10:43:20 +0200 (CEST)
Received: from localhost ([::1]:39134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDjpX-00013j-Px
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 04:43:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mDjnU-0004lT-C5
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 04:41:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mDjnS-0007aj-6w
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 04:41:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628671269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nY7keCE8LsgqHFWDz580vVP5hSsq4RhKyMmQZ4C9yos=;
 b=OODyG/P33FAfolGxo1EjoGQVnGbqAhMYYC3oP3y2UqrF3bGACSUR8myc8Nco2zGGrcMrzJ
 Qcc7PHaDbpPdtVLa43l7OrsBXaq+rrzwJGeftYuRq7uTEzMPMdj/Yk7eDQzm//clP7kwkh
 F7e8umF+uuOOjps8WqBurQfvogJIbL4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-epqQwDNdOrecTGQzxEW6uQ-1; Wed, 11 Aug 2021 04:41:07 -0400
X-MC-Unique: epqQwDNdOrecTGQzxEW6uQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B921A101C8A9;
 Wed, 11 Aug 2021 08:41:06 +0000 (UTC)
Received: from thuth.com (reserved-198-128.str.redhat.com [10.33.198.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8AA8D1B5C0;
 Wed, 11 Aug 2021 08:41:05 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	pbonzini@redhat.com
Subject: [PATCH v2 0/6] Document removed features from older QEMU versions
Date: Wed, 11 Aug 2021 10:40:57 +0200
Message-Id: <20210811084103.74832-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
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

v2:
 - Update the descriptions of `-no-kvm-pit`, `-tdf` and `-balloon`
   according to the suggestions of Paolo

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

 docs/about/removed-features.rst | 183 +++++++++++++++++++++++++++++++-
 1 file changed, 179 insertions(+), 4 deletions(-)

-- 
2.27.0


