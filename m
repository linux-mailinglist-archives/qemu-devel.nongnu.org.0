Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1770D4B9F77
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 13:00:10 +0100 (CET)
Received: from localhost ([::1]:51664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKfSC-0005av-LI
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 07:00:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKfPh-0002or-Cv
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 06:57:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nKfPf-00010L-SA
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 06:57:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645099051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=J4gOFVH5oAITIwEBuYM7l5bndyeRVEyogBj30pjjayw=;
 b=YfVPqeJuuO0pH6uZkINXDKw54s8oS3FxoaSBL42EOZbT3HfcWrlWbKABr+Al+O0eWXyHKZ
 VcOz43rqmo2b5jAV/wHoe/yumTQdvFdqmr1yTLRbQ8jyI6Lm9io9GjVypkQPVu+B1hpXOr
 mSgdgpAMCgM/aoqNJaGQEs/rJLyOySA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-j04bjGZcPwaP_mrMezPBaA-1; Thu, 17 Feb 2022 06:57:28 -0500
X-MC-Unique: j04bjGZcPwaP_mrMezPBaA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CC2A1091DA3;
 Thu, 17 Feb 2022 11:57:27 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0AE7C108648D;
 Thu, 17 Feb 2022 11:57:24 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/10] Misc next patches
Date: Thu, 17 Feb 2022 11:57:13 +0000
Message-Id: <20220217115723.1782616-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Kashyap Chamarthy <kchamart@redhat.com>,
 "Richard W.M. Jones" <rjones@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit ad38520bdeb2b1e0b487db317f29119e94c1c88d=
:=0D
=0D
  Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-req=
uest' into staging (2022-02-15 19:30:33 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/berrange/qemu tags/misc-next-pull-request=0D
=0D
for you to fetch changes up to 2720ceda0521bc43139cfdf45e3e470559e11ce3:=0D
=0D
  docs: expand firmware descriptor to allow flash without NVRAM (2022-02-16=
 18:53:26 +0000)=0D
=0D
----------------------------------------------------------------=0D
This misc series of changes:=0D
=0D
 - Improves documentation of SSH fingerprint checking=0D
 - Fixes SHA256 fingerprints with non-blockdev usage=0D
 - Blocks the clone3, setns, unshare & execveat syscalls=0D
   with seccomp=0D
 - Blocks process spawning via clone syscall, but allows=0D
   threads, with seccomp=0D
 - Takes over seccomp maintainer role=0D
 - Expands firmware descriptor spec to allow flash=0D
   without NVRAM=0D
=0D
----------------------------------------------------------------=0D
=0D
Daniel P. Berrang=C3=A9 (10):=0D
  block: better document SSH host key fingerprint checking=0D
  block: support sha256 fingerprint with pre-blockdev options=0D
  block: print the server key type and fingerprint on failure=0D
  seccomp: allow action to be customized per syscall=0D
  seccomp: add unit test for seccomp filtering=0D
  seccomp: fix blocking of process spawning=0D
  seccomp: block use of clone3 syscall=0D
  seccomp: block setns, unshare and execveat syscalls=0D
  MAINTAINERS: take over seccomp from Eduardo Otubo=0D
  docs: expand firmware descriptor to allow flash without NVRAM=0D
=0D
 MAINTAINERS                            |   5 +-=0D
 block/ssh.c                            |  42 +++-=0D
 docs/interop/firmware.json             |  54 ++++-=0D
 docs/system/qemu-block-drivers.rst.inc |  30 ++-=0D
 softmmu/qemu-seccomp.c                 | 282 +++++++++++++++++++------=0D
 tests/unit/meson.build                 |   4 +=0D
 tests/unit/test-seccomp.c              | 269 +++++++++++++++++++++++=0D
 7 files changed, 599 insertions(+), 87 deletions(-)=0D
 create mode 100644 tests/unit/test-seccomp.c=0D
=0D
--=20=0D
2.34.1=0D
=0D


