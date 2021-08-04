Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2B23DF913
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 02:58:10 +0200 (CEST)
Received: from localhost ([::1]:45080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mB5EW-0002Zb-VD
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 20:58:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mB5Cw-0000U3-Sg
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 20:56:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mB5Ct-0006hm-Ks
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 20:56:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628038585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rcW7/oGv1BplVU0+Si7e1kWtxljyB52LqDRHUvnE7qk=;
 b=dIc2ZD0dtpxJpdkvx/J7RCpRyuBGmiBTBFyrgMroQ0w7Vfu/PVyT7cYHPgCF8Y+T1apdg2
 bs3IGyKiKJvPc+LhIz/O0NGsc2yTQhchyvUc4kpUaxuyeGoRgGOCmI40Y/K1XBld94u6CT
 yZa4+1A3JWFEKKkACMCiGf8bRgHZ7EM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-tGw_lG2HMCywluI-Ivtvgw-1; Tue, 03 Aug 2021 20:56:24 -0400
X-MC-Unique: tGw_lG2HMCywluI-Ivtvgw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F09EC801AEB;
 Wed,  4 Aug 2021 00:56:22 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 50FDF5D9DC;
 Wed,  4 Aug 2021 00:56:22 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] docs/devel: Organize devel manual into further subsections
Date: Tue,  3 Aug 2021 20:56:15 -0400
Message-Id: <20210804005621.1577302-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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
Cc: John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's a bit cluttered. On my way to converting the QAPI/QMP documents to=0D
ReST I thought it could do with another organizational level to help=0D
make sense of things a bit more quickly.=0D
=0D
John Snow (6):=0D
  docs/devel: create "Community & Governance" subsection=0D
  docs/devel: create "Developing QEMU" subsection=0D
  docs/devel: create "Testing & Debugging" subsection=0D
  docs/devel: create TCG subsection=0D
  docs/devel: create "Subsystem APIs" subsection=0D
  docs/devel: create "Miscellaneous Topics" subsection=0D
=0D
 docs/devel/index.rst                        | 39 ++++-----------------=0D
 docs/devel/section-community-governance.rst |  9 +++++=0D
 docs/devel/section-development.rst          | 12 +++++++=0D
 docs/devel/section-misc.rst                 | 15 ++++++++=0D
 docs/devel/section-subsystems.rst           | 16 +++++++++=0D
 docs/devel/section-tcg.rst                  | 11 ++++++=0D
 docs/devel/section-testing-debugging.rst    | 12 +++++++=0D
 7 files changed, 81 insertions(+), 33 deletions(-)=0D
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


