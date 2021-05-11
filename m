Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E3537A78B
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 15:28:37 +0200 (CEST)
Received: from localhost ([::1]:45272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgSR9-0007BZ-Fa
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 09:28:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgSPo-0005Wu-Qp
 for qemu-devel@nongnu.org; Tue, 11 May 2021 09:27:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgSPl-0000J5-Dd
 for qemu-devel@nongnu.org; Tue, 11 May 2021 09:27:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620739627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1PhfcqQyB0SOMvyC867ZjCRMntl/09zTSepdxIw/HYo=;
 b=IRT0gAnpZs/oGIrasmMF2lRESWxtaNUxETn7DgoLwNH1cFptdhY9GjpEvMr04yL/zk/WTq
 RArweTuDrdNF1FfuQ2T4PPvIP76fZ8XegTzHPGJtE29tyIRnD0uaUUlrcthNVO3oiLMiXQ
 KJXWbNOMUkB5YH6XMr4RgqcOnr6NV+Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-Mr68ltlhNPugqLr3KD1Diw-1; Tue, 11 May 2021 09:27:04 -0400
X-MC-Unique: Mr68ltlhNPugqLr3KD1Diw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 424B28015F5;
 Tue, 11 May 2021 13:27:03 +0000 (UTC)
Received: from foo.redhat.com (ovpn-115-93.ams2.redhat.com [10.36.115.93])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91D8E39A71;
 Tue, 11 May 2021 13:26:42 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 00/12] Wave goodbye to RHEL 7 vintage distros
Date: Tue, 11 May 2021 14:26:29 +0100
Message-Id: <20210511132641.1022161-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The main motivation for this series is to eliminate some backcompat=0D
logic in the crypto code only needed for RHEL-7. I take the opportunity=0D
to also bump the min required versions of glib, gcc and clang since we=0D
have dropped many distros since they were last bumped.=0D
=0D
There are possibly some more cleanups that can be done as a side effect=0D
of these new min versions, but I leave that for other interested people=0D
to look at.=0D
=0D
One that might be intesting is switching from std=3Dgnu99 to gnu11 since=0D
we're no longer constrainted by the 4.8.x vintage GCC which marked gnu11=0D
as experimental (see 7be41675f7cb16be7c8d2554add7a63fa43781a8)=0D
=0D
Daniel P. Berrang=C3=A9 (12):=0D
  gitlab: move linux user build job from CentOS 7 to CentOS 8=0D
  patchew: move quick build job from CentOS 7 to CentOS 8 container=0D
  crypto: bump min nettle to 3.3, dropping RHEL-7 support=0D
  crypto: drop back compatibility typedefs for nettle=0D
  crypto: bump min gcrypt to 1.7.6, dropping RHEL-7 support=0D
  crypto: bump min gnutls to 3.5.8, dropping RHEL-7 support=0D
  crypto: drop used conditional check=0D
  tests/vm: convert centos VM recipe to CentOS 8=0D
  tests/docker: drop CentOS 7 container=0D
  bump min required glib version to 2.50=0D
  configure: bump min required GCC to 6.3.0=0D
  configure: bump min required CLang to 7.0.0 / XCode 10.2=0D
=0D
 .gitlab-ci.d/containers.yml             |   5 -=0D
 .gitlab-ci.yml                          |  41 +----=0D
 .patchew.yml                            |   6 +-=0D
 configure                               |  40 ++---=0D
 crypto/cipher-nettle.c.inc              |  91 +++--------=0D
 crypto/hash-nettle.c                    |  10 +-=0D
 crypto/hmac-nettle.c                    |  12 +-=0D
 crypto/meson.build                      |   6 +-=0D
 crypto/tlscredsx509.c                   |   2 -=0D
 include/glib-compat.h                   |   9 --=0D
 tests/docker/dockerfiles/centos7.docker |  43 -----=0D
 tests/docker/dockerfiles/centos8.docker |   1 +=0D
 tests/vm/centos                         |   6 +-=0D
 util/oslib-win32.c                      | 204 ------------------------=0D
 14 files changed, 52 insertions(+), 424 deletions(-)=0D
 delete mode 100644 tests/docker/dockerfiles/centos7.docker=0D
=0D
--=20=0D
2.31.1=0D
=0D


