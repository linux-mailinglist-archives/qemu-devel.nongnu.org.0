Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E04B442139
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:59:56 +0100 (CET)
Received: from localhost ([::1]:40322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhdTH-00020m-7Q
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:59:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhcH3-0007tI-D9
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:43:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhcGx-0008Nw-6R
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:43:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635792185;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=P5uUCvVbrgck6F7RBpsfZAYQQ6D4i4rt8ntgZiraHzA=;
 b=ILQqrWhy9VJrYmC2v2w3vX+jsfd5AXNdUvSdJAumwap2xaJoUHJBThlAzwxd6xb3bUeQMv
 KkJK/faOGVgwqvjMdA/lM2K1j4mWQ0nETDA+dVEyuUaXDlmJWSm9ewbd7ikqP2CFnP3Gt7
 Gk6VnshagA1SPrdVkxDGMRQT/GPdAOc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-KHbrbXjyOqe3DdEkDa6ROQ-1; Mon, 01 Nov 2021 14:43:02 -0400
X-MC-Unique: KHbrbXjyOqe3DdEkDa6ROQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 c4-20020adfed84000000b00185ca4eba36so1388023wro.21
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 11:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1YFgi9RCX8Hcy512XTgpgir/BTQ5eSUnJ2/EXm0pef8=;
 b=46HlTiqNTPRyFkj7TRIhlgmUG4yOmwcfisYxcXxw9kUqrWYDf4Eau2mG+NAj/55WU2
 fL3c2JHDToEQXj4su1MPHN4aGqP9fiiecsF/7QLshBoFOZfZU4rpV4XbvygjXoEGgK1w
 UV/xmhHi9QY4Zu31Es2Rl1QcQihhnj/x729v6WN+RiVVFujwrZhWeWU9mizagL4jjVSQ
 tOwrAMotJP7g0lHQNc6CBhZu1qJVHOk4tLzW7ysgmeNGUyfz01m1J+fRNUngJooWxRzW
 HsrCAWBsfxRRg3JOhBT5S59BvIXwzin7dF+CRWFzpLVqxaVE8HuRobX8jYAHIdGWCH7G
 WRzQ==
X-Gm-Message-State: AOAM5317X1vfcbTuoEH7jyJ3Ik7x4GJElilliKHa++Rbcq0WGbSm+3b2
 uNwds0A7ygnCbXTU2MGkkgyrgxemTeO/nyHb2J/md7TBC7x+G8vT8B/YKcy97kJIWXMcJ7b0Inu
 /v9GmEGwjd/amBKcDvKKhnRH+mdcROLZY6NKPNXAZ0AQouqorUa+SnpD9T+IsCXtP
X-Received: by 2002:adf:9c11:: with SMTP id f17mr40681972wrc.147.1635792181165; 
 Mon, 01 Nov 2021 11:43:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRUg9KgfdLnbZnftfoMvMh7kuwmaMdLPOKG/rcfh6/ZSZ3BdEFM1g3lEx6zj52fQagAS4Fdw==
X-Received: by 2002:adf:9c11:: with SMTP id f17mr40681944wrc.147.1635792180944; 
 Mon, 01 Nov 2021 11:43:00 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id 8sm269478wmg.24.2021.11.01.11.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 11:43:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/10] Machine-next patches for 2021-11-01
Date: Mon,  1 Nov 2021 19:42:49 +0100
Message-Id: <20211101184259.2859090-1-philmd@redhat.com>
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
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
On behalf on Eduardo (and with his blessing) this is the current=0D
machine-next patch queue.=0D
=0D
The following changes since commit af531756d25541a1b3b3d9a14e72e7fedd941a2e=
:=0D
=0D
  Merge remote-tracking branch 'remotes/philmd/tags/renesas-20211030' into =
staging (2021-10-30 11:31:41 -0700)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/philmd/qemu.git tags/machine-20211101=0D
=0D
for you to fetch changes up to 84436ec4b2b4c6c62f0ae8c911f8b982fedc0f4e:=0D
=0D
  machine: remove the done notifier for dynamic sysbus device type check (2=
021-11-01 19:32:40 +0100)=0D
=0D
----------------------------------------------------------------=0D
Machine core patches=0D
=0D
- Move GPIO code out of qdev.c=0D
- Move hotplug code out of qdev.c=0D
- Restrict various files to sysemu=0D
- Move SMP code out of machine.c=0D
- Add SMP parsing unit tests=0D
- Move dynamic sysbus device check earlier=0D
=0D
----------------------------------------------------------------=0D
=0D
Damien Hedde (3):=0D
  machine: add device_type_is_dynamic_sysbus function=0D
  qdev-monitor: Check sysbus device type before creating it=0D
  machine: remove the done notifier for dynamic sysbus device type check=0D
=0D
Eduardo Habkost (1):=0D
  machine: Move gpio code to hw/core/gpio.c=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  hw/core: Restrict sysemu specific files=0D
  hw/core: Declare meson source set=0D
  hw/core: Extract hotplug-related functions to qdev-hotplug.c=0D
  hw/core: Restrict hotplug to system emulation=0D
=0D
Yanan Wang (2):=0D
  hw/core/machine: Split out the smp parsing code=0D
  tests/unit: Add an unit test for smp parsing=0D
=0D
 meson.build                 |   4 +-=0D
 include/hw/boards.h         |  17 +-=0D
 hw/core/gpio.c              | 197 ++++++++++++=0D
 hw/core/hotplug-stubs.c     |  34 +++=0D
 hw/core/machine-smp.c       | 181 +++++++++++=0D
 hw/core/machine.c           | 199 +-----------=0D
 hw/core/qdev-hotplug.c      |  73 +++++=0D
 hw/core/qdev.c              | 234 --------------=0D
 softmmu/qdev-monitor.c      |  11 +=0D
 tests/unit/test-smp-parse.c | 594 ++++++++++++++++++++++++++++++++++++=0D
 MAINTAINERS                 |   2 +=0D
 hw/core/meson.build         |  35 ++-=0D
 tests/unit/meson.build      |   1 +=0D
 13 files changed, 1145 insertions(+), 437 deletions(-)=0D
 create mode 100644 hw/core/gpio.c=0D
 create mode 100644 hw/core/hotplug-stubs.c=0D
 create mode 100644 hw/core/machine-smp.c=0D
 create mode 100644 hw/core/qdev-hotplug.c=0D
 create mode 100644 tests/unit/test-smp-parse.c=0D
=0D
--=20=0D
2.31.1=0D
=0D


