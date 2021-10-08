Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA935427365
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 00:08:29 +0200 (CEST)
Received: from localhost ([::1]:51226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYy2W-00018A-Gu
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 18:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mYy0h-0007ql-9E
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 18:06:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mYy0d-0002ik-OK
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 18:06:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633730789;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hKAot3UxiDpe2OwwZ9CwxwFOO1IB4cHoE6gOA1bTx8I=;
 b=NQySsItQhnGEDRc00NgIL/tCjBvTjMjC1BStvaHdLK985Q7QTcEFGLmXdg0fDW26oMhQ/5
 i06T4tv45MJQl2DFO2pwKQGFWl70sIlsjZiREillmQSXNJpZ+xbkB8165YREHjV80ZKfk2
 K2fpe+aoOMTuXdxen4byAMWVn4YzEN8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-577-RoOgYxwPMIyAtkb3eJaC2g-1; Fri, 08 Oct 2021 18:06:27 -0400
X-MC-Unique: RoOgYxwPMIyAtkb3eJaC2g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4CFC100F942;
 Fri,  8 Oct 2021 22:06:26 +0000 (UTC)
Received: from localhost (unknown [10.39.208.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 656E119729;
 Fri,  8 Oct 2021 22:06:22 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] Some Sphinx improvements
Date: Sat,  9 Oct 2021 02:06:14 +0400
Message-Id: <20211008220620.1488179-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.051,
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
Cc: pbonzini@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi,=0D
=0D
I have collected a few Sphinx-related improvements to improve depfile gener=
ation=0D
and add some keyboard navigation. Hope you'll like it.=0D
=0D
Marc-Andr=C3=A9 Lureau (6):=0D
  docs/sphinx: add loaded modules to generated depfile=0D
  docs/sphinx: add static files to generated depfile=0D
  docs/sphinx: add templates files to generated depfile=0D
  meson: remove explicit extensions dependency file list=0D
  docs/sphinx: set navigation_with_keys=3DTrue=0D
  docs/sphinx: add 's' keyboard binding to focus search=0D
=0D
 docs/conf.py                  |  7 ++++++-=0D
 docs/meson.build              | 10 ----------=0D
 docs/sphinx-static/custom.js  |  9 +++++++++=0D
 docs/sphinx/depfile.py        | 19 +++++++++++++++++--=0D
 tests/qapi-schema/meson.build |  5 ++++-=0D
 5 files changed, 36 insertions(+), 14 deletions(-)=0D
 create mode 100644 docs/sphinx-static/custom.js=0D
=0D
--=20=0D
2.33.0.721.g106298f7f9=0D
=0D


