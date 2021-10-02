Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DD341FABE
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 12:02:19 +0200 (CEST)
Received: from localhost ([::1]:42430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWbqV-00011G-0G
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 06:02:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mWblW-00018f-L5
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 05:57:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mWblN-0004Jx-Uu
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 05:57:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633168619;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=f5Y48i2JBBd47+/mYnsHg/P937rbPA9WaLie/Znxo7s=;
 b=TfI319iZoYHxe34UM3ZDlgIpbNYPrMNzFo3Wh8dSs6EOb7hiYS7GB4OjBmArW07lPdmSmh
 zN1uX0BtdLp5l+R3WScDOc+1/MHxweOsCem1CVKWIJXs4NNVJw9Jz+XMt48ZMfCTh6vVwA
 8jlTIyV3MrhBCweiOGXNiVMsqNUugCE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-5JMF7hWcM_ms-00TGLKWIg-1; Sat, 02 Oct 2021 05:56:57 -0400
X-MC-Unique: 5JMF7hWcM_ms-00TGLKWIg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 035E01084681;
 Sat,  2 Oct 2021 09:56:57 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB55560936;
 Sat,  2 Oct 2021 09:56:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 68842113865F; Sat,  2 Oct 2021 11:56:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/13] QAPI patches patches for 2021-10-02
Date: Sat,  2 Oct 2021 11:56:42 +0200
Message-Id: <20211002095655.1944970-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 5f992102383ed8ed97076548e1c897c7034ed8a4:

  Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' into staging (2021-10-01 13:44:36 -0400)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-10-02

for you to fetch changes up to d183e0481b1510b253ac94e702c76115f3bb6450:

  qapi/parser: enable pylint checks (2021-10-02 07:33:42 +0200)

----------------------------------------------------------------
QAPI patches patches for 2021-10-02

----------------------------------------------------------------
John Snow (13):
      qapi/pylintrc: ignore 'consider-using-f-string' warning
      qapi/gen: use dict.items() to iterate over _modules
      qapi/parser: fix unused check_args_section arguments
      qapi: Add spaces after symbol declaration for consistency
      qapi/parser: remove FIXME comment from _append_body_line
      qapi/parser: clarify _end_section() logic
      qapi/parser: Introduce NullSection
      qapi/parser: add import cycle workaround
      qapi/parser: add type hint annotations (QAPIDoc)
      qapi/parser: Add FIXME for consolidating JSON-related types
      qapi/parser: enable mypy checks
      qapi/parser: Silence too-few-public-methods warning
      qapi/parser: enable pylint checks

 qapi/block-core.json                   |   1 +
 qga/qapi-schema.json                   |   3 +
 scripts/qapi/gen.py                    |   3 +-
 scripts/qapi/mypy.ini                  |   5 --
 scripts/qapi/parser.py                 | 148 +++++++++++++++++++++------------
 scripts/qapi/pylintrc                  |   4 +-
 tests/qapi-schema/doc-bad-feature.err  |   2 +-
 tests/qapi-schema/doc-empty-symbol.err |   2 +-
 tests/qapi-schema/doc-good.json        |   8 ++
 9 files changed, 112 insertions(+), 64 deletions(-)

-- 
2.31.1


