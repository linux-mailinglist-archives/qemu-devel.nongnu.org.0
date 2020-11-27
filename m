Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADC52C6A68
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 18:10:06 +0100 (CET)
Received: from localhost ([::1]:60988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kihG0-00036w-U3
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 12:10:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kihEq-0002Mf-6X
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 12:08:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1kihEm-0000PF-Hj
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 12:08:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606496927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Akg/cvZfux2/L3giiV02GVXMC6gfqJOdP54xrFWoWpY=;
 b=A96YEHM5ff+2i3VeT91tfa8pf4OPL3Yysk6uhmpEeXCezehmoDiq4w/wM8AWEJe4E1pbot
 2ICyh0rYtovAglA/DKZW4TdsNWb7Wj+kREVjQi3zvep1VpNopTWrK7VSCDRl/HGKLyVt0+
 OkkFd2agYXYS1vVFv3UbfCUZ7tT2zqA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-jWmDEthMOG2KC-obGuEsZw-1; Fri, 27 Nov 2020 12:08:45 -0500
X-MC-Unique: jWmDEthMOG2KC-obGuEsZw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15FAD8049C3;
 Fri, 27 Nov 2020 17:08:44 +0000 (UTC)
Received: from localhost (unknown [10.36.110.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2E9B26085D;
 Fri, 27 Nov 2020 17:08:39 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] Libslirp CVE-2020-29129 CVE-2020-29130
Date: Fri, 27 Nov 2020 21:08:35 +0400
Message-Id: <20201127170836.687073-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>=0D

The following changes since commit ea8208249d1082eae0444934efb3b59cd3183f05=
:=0D
=0D
  Merge remote-tracking branch 'remotes/kraxel/tags/fixes-20201127-pull-req=
uest' into staging (2020-11-27 11:11:43 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git@github.com:elmarco/qemu.git tags/libslirp-pull-request=0D
=0D
for you to fetch changes up to 37c0c885d19a4c2d69faed891b5c02aaffbdccfb:=0D
=0D
  slirp: update to fix CVE-2020-29129 CVE-2020-29130 (2020-11-27 20:57:11 +=
0400)=0D
=0D
----------------------------------------------------------------=0D
=0D
----------------------------------------------------------------=0D
=0D
Marc-Andr=C3=A9 Lureau (1):=0D
  slirp: update to fix CVE-2020-29129 CVE-2020-29130=0D
=0D
 slirp | 2 +-=0D
 1 file changed, 1 insertion(+), 1 deletion(-)=0D
=0D
--=20=0D
2.29.0=0D
=0D


