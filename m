Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EECF415518
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 03:19:32 +0200 (CEST)
Received: from localhost ([::1]:46520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTDOd-0001zY-BT
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 21:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTD6s-0003VZ-OA
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 21:01:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mTD6p-00053D-Ns
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 21:01:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632358866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UaAPesH/gdaRo8BcGSLjONlpoPTLNeMfVO0t1CanoGw=;
 b=cJITHnOaLBlstd0KugzugDKJj6bYl0/Nip29OUbZ50xDQdWOVY85sqZDkIbEPbJdX8Lht9
 xtXvXil1FjTk6M8mZUaLPKdDd5g4gmMOfenp4XGBLNYInE5Tp/1yQGCTjmcOS/hoghbHnF
 v+0w4Lsds6Tbc6qJGLSg/cmaiqrtrh0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-7rm2wt7hOqeP51XaZEgBNA-1; Wed, 22 Sep 2021 21:01:03 -0400
X-MC-Unique: 7rm2wt7hOqeP51XaZEgBNA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6700E18D6A42;
 Thu, 23 Sep 2021 01:01:02 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A18A279448;
 Thu, 23 Sep 2021 01:01:01 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/7] docs/devel: Organize devel manual into further
 subsections
Date: Wed, 22 Sep 2021 21:00:54 -0400
Message-Id: <20210923010101.4002759-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's a bit cluttered. On my way to converting the QAPI/QMP documents to=0D
ReST I thought it could do with another organizational level to help=0D
make sense of things a bit more quickly.=0D
=0D
V3:=0D
 - Rebase/resend.=0D
=0D
V2:=0D
 - Move decodetree into TCG subsection=0D
 - Rebase, add QOM/QAPI/QMP docs into API subsection=0D
=0D
John Snow (7):=0D
  docs/devel: create "Community & Governance" subsection=0D
  docs/devel: create "Developing QEMU" subsection=0D
  docs/devel: create "Testing & Debugging" subsection=0D
  docs/devel: create TCG subsection=0D
  docs/devel: create "Subsystem APIs" subsection=0D
  docs/devel: create "QEMU API" section=0D
  docs/devel: create "Miscellaneous Topics" subsection=0D
=0D
 docs/devel/index.rst                        | 42 ++++-----------------=0D
 docs/devel/section-api.rst                  | 10 +++++=0D
 docs/devel/section-community-governance.rst |  9 +++++=0D
 docs/devel/section-development.rst          | 12 ++++++=0D
 docs/devel/section-misc.rst                 | 13 +++++++=0D
 docs/devel/section-subsystems.rst           | 16 ++++++++=0D
 docs/devel/section-tcg.rst                  | 12 ++++++=0D
 docs/devel/section-testing-debugging.rst    | 12 ++++++=0D
 8 files changed, 91 insertions(+), 35 deletions(-)=0D
 create mode 100644 docs/devel/section-api.rst=0D
 create mode 100644 docs/devel/section-community-governance.rst=0D
 create mode 100644 docs/devel/section-development.rst=0D
 create mode 100644 docs/devel/section-misc.rst=0D
 create mode 100644 docs/devel/section-subsystems.rst=0D
 create mode 100644 docs/devel/section-tcg.rst=0D
 create mode 100644 docs/devel/section-testing-debugging.rst=0D
=0D
--=20=0D
2.31.1=0D
=0D


