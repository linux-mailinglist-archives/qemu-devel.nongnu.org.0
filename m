Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E718D3DF00A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 16:19:38 +0200 (CEST)
Received: from localhost ([::1]:42312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAvGc-0000oY-17
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 10:19:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mAvFs-00007P-I4
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:18:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mAvFr-00052n-8L
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 10:18:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628000330;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qqKuCI5BTJ6GbTAfW93fTbqJeuXoCVCSHBWefsMtSJQ=;
 b=bm7Dch+cHckMd7M8NoDFB0SfUttgm0lnJnyKtTwcIymXF8WERdKJjtKzoM2oQRSa5hjtZ4
 KcOeIGSfuMQhsKusOsNZcuEkL34VUq5dxUpGw9Un4lH4MRXGR/zxOnUWkjkmAJ5c9KV6X0
 KfDYyAjFvs9tfFAAdbnhbWUktYTja5A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-ed_KNJ9ROF-ixhAcqFf37A-1; Tue, 03 Aug 2021 10:18:43 -0400
X-MC-Unique: ed_KNJ9ROF-ixhAcqFf37A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0E0B801B3C;
 Tue,  3 Aug 2021 14:18:41 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2518710016F7;
 Tue,  3 Aug 2021 14:18:36 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL v4 0/1] Libslirp patches
Date: Tue,  3 Aug 2021 18:18:32 +0400
Message-Id: <20210803141833.3468770-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
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
Cc: samuel.thibault@ens-lyon.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

The following changes since commit 7f1cab9c628a798ae2607940993771e6300e9e00=
:=0D
=0D
  Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' i=
nto staging (2021-08-02 17:21:50 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git@github.com:elmarco/qemu.git tags/libslirp-pull-request=0D
=0D
for you to fetch changes up to 43f547b73dfaf108c9aaacb0b36200e2e7a200f1:=0D
=0D
  Update libslirp to v4.6.1 (2021-08-03 16:07:22 +0400)=0D
=0D
----------------------------------------------------------------=0D
Update libslirp=0D
=0D
Hi,=0D
=0D
v4:=0D
 - drop subproject patch=0D
 - fix OSX linking issue=0D
=0D
v3:=0D
 - rebased=0D
 - (checked compilation with P. Maydell extra-cflags reported failure & git=
lab CI)=0D
=0D
v2:=0D
 - fix unused variables on macos=0D
 - fork_exec_child_setup: improve signal handling=0D
=0D
----------------------------------------------------------------=0D
=0D
Marc-Andr=C3=A9 Lureau (1):=0D
  Update libslirp to v4.6.1=0D
=0D
 meson.build | 2 ++=0D
 slirp       | 2 +-=0D
 2 files changed, 3 insertions(+), 1 deletion(-)=0D
=0D
--=20=0D
2.32.0.264.g75ae10bc75=0D
=0D


