Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF2B31FC0F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:36:08 +0100 (CET)
Received: from localhost ([::1]:39052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7p9-0002bV-SZ
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:36:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lD76Q-0004oE-JO
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:49:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lD76N-0004is-Dt
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:49:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613746190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tAaMZkC+X4vHvULg/xlpkM+0NLjJUDKBC3YHFUCIOTM=;
 b=J2n1bgAXk4U4dSbkWJ9yQz+9MWht68GsbddQvHaQJI6s8QWS1UjnyS3yG13XB/IbsOeY7x
 SeKB11UVqF5bUchWjVesgCYN9J0HFm3fNhu8Z3XYh/1FL5PKIkWsNuLqLY7hCXVQkUJ3c/
 oZknNG22+VtO958Hq2qI07Pn7LojTjQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-m4JOllC-OV2tc6QTWijHCQ-1; Fri, 19 Feb 2021 09:49:41 -0500
X-MC-Unique: m4JOllC-OV2tc6QTWijHCQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6B11801965;
 Fri, 19 Feb 2021 14:49:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B91DC5C1BB;
 Fri, 19 Feb 2021 14:49:40 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4B2F9113860F; Fri, 19 Feb 2021 15:49:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/18] QAPI patches patches for 2021-02-18
Date: Fri, 19 Feb 2021 15:49:21 +0100
Message-Id: <20210219144939.604488-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

The following changes since commit 91416a4254015e1e3f602f2b241b9ddb7879c10b:

  Merge remote-tracking branch 'remotes/stsquad/tags/pull-plugin-updates-180221-1' into staging (2021-02-18 13:27:03 +0000)

are available in the Git repository at:

  git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-02-18

for you to fetch changes up to 9b77d946990e7497469bb98171b90b4f3ab186a9:

  qapi/introspect.py: set _gen_tree's default ifcond argument to () (2021-02-18 19:51:14 +0100)

----------------------------------------------------------------
QAPI patches patches for 2021-02-18

----------------------------------------------------------------
John Snow (18):
      qapi: Replace List[str] with Sequence[str] for ifcond
      qapi/introspect.py: assert schema is not None
      qapi/introspect.py: use _make_tree for features nodes
      qapi/introspect.py: add _gen_features helper
      qapi/introspect.py: guard against ifcond/comment misuse
      qapi/introspect.py: Unify return type of _make_tree()
      qapi/introspect.py: replace 'extra' dict with 'comment' argument
      qapi/introspect.py: Always define all 'extra' dict keys
      qapi/introspect.py: Introduce preliminary tree typing
      qapi/introspect.py: create a typed 'Annotated' data strutcure
      qapi/introspect.py: improve _tree_to_qlit error message
      qapi/introspect.py: improve readability of _tree_to_qlit
      qapi/introspect.py: remove _gen_variants helper
      qapi/introspect.py: add type hint annotations
      qapi/introspect.py: Add docstrings to _gen_tree and _tree_to_qlit
      qapi/introspect.py: Update copyright and authors list
      qapi/introspect.py: Type _gen_tree variants as Sequence[str]
      qapi/introspect.py: set _gen_tree's default ifcond argument to ()

 scripts/qapi/commands.py   |   3 +-
 scripts/qapi/events.py     |   4 +-
 scripts/qapi/gen.py        |  12 +-
 scripts/qapi/introspect.py | 327 ++++++++++++++++++++++++++++++++-------------
 scripts/qapi/mypy.ini      |   5 -
 scripts/qapi/schema.py     |   2 +-
 scripts/qapi/types.py      |  12 +-
 scripts/qapi/visit.py      |  10 +-
 8 files changed, 255 insertions(+), 120 deletions(-)

-- 
2.26.2


