Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32813F8F3D
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 21:52:50 +0200 (CEST)
Received: from localhost ([::1]:52212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJLQf-00074z-P7
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 15:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJLOK-0004oT-K3
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 15:50:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJLOI-0002hy-7k
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 15:50:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630007421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=GviRMTMlVPichyTt/G41s6Va+TzS5AbAU5mwNg/hVGw=;
 b=WLOXKpFaTQQmxoyAXK+gz75qezYrvGcWINW67dJa5D8FJgFA7QnuDYhx5g8q6G4PmOAI+8
 KFoa8tr/gmBl52wrIDtkxl22mJYCpl99c9l4sugZE3rEzz2osd4IpK+Reamt8GslFXeA9x
 HTYjOwIJJWYfjO2Sqd/KGgmdzcXFUnk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-45ls6ZHPMO6cr8skQhMaeA-1; Thu, 26 Aug 2021 15:50:18 -0400
X-MC-Unique: 45ls6ZHPMO6cr8skQhMaeA-1
Received: by mail-wr1-f70.google.com with SMTP id
 t15-20020a5d42cf000000b001565f9c9ee8so1219011wrr.2
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 12:50:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oV4DCQpNQvGIX6b+YYRAudx6Oq27pJED0SGYy8EzfxA=;
 b=EqsrmpfAxyWxomYg0Tc5d30tkfRzjIvS8YSbap13sxoZZgmzccM70hpx0ljo1HWwK0
 3BuI8Jqyw+5ORKyySHso0XbZ6gSpDMvh+KrmuWoQcwK8UxrTYe71IJFwFQ6eQTEtpxus
 zESRnOTs9+UOMjEwAUpr3fCljAn00GugPm2k+HIjnjlmQO5ndW5BlNDR0SusC7OqwSQ7
 gPJt3BleSGCRKz+lC9L6iGR7612EqEJc3zsBlBRuIBCVJp0z4YZz+152R4ZF8blQBzhA
 cbAvIGVzzTuHRSfZAzkjjX3SY73dPiEHzzO6vhlBYvPZNhYEUrb8m6ugcMH33zPyarLU
 RQTg==
X-Gm-Message-State: AOAM533lirxfRSDpiKUQMVc2BikzWZ5eP0qvCJBThpo3gieCeBLbyepx
 JypYs7xBmnlL+U+f6Zkqw1qRXbvUn+FwG7zQRMlEQBm2cKUDJl2eSdeWdjmwIvSmR+Wl9Y3Zl+X
 LiM40soSotOOybWjBH8HR0FyH+7gnOFgqRWXwOI5rSYmoHG8D9q7GbDzCt8cd0oZ9
X-Received: by 2002:a1c:e912:: with SMTP id q18mr16059386wmc.21.1630007416585; 
 Thu, 26 Aug 2021 12:50:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1K/ajqjofM/DqA1BNz4kn5jH4v6T45zjluZvbIWnhKKbuSRxF3l3GRFjysFmsSfwBkBZKMw==
X-Received: by 2002:a1c:e912:: with SMTP id q18mr16059347wmc.21.1630007416205; 
 Thu, 26 Aug 2021 12:50:16 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 x11sm4184995wro.83.2021.08.26.12.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 12:50:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/11] block/nvme: Rework error reporting
Date: Thu, 26 Aug 2021 21:50:03 +0200
Message-Id: <20210826195014.2180369-1-philmd@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Auger Eric <eric.auger@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This series contains various patches sent last year with=0D
review comments addressed, few more cleanups, and a new=0D
patch which remove the spurious "VFIO_MAP_DMA failed: No=0D
space left on device" now poping up since commit 15a730e7a.=0D
(it is the expected behavior, which is why we retry the=0D
same call after flushing the DMA mappings).=0D
=0D
Since v1:=0D
- Addressed Klaus review comments (cleaner Error* handling)=0D
- Add Klaus's R-b=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (11):=0D
  block/nvme: Use safer trace format string=0D
  util/vfio-helpers: Let qemu_vfio_verify_mappings() use error_report()=0D
  util/vfio-helpers: Replace qemu_mutex_lock() calls with=0D
    QEMU_LOCK_GUARD=0D
  util/vfio-helpers: Remove unreachable code in qemu_vfio_dma_map()=0D
  block/nvme: Have nvme_create_queue_pair() report errors consistently=0D
  util/vfio-helpers: Pass Error handle to qemu_vfio_dma_map()=0D
  util/vfio-helpers: Extract qemu_vfio_water_mark_reached()=0D
  util/vfio-helpers: Use error_setg in qemu_vfio_find_[fixed/temp]_iova=0D
  util/vfio-helpers: Simplify qemu_vfio_dma_map() returning directly=0D
  util/vfio-helpers: Let qemu_vfio_do_mapping() propagate Error=0D
  block/nvme: Only report VFIO error on failed retry=0D
=0D
 include/qemu/vfio-helpers.h |  2 +-=0D
 block/nvme.c                | 29 +++++++-----=0D
 util/vfio-helpers.c         | 89 +++++++++++++++++++++----------------=0D
 block/trace-events          |  2 +-=0D
 4 files changed, 72 insertions(+), 50 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


