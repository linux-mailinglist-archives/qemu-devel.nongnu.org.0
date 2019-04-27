Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F044B3C9
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Apr 2019 16:47:54 +0200 (CEST)
Received: from localhost ([127.0.0.1]:32906 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hKOcL-0007JJ-7W
	for lists+qemu-devel@lfdr.de; Sat, 27 Apr 2019 10:47:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43576)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hKOZq-0005eR-8P
	for qemu-devel@nongnu.org; Sat, 27 Apr 2019 10:45:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hKOVJ-0004iz-B5
	for qemu-devel@nongnu.org; Sat, 27 Apr 2019 10:40:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51800)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hKOVJ-0004hS-5l
	for qemu-devel@nongnu.org; Sat, 27 Apr 2019 10:40:37 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E29B930B0862;
	Sat, 27 Apr 2019 14:40:35 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-83.brq.redhat.com [10.40.204.83])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D8401001E81;
	Sat, 27 Apr 2019 14:40:27 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 27 Apr 2019 16:40:22 +0200
Message-Id: <20190427144025.22880-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Sat, 27 Apr 2019 14:40:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/3] hw/i386/acpi: Improve build modularity
 (isapc/q35/...)
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Yang Zhong <yang.zhong@intel.com>, Thomas Huth <thuth@redhat.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series allow to build the ISAPC/Q35 machines independently.

Regards,

Phil.

Philippe Mathieu-Daud=C3=A9 (3):
  hw/acpi/piix4: Move TYPE_PIIX4_PM to a public header
  hw/i386/acpi: Add object_resolve_type_unambiguous to improve
    modularity
  hw/i386/acpi: Assert a pointer is not null BEFORE using it

 hw/acpi/piix4.c         | 13 -------------
 hw/i386/acpi-build.c    | 22 +++++++++++++++++-----
 hw/isa/lpc_ich9.c       | 11 -----------
 include/hw/acpi/piix4.h |  2 +-
 include/hw/i386/ich9.h  |  2 --
 5 files changed, 18 insertions(+), 32 deletions(-)

--=20
2.20.1


