Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E44EC42EF32
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 12:57:09 +0200 (CEST)
Received: from localhost ([::1]:59698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbKtg-0006no-WF
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 06:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mbKqe-0003xe-Kb
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 06:54:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mbKqd-0004QN-3U
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 06:54:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634295238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=r0NPkhtNNRHdSF05xmMmpdfcF/d09cYaL4oAW9YFn9Y=;
 b=cLf/xAp1o3/4r8ElzufanWEw0XkN4g8ZpluSDJDzsEZnMYFCjptcjTOTOv0IrEC9PzKfw9
 AFppfOS5FnZvivfGVva9nJMub3nkYrvLewZKuwW9XDs1zhqFk9YrKPaXPxMc7EBY91eOVa
 Y6fX111+wLZWxfkrPfPhgGOtqTQ+kGQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-ujxtQ5stO8Gehw3Y5_LDsA-1; Fri, 15 Oct 2021 06:53:52 -0400
X-MC-Unique: ujxtQ5stO8Gehw3Y5_LDsA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C38D41006AA2;
 Fri, 15 Oct 2021 10:53:51 +0000 (UTC)
Received: from localhost (unknown [10.39.208.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C06A5C1A3;
 Fri, 15 Oct 2021 10:53:47 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/8] Some Sphinx improvements
Date: Fri, 15 Oct 2021 14:53:36 +0400
Message-Id: <20211015105344.152591-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi,=0D
=0D
I have collected a few Sphinx-related improvements to improve depfile gener=
ation=0D
and add some keyboard navigation. Hope you'll like it.=0D
=0D
v2:=0D
 - fix test 'output:' regression=0D
 - fix javascript indentation (Paolo)=0D
 - split "meson: remove explicit extensions dependency file list" (Paolo)=
=0D
=0D
Marc-Andr=C3=A9 Lureau (8):=0D
  docs/sphinx: add loaded modules to generated depfile=0D
  docs/sphinx: add static files to generated depfile=0D
  docs/sphinx: add templates files to generated depfile=0D
  tests/qapi-schema/meson: add depfile to sphinx doc=0D
  meson: drop sphinx_extn_depends=0D
  meson: drop sphinx_template_files=0D
  docs/sphinx: set navigation_with_keys=3DTrue=0D
  docs/sphinx: add 's' keyboard binding to focus search=0D
=0D
 docs/conf.py                  |  7 ++++++-=0D
 docs/meson.build              | 10 ----------=0D
 docs/sphinx-static/custom.js  |  9 +++++++++=0D
 docs/sphinx/depfile.py        | 19 +++++++++++++++++--=0D
 tests/qapi-schema/meson.build |  6 ++++--=0D
 5 files changed, 36 insertions(+), 15 deletions(-)=0D
 create mode 100644 docs/sphinx-static/custom.js=0D
=0D
--=20=0D
2.33.0.721.g106298f7f9=0D
=0D


