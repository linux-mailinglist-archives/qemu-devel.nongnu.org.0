Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D784C6A8C
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 12:32:01 +0100 (CET)
Received: from localhost ([::1]:45198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOeG0-0007xF-MM
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 06:32:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nOeAe-00046x-96
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 06:26:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nOeAX-00077q-OJ
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 06:26:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646047579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=v1CRg0OPxHxqMAgJXBCWt3VizN8zkqgfoGB3MDw+HBE=;
 b=AqcB5vccqkgPxQ0mn6czNCR3PGk2PaPK7AD+oRPTPUzssosx25TunbpYf/5Z4zb5kmsVsU
 8VzR1TLmouu8QgrP6w6If3TzovyJBJOyshy6+wY4aXawnoH54qpKhoGTxvyRh1sk5jeG9m
 gQ376Hi31KCxRIqrGrcsxI1XQ5tYhiw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-KPresSQyMTCijY527vD7Vw-1; Mon, 28 Feb 2022 06:26:16 -0500
X-MC-Unique: KPresSQyMTCijY527vD7Vw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E7085200;
 Mon, 28 Feb 2022 11:26:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.112.3])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C42A7B6EF;
 Mon, 28 Feb 2022 11:26:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id C572221E6A00; Mon, 28 Feb 2022 12:26:13 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/9] QAPI patches patches for 2022-02-28
Date: Mon, 28 Feb 2022 12:26:04 +0100
Message-Id: <20220228112613.520040-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit fa435db8ce1dff3b15e3f59a12f55f7b3a347b08:

  Merge remote-tracking branch 'remotes/jsnow-gitlab/tags/python-pull-request' into staging (2022-02-24 12:48:14 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2022-02-28

for you to fetch changes up to 1428502c8c0c0cfbb04212558144fef970042cf3:

  qapi: Belatedly adjust limitations documentation (2022-02-28 11:39:35 +0100)

----------------------------------------------------------------
QAPI patches patches for 2022-02-28

----------------------------------------------------------------
Fabian Holler (1):
      qapi/migration: Fix examples document wrong field name for arguments

John Snow (1):
      scripts/qapi: minor delinting

Markus Armbruster (4):
      keyval: Fix grammar comment to cover downstream prefix
      qapi: Fix stale reference to scripts/qapi.py in a comment
      rtc: Have event RTC_CHANGE identify the RTC by QOM path
      qapi: Belatedly adjust limitations documentation

Peter Maydell (3):
      qapi: Move RTC_CHANGE back out of target schema
      qapi: Document some missing details of RTC_CHANGE event
      hw/rtc: Compile pl031 once-only

 qapi/compat.json         |  2 +-
 qapi/migration.json      | 10 +++++-----
 qapi/misc-target.json    | 33 ---------------------------------
 qapi/misc.json           | 26 ++++++++++++++++++++++++++
 hw/ppc/spapr_rtc.c       |  6 ++++--
 hw/rtc/mc146818rtc.c     |  5 +++--
 hw/rtc/pl031.c           |  5 +++--
 qapi/qapi-util.c         |  2 +-
 util/keyval.c            |  4 +++-
 hw/rtc/meson.build       |  2 +-
 scripts/qapi/commands.py |  2 +-
 scripts/qapi/pylintrc    | 16 ++++++----------
 scripts/qapi/types.py    |  6 +++++-
 scripts/qapi/visit.py    |  6 +++++-
 14 files changed, 64 insertions(+), 61 deletions(-)

-- 
2.35.1


