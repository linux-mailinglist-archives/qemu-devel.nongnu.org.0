Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 737F03F4EC9
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 18:54:50 +0200 (CEST)
Received: from localhost ([::1]:60822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIDDl-000780-Gq
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 12:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mID1U-0008Ks-Q7
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:42:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mID1Q-0007Er-Ma
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 12:42:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629736923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Iw86gclMHHcslYfuyGWy7U6haKf3Q0NfRhoUfbCS24o=;
 b=gGt9QikeJY1uEbGfp9SpVrWsUPkgV1BmJOLNNaBkPEZa8l/Yu62ZJJEJwAMHhkVLoFgSXd
 bit+Wel+oNK0noRcWRtd78+L1xQ4APPbiQeZ5Wls0/D8Zb9xyWZVpBEi3QbYn8sfnqzrwC
 G4Nipks13/vCSgQxDaB4VTt8H8NPylQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-24-JTI97BiLPfmEbCC2apCTAw-1; Mon, 23 Aug 2021 12:42:00 -0400
X-MC-Unique: JTI97BiLPfmEbCC2apCTAw-1
Received: by mail-wm1-f70.google.com with SMTP id
 z18-20020a1c7e120000b02902e69f6fa2e0so3180480wmc.9
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 09:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tdQkF+DeGW/PUh7l/wCwp28OizfjkGr6/zWGWFTFV5I=;
 b=q5JMpxVFYzNn41puFa6IE+1nGnLiqLgsP3uW9aXthfw1e840Ml0koF855pDHOT0OkO
 dE4BU/Iu+w76BAAUIt6ULUdcGKlxgAMHpbZPUShkLIjyPsGFd/+FP5I/afd5OFZPxTLW
 8IBvtVr1V9LF/Jcj6SD5og6LloLpUsAD8b9rFy18oK//YMHc8zvLsckDNcPHgWZh5hTC
 1vnZ6uWImIUJgAGptP9Z0d/nzk3NsgrbOQxMMNgbWl9fvmdgnBr2JrXvYQ8sEJd8yvD7
 4DpfF4T+HBtyFenyWpgWWHX6yZ9zjYGIB2AGqTySsqmsLEQN4Lj4628KnmTyC7iU4qR6
 CzLw==
X-Gm-Message-State: AOAM530jsW8emAReZzHIMRD9u+9pBkFKDaEuLifRnLFH6j8QbyfHQa1+
 7ZLa70Bj/QX5AqA/OrdVNCYUPryacMWSSVEeIIoB9vJ7MMU8sjFGxYSoSKmItyvtl3oVEBA1ksY
 jsuhTIZCdoTTNNRE/emsvem4MvOehgFppKga+h0IEoEbuYmlWaw6nGu1oAfuXWuOn
X-Received: by 2002:adf:fa11:: with SMTP id m17mr14389942wrr.323.1629736919249; 
 Mon, 23 Aug 2021 09:41:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYS5I4V0E6T9z0oXJSmjqn6kfEJFUhECL99lLjdRGQDiV1PtdWS8KTfuQod5KH+GDO1CoC8g==
X-Received: by 2002:adf:fa11:: with SMTP id m17mr14389917wrr.323.1629736919019; 
 Mon, 23 Aug 2021 09:41:59 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 b4sm4795851wrp.33.2021.08.23.09.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 09:41:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 0/5] physmem: Have flaview API check bus permission
 from MemTxAttrs argument
Date: Mon, 23 Aug 2021 18:41:52 +0200
Message-Id: <20210823164157.751807-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series aim to kill a recent class of bug, the infamous=0D
"DMA reentrancy" issues found by Alexander while fuzzing.=0D
=0D
Introduce the 'bus_perm' field in MemTxAttrs, defining 3 bits:=0D
=0D
- MEMTXPERM_UNSPECIFIED (current default, unchanged behavior)=0D
- MEMTXPERM_UNRESTRICTED (allow list approach)=0D
- MEMTXPERM_RAM_DEVICE (example of deny list approach)=0D
=0D
If a transaction permission is not allowed (for example access=0D
to non-RAM device), we return the specific MEMTX_BUS_ERROR.=0D
=0D
Permissions are checked in after the flatview is resolved, and=0D
before the access is done, in a new function: flatview_access_allowed().=0D
=0D
I'll post another series on top as example, fixing the SD card=0D
bugs.=0D
=0D
Since v1 ("hw: Forbid DMA write accesses to MMIO regions") [1]:=0D
- rewrite based on Peter / Stefan feedbacks=0D
=0D
Based on "hw: Let the DMA API take a MemTxAttrs argument" [2].=0D
=0D
Supersedes: <20200903110831.353476-1-philmd@redhat.com>=0D
Based-on: <20210702092439.989969-1-philmd@redhat.com>=0D
=0D
[1] https://www.mail-archive.com/qemu-block@nongnu.org/msg72924.html=0D
[2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg820359.html=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  softmmu/physmem: Simplify flatview_write and=0D
    address_space_access_valid=0D
  hw/intc/arm_gicv3: Check for !MEMTX_OK instead of MEMTX_ERROR=0D
  exec/memattrs: Introduce MemTxAttrs::bus_perm field=0D
  softmmu/physmem: Introduce flatview_access_allowed() to check bus=0D
    perms=0D
  softmmu/physmem: Have flaview API check MemTxAttrs::bus_perm field=0D
=0D
 include/exec/memattrs.h    | 21 +++++++++++++=0D
 hw/intc/arm_gicv3_dist.c   |  4 +--=0D
 hw/intc/arm_gicv3_redist.c |  4 +--=0D
 softmmu/physmem.c          | 61 ++++++++++++++++++++++++++++++++------=0D
 4 files changed, 77 insertions(+), 13 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


