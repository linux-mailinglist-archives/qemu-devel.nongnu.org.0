Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4622E252C34
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 13:08:59 +0200 (CEST)
Received: from localhost ([::1]:42456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAtIY-0001cA-7R
	for lists+qemu-devel@lfdr.de; Wed, 26 Aug 2020 07:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kAtG5-0005qy-S8
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 07:06:25 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:30508
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kAtEG-00037z-FC
 for qemu-devel@nongnu.org; Wed, 26 Aug 2020 07:06:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598439871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DoLsYrCDYKkjcYC8LFkgFdJxKPUHBmrTMlE9U5WviuM=;
 b=VfyYssPqjfdgIpxWSBYUImcTaoD3hqMEgLClsHqAjvY6nd9lHTRMXTMmSivVCR7kk+sigw
 rea2IkQ/J6KJfxLitY83HAod3eOzkXoAArnMkAiaKAF1kX7Jc25bfeySfeHeJNXcYA0Blt
 PtrhTwqJSt/xiMNZZ7YDBkXch7zEanM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-9oaiYUqXOsOykA4o1xBTSw-1; Wed, 26 Aug 2020 07:04:27 -0400
X-MC-Unique: 9oaiYUqXOsOykA4o1xBTSw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C7A7805EE2;
 Wed, 26 Aug 2020 11:04:26 +0000 (UTC)
Received: from localhost (unknown [10.36.110.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 995821992F;
 Wed, 26 Aug 2020 11:04:22 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/8] meson: mingw installation fixes & nsis conversion
Date: Wed, 26 Aug 2020 15:04:11 +0400
Message-Id: <20200826110419.528931-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/26 06:53:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: sw@weilnetz.de, berrange@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi,=0D
=0D
The following patches fix installation path when cross-compiling Windows=0D
version, and move the NSIS build rule to meson.=0D
=0D
v3:=0D
 - change qemu suffix handling, make /-separator implicit=0D
 - use qemu suffix to build qemu_docdir, as --help says=0D
 - use / to construct qemu directory variables in meson=0D
 - add a few signed-off from Daniel=0D
=0D
v2:=0D
 - replaced the shell script by a python version=0D
 - add copyright/license for the new python script=0D
=0D
Marc-Andr=C3=A9 Lureau (8):=0D
  configure: rename confsuffix option=0D
  configure: always /-seperate directory from qemu_suffix=0D
  configure: build docdir like other suffixed directories=0D
  meson: pass qemu_suffix option=0D
  meson: use meson datadir instead of qemu_datadir=0D
  meson: pass docdir option=0D
  meson: use meson mandir instead of qemu_mandir=0D
  meson: add NSIS building=0D
=0D
 Makefile                           | 56 ---------------------=0D
 configure                          | 27 ++++++-----=0D
 contrib/vhost-user-gpu/meson.build |  2 +-=0D
 docs/meson.build                   |  4 +-=0D
 meson.build                        | 34 +++++++++++--=0D
 meson_options.txt                  |  4 ++=0D
 pc-bios/descriptors/meson.build    |  2 +-=0D
 pc-bios/keymaps/meson.build        |  6 +--=0D
 pc-bios/meson.build                |  2 +-=0D
 scripts/nsis.py                    | 78 ++++++++++++++++++++++++++++++=0D
 tools/virtiofsd/meson.build        |  2 +-=0D
 trace/meson.build                  |  2 +-=0D
 12 files changed, 138 insertions(+), 81 deletions(-)=0D
 create mode 100644 scripts/nsis.py=0D
=0D
--=20=0D
2.26.2=0D
=0D


