Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4C34D9686
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 09:43:05 +0100 (CET)
Received: from localhost ([::1]:42700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU2lk-0006RD-7c
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 04:43:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nU2fx-0008L0-RL
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 04:37:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nU2fv-0003xX-Qj
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 04:37:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647333423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HNriY9RsfHQ+I7lniKAyHSaA9JmYT0hPOr0QvC/rhYA=;
 b=D/3euAetAPPqTuT3PTXXCdFZfloCDp68tMzEbIprUaEm8dZ+F4DeDbnDTQo8ckjtvSTwO9
 HUqtPX7b33BGHEI7JJNWpSRoKZdMIWWDuKjPYgYhhkJFSdzPU217wtZqteOjCGBU/lrOhU
 cBZnjfPEG1NbyqnuIeLz6gEr/9/l45o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-DDoyVKQ4ONKipyVeuw6VUw-1; Tue, 15 Mar 2022 04:36:59 -0400
X-MC-Unique: DDoyVKQ4ONKipyVeuw6VUw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ECB8480352D;
 Tue, 15 Mar 2022 08:36:58 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.196.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B1877BEC08;
 Tue, 15 Mar 2022 08:36:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 860F918003A2; Tue, 15 Mar 2022 09:36:56 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/11] Edk2 20220315 patches
Date: Tue, 15 Mar 2022 09:36:45 +0100
Message-Id: <20220315083656.1949517-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 352998df1c53b366413690d95b35f76d0721ebed=
:=0D
=0D
  Merge tag 'i2c-20220314' of https://github.com/philmd/qemu into staging (=
2022-03-14 14:39:33 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/edk2-20220315-pull-request=0D
=0D
for you to fetch changes up to 9b437cd0f95398198852f25d7847a605370f984d:=0D
=0D
  MAINTAINERS: take edk2 (2022-03-15 09:32:22 +0100)=0D
=0D
----------------------------------------------------------------=0D
edk2: update to stable202202=0D
=0D
----------------------------------------------------------------=0D
=0D
Gerd Hoffmann (11):=0D
  tests/acpi: allow virt memory hotplug changes=0D
  edk2: update submodule to stable202202=0D
  edk2: switch to release builds=0D
  edk2: .git can be a file=0D
  edk2: add microvm build=0D
  edk2: update binaries to stable202202=0D
  tests/acpi: update expected data files=0D
  tests/acpi: disallow virt memory hotplug changes=0D
  edk2/docker: install python3=0D
  edk2/docker: use ubuntu 18.04=0D
  MAINTAINERS: take edk2=0D
=0D
 .gitlab-ci.d/edk2/Dockerfile           |   4 ++--=0D
 MAINTAINERS                            |   2 +-=0D
 pc-bios/edk2-aarch64-code.fd.bz2       | Bin 1507722 -> 1161290 bytes=0D
 pc-bios/edk2-arm-code.fd.bz2           | Bin 1503187 -> 1161845 bytes=0D
 pc-bios/edk2-i386-code.fd.bz2          | Bin 1646741 -> 1282120 bytes=0D
 pc-bios/edk2-i386-secure-code.fd.bz2   | Bin 1860546 -> 1473677 bytes=0D
 pc-bios/edk2-x86_64-code.fd.bz2        | Bin 1680164 -> 1327522 bytes=0D
 pc-bios/edk2-x86_64-microvm.fd.bz2     | Bin 0 -> 1309407 bytes=0D
 pc-bios/edk2-x86_64-secure-code.fd.bz2 | Bin 1912112 -> 1513711 bytes=0D
 roms/Makefile.edk2                     |  30 +++++++++++++++++--------=0D
 roms/edk2                              |   2 +-=0D
 roms/edk2-build.sh                     |   2 +-=0D
 tests/data/acpi/virt/SSDT.memhp        | Bin 736 -> 736 bytes=0D
 13 files changed, 26 insertions(+), 14 deletions(-)=0D
 create mode 100644 pc-bios/edk2-x86_64-microvm.fd.bz2=0D
=0D
--=20=0D
2.35.1=0D
=0D


