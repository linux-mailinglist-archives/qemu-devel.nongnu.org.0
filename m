Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 877126B1E8A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 09:46:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paBtb-0000DW-U1; Thu, 09 Mar 2023 03:45:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paBtY-0000Cf-BE
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:45:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1paBtW-0008MR-K3
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 03:45:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678351501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CSSxhZo+VnOpP/HA7k7zf3ykFi8a3t223tuCwQJTtbc=;
 b=gy6bGZDvi2HQahjhLHJhpYyWJj3pDNsPZz3JKfy+tjiXnnjOtgZogVJlV/VLgJ8rsFe1hh
 L7rqAhr9lnDTAAKRYBK7B7Tm+mRgdzH5QhiOfPqGmpEHJ/Eny+dQPmZklwmQ6ljFzDjd0o
 KfLqY0Ffffa7uYWdPuqOaxQbHubD49w=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-VRbr9TTtM065vSjNkOmaEw-1; Thu, 09 Mar 2023 03:44:59 -0500
X-MC-Unique: VRbr9TTtM065vSjNkOmaEw-1
Received: by mail-ed1-f71.google.com with SMTP id
 ev6-20020a056402540600b004bc2358ac04so1873747edb.21
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 00:44:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678351498;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CSSxhZo+VnOpP/HA7k7zf3ykFi8a3t223tuCwQJTtbc=;
 b=vOQXlFzluh4vm6W/L0RhEMJIyrcmeMMNz4siTXmtgGpu+i7Jrs+cYC8wP+0sZbPpsf
 TYdfqZM7fQnCSM1j+hoYxO6Wi9oFswijMvGH3sNbfJdapBhjeD3L4XeKEbKW200Y508v
 l+ss4fIHRumDMxg3R6Ru4hqWnDzIo7mMr0skkngQJxf98+hMulq9gCvzjtm14qAxo9m/
 ri58Htkay+N5wstaDgc/cIf9HYpiZxW7hExTNKsmoccPmCaFHmdAGzyqdfcmhs81rs5T
 M36/loLlJtdvfG6WVmkhN5x6Q6SwW9nEd36WVUD+JxmzUzufdV4ehXAq1xPHwE+AVdRg
 loPQ==
X-Gm-Message-State: AO0yUKUlYbxxdjW2EiX8K+0WGRof3ogYqj1JnQyXxkMFm22c/TlZyF+M
 pJis2R74WGJo5A0h9I3jiI1+y4LQ9jxlLrPihb1cZCrrgkffSWZ2Nhgw1reKU/rUX5i24Wq3qh5
 GAezzSSw8AQu6SMkKdnc877Ef3P4n7fd0Jbq7nhcvJfUQf1IwuI8ER2SopDg0XpkQcJNXPxAqcv
 Q=
X-Received: by 2002:a17:906:dd7:b0:864:223:40b with SMTP id
 p23-20020a1709060dd700b008640223040bmr22536179eji.33.1678351498200; 
 Thu, 09 Mar 2023 00:44:58 -0800 (PST)
X-Google-Smtp-Source: AK7set/XedvaHdvdePIJXCBPABIdqhJ00X9bglWpMbk74Qnhi61Bk/Ic+wo96QFMydae5pPoWyY0jg==
X-Received: by 2002:a17:906:dd7:b0:864:223:40b with SMTP id
 p23-20020a1709060dd700b008640223040bmr22536153eji.33.1678351497753; 
 Thu, 09 Mar 2023 00:44:57 -0800 (PST)
Received: from [192.168.10.118] ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a170906338c00b008ba9e67ea4asm8600119eja.133.2023.03.09.00.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 00:44:57 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
Subject: [PATCH 0/9] (mostly) block: add more coroutine_fn annotations,
 use bdrv/blk_co_*
Date: Thu,  9 Mar 2023 09:44:47 +0100
Message-Id: <20230309084456.304669-1-pbonzini@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

"Mostly" because there is a 9pfs patch in here too.

The series was developed with the help of vrc and the clang TSA annotations.

Paolo

Paolo Bonzini (9):
  vvfat: mark various functions as coroutine_fn
  blkdebug: add missing coroutine_fn annotation
  mirror: make mirror_flush a coroutine_fn
  nbd: mark more coroutine_fns
  9pfs: mark more coroutine_fns
  qemu-pr-helper: mark more coroutine_fns
  tests: mark more coroutine_fns
  qcow2: mark various functions as coroutine_fn and GRAPH_RDLOCK
  vmdk: make vmdk_is_cid_valid a coroutine_fn

 block/blkdebug.c              |  4 +--
 block/mirror.c                |  4 +--
 block/qcow2-bitmap.c          |  2 +-
 block/qcow2-cluster.c         | 20 +++++++-----
 block/qcow2-refcount.c        |  8 ++---
 block/qcow2-snapshot.c        | 25 +++++++--------
 block/qcow2.c                 | 26 ++++++++--------
 block/qcow2.h                 | 15 ++++-----
 block/vmdk.c                  |  2 +-
 block/vvfat.c                 | 58 ++++++++++++++++++-----------------
 hw/9pfs/9p.h                  |  4 +--
 hw/9pfs/codir.c               |  6 ++--
 nbd/server.c                  | 48 ++++++++++++++---------------
 scsi/qemu-pr-helper.c         | 22 ++++++-------
 tests/unit/test-thread-pool.c |  2 +-
 15 files changed, 127 insertions(+), 119 deletions(-)

-- 
2.39.2


