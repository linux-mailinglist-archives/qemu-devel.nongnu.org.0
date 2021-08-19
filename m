Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A11A53F1DED
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 18:36:12 +0200 (CEST)
Received: from localhost ([::1]:35626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGl1X-0004Rs-2B
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 12:36:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGkzu-00026z-LX
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:34:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGkzs-0005pJ-0f
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 12:34:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629390867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=P40SZLAow2qKFOaot8Segjt7m5P0Tsh3DgGPbGXn+Zc=;
 b=dXAXX5YVEnKppnVRc5ZjYsfmE1WOKvaKb3xoxxTNBn4JYjRGCErAaLRSr1c4kvP3YDzVXm
 NivVInQu0RIGij5UFrF4AuX8Ujs4mIBt24OFKudVofd5IQw0T2H3c/mloxjinnjz2a1gx2
 P8BgoXVV5sXLewRaBhdlJnl4benl4uY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-3Noc46X5OcSGfiTGdYFGMA-1; Thu, 19 Aug 2021 12:34:26 -0400
X-MC-Unique: 3Noc46X5OcSGfiTGdYFGMA-1
Received: by mail-wr1-f70.google.com with SMTP id
 t15-20020a5d42cf000000b001565f9c9ee8so1886773wrr.2
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 09:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RgbSsE9quR7RENKnyXMZwWY+CLMoPahTuLam0TQ3O8Y=;
 b=ry0gM0Goe4OdEFaAQHFdTQa2pUIw+zEMYYZTYW5FgJS1yrB4TZDNjROxAf8Qh323J1
 IZ3j04bkIwMYGUGs6RfmfB1DmMzmcYJjWYX1QbzOw9XdhMtkHvANtWaHwjPfz8E7lklO
 B7X13RmCK63ocUIWeV/BtSKcr5j7l4RPGQ8lCUURjBBc8Q/XgoOoyAYV+4yn9zt5/5Li
 rhbRG6if7UuwKKX22/BEPliJTH9MCgWsIdQF1pBJupFcHVbdRT2g09HMQMVhPVK5XN/Y
 KPmj18LPFu2nfxyRX1kfrISu4wTbFfz7P/EAX+NyvyyfJjaEd+4f9vuyOtyST7wrwWV6
 qsUQ==
X-Gm-Message-State: AOAM5324h4UTe14/lM3+i3Omg3YeohY6oILIYm8pekUTGy76epgVWBbO
 GG6z+82+BlsNQCJ08PhOZr4W2h05XsZ0WyaTo6D+26sXY5HNo+6CQEK3w4z7x1bVeo++Uraouvr
 lLQN5ATPHCkR+gUY5dFiO1WefgbsWZ+Lt1CAKJyL+GuQo+MIqOSo5xNjvP5fs+Ql2
X-Received: by 2002:a5d:4dc3:: with SMTP id f3mr5131637wru.302.1629390864719; 
 Thu, 19 Aug 2021 09:34:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXpfM9gr9iDjvUEZ897WsswR77vYts2Vd4MYj5ufhY7PRmD5Gsk4SLk8d9c/mEXAXu620xcw==
X-Received: by 2002:a5d:4dc3:: with SMTP id f3mr5131594wru.302.1629390864383; 
 Thu, 19 Aug 2021 09:34:24 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 z17sm3553511wrh.4.2021.08.19.09.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 09:34:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] hw/dma: Always expect 'dma' link property to be set to
 simplify
Date: Thu, 19 Aug 2021 18:34:18 +0200
Message-Id: <20210819163422.2863447-1-philmd@redhat.com>
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fix a qdev realization ordering, then simplify a pair of DMA=0D
devices by always passing a MemoryRegion property to the device.=0D
Doing so we can move the AddressSpace field to the device struct,=0D
removing need for heap allocation.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  hw/arm/xlnx-zynqmp: Realize qspi controller *after* qspi_dma=0D
  hw/dma/xlnx_csu_dma: Run trivial checks early in realize()=0D
  hw/dma/xlnx_csu_dma: Always expect 'dma' link property to be set=0D
  hw/dma/xlnx-zdma Always expect 'dma' link property to be set=0D
=0D
 include/hw/dma/xlnx-zdma.h    |  2 +-=0D
 include/hw/dma/xlnx_csu_dma.h |  2 +-=0D
 hw/arm/xlnx-versal.c          |  2 ++=0D
 hw/arm/xlnx-zynqmp.c          | 54 +++++++++++++++++++++--------------=0D
 hw/dma/xlnx-zdma.c            | 24 ++++++++--------=0D
 hw/dma/xlnx_csu_dma.c         | 31 ++++++++++----------=0D
 6 files changed, 63 insertions(+), 52 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


