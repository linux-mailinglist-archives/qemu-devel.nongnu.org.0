Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B50D73F5FF5
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 16:13:39 +0200 (CEST)
Received: from localhost ([::1]:58054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIXBJ-0007g0-O3
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 10:13:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIX9d-0004wr-Pr
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:11:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIX9Z-00058I-PV
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:11:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629814307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=78sUjXfLGjMldcm4Aare9BAwd/4qYSy5kHBV7wzaDrs=;
 b=GJgk/lB3HalQXCT8jVohHZRxgi84xxz8W0ZJtV06IjQOaPO8ItkgSLNI43drAEkoqhxwOo
 g6U2Z6g3k+Q8Hkv4wtTtrnPpHLRPPFIWO+LBfMYk6TLBAdy9qWO7vvtReLoVmxMVz53TWh
 im95mRGWF70kajHs2fuUMI//vMOjzpE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-Y7lAC4XpNQazI1FsYSmolA-1; Tue, 24 Aug 2021 10:11:46 -0400
X-MC-Unique: Y7lAC4XpNQazI1FsYSmolA-1
Received: by mail-wr1-f72.google.com with SMTP id
 h6-20020a5d4fc6000000b00157503046afso1715667wrw.3
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 07:11:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ofa9XrpQSVtFF9DQsbbU5OFDxNbpgMsOuA/ajhT4pog=;
 b=OQJi3n1KjzMzU9NbTOdihX1dRU68BdttW5w7tNf3CmGBkfdN+oNnH5leVH5xTrsk5t
 ly1l9PwHP0UOhJrA5vfeAWTfBd8o6JO61RQQxHoTOefZlhox/nArIzax+6z89VEoMbVa
 POLA0seOBWOkSv5VjDs+RJzj0paFjW/VJRETPScRWDz/S4HyA9YEmBvU7CY2Yjn25ZWi
 H3cnNHiPZqlEXu52+CrBjD131LtvLwtgOPCRxx22wP4P5nx3tuNFBpdIkMf5yvyRzh9C
 oQFXoWMToXLef+Q5zmndpmSe4c1CloA7IFXJiTb6mpEq8e25x/HDV50ohKw6mHRUrPZ7
 Pamg==
X-Gm-Message-State: AOAM53004NEdoQQmk61th+l3UHlNd2XI2BNvNDgWTL0ksNlxsca0WpDi
 2FGdAuKKPNHLz9cJltRi61THXUtYUyV1QIw1a2cfYFt3gkTtp4+3QENoaMrA3lAricu9UeWIHzu
 ibgcPyd7jeNx9aTU9CtnJBB4rVWnywLaiWgAXyxMJwohf/Y5SnSvnE0bXfjNmcyrs
X-Received: by 2002:adf:e74a:: with SMTP id c10mr19514079wrn.350.1629814304801; 
 Tue, 24 Aug 2021 07:11:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxzRYMou/E0KpJjq++SkpHynkat2te2KROpP5ielMJ+x/RAVdrNGf/79J3yXxWKaTGQAPvTA==
X-Received: by 2002:adf:e74a:: with SMTP id c10mr19514047wrn.350.1629814304552; 
 Tue, 24 Aug 2021 07:11:44 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 t14sm2730099wmj.2.2021.08.24.07.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 07:11:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/9] block/nvme: Rework error reporting
Date: Tue, 24 Aug 2021 16:11:33 +0200
Message-Id: <20210824141142.1165291-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
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
 qemu-block@nongnu.org, Auger Eric <eric.auger@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
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
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (9):=0D
  block/nvme: Use safer trace format string=0D
  block/nvme: Have nvme_create_queue_pair() report errors consistently=0D
  util/vfio-helpers: Let qemu_vfio_verify_mappings() use error_report()=0D
  util/vfio-helpers: Replace qemu_mutex_lock() calls with=0D
    QEMU_LOCK_GUARD=0D
  util/vfio-helpers: Remove unreachable code in qemu_vfio_dma_map()=0D
  util/vfio-helpers: Pass Error handle to qemu_vfio_dma_map()=0D
  util/vfio-helpers: Have qemu_vfio_dma_map() propagate Error=0D
  util/vfio-helpers: Let qemu_vfio_do_mapping() propagate Error=0D
  block/nvme: Only report VFIO error on failed retry=0D
=0D
 include/qemu/vfio-helpers.h |  2 +-=0D
 block/nvme.c                | 29 +++++++++++------=0D
 util/vfio-helpers.c         | 63 +++++++++++++++++--------------------=0D
 block/trace-events          |  2 +-=0D
 4 files changed, 50 insertions(+), 46 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


