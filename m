Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DE148C3D7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 13:17:16 +0100 (CET)
Received: from localhost ([::1]:47956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7cZ1-0005NB-5d
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 07:17:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1n7bzL-00062A-2X
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:40:23 -0500
Received: from [2607:f8b0:4864:20::630] (port=40905
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1n7bzI-0005KH-Dq
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 06:40:22 -0500
Received: by mail-pl1-x630.google.com with SMTP id l15so3756866pls.7
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 03:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PaeMzbq5XQlie9RKzgFtbG7me8Ynld4JtwfwQPkZH50=;
 b=aJhnE7IYxIDhMfH4fRmL0t6oxeN3RQCM4MJ4E9c4i+caAqa15YLuRzUlIWLzD68giO
 lR2lajrsWxsexAn9XGIt50hC9DbNCk3WvUhBY38F0V2pn2JqLcrOlzmHzior7MgTm6Le
 ZaDYhAtCKdkJ1gekVAi8inTeP+OiFdvJd7WcrSolSPYZ0N710Syd+CMsZrjzXfv0JLfF
 g2uJq7orFoP3z5qbaCY5ZPJM1sQ7COb9733eeWzpSnxAKwummwfNar1qMV0rK1fcnUA5
 ZghG/+jNKuxWZu/0FeLiep1/QXJPWIZAdq2EacmY0BmrZLOCRlJYrR48aTHlTRasfa7D
 7Jxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PaeMzbq5XQlie9RKzgFtbG7me8Ynld4JtwfwQPkZH50=;
 b=hq5SJocINifNHWd0cSXTkdfUA3saWztTiIphPc/NTPIXzKH5a37GmHgufkdNcMZnCQ
 jYkJTMY/HGmBTpH0PkvlYup6Xecb6y7BA8gQU6V9XoK/y0MuMrefd+2ONlL6+A+rCV4f
 9IISxhmVVD+surE8hKcz21xI2KunkbyqpQtJlNy6UDnmfXX9UQk5o+onTbqmrz/GoodJ
 MaE5c5FwVwFsZXAJCOhPdQp8nXUVNFNL7Hq5WOf7lH3WGdBMvhnCE3PKrlkPDL8CvZ6j
 +U5JtLhWffkDhg5WxD5l5k4H3nohqAm+IxKASPxoRwyHKGEDwEd7zM+gezJIOJcm0Pln
 KYCw==
X-Gm-Message-State: AOAM533dXch6rzv1Qht5wK71MC3SGIkm0O8ruWL+LETxvl4EVsLI4TPy
 H8pq+sPrN7eiIUP2lUxHwYh+r/oN0tK+4g==
X-Google-Smtp-Source: ABdhPJyZuEKbeDgilO/LHnVGOxCex7btsyn1ovpnV8NqI/Zzg7cvsrKKGiOsFYYvYolP9DcA8h9j2A==
X-Received: by 2002:a05:6a00:1a03:b0:4ba:c23e:df67 with SMTP id
 g3-20020a056a001a0300b004bac23edf67mr8780961pfv.63.1641987303219; 
 Wed, 12 Jan 2022 03:35:03 -0800 (PST)
Received: from localhost ([122.171.221.63])
 by smtp.gmail.com with ESMTPSA id v20sm5348408pjr.21.2022.01.12.03.35.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 03:35:02 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH 0/2] virtio: Add vhost-user-gpio device's support
Date: Wed, 12 Jan 2022 17:04:57 +0530
Message-Id: <cover.1641987128.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Vincent Guittot <vincent.guittot@linaro.org>, stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

This patchset adds vhost-user-gpio device's support in Qemu. The support for the
same has already been added to virtio specification and Linux Kernel.

A Rust based backend is also in progress and is tested against this patchset:

https://github.com/rust-vmm/vhost-device/pull/76

--
Viresh

Viresh Kumar (2):
  hw/virtio: add boilerplate for vhost-user-gpio device
  hw/virtio: add vhost-user-gpio-pci boilerplate

 hw/virtio/Kconfig                   |   5 +
 hw/virtio/meson.build               |   2 +
 hw/virtio/vhost-user-gpio-pci.c     |  69 ++++++
 hw/virtio/vhost-user-gpio.c         | 343 ++++++++++++++++++++++++++++
 include/hw/virtio/vhost-user-gpio.h |  35 +++
 5 files changed, 454 insertions(+)
 create mode 100644 hw/virtio/vhost-user-gpio-pci.c
 create mode 100644 hw/virtio/vhost-user-gpio.c
 create mode 100644 include/hw/virtio/vhost-user-gpio.h

-- 
2.31.1.272.g89b43f80a514


