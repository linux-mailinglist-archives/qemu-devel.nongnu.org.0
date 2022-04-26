Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 218E35101AE
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 17:15:16 +0200 (CEST)
Received: from localhost ([::1]:36404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njMuJ-0004Dq-16
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 11:15:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1njMsf-0002IZ-Oc
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 11:13:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1njMsd-0006r2-Mv
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 11:13:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650986010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ce9X9jG0PcsOPMiCP8EIRzaFuEwxqbZJ0KK01o9p4i8=;
 b=VkFaKLQ/TsEdQPkpFbzDkitoPG/vLVL2QgrfPvOCauEUt/IOvZ9xB3pWBglhpYS/zWjio4
 VfAzXVJMiCoSvFj4Futszt31/2Fy+0qCBpCHtqpf24MaKrF3PYYywML+Ne15Fi3kP9yhVI
 JZoxKj+0/93ckxhMn0TTtGOam9zMkGw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-_IWaViWrOXGLYX1VILPtOQ-1; Tue, 26 Apr 2022 11:13:27 -0400
X-MC-Unique: _IWaViWrOXGLYX1VILPtOQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C4374801E80;
 Tue, 26 Apr 2022 15:13:26 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0661554CB18;
 Tue, 26 Apr 2022 15:13:24 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] Misc next patches
Date: Tue, 26 Apr 2022 16:13:20 +0100
Message-Id: <20220426151323.729982-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, libvir-list@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit a1755db71e34df016ffc10aa0727360aae2c6036=
:=0D
=0D
  Merge tag 'pull-block-2022-04-25' of https://gitlab.com/hreitz/qemu into =
staging (2022-04-25 13:35:41 -0700)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/berrange/qemu tags/misc-next-pull-request=0D
=0D
for you to fetch changes up to 5cf434b5af386fadc3418df71d3738676cbb0549:=0D
=0D
  github: fix config mistake preventing repo lockdown commenting (2022-04-2=
6 16:12:26 +0100)=0D
=0D
----------------------------------------------------------------=0D
Misc patch queue=0D
=0D
* Removes depecated --enable-fips QEMU system emulator option=0D
* Fixes array bounds check in keycode conversion for ESCC device=0D
=0D
----------------------------------------------------------------=0D
=0D
Daniel P. Berrang=C3=A9 (3):=0D
  softmmu: remove deprecated --enable-fips option=0D
  hw/char: fix qcode array bounds check in ESCC impl=0D
  github: fix config mistake preventing repo lockdown commenting=0D
=0D
 .github/workflows/lockdown.yml  |  6 +++---=0D
 docs/about/deprecated.rst       | 12 ------------=0D
 docs/about/removed-features.rst | 11 +++++++++++=0D
 hw/char/escc.c                  |  2 +-=0D
 include/qemu/osdep.h            |  3 ---=0D
 os-posix.c                      |  8 --------=0D
 qemu-options.hx                 | 10 ----------=0D
 ui/vnc.c                        |  7 -------=0D
 util/osdep.c                    | 28 ----------------------------=0D
 9 files changed, 15 insertions(+), 72 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D


