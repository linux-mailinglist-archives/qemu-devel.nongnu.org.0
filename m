Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 488FE6DAFB7
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 17:33:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pko5S-0007b2-AX; Fri, 07 Apr 2023 11:33:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pko5Q-0007aU-1p
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 11:33:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pko5N-0003Pj-JI
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 11:33:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680881588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tR/TbxSGD1/P0pW27JZmMmk8kjb1ILop01ce2tftF2Q=;
 b=ffOVddUVuHWF+SS1JyI43PjCpgjNm6nYu4TbzHCehzpHeBtwYnjhu4oU2LNVmPGC7gUJuY
 Ir5NARwC1//f1JFjSeFww5rNiLK68nlx8RlufFeUcbe2yrfxjxSDvwU9rME+5YgSBZFeMj
 9kqPC2NUCuZ0E+j4XLWC4zmsygHVX5A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-453-nlemSjouOCSjIu1aG56gdA-1; Fri, 07 Apr 2023 11:33:07 -0400
X-MC-Unique: nlemSjouOCSjIu1aG56gdA-1
Received: by mail-wm1-f69.google.com with SMTP id
 r20-20020a05600c35d400b003edd2023418so901116wmq.4
 for <qemu-devel@nongnu.org>; Fri, 07 Apr 2023 08:33:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680881586; x=1683473586;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tR/TbxSGD1/P0pW27JZmMmk8kjb1ILop01ce2tftF2Q=;
 b=kEmtZIzS0tDngF6cRbXObUg114BnTRHq91zO7GmlO3pmF6SD+3m6uYc745wCoKwQPt
 mZZuEcV+gSHCxUNI6/N5tw2X7IvjRNSK0SZgUL1jxGZAWOuFZOc4RDsgKMBqD+Ob/JQa
 u395973KqEr8G8qb2N9ChnwHvcrc2wrw4DgelOICv1zeWA3mV8Q9YnsGIwOYgRRvi8OO
 kqhl1F386F+Kb9DxzYVVQ+4amkkxts94TBmdRvk3mjs6IucsBA/8+gmFGEo9FbblW5O8
 YvwjVw6zlEtorHm2miG+EcD0RWi/dqr4sgr/XYrgmPcmsUeethk+yFAbq6N1lT0TfjCi
 DXWA==
X-Gm-Message-State: AAQBX9d/ps8VfdQ2TqJJYjnPENZzoDtIPWpar5pYzf9X3rVF1VOwReKf
 VQApEYcXkEfJJja6aOghP+Qi/qcmAta1IzO/B8wE9nJwHHetKeUQU9FtbbWZ3zoUhS7Q8bdVRWy
 c8gVWgKjQgBn9vzf1uTYD3/RZWrH6o5a+bbCYGg0ALPjoOdhAH9fYV+AslVlYN64GAF2Of38xlF
 I=
X-Received: by 2002:adf:dc92:0:b0:2ca:2794:87e8 with SMTP id
 r18-20020adfdc92000000b002ca279487e8mr1869609wrj.21.1680881585909; 
 Fri, 07 Apr 2023 08:33:05 -0700 (PDT)
X-Google-Smtp-Source: AKy350YrPkFNI4EA+HJscV/bx/Pbmp3FR2FzTiYlXfbUflzN8tDKnGIl/5e5Y0QdEYf2bFkstXkaBg==
X-Received: by 2002:adf:dc92:0:b0:2ca:2794:87e8 with SMTP id
 r18-20020adfdc92000000b002ca279487e8mr1869591wrj.21.1680881585442; 
 Fri, 07 Apr 2023 08:33:05 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a5d6b85000000b002d97529b3bbsm4773019wrx.96.2023.04.07.08.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Apr 2023 08:33:04 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, kwolf@redhat.com, qemu-block@nongnu.org,
 hreitz@redhat.com
Subject: [PATCH 8.0 regression 0/8] block: remove bdrv_co_get_geometry
 coroutines from I/O hot path
Date: Fri,  7 Apr 2023 17:32:55 +0200
Message-Id: <20230407153303.391121-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The introduction of the graph lock is causing blk_get_geometry, a hot
function used in the I/O path, to create a coroutine for the call to
bdrv_co_refresh_total_sectors.

In theory the call to bdrv_co_refresh_total_sectors should only matter
in the rare case of host CD-ROM devices, whose size changes when a medium
is added or removed.  However, the call is actually keyed by a field in
BlockDriver, drv->has_variable_length, and the field is true in the common
case of the raw driver!  This is because the host CD-ROM is usually
layered below the raw driver.

So, this series starts by moving has_variable_length from BlockDriver to
BlockLimits.  This is patches 1-4, which also include a fix for a small
latent bug (patch 3).

The second half of the series then cleans up the functions to retrieve
the BlockDriverState's size (patches 5-7) to limit the amount of duplicated
code introduced by the hand-written wrappers of patch 8.  The final result
is that blk_get_geometry will not anymore create a coroutine.

This series applies to qemu.git, or to the block-next branch if commit
d8fbf9aa85ae ("block/export: Fix graph locking in blk_get_geometry()
call", 2023-03-27) is cherry picked.  Commit d8fbf9aa85ae is also where
bdrv_co_get_geometry() was introduced and with it the performance
regression.  It is quite a recent change, and therefore this is
probably a regression in 8.0 that had not been detected yet (except by
Stefan who talked to Kevin and me about it yesterday).  I'm not sure how
we can avoid the regression, if not by disabling completely the graph lock
(!) or applying this large series.

I'm throwing this out before disappearing for a couple days for Easter;
I have only tested it with qemu-iotests and "make check-unit".

Thanks,

Paolo

Paolo Bonzini (8):
  block: move has_variable_length to BlockLimits
  block: remove has_variable_length from filters
  block: refresh bs->total_sectors on reopen
  block: remove has_variable_length from BlockDriver
  migration/block: replace uses of blk_nb_sectors that do not check
    result
  block-backend: inline bdrv_co_get_geometry
  block-backend: ignore inserted state in blk_co_nb_sectors
  block, block-backend: write some hot coroutine wrappers by hand

 block.c                           | 35 ++++++++++++++++++--------
 block/block-backend.c             | 42 ++++++++++++++++++++++++-------
 block/copy-on-read.c              |  1 -
 block/file-posix.c                | 12 ++++++---
 block/file-win32.c                |  2 +-
 block/filter-compress.c           |  1 -
 block/io.c                        |  4 +++
 block/preallocate.c               |  1 -
 block/raw-format.c                |  3 ++-
 block/replication.c               |  1 -
 include/block/block-io.h          |  5 +---
 include/block/block_int-common.h  | 10 ++++++--
 include/sysemu/block-backend-io.h |  5 ++--
 migration/block.c                 |  5 ++--
 14 files changed, 85 insertions(+), 42 deletions(-)

-- 
2.39.2


