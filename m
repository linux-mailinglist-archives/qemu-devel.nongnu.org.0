Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A07E852CFAB
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 11:48:02 +0200 (CEST)
Received: from localhost ([::1]:45990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrcl5-0002MT-Nv
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 05:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <usama.arif@bytedance.com>)
 id 1nrch5-00007T-Kh
 for qemu-devel@nongnu.org; Thu, 19 May 2022 05:43:43 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <usama.arif@bytedance.com>)
 id 1nrch0-0001Lh-I5
 for qemu-devel@nongnu.org; Thu, 19 May 2022 05:43:40 -0400
Received: by mail-wr1-x42d.google.com with SMTP id r30so6309882wra.13
 for <qemu-devel@nongnu.org>; Thu, 19 May 2022 02:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pEZqbUEJ6M24WEXlttAv0nZBg+0XSsUaxOzVKF6KJyM=;
 b=xPv4pQizbfUazCjma0l3e7FBTMDw1U+ZTPoidjClNTMdbE+6wSJh5FEx9Ym7iimAR8
 PWsWW7CAdOo+OZIqxeymFv5zib8tt4P4j+0HLApaI3qZwv9GhKUA1Vq/ox0gKMOMSzI/
 b5g80OdkykxIhgHF+z0Ad1+5shdpROiiInQDZF1lbmJ/N14/MeC2ay9nG9dLIzaw2m4/
 wTwSZ+bWOgDnbvnl0oJJ5WfFPtQ3xg+CqtSmV5kJnADuLXTlxLhAeURJbL3JuoFalkZO
 6J6766S6oiBPWx6dV5owroUq/A2AbDMAx1t+kc1K2wawbHreO1gywl50nZhQ5QcWC6bW
 Y9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pEZqbUEJ6M24WEXlttAv0nZBg+0XSsUaxOzVKF6KJyM=;
 b=clvJxFXt+2SnVel1HcwoP2mpEY5Gi+QYVqDm2BRL0ZsX14nnUorP4mJYWrOcD4m+6W
 T9edaifA2SjXRwk/t2nEH76RdLJamljOGHETyYWdi2S9tvcrjp9iNS4SG5mYJLuoYSh5
 LJ9nAji5MQnKZbOBB9BEtjLY3BGApaJdu0eM1+7/5eDc0Rd33MbnbpJCX/OnmsI3/3B3
 4PB/ygTr8Sgq16QWFNUfr7x1NbwjfhJIK8RhKQyqN+bbbV/9IIu23OLXdwfXyPjLQ5tO
 czjYeUvlzuYrQreJV+1b0xVHfAuSxgdPNv5UfAndPszg60xMGXfjDb/sFN/YD76WDCUh
 jH9g==
X-Gm-Message-State: AOAM532aoeCjWEylUIHlasK5KxzoyDOQ99YLVKWFnpcaQuGvqY6KEmVa
 u5us7WOzFj6ZTK0gOz5rXouLJbAeS4DG1Q==
X-Google-Smtp-Source: ABdhPJxyuozvv3qdXfN5NCLnQiBvTkGmMLXyRTAFdzYa38utqakUtszE+bz82o6kyp2dtIi/GMd4SA==
X-Received: by 2002:adf:f542:0:b0:20d:2bb:b282 with SMTP id
 j2-20020adff542000000b0020d02bbb282mr3180467wrp.464.1652953416216; 
 Thu, 19 May 2022 02:43:36 -0700 (PDT)
Received: from usaari01.cust.communityfibre.co.uk
 ([2a02:6b6a:b497:0:8edd:b6b5:d314:5955])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a05600c434100b003942a244ecesm3525029wme.19.2022.05.19.02.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 02:43:35 -0700 (PDT)
From: Usama Arif <usama.arif@bytedance.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com, stefanha@redhat.com, ndragazis@arrikto.com,
 fam.zheng@bytedance.com, liangma@liangbit.com,
 Usama Arif <usama.arif@bytedance.com>
Subject: [RFC 0/2] Introduce virtio-vhost-user device
Date: Thu, 19 May 2022 10:43:21 +0100
Message-Id: <20220519094323.3109598-1-usama.arif@bytedance.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=usama.arif@bytedance.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The virtio-vhost-user (vvu) allows moving the vhost-user process inside
a VM. This is done by moving vhost device backend into a guest and
tunneling the vhost-user protocol over a new type of device called
virtio-vhost-user.

A usecase for this is live-updating the host kernel which has the DPDK
application running inside a VM with vvu device. The DPDK application
doesn't need to be restarted after the host kernel has been updated
as the DPDK VM is snapshotted before host kernel update, allowing DPDK
state to be saved.
There should potentially be further usecases, as it allows isolating the
vhost-user process inside a VM, with more components like SPDK.

vvu is based on the work initially done by Stefan Hajnoczi [1]
and continued by Nikos Dragazis [2], [3].

The virtio-spec changes for vvu are currently in review[4]. A HTML
version with the changes is available at [5].

A working prototype showcasing vvu can be reproduced using
instructions in [6].

Thanks and looking forward to your response!
Usama

[1] https://wiki.qemu.org/Features/VirtioVhostUser
[2] https://ndragazis.github.io/dpdk-vhost-vvu-demo.html
[3] https://lists.oasis-open.org/archives/virtio-dev/202005/msg00132.html
[4] https://lists.oasis-open.org/archives/virtio-dev/202204/msg00022.html
[5] https://uarif1.github.io/vvu/v2/virtio-v1.1-cs01
[6] https://uarif1.github.io/vvu/dpdk-vvu-instructions


Usama Arif (2):
  vhost-user: share the vhost-user protocol related structures
  virtio-vhost-user: add virtio-vhost-user device

 hw/virtio/Kconfig                           |    5 +
 hw/virtio/meson.build                       |    2 +
 hw/virtio/trace-events                      |   26 +
 hw/virtio/vhost-user.c                      |  160 ---
 hw/virtio/virtio-pci.c                      |   13 +-
 hw/virtio/virtio-vhost-user-pci.c           |  471 ++++++++
 hw/virtio/virtio-vhost-user.c               | 1066 +++++++++++++++++++
 hw/virtio/virtio.c                          |    7 +-
 include/hw/pci/pci.h                        |    1 +
 include/hw/virtio/vhost-user.h              |  163 +++
 include/hw/virtio/virtio-pci.h              |    7 +
 include/hw/virtio/virtio-vhost-user.h       |  126 +++
 include/hw/virtio/virtio.h                  |    2 +
 include/standard-headers/linux/virtio_ids.h |    1 +
 14 files changed, 1880 insertions(+), 170 deletions(-)
 create mode 100644 hw/virtio/virtio-vhost-user-pci.c
 create mode 100644 hw/virtio/virtio-vhost-user.c
 create mode 100644 include/hw/virtio/virtio-vhost-user.h

-- 
2.25.1


