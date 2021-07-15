Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9EE3C9EB5
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 14:34:13 +0200 (CEST)
Received: from localhost ([::1]:34050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m40Z9-0006OY-Sp
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 08:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m40XM-0004fE-ML
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 08:32:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m40XD-0002sm-IL
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 08:32:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626352330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=x4Kr+0PozhU7rBhZke7yAFvxjZN4F1cxJ4+QPwWQKyI=;
 b=VxOp+aVvBFSzAF/jkpEPRmFKkjrLfqj0nuWA97NbkCBRiIWXosMbx+KStzUmOXgxvF+gY0
 3BZIg2r6fCpkFlGPg1fq4rMZ+4uIq1OvgR2dTn0oylcDgV9qFfW5WXZN3R6VDqTz7p32Bh
 9raoD1XC1xFMr0io9aLEAUghFAumQt8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-tYkJkY4zMI6Lu_86Mlh2ew-1; Thu, 15 Jul 2021 08:32:08 -0400
X-MC-Unique: tYkJkY4zMI6Lu_86Mlh2ew-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A09F45074B;
 Thu, 15 Jul 2021 12:32:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-81.ams2.redhat.com
 [10.36.112.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7346F5C225;
 Thu, 15 Jul 2021 12:32:07 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 09387113865F; Thu, 15 Jul 2021 14:32:06 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] QAPI patches patches for 2021-07-15
Date: Thu, 15 Jul 2021 14:32:05 +0200
Message-Id: <20210715123206.212379-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit a9649a719a44894b81f38dc1c5c1888ee684acef:

  Merge remote-tracking branch 'remotes/cleber-gitlab/tags/python-next-pull-request' into staging (2021-07-14 18:09:09 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-07-15

for you to fetch changes up to a0c7b99bf75d85b616fa219a7d866fc72970f327:

  qapi: Fix crash on missing enum member name (2021-07-15 12:56:41 +0200)

----------------------------------------------------------------
QAPI patches patches for 2021-07-15

----------------------------------------------------------------
Markus Armbruster (1):
      qapi: Fix crash on missing enum member name

 scripts/qapi/expr.py                     | 2 +-
 tests/qapi-schema/enum-dict-no-name.err  | 2 ++
 tests/qapi-schema/enum-dict-no-name.json | 2 ++
 tests/qapi-schema/enum-dict-no-name.out  | 0
 4 files changed, 5 insertions(+), 1 deletion(-)
 create mode 100644 tests/qapi-schema/enum-dict-no-name.err
 create mode 100644 tests/qapi-schema/enum-dict-no-name.json
 create mode 100644 tests/qapi-schema/enum-dict-no-name.out

-- 
2.31.1


