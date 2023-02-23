Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 866326A088B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 13:24:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVAdM-0002xT-1X; Thu, 23 Feb 2023 07:23:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVAdK-0002wz-MH
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:23:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pVAdJ-0003yB-4f
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 07:23:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677155012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Fwj8NJ5I5aiZ3NQuLuMSavTvGrynIuY1XCRhEbfSOxs=;
 b=KOgKi3pDhZKjJHvTr8CuBmy3c3wGGc98hYVt1yPqolnM5c35ko7s88z8jLarypzwokIWyF
 Stb3eAEAKEW1z24Crc53/kV8PClXFVL9ai4nXUjZ+8h3hKiZYiLQePdV23zv3GTT9dhXuZ
 ZMV2yXclmedwDsH9ZBiCd9xhtaNrJGw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-Ab9VCXtDPs6rGYp49_uo4A-1; Thu, 23 Feb 2023 07:23:29 -0500
X-MC-Unique: Ab9VCXtDPs6rGYp49_uo4A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6662857F40;
 Thu, 23 Feb 2023 12:23:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F9ABC15BA0;
 Thu, 23 Feb 2023 12:23:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 83FD321E6A1F; Thu, 23 Feb 2023 13:23:27 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 0/8] QAPI patches patches for 2023-02-23
Date: Thu, 23 Feb 2023 13:23:19 +0100
Message-Id: <20230223122327.1920247-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 79b677d658d3d35e1e776826ac4abb28cdce69b8:

  Merge tag 'net-pull-request' of https://github.com/jasowang/qemu into staging (2023-02-21 11:28:31 +0000)

are available in the Git repository at:

  https://repo.or.cz/qemu/armbru.git tags/pull-qapi-2023-02-23

for you to fetch changes up to c7b7a7ded9376ad936cfedd843752789ca61bc3b:

  qapi: remove JSON value FIXME (2023-02-23 13:01:45 +0100)

----------------------------------------------------------------
QAPI patches patches for 2023-02-23

----------------------------------------------------------------
John Snow (6):
      qapi: Update flake8 config
      qapi: update pylint configuration
      qapi: Add minor typing workaround for 3.6
      qapi/parser: add QAPIExpression type
      qapi: remove _JSONObject
      qapi: remove JSON value FIXME

Markus Armbruster (2):
      docs/devel/qapi-code-gen: Belatedly update features documentation
      docs/devel/qapi-code-gen: Fix a missing 'may', clarify SchemaInfo

 docs/devel/qapi-code-gen.rst |  16 +++----
 scripts/qapi/.flake8         |   3 +-
 scripts/qapi/expr.py         | 100 ++++++++++++++++---------------------------
 scripts/qapi/parser.py       |  41 ++++++++++--------
 scripts/qapi/pylintrc        |   1 +
 scripts/qapi/schema.py       |  72 +++++++++++++++++--------------
 6 files changed, 111 insertions(+), 122 deletions(-)

-- 
2.39.0


