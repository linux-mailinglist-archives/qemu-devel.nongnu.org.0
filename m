Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D976FE08B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 16:40:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwkyE-0008Fa-6J; Wed, 10 May 2023 10:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3h6xbZAgKCngpWhqiXWqckkcha.Ykimaiq-Zarahjkjcjq.knc@flex--talumbau.bounces.google.com>)
 id 1pwkyC-0008FK-Dx
 for qemu-devel@nongnu.org; Wed, 10 May 2023 10:39:08 -0400
Received: from mail-io1-xd49.google.com ([2607:f8b0:4864:20::d49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3h6xbZAgKCngpWhqiXWqckkcha.Ykimaiq-Zarahjkjcjq.knc@flex--talumbau.bounces.google.com>)
 id 1pwky9-0003xr-Fo
 for qemu-devel@nongnu.org; Wed, 10 May 2023 10:39:07 -0400
Received: by mail-io1-xd49.google.com with SMTP id
 ca18e2360f4ac-76c6c1b16d2so118243739f.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 07:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1683729543; x=1686321543;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1NiIH2rSqFliVPE6v5TmLKjIQhtbZfRq0MIHckfGANc=;
 b=hKCZZLz33SbBDAHtqPVVee37pMXk1Pz7B6OL9YpwOosYlsJfuQdW1fF+FOtuj+0zvx
 5GLk9JLKLp3lL7zE7wb2UXOZxK8qE5grk4S52JkJrGXqJCVaBs3dgIZytAob/vGW2cGX
 qRuVHgk8e3uoMWbOGd225I4P5ZTWWGCQe4gfWHdFddpWRliHjqHdcnIgOrvp5A7J0cjJ
 JvMEYjcLr2eGI2aV+MqLINporkrffjA2TVkNM0Vgby7YUmNTTZRZvDg9B2PnU7spUZaT
 OYnX/fR3Xf9vCGEL+YXtdtcx9+CK/BVjt0PxM4jziSNelG/nUt2O0M5wDd5WL60Cd33i
 hidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683729543; x=1686321543;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1NiIH2rSqFliVPE6v5TmLKjIQhtbZfRq0MIHckfGANc=;
 b=lcQqgD5Fp33zMBI0aKbyxasfm2Ti65PZiLzKFNh8hdWQaY0p1/PwHx6tZVjITsCRyi
 QsNV7THaJC0eEXy6Vd8I4ozVncjSIHsg6P9lbRiScZrRMoEw/EC7hxEdAd2/z7CyMY7X
 XcKlbRz0xfnQF3tyjv10uj6tCfJrMZFdWBqOgXC1s5fY5fo4xA7rhK0wX84QpT+0PTN8
 nFKmm/LFT6Gmlqr9of0yDtuvK/J0WpGvRLaZsRlngGq1tlyXGQent8oxORj3OFBy3U36
 CdUjk7IEhMBpNz2BbDkc+MNkTNMNwHb9U+Ie/w5VPQ4Q6ci6baKeviNO60IQFyXJsQAH
 Hc8w==
X-Gm-Message-State: AC+VfDwZ/Da1IzLjj5x83bnJEOSttc2EXEOHwWGaoygsR/H/DpGzoM1E
 u4bRpKaIrUA0m1d0ZbtWHUlNPAGeu6Ws6X4WQUV6HcILuHsNIV3lF2B01CVqC7yfXhc/oF4VFT/
 h2cZ51sHGbQ62I5wArB3Ml6k8Z56ph/6+spvLf6Emawg0vvbCCCW7BuZ767ALENU6iw==
X-Google-Smtp-Source: ACHHUZ4t5G2t4jaVVp1ekdhUa8mDLIuvsz0Ep9OKgz6Uu3DxyHcYjuAU8zXdqq25qUToFj+5Slnj0JV2GjQEHw==
X-Received: from talumbau.c.googlers.com
 ([fda3:e722:ac3:cc00:2b:ff92:c0a8:90d])
 (user=talumbau job=sendgmr) by 2002:a02:9485:0:b0:411:c6da:1107 with SMTP id
 x5-20020a029485000000b00411c6da1107mr3260925jah.2.1683729543067; Wed, 10 May
 2023 07:39:03 -0700 (PDT)
Date: Wed, 10 May 2023 14:38:55 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
Message-ID: <20230510143856.964541-1-talumbau@google.com>
Subject: [RFC PATCH 0/1] virtio-balloon: Add Working Set Reporting feature
From: "T.J. Alumbaugh" <talumbau@google.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 Yuanchu Xie <yuanchu@google.com>, 
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Markus Armbruster <armbru@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 "=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, 
 Eric Blake <eblake@redhat.com>, Yu Zhao <yuzhao@google.com>, 
 "T.J. Alumbaugh" <talumbau@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d49;
 envelope-from=3h6xbZAgKCngpWhqiXWqckkcha.Ykimaiq-Zarahjkjcjq.knc@flex--talumbau.bounces.google.com;
 helo=mail-io1-xd49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is the device implementation for the proposed expanded balloon feature
described here:

https://lore.kernel.org/linux-mm/20230509185419.1088297-1-yuanchu@google.com/

Motivation
==========
As mentioned in the above message, the use case is a host with overcommitted
memory and 1 or more VMs. The goal is to get both timely and accurate
information on overall memory utilization in order to drive appropriate
reclaim activities, since in some client device use cases a VM might need a
significant fraction of the overall memory for a period of time, but then
enter a quiet period that results in a large number of cold pages in the
guest.

The balloon device now has a number of features to assist in sharing memory
resources amongst the guests and host (e.g free page hinting, stats, free page
reporting). As mentioned in slide 12 in [1], the balloon doesn't have a good
mechanism to drive the reclaim of guest cache. Our use case includes both
typical page cache as well as "application caches" with memory that should be
discarded in times of system-wide memory pressure. In some cases, virtio-pmem
can be a method for host control of guest cache but there are undesirable
security implications.

Working Set Reporting
=====================
The patch here has two components:

 - Actual device implementation for VIRTIO_F_WS_REPORTING to standardize the
   configuration and communication of Working Set reports from the guest. This
   includes a notification virtqueue for receiving config information and
   requests for a report (a feature which could be expanded for additional use
   cases) and a virtqueue for the actual report from the driver.

 - QMP changes so that a controller program can use the existing QEMU socket
   mechanism to configure and request WS reports and then read the reports as
   a JSON property on the balloon.

Working Set reporting in the balloon provides:

 - an accurate picture of current memory utilization in the guest
 - event driven reporting (with configurable rate limiting) to deliver reports
   during times of memory pressure.

The reporting mechanism can be combined with a domain-specific balloon policy
to drive the separate reclaim activities in a coordinated fashion.

A follow up message to virtio-dev will be sent with the proposed specification
changes that this patch implements.

TODOs:
======
 -  A synchronization mechanism must be added to the functions that send WS
    Config and WS Request, otherwise concurrent callers (through QMP) can mix
    messages on the virtqueue sending the data to the driver.

 - The device currently has a hard-coded setting of 4 'bins' for a Working Set
   report, whereas the specification calls for anywhere between 2 and 16.

 - A WS_EVENT notification through QMP should include the actual report,
   whereas right now we query for that information right after a WS_EVENT is
   received.

References:

[1] https://kvmforum2020.sched.com/event/eE4U/virtio-balloonpmemmem-managing-guest-memory-david-hildenbrand-michael-s-tsirkin-red-hat


T.J. Alumbaugh (1):
  virtio-balloon: Add Working Set Reporting feature

 hmp-commands.hx                               |  26 ++
 hw/core/machine-hmp-cmds.c                    |  21 ++
 hw/virtio/virtio-balloon-pci.c                |   2 +
 hw/virtio/virtio-balloon.c                    | 225 +++++++++++++++++-
 include/hw/virtio/virtio-balloon.h            |  17 +-
 include/monitor/hmp.h                         |   2 +
 .../standard-headers/linux/virtio_balloon.h   |  17 ++
 include/sysemu/balloon.h                      |   8 +-
 monitor/monitor.c                             |   1 +
 qapi/machine.json                             |  66 +++++
 qapi/misc.json                                |  26 ++
 softmmu/balloon.c                             |  32 ++-
 12 files changed, 437 insertions(+), 6 deletions(-)

-- 
2.40.1.521.gf1e218fcd8-goog


