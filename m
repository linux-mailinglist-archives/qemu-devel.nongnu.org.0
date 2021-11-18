Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A985B456372
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 20:23:29 +0100 (CET)
Received: from localhost ([::1]:59568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnn0K-0004Yj-AI
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 14:23:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnmxR-0002cE-Tn
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 14:20:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnmxO-00069m-AF
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 14:20:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637263225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6dS0brA8+30QqRm5zKm6fxcs1rYR6OuQADqB4TDp/Ac=;
 b=XZX0zgRVHOtqVvf7EJlgZMpnKpP6f95xERM50i2lNTp6JXteUR1fBqBDD3T5lUVILh5QIG
 3BISrCi2lIc/ghgv/GkvJP+V5ggBVtusesjcbebwpW87SmyBIXobc0rIHRsoCrmfs+JuMC
 mPJLQwLurK/ztV1LafrVN8uxJ23VvtA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-awp1ydn3P3a07Kbe3V7hrQ-1; Thu, 18 Nov 2021 14:20:24 -0500
X-MC-Unique: awp1ydn3P3a07Kbe3V7hrQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 z126-20020a1c7e84000000b003335e5dc26bso3005014wmc.8
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 11:20:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cf8pLZJQ/JJRwTaBWdMPx2aAKabWUBHBRVzCl0/kMXc=;
 b=k6F86EvgwyYezhK8SlqxjuhdHYKt7DOqYP4rINJP7O6gRjg1t6zx/4B86BbbDC5HAI
 AcP34N4ghPH3cRE55sbCObTpLkjEBLHxpHi9OCByPutmDTRsZn6MEFPf3Z6iMLbadx1F
 0/JQivfhshVnxacR4KEkjyEHaBTDBEciAOxxzWDqcrwE5Schr4BaneshXL0efnEhygI1
 a8cd8up2gG2m4U+B+81uoBMYf8qeuvz6ZH+Lawr5bJynTNgZz+1MQDMk5YII2w4BsIw3
 6WeI0YBb6S68wVkFli9NvaMUfZKxp+POPTK/+ERmsrFgqSnkAU3yQMWm0uVurLemPL9A
 XFkg==
X-Gm-Message-State: AOAM532B3Tf+9xtV1nqsD0DiaPOivzMbApRjDo/hpIWutBzJV2WkyDhV
 3MyJgYKjZq1TUy4wj8lS6cjtkIcRlvvwLapuZ9BLXJkixZrW6gn2Fl/mj6xr0xAoNCFc2kGGCJL
 FZj0R7deOKxUa4W3xLpwvqxhGqGVs8cXFGiR5CeuKW5yxvoJSq/M/WUeK93Ljwpvb
X-Received: by 2002:a05:600c:3b83:: with SMTP id
 n3mr12583954wms.116.1637263222739; 
 Thu, 18 Nov 2021 11:20:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytN87yCT/fEFjEzQ4Kq78C77GckmKlYYX5OM4zdKlezUHX/KRpiHMUTE0vdWdMUPEgCgLJGQ==
X-Received: by 2002:a05:600c:3b83:: with SMTP id
 n3mr12583908wms.116.1637263222502; 
 Thu, 18 Nov 2021 11:20:22 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 b188sm517556wmd.45.2021.11.18.11.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 11:20:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 0/2] hw/display: Do not allow multiple (identical) VGA
 devices
Date: Thu, 18 Nov 2021 20:20:18 +0100
Message-Id: <20211118192020.61245-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 John Snow <jsnow@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 7852a77f598 fixed creating multiple TYPE_ISA_VGA devices,=0D
generalize the fix to all VGA devices.=0D
=0D
See https://gitlab.com/qemu-project/qemu/-/issues/44=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/display: Add Error* handle to vga_common_init()=0D
  hw/display: Do not allow multiple identical VGA devices=0D
=0D
 hw/display/vga_int.h        |  2 +-=0D
 hw/display/ati.c            |  4 +++-=0D
 hw/display/cirrus_vga.c     |  4 +++-=0D
 hw/display/cirrus_vga_isa.c |  4 +++-=0D
 hw/display/qxl.c            |  4 +++-=0D
 hw/display/vga-isa-mm.c     |  3 ++-=0D
 hw/display/vga-isa.c        | 11 ++---------=0D
 hw/display/vga-pci.c        |  8 ++++++--=0D
 hw/display/vga.c            | 17 ++++++++++++++++-=0D
 hw/display/virtio-vga.c     |  4 +++-=0D
 hw/display/vmware_vga.c     |  2 +-=0D
 11 files changed, 43 insertions(+), 20 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


