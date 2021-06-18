Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1C43ACA64
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 13:48:14 +0200 (CEST)
Received: from localhost ([::1]:51148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luCyq-0005VS-KB
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 07:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1luCxY-0004ky-GH
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 07:46:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1luCxO-000360-PV
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 07:46:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624016801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kjIYEKjuF9gmHhKIOWEMR9NnaCBW5CObdcEQrUAM3Vc=;
 b=VCzOHvlfIQqkd3G/uJy/ew6j82aDvgBrsPjHlowwjrrmOhRUvhdAyCbyBaaajpgoXlDdBl
 4TIPKyZqnwYW8xfJfUYJEyRXmCHwGRl9xchgFjnkoqyt+VeiilNeL92kSnCGtIU2LWMGlD
 lTM4SnI5scBRCrTvHY9XIcMCXsCjn/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-EeFxDPjhN5q6wLkbQTQvSA-1; Fri, 18 Jun 2021 07:46:39 -0400
X-MC-Unique: EeFxDPjhN5q6wLkbQTQvSA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3C90C73AA;
 Fri, 18 Jun 2021 11:46:37 +0000 (UTC)
Received: from localhost (unknown [10.43.2.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C2E0163D9;
 Fri, 18 Jun 2021 11:46:24 +0000 (UTC)
Date: Fri, 18 Jun 2021 13:46:23 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 00/23] target/i386/sev: Housekeeping (OVMF +
 SEV-disabled binaries)
Message-ID: <20210618134623.5964098e@redhat.com>
In-Reply-To: <20210617164114-mutt-send-email-mst@kernel.org>
References: <20210616204328.2611406-1-philmd@redhat.com>
 <20210617164114-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
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
Cc: Laszlo Ersek <lersek@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Eric Blake <eblake@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Jun 2021 16:42:24 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Wed, Jun 16, 2021 at 10:43:05PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Hi,
> >=20
> > While testing James & Dov patch:
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg810571.html
> > I wasted some time trying to figure out how OVMF was supposed to
> > behave until realizing the binary I was using was built without SEV
> > support... Then wrote this series to help other developers to not
> > hit the same problem.
> >=20
> > Some SEV patches I was following have been queued on Eduardo's
> > 'x86-next' tree, so I used his tree as base, and included David and
> > Connor patches to reduce merge conflicts.
> >=20
> > Patches 1-16 are SEV related,
> > patches 17-23 are OVMF related.
> >=20
> > Special comment for Laszlo: Please don't review this version,
> > wait for the respin (hoping the SEV cleanup patch get accepted,
> > the respin will be focused on OVMF).
> >=20
> > Based-on: https://gitlab.com/ehabkost/qemu/-/commits/x86-next/
> > Supersedes: <20210610064556.1421620-1-philmd@redhat.com> =20
>=20
>=20
> acpi things
>=20
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>=20
> do you want to split acpi things out so I can merge?
I agree they should have been split out.
(I see in cover letter SEV don't look into series anymore, so
this APCI patches which are totally irrelevant to SEV weren't
even unnoticed).

Perhaps I should take these into my ACPI refactoring series
(with your acks), which would need to be rebased on top of these.
Though I'd drop 19/23 which doesn't look correct to me.

>=20
> > Connor Kuehl (1):
> >   MAINTAINERS: Add Connor Kuehl as reviewer for AMD SEV
> >=20
> > Dr. David Alan Gilbert (1):
> >   target/i386/sev: sev_get_attestation_report use g_autofree
> >=20
> > Philippe Mathieu-Daud=C3=A9 (21):
> >   qapi/misc-target: Wrap long 'SEV Attestation Report' long lines
> >   qapi/misc-target: Group SEV QAPI definitions
> >   target/i386/monitor: Return QMP error when SEV is disabled in build
> >   target/i386/cpu: Add missing 'qapi/error.h' header
> >   target/i386/sev_i386.h: Remove unused headers
> >   target/i386/sev: Remove sev_get_me_mask()
> >   target/i386/sev: Mark unreachable code with g_assert_not_reached()
> >   target/i386/sev: Restrict SEV to system emulation
> >   target/i386/sev: Move qmp_query_sev_attestation_report() to sev.c
> >   target/i386/sev: Move qmp_sev_inject_launch_secret() to sev.c
> >   target/i386/sev: Move qmp_query_sev_capabilities() to sev.c
> >   target/i386/sev: Move qmp_query_sev_launch_measure() to sev.c
> >   target/i386/sev: Move qmp_query_sev() & hmp_info_sev() to sev.c
> >   monitor: Restrict 'info sev' to x86 targets
> >   hw/i386/acpi-common: Remove unused includes
> >   hw/i386: Rename acpi-build.c -> acpi-pc.c
> >   hw/i386: Move pc_madt_cpu_entry() to acpi-pc.c
> >   hw/acpi: Do not restrict ACPI core routines to x86 architecture
> >   hw/i386: Introduce X86_FW_OVMF Kconfig symbol
> >   hw/acpi/Kconfig: Add missing Kconfig dependencies (build error)
> >   hw/i386/Kconfig: Add missing Kconfig dependency (runtime error)
> >=20
> >  qapi/misc-target.json               |  78 ++++++++--------
> >  include/hw/i386/pc.h                |   1 +
> >  include/monitor/hmp-target.h        |   1 +
> >  include/monitor/hmp.h               |   1 -
> >  target/i386/sev_i386.h              |  11 ---
> >  hw/i386/acpi-common.c               |  45 ----------
> >  hw/i386/{acpi-build.c =3D> acpi-pc.c} |  39 ++++++++
> >  hw/i386/pc_sysfw.c                  | 107 ----------------------
> >  hw/i386/pc_sysfw_ovmf-stubs.c       |  26 ++++++
> >  hw/i386/pc_sysfw_ovmf.c             | 135 ++++++++++++++++++++++++++++
> >  target/i386/cpu.c                   |   1 +
> >  target/i386/monitor.c               |  91 -------------------
> >  target/i386/sev-stub.c              |  49 +---------
> >  target/i386/sev-sysemu-stub.c       |  69 ++++++++++++++
> >  target/i386/sev.c                   | 130 +++++++++++++++++++++------
> >  MAINTAINERS                         |   8 ++
> >  hw/acpi/Kconfig                     |   4 +
> >  hw/acpi/meson.build                 |   3 +-
> >  hw/i386/Kconfig                     |   5 ++
> >  hw/i386/meson.build                 |   4 +-
> >  target/i386/meson.build             |   4 +-
> >  21 files changed, 443 insertions(+), 369 deletions(-)
> >  rename hw/i386/{acpi-build.c =3D> acpi-pc.c} (98%)
> >  create mode 100644 hw/i386/pc_sysfw_ovmf-stubs.c
> >  create mode 100644 hw/i386/pc_sysfw_ovmf.c
> >  create mode 100644 target/i386/sev-sysemu-stub.c
> >=20
> > --=20
> > 2.31.1
> >  =20
>=20


