Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FAB4517AF
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 23:38:44 +0100 (CET)
Received: from localhost ([::1]:33118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmkcd-0004Iw-Lo
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 17:38:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmkaS-0002F9-GJ
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 17:36:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mmkaQ-0002hf-G1
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 17:36:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637015783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/OPJ8eHGaKUPhjbn+xYxHNLdw0YY9X/lgt43EhZYKAw=;
 b=XwK5b4H2H5qiFMAuEDZcBe+yrTIwRKpIyl31mriGsLxvCGtt2GZgRSkfugt7ZIx1lGP2iq
 S+9fa5OLlLEs7WC/j2beAflwM2sS5iBM4BDtiAdFNha5Lpz60MOZvxU2E+mN2cA32BAv4l
 ukfiay2MQZ1Rf/3RqEv4Bm0HKE+e8Io=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-ylqLpXDKP-6ysDONJFk1ZA-1; Mon, 15 Nov 2021 17:36:22 -0500
X-MC-Unique: ylqLpXDKP-6ysDONJFk1ZA-1
Received: by mail-wm1-f71.google.com with SMTP id
 205-20020a1c00d6000000b003335d1384f1so237437wma.3
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 14:36:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/PWOHUZi2PgaSlm9zifAoFcf6hnwEgCyfNfgwKpbKgQ=;
 b=2dBHUu+ou5BxzAczhXK24TLTixh7oXCPWRTIDRvkTSnIPxxSXc0NqdN4yPp0rPuSsJ
 0DzaDYOkShcmHj60cZvpqtG5b/5AiRokHGT+AbRX6IHccHW3FNJQjGq82bRqTo8esG7/
 lxHxDJIU2g6Q2v1aV9s87ZwBDihkUOaGqd/9xC83f4iYzh+POTtKuGQKyCiky26myN6U
 9n754DbJvMQWNjBRMWVfIL+8L3etxKg83pyMelsne0gM8ITirNWVuZc/heqhtXsckYuS
 gfFCfTNkdTtBucdar7+IZWGuGjEU25aBDhbxmjxaZRmJ6+wq1wzCOmt8aLRh5GVBnmq7
 sAsA==
X-Gm-Message-State: AOAM531251c1a8cmInVcUuUb6AukgHaYZ1JEm6D22GG9XfRppcLeohcJ
 +Kh6CbwsgC1C9L+qfX7UGmCeF7qtqtsOXcReP9RsKtfUwS0bTAZF3RVjqqCqHnclkeyZqOSh/Ua
 u11YSmuHCWs7sTFX8VUha0e75IdkDnRWc7XiF05LngZltXXfV0wiN5NET20t6UEYW
X-Received: by 2002:a05:6000:1a41:: with SMTP id
 t1mr3164199wry.261.1637015780916; 
 Mon, 15 Nov 2021 14:36:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHbTTcETlZkUZNmzipkjPJthSJUgeavYoyS9PXf+0iKvGrPQ4KG5H2z0dbPYdAcWbtdXw4gw==
X-Received: by 2002:a05:6000:1a41:: with SMTP id
 t1mr3164163wry.261.1637015780604; 
 Mon, 15 Nov 2021 14:36:20 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 c5sm16570147wrd.13.2021.11.15.14.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Nov 2021 14:36:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2? 0/2] hw/intc/arm_gicv3: Introduce CONFIG_ARM_GIC_TCG
 Kconfig selector
Date: Mon, 15 Nov 2021 23:36:17 +0100
Message-Id: <20211115223619.2599282-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Miroslav Rezanina <mrezanin@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Shashi Mallela <shashi.mallela@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The GICv3 ITS support has been introduced uring the 6.2 development=0D
window (commits 18f6290a6a9..17fb5e36aab). This device is for=0D
emulation. When building virtualization-only binary, it might be=0D
desirable to not include this device.=0D
=0D
Introduce the CONFIG_ARM_GIC_TCG Kconfig selector to allow downstream=0D
distributions to deselect this device.=0D
=0D
Based-on: pull-target-arm-20211115-1=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/intc/arm_gicv3: Extract gicv3_set_gicv3state from arm_gicv3_cpuif.c=0D
  hw/intc/arm_gicv3: Introduce CONFIG_ARM_GIC_TCG Kconfig selector=0D
=0D
 hw/intc/arm_gicv3.c              |  2 +-=0D
 hw/intc/arm_gicv3_cpuif.c        | 10 +---------=0D
 hw/intc/arm_gicv3_cpuif_common.c | 22 ++++++++++++++++++++++=0D
 hw/intc/Kconfig                  |  5 +++++=0D
 hw/intc/meson.build              | 11 +++++++----=0D
 5 files changed, 36 insertions(+), 14 deletions(-)=0D
 create mode 100644 hw/intc/arm_gicv3_cpuif_common.c=0D
=0D
--=20=0D
2.31.1=0D
=0D


