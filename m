Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2CD31FE11
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 18:42:47 +0100 (CET)
Received: from localhost ([::1]:40040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD9nh-0004sU-R2
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 12:42:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD9k2-00026c-5J
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:38:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lD9jz-0005Mt-Hc
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 12:38:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613756334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4SOncT9Fo54yUG54/z2tFe4UG2s+CTajIRyeydICZjo=;
 b=YZFlL6hfULqIyWQb/z3hlSqI+0d7XDhxI+UD3ulqt3+SsPKHXd9ZhttbYlzjjwfEjvDr+0
 OS5dhGRn9X+jz+YmEHCxkkIgo9z0nNb9Eg1yRcKHJMK2DgeYY39auP1HBisnrvlIVyWzM6
 wOVfVEafosJYWkb6t+gRvciSL9Ml7Vg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-j_TV_XhiPMaW4uo1nGbhPw-1; Fri, 19 Feb 2021 12:38:52 -0500
X-MC-Unique: j_TV_XhiPMaW4uo1nGbhPw-1
Received: by mail-wr1-f72.google.com with SMTP id u15so2773051wrn.3
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 09:38:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lykBUd6DAhrahT8nCJAC5FU9Ql8oesKH07nupx8xYdk=;
 b=rihIkBEocFVFaIqNptYLDhKkmEKuhbutmRBT/Ckwcs4cbPWewRCpOvKN8h3EbBfzbV
 4KYyb7HS78fItVgVFwryGtCikirIX4rEK0IAzcLlHMpyFbaVjSy/2QULOvtNu4IrAi0V
 juODaBHW4v7v8Yzpb9D5mYpvpbfQ/djxmy8vaK1WtLAShkvcJnCEvcrCKh9amvnKhzj9
 pa1dHvvDCErHC3/ESVtUxfXBitVQeWTNcbQL1YReyFcLGOCA68ozdz+q7YibZk/He6pp
 M9D5yBm5TTxJPCZ3wuh16k5NJ/gNCOMZa1wBTabNRc5R+AXIDxF1BudlAnKemyM2xntm
 orrA==
X-Gm-Message-State: AOAM5310R27WuHYEi/134VX7QmO3XYgCJJVR/eF+CpaiDNR8+cKR4PvF
 qvr5WR+sSEUTzcpEPXLN5jTmH1XgKh44D2AxES81d5C8JplyvvJOKcCVdySepA3HBuFRmGFHgNN
 GVvc3Yl/d0Cxt5XzMOzKJKagvDfYDbvSOvv4XxfewTR5a57PZ72R5KoFXBdiXelk1
X-Received: by 2002:adf:e4c3:: with SMTP id v3mr10542060wrm.210.1613756331142; 
 Fri, 19 Feb 2021 09:38:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwI/byrZ/GWSkkhxlUrl1Omb6LyZ4OFFS/CSa2qXI7tP50C7ZajzgipQ5EfU9sygOtDbt6r2g==
X-Received: by 2002:adf:e4c3:: with SMTP id v3mr10542005wrm.210.1613756330876; 
 Fri, 19 Feb 2021 09:38:50 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id l2sm13785629wrm.6.2021.02.19.09.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 09:38:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/11] hw/accel: Exit gracefully when accelerator is invalid
Date: Fri, 19 Feb 2021 18:38:36 +0100
Message-Id: <20210219173847.2054123-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, David Hildenbrand <david@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <rad@semihalf.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This series aims to improve user experience by providing=0D
a better error message when the user tries to enable KVM=0D
on machines not supporting it.=0D
=0D
Since v1:=0D
- added missing x86 arch (Peter)=0D
- consider all accelerators (Daniel and Peter)=0D
- do not enable KVM on sbsa-ref (Leif)=0D
- updated 'query-machines' (Daniel)=0D
- new patch for XenPV=0D
=0D
Supersedes: <20210219114428.1936109-1-philmd@redhat.com>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (11):=0D
  accel/kvm: Check MachineClass kvm_type() return value=0D
  hw/boards: Introduce machine_class_valid_for_accelerator()=0D
  hw/core: Restrict 'query-machines' to those supported by current accel=0D
  hw/arm: Restrit KVM to the virt & versal machines=0D
  hw/mips: Restrict KVM to the malta & virt machines=0D
  hw/ppc: Restrict KVM to various PPC machines=0D
  hw/s390x: Explicit the s390-ccw-virtio machines support TCG and KVM=0D
  hw/i386: Explicit x86 machines support all current accelerators=0D
  hw/xenpv: Restrict Xen Para-virtualized machine to Xen accelerator=0D
  hw/board: Only allow TCG accelerator by default=0D
  softmmu/vl: Exit gracefully when accelerator is not supported=0D
=0D
 include/hw/boards.h        | 27 ++++++++++++++++++++++++++-=0D
 accel/kvm/kvm-all.c        |  6 ++++++=0D
 hw/arm/virt.c              |  5 +++++=0D
 hw/arm/xlnx-versal-virt.c  |  5 +++++=0D
 hw/core/machine-qmp-cmds.c |  4 ++++=0D
 hw/core/machine.c          | 26 ++++++++++++++++++++++++++=0D
 hw/i386/x86.c              |  5 +++++=0D
 hw/mips/loongson3_virt.c   |  5 +++++=0D
 hw/mips/malta.c            |  5 +++++=0D
 hw/ppc/e500plat.c          |  5 +++++=0D
 hw/ppc/mac_newworld.c      |  6 ++++++=0D
 hw/ppc/mac_oldworld.c      |  5 +++++=0D
 hw/ppc/mpc8544ds.c         |  5 +++++=0D
 hw/ppc/ppc440_bamboo.c     |  5 +++++=0D
 hw/ppc/prep.c              |  5 +++++=0D
 hw/ppc/sam460ex.c          |  5 +++++=0D
 hw/ppc/spapr.c             |  5 +++++=0D
 hw/s390x/s390-virtio-ccw.c |  5 +++++=0D
 hw/xenpv/xen_machine_pv.c  |  5 +++++=0D
 softmmu/vl.c               |  7 +++++++=0D
 20 files changed, 145 insertions(+), 1 deletion(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


