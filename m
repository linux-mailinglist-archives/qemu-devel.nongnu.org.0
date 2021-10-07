Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 252554257B5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:19:28 +0200 (CEST)
Received: from localhost ([::1]:37496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYW7D-00059N-7l
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW5L-0002wT-3X
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:17:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW5G-0004S8-ND
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:17:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633623443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hn+p7PzTJj5sD/vAImONJpv09NB1pTbFcHesHrHoEPk=;
 b=U6xeqlNysgvlje3sdSFFs2OZiAqM67/ZHUk4C9gxjIRukRFI/0zpvgD/hhbK6SNDpV8vQP
 koINOWpCiNoZWItxGAnCr2m0IVIGDwszgZRleiagwPIlB4cLJhNmj/6dsZKs0RvsGtG7tV
 BfjoFQ8JDkzelJIqOvbouVaJvMb6PXA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-64jiP___PHCDdrosgFC2ww-1; Thu, 07 Oct 2021 12:17:22 -0400
X-MC-Unique: 64jiP___PHCDdrosgFC2ww-1
Received: by mail-wr1-f70.google.com with SMTP id
 r21-20020adfa155000000b001608162e16dso5101680wrr.15
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 09:17:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p6fHLDVl0Cbua1Rf17vUj4XEPtHLVrJLYw1HhEkRr54=;
 b=uCRAQfxFo5qugiEd3XybrIEcUhWpdCvTuHs1nL2KxrWR5BvqrHXbIzoKv+rVsZiKfe
 m4I1S7POqPlcbsoxE2BsW1ILsTYOljMVAx4gPGVpzManXpGEqss6zvg+bBIf41gf0vQ6
 XMHEkbn0/6BJKh/OVkY6aIe6v7DQWa4GXfr/P2CzgbNN/YKMlTbZgVLKIhqKc+CKN/xu
 QzxNidI/KXrpt7kOh4TFm6bNK0F0zon3JLtOC9UJ+m6vRFxTjSoAvlniztyQrTNzTgwf
 SvHFDfpeOu6iwSGacmLJJfj3tvRxBEvfLJKohxjkSd7+YWTO4eVMetMTVBqZ7kA8afn5
 QxDg==
X-Gm-Message-State: AOAM530guZULBwP8F1pbC4kOhXQkUwzsSGwv+8VVH/4MjX0vTCA46e5f
 so9TDhh32zG4YT486uySQmfSdunIQX9zGTrNoAUY3hNventT8DMx8ohVLZp9nn86AzJGwaGL+cy
 kAXT0Yl2AlDXw6fgYRbRppV2ngtYOqMz6qaVlMe/v9f559dturyp7HTJUSKhqW5mX
X-Received: by 2002:a5d:4481:: with SMTP id j1mr6733776wrq.6.1633623438684;
 Thu, 07 Oct 2021 09:17:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2EmrFsCPnCn7w8xn3CHIU49Oj94zA0/VNeS7NO/gGdXhjH6plu98/nw1ribtc2xuIOoff5g==
X-Received: by 2002:a5d:4481:: with SMTP id j1mr6733725wrq.6.1633623438347;
 Thu, 07 Oct 2021 09:17:18 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id 189sm10243854wmz.27.2021.10.07.09.17.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 09:17:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 00/23] target/i386/sev: Housekeeping SEV + measured Linux
 SEV guest
Date: Thu,  7 Oct 2021 18:16:53 +0200
Message-Id: <20211007161716.453984-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Missing review:=0D
  0005-target-i386-sev-Prefix-QMP-errors-with-SEV.patch=0D
  0012-target-i386-sev-Use-g_autofree-in-sev_launch_get_mea.patch=0D
  0014-target-i386-sev-Rename-sev_i386.h-sev.h.patch=0D
  0016-target-i386-sev-Remove-stubs-by-using-code-elision.patch=0D
  0023-MAINTAINERS-Cover-SEV-related-files-with-X86-KVM-sec.patch=0D
