Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA9E4D5AB1
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 06:41:40 +0100 (CET)
Received: from localhost ([::1]:49634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSY1z-0005za-35
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 00:41:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nSXzH-0003Kw-K7
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 00:38:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nSXzF-0003D9-ST
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 00:38:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646977129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IObTDjc+vZU1QaQObRsGsUGBQ2qqyqLiORLTHYlK164=;
 b=cyhL8vh0F0dS2PcUGeCIHbUnw2ALNBahY5h4ZrEWkJaTR7EHGtpfHD6rTA5NZ9kY8aMpWu
 +P6YjadUSNd3KYziSElOZdDW02L2vnLSfjCOl5BGS+OsFxYB5dZM1gRGSvIHsNCCIkNLYW
 jlTrd7V9ckPApUoqOTJUDvmJ2BWur/E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-CIVHijZvNKmwnv2omrWW4A-1; Fri, 11 Mar 2022 00:38:47 -0500
X-MC-Unique: CIVHijZvNKmwnv2omrWW4A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B17371091DA1;
 Fri, 11 Mar 2022 05:38:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.196.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F0CF54555;
 Fri, 11 Mar 2022 05:38:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4FBE818000B3; Fri, 11 Mar 2022 06:37:59 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/11] edk2: update to stable202202
Date: Fri, 11 Mar 2022 06:37:48 +0100
Message-Id: <20220311053759.875785-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

While being at it switch to RELEASE builds,=0D
which in turn needs acpi test data updates.=0D
=0D
Add microvm build.  Update MAINTAINERS.=0D
Some build/ci tweaks.=0D
=0D
Also available here:=0D
  https://gitlab.com/kraxel/qemu/-/commits/edk2=0D
=0D
v2:=0D
 - tweaked .git check=0D
 - updated acpi table commit messages.=0D
 - picked up review tags.=0D
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


