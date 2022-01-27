Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE5849E4BE
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 15:36:57 +0100 (CET)
Received: from localhost ([::1]:40288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD5tQ-0004io-C0
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 09:36:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nD5fJ-0007Va-9Q
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:22:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1nD5fH-0003Ov-J9
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 09:22:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643293338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uCJe4bf9sFj9ZcmAhcx1t6PVlMLuN4Y+Ylj/rx2TQhk=;
 b=Eeyg7Gtwcj/e9fnhlh2g7PQG9aNdV86HoNjGhwYTSTHvpILqEDvLDlmoTzIC78HEotuvLR
 bhd9Rv/tWHNRWMqcDEXe6dmvsuNk6UwSMqhp46hax+KCq07OIlicy7UIfuadezYHWsN4EB
 TCn6ZAwFwafgAmJfKwgiIKM1AUNSHPI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-TR8oJeOXMCa2z65Cp6kCRQ-1; Thu, 27 Jan 2022 09:22:05 -0500
X-MC-Unique: TR8oJeOXMCa2z65Cp6kCRQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 27B598144E2;
 Thu, 27 Jan 2022 14:22:04 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ED1826F9CF;
 Thu, 27 Jan 2022 14:22:03 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9B8E0113864A; Thu, 27 Jan 2022 15:22:02 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 0/8] QAPI patches patches for 2022-01-27
Date: Thu, 27 Jan 2022 15:21:54 +0100
Message-Id: <20220127142202.236638-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The following changes since commit 48302d4eb628ff0bea4d7e92cbf6b726410eb4c3:

  Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiofs-20220126' into staging (2022-01-26 10:59:50 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2022-01-27-v2

for you to fetch changes up to 761a1a488e67a77858f3645a43fbdfe6208b51ce:

  qapi: generate trace events by default (2022-01-27 15:17:35 +0100)

----------------------------------------------------------------
QAPI patches patches for 2022-01-27

----------------------------------------------------------------
Victor Toso (1):
      schemas: add missing vim modeline

Vladimir Sementsov-Ogievskiy (7):
      qapi/gen: Add FOO.trace-events output module
      qapi/commands: refactor error handling code
      qapi/commands: Optionally generate trace for QMP commands
      meson: generate trace events for qmp commands
      docs/qapi-code-gen: update to cover trace events code generation
      meson: document why we don't generate trace events for tests/ and qga/
      qapi: generate trace events by default

 docs/devel/qapi-code-gen.rst |  25 ++++++++++-
 docs/devel/tracing.rst       |   2 +
 meson.build                  |   3 ++
 qapi/audio.json              |   1 +
 qapi/compat.json             |   1 +
 qapi/replay.json             |   1 +
 qapi/trace.json              |   1 +
 qapi/meson.build             |   7 +++
 qga/meson.build              |  10 ++++-
 scripts/qapi/commands.py     | 100 +++++++++++++++++++++++++++++++++++++------
 scripts/qapi/gen.py          |  31 ++++++++++++--
 scripts/qapi/main.py         |  14 ++++--
 tests/meson.build            |  10 ++++-
 trace/meson.build            |  11 +++--
 14 files changed, 190 insertions(+), 27 deletions(-)

-- 
2.31.1


