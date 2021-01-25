Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0C5302276
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 08:37:06 +0100 (CET)
Received: from localhost ([::1]:53632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3wQr-0008Lj-Mh
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 02:37:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l3wOf-0007TU-1U
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 02:34:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1l3wOY-0001nQ-7h
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 02:34:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611560080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LKfihgdTFEtng/wgj1FTvuZ4H9Gw80OiMy9Lc7XPLX8=;
 b=Z3x3OvotyvBfi2tafYM3QiAyWQQiNqY3z03fOs9kEhwUmD9invv1FekOJ/YtAWe5+Oj5r3
 ZJV+TLyL5UOpZeNdt1E5SWIz9hQaQM6ZdFKS09/BMt/tNQJ7vXck3KaxGYkHvTHNOzdNn3
 4kmMfIMrNIGEx2c+CSYj+0sPrqG1Avc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-7oTJd4dtPDmuMN7acqZfwg-1; Mon, 25 Jan 2021 02:34:36 -0500
X-MC-Unique: 7oTJd4dtPDmuMN7acqZfwg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CE2D8144E3;
 Mon, 25 Jan 2021 07:34:35 +0000 (UTC)
Received: from localhost (unknown [10.36.110.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2B9C818401;
 Mon, 25 Jan 2021 07:34:30 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] Update libslirp & make it a subproject
Date: Mon, 25 Jan 2021 11:34:25 +0400
Message-Id: <20210125073427.3970606-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: samuel.thibault@ens-lyon.org, j@getutm.app,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

Hi,=0D
=0D
Here is a few patches to update libslirp to git upstream.=0D
Since it now supports meson subproject(), adapt the build=0D
system to use it, and related fixes.=0D
=0D
v2:=0D
 - fix unused variables on macos=0D
 - fork_exec_child_setup: improve signal handling=0D
=0D
Marc-Andr=C3=A9 Lureau (2):=0D
  slirp: update to git master=0D
  build-sys: make libslirp a meson subproject=0D
=0D
 configure            |  2 +-=0D
 meson.build          | 62 +++-----------------------------------------=0D
 .gitmodules          |  4 +--=0D
 slirp                |  1 -=0D
 subprojects/libslirp |  1 +=0D
 5 files changed, 8 insertions(+), 62 deletions(-)=0D
 delete mode 160000 slirp=0D
 create mode 160000 subprojects/libslirp=0D
=0D
--=20=0D
2.29.0=0D
=0D


