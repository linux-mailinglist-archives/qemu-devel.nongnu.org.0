Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8813E1691
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 16:10:58 +0200 (CEST)
Received: from localhost ([::1]:60074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBe5J-0002qU-1Q
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 10:10:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBe3d-0000BL-6e
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 10:09:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mBe3Z-0007sS-GQ
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 10:09:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628172548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Z6ju6E1DwlhR+5cJowTSMjmsGnlfY6Pv5yqBjTPIDWw=;
 b=TW6gpd8/gQCa8cdz+EyCkazH/r2ipTbp4BTw1MtEFgIw0i/XKUanCLyiOLDC82EMt67f6y
 xf2YkoHlhnmeJ1Nr6PcgGLJE/wOe7ODTiPCnj4e+G5vMkrF6UHPtY8MA/eX8pVPHSOR1pZ
 nmPnAzYLgrrRf+48hWoaSplvmWXPvvU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-eo47CszNO5u5Ahyp2-4ing-1; Thu, 05 Aug 2021 10:09:04 -0400
X-MC-Unique: eo47CszNO5u5Ahyp2-4ing-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD342760C7;
 Thu,  5 Aug 2021 14:09:03 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-12.ams2.redhat.com
 [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8626C5D9DD;
 Thu,  5 Aug 2021 14:09:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1AF4111380A0; Thu,  5 Aug 2021 16:09:02 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] QAPI patches patches for 2021-08-05
Date: Thu,  5 Aug 2021 16:08:57 +0200
Message-Id: <20210805140902.2110546-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

The following changes since commit cb2f4b8750b7e1c954570d19b104d4fdbeb8739a:

  Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2021-08-03' into staging (2021-08-03 19:50:43 +0100)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-08-05

for you to fetch changes up to 68e6dc594a44a7077657f2ea878806e38dfa50cf:

  docs: convert writing-qmp-commands.txt to writing-qmp-commands.rst (2021-08-04 11:18:05 +0200)

----------------------------------------------------------------
QAPI patches patches for 2021-08-05

----------------------------------------------------------------
John Snow (4):
      docs: convert qapi-code-gen.txt to ReST
      docs/qapi-code-gen: Beautify formatting
      docs/qapi-code-gen: add cross-references
      docs: convert writing-qmp-commands.txt to writing-qmp-commands.rst

Markus Armbruster (1):
      docs/devel/qapi-code-gen: Update examples to match current code

 docs/devel/index.rst                               |   2 +
 .../devel/{qapi-code-gen.txt => qapi-code-gen.rst} | 823 ++++++++++++---------
 ...g-qmp-commands.txt => writing-qmp-commands.rst} | 567 +++++++-------
 3 files changed, 754 insertions(+), 638 deletions(-)
 rename docs/devel/{qapi-code-gen.txt => qapi-code-gen.rst} (75%)
 rename docs/devel/{writing-qmp-commands.txt => writing-qmp-commands.rst} (61%)

-- 
2.31.1


