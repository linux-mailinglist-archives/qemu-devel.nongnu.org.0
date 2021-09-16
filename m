Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D9E40E9CA
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 20:24:48 +0200 (CEST)
Received: from localhost ([::1]:57400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQw3z-0000HQ-2f
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 14:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQw2F-00072p-Is
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 14:22:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQw2B-0005Xq-OP
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 14:22:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631816573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZX01rYVGFkoGy4Ggi/nSCzx9kr3m+m08PNcJoeHIXzU=;
 b=hAfwJ4I+6I1doD6fvf4THdVYnrXS5TAjc5cCTRpxo0pTo9Bl68NrXWxpKEmIJEZfhRyXKw
 /XQUlTOGyTMkTwqLA0Q+e4zutkhO9UyXebg7wGfOSp5gwjBFUCLuHgLHVA0UZeVATB4O6D
 AzaLOHYHh57boc0VkIWLm3uAUNGjZho=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-rKLeRMA9MU2MuvRM2wf9ew-1; Thu, 16 Sep 2021 14:22:50 -0400
X-MC-Unique: rKLeRMA9MU2MuvRM2wf9ew-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DBA33800FF4
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 18:22:49 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30EE7196E2;
 Thu, 16 Sep 2021 18:22:48 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] Python: update CI tests for pylint 2.10 and 2.11
Date: Thu, 16 Sep 2021 14:22:46 -0400
Message-Id: <20210916182248.721529-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

GitLab: https://gitlab.com/jsnow/qemu/-/commits/python-package-pylint-211=
=0D
CI: https://gitlab.com/jsnow/qemu/-/pipelines/372122981=0D
=0D
While debating the fix for 2.10, 2.11 released and added new warnings to=0D
suppress.=0D
=0D
This version includes everything needed to get the Gitlab CI green again.=
=0D
=0D
John Snow (2):=0D
  python: Update for pylint 2.10=0D
  python: pylint 2.11 support=0D
=0D
 python/qemu/machine/machine.py | 7 ++++++-=0D
 python/setup.cfg               | 3 ++-=0D
 2 files changed, 8 insertions(+), 2 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