=0D
Hi,=0D
=0D
While testing James & Dov patch:=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg810571.html=0D
I wasted some time trying to figure out how OVMF was supposed to=0D
behave until realizing the binary I was using was built without SEV=0D
support... Then wrote this series to help other developers to not=0D
hit the same problem.=0D
=0D
Since v3:=0D
- Rebased ('Measured Linux SEV guest' from Dov [1] merged)=0D
- Addressed Paolo & David review comments=0D
=0D
Since v2:=0D
- Rebased on top of SGX=0D
- Addressed review comments from Markus / David=0D
- Included/rebased 'Measured Linux SEV guest' from Dov [1]=0D
- Added orphean MAINTAINERS section=0D
=0D
[1] https://lore.kernel.org/qemu-devel/20210825073538.959525-1-dovmurik@lin=
ux.ibm.com/=0D
=0D
Supersedes: <20210616204328.2611406-1-philmd@redhat.com>=0D
=0D
Dr. David Alan Gilbert (1):=0D
  target/i386/sev: sev_get_attestation_report use g_autofree=0D
=0D
Philippe Mathieu-Daud=C3=A9 (22):=0D
  qapi/misc-target: Wrap long 'SEV Attestation Report' long lines=0D
  qapi/misc-target: Group SEV QAPI definitions=0D
  target/i386/kvm: Introduce i386_softmmu_kvm Meson source set=0D
  target/i386/kvm: Restrict SEV stubs to x86 architecture=0D
  target/i386/sev: Prefix QMP errors with 'SEV'=0D
  target/i386/monitor: Return QMP error when SEV is not enabled for=0D
    guest=0D
  target/i386/cpu: Add missing 'qapi/error.h' header=0D
  target/i386/sev_i386.h: Remove unused headers=0D
  target/i386/sev: Remove sev_get_me_mask()=0D
  target/i386/sev: Mark unreachable code with g_assert_not_reached()=0D
  target/i386/sev: Use g_autofree in sev_launch_get_measure()=0D
  target/i386/sev: Restrict SEV to system emulation=0D
  target/i386/sev: Rename sev_i386.h -> sev.h=0D
  target/i386/sev: Declare system-specific functions in 'sev.h'=0D
  target/i386/sev: Remove stubs by using code elision=0D
  target/i386/sev: Move qmp_query_sev_attestation_report() to sev.c=0D
  target/i386/sev: Move qmp_sev_inject_launch_secret() to sev.c=0D
  target/i386/sev: Move qmp_query_sev_capabilities() to sev.c=0D
  target/i386/sev: Move qmp_query_sev_launch_measure() to sev.c=0D
  target/i386/sev: Move qmp_query_sev() & hmp_info_sev() to sev.c=0D
  monitor: Reduce hmp_info_sev() declaration=0D
  MAINTAINERS: Cover SEV-related files with X86/KVM section=0D
=0D
 qapi/misc-target.json                 |  77 ++++++------=0D
 include/monitor/hmp-target.h          |   1 +=0D
 include/monitor/hmp.h                 |   1 -=0D
 include/sysemu/sev.h                  |  28 -----=0D
 target/i386/{sev_i386.h =3D> sev.h}     |  35 ++++--=0D
 hw/i386/pc_sysfw.c                    |   2 +-=0D
 hw/i386/x86.c                         |   2 +-=0D
 target/i386/cpu.c                     |  16 +--=0D
 target/i386/kvm/kvm.c                 |   3 +-=0D
 {accel =3D> target/i386}/kvm/sev-stub.c |   2 +-=0D
 target/i386/monitor.c                 |  92 +--------------=0D
 target/i386/sev-stub.c                |  88 --------------=0D
 target/i386/sev-sysemu-stub.c         |  70 +++++++++++=0D
 target/i386/sev.c                     | 164 +++++++++++++++++++-------=0D
 MAINTAINERS                           |   2 +=0D
 accel/kvm/meson.build                 |   1 -=0D
 target/i386/kvm/meson.build           |   8 +-=0D
 target/i386/meson.build               |   4 +-=0D
 18 files changed, 279 insertions(+), 317 deletions(-)=0D
 delete mode 100644 include/sysemu/sev.h=0D
 rename target/i386/{sev_i386.h =3D> sev.h} (62%)=0D
 rename {accel =3D> target/i386}/kvm/sev-stub.c (94%)=0D
 delete mode 100644 target/i386/sev-stub.c=0D
 create mode 100644 target/i386/sev-sysemu-stub.c=0D
=0D
--=20=0D
2.31.1=0D
=0D


