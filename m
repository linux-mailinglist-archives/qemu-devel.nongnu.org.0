Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF5B1956E1
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Mar 2020 13:13:02 +0100 (CET)
Received: from localhost ([::1]:41028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHnrB-0006wH-IL
	for lists+qemu-devel@lfdr.de; Fri, 27 Mar 2020 08:13:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35227)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jHnpb-0005HM-4H
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 08:11:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1jHnpZ-0002Ae-Mx
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 08:11:22 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:59486)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1jHnpZ-00028m-Ih
 for qemu-devel@nongnu.org; Fri, 27 Mar 2020 08:11:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585311081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SzdIw7Y0WZj7V5IFmk3evAd4oJqGuWGlqAKgBc4grOE=;
 b=HZ1LjBGJuiinpf05a++KJgWDQmSVAmojrmPF/Keh0KLVFmxZnSDyY7y59a+M7Bla8ANfeR
 CwoFmPy8hFq+Rfr4K4yDvwSuPaCidWwKUP3S+ijoI30JH7MtSPoPLJZaFf0S/mLO1kamHf
 GgBIImQvYOJjWWRKEUJgEKFghRfJBwY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-md1r-0VxO6eW0i-wVqRP6A-1; Fri, 27 Mar 2020 08:11:19 -0400
X-MC-Unique: md1r-0VxO6eW0i-wVqRP6A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F9018017CC;
 Fri, 27 Mar 2020 12:11:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-49.ams2.redhat.com
 [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE8445E02A;
 Fri, 27 Mar 2020 12:11:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BB4EF9D43; Fri, 27 Mar 2020 13:11:11 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/6] acpi: i386 tweaks
Date: Fri, 27 Mar 2020 13:11:05 +0100
Message-Id: <20200327121111.1530-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

First batch of microvm patches, some generic acpi stuff.
Split the acpi-build.c monster, specifically split the
pc and q35 and pci bits into a separate file which we
can skip building at some point in the future.

Also some small refactorings and simplifications.

take care,
  Gerd

Gerd Hoffmann (6):
  acpi: split hw/i386/acpi-build.c
  acpi: make build_madt() more generic.
  acpi: factor out acpi_dsdt_add_fw_cfg()
  acpi: drop pointless _STA method
  acpi: serial: don't use _STA method
  acpi: parallel: don't use _STA method

 hw/i386/acpi-build-internal.h             |  35 +++
 hw/i386/acpi-build-core.c                 | 191 +++++++++++++
 hw/i386/{acpi-build.c =3D> acpi-build-pc.c} | 315 ++++------------------
 hw/i386/Makefile.objs                     |   3 +-
 4 files changed, 284 insertions(+), 260 deletions(-)
 create mode 100644 hw/i386/acpi-build-internal.h
 create mode 100644 hw/i386/acpi-build-core.c
 rename hw/i386/{acpi-build.c =3D> acpi-build-pc.c} (91%)

--=20
2.18.2


