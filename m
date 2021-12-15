Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7335F476190
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 20:21:32 +0100 (CET)
Received: from localhost ([::1]:43110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxZqC-0001KN-J5
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 14:21:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxYxB-0004ZR-Kt
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 13:24:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxYx9-0007OV-5h
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 13:24:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639592673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BLKSMsPPaS0PgT8CaPVQtmt5Z9qn3oJOI6lqwxdMpts=;
 b=JU8S5ARyfh/rzt4QwpTd5RfT/e0j3rhxrCu1/G2owXSXaNgmOMk61jCLpQximAPilndrcG
 tnRwPmpzpxULDIwLOIRfmkOZq037tF9fNU2k+4p9NgJOc2uEzfNGCetbMmcknWrIyxche2
 Nx7IXEFFXbAFhs5OHBexOs49CQq0yhY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-pssh_ef3ODqt6yYPjFruaQ-1; Wed, 15 Dec 2021 13:24:32 -0500
X-MC-Unique: pssh_ef3ODqt6yYPjFruaQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 l34-20020a05600c1d2200b00344d34754e4so2302628wms.7
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 10:24:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lmdBhwEuEb1iSFZeoR9qOmmlXKX0RLfyyHS8mXXUyfI=;
 b=El3lmoGR0YEigqqEE9L6/j4lj1qg1J30I09fY62aoVdpwoRCw2g4JRq30g9XtneYMX
 DdjM9+ny4aWz7kobkPFf+M7XLFIO4A2ys+V7PEBp+JhUPR0qnVF78nq/677cU2YYjQBy
 EuPN5kpc0vV71KW5XMTFjOolzcq3Z616+C2iI2Z3d4uEmS940rQ3jT5nyyPsWPwx0Wqr
 Wk3jdrb5kNlpI6aGhyqvnU3VZxNpfc6r+cueQw2vTO67eDke2a/Oi2byVEX6DkLV1W1m
 QaQtxrmY0yg+ICks+GgKrwp/MIjzgkwVblHbvIew+OQck3fcPR5xodJTM4b6j2Lks6zb
 rMQw==
X-Gm-Message-State: AOAM533vndY+9S2owN4o8xW1hMOScJIwQR+RXtBqOcyu3wygEB37dG70
 yrPK0rrfrwVk4gz8tNKXgv6GCyfnCzkK4XYFRDD/Vf/nxep+5mAiR8kCXzInmWLRIIu/4Zstkdx
 LRizM5G0BNpclyfk7aOPiEP0tODV78DFjv8L21LQhl8tgPRYKLHYS/4+drqOW+iOJ
X-Received: by 2002:a05:6000:1868:: with SMTP id
 d8mr5884829wri.285.1639592670524; 
 Wed, 15 Dec 2021 10:24:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxp0dsMmKVGOMIbTdAzQRK8stpZ/Vrf433BbSjfT2MF9bwsEY6Fsv3FcxVqXqmv3nlFLjbnIA==
X-Received: by 2002:a05:6000:1868:: with SMTP id
 d8mr5884787wri.285.1639592670217; 
 Wed, 15 Dec 2021 10:24:30 -0800 (PST)
Received: from localhost.localdomain
 (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id w5sm282615wrr.45.2021.12.15.10.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 10:24:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 0/3] physmem: Have flaview API check bus permission
 from MemTxAttrs argument
Date: Wed, 15 Dec 2021 19:24:18 +0100
Message-Id: <20211215182421.418374-1-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series aim to kill a recent class of bug, the infamous=0D
"DMA reentrancy" issues found by Alexander while fuzzing.=0D
=0D
Introduce the 'memory' field in MemTxAttrs, allowing to restrict=0D
a controller to memories (and not devices).=0D
=0D
If a transaction permission is not allowed (for example access=0D
to device), we return the specific MEMTX_BUS_ERROR.=0D
=0D
Permissions are checked in after the flatview is resolved, and=0D
before the access is done, in a new function: flatview_access_allowed().=0D
=0D
Since v2 [1]:=0D
- Addressed review comments:=0D
  - reword arm_gicv3 description (pm215)=0D
  - merged patches 3/4/5 (peterx & dhildenb)=0D
  - simplify flatview_access_allowed() logic (stefanha)=0D
  - drop MEMTXPERM enum and reword following AMBA terminology (edgar)=0D
=0D
Since v1 ("hw: Forbid DMA write accesses to MMIO regions") [2]:=0D
- rewrite based on Peter / Stefan feedbacks=0D
=0D
Based on "hw: Let the DMA API take a MemTxAttrs argument" [3].=0D
=0D
Based-on: <20210702092439.989969-1-philmd@redhat.com>=0D
=0D
[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg831168.html=0D
[2] https://www.mail-archive.com/qemu-block@nongnu.org/msg72924.html=0D
[3] https://www.mail-archive.com/qemu-devel@nongnu.org/msg820359.html=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/intc/arm_gicv3: Check for !MEMTX_OK instead of MEMTX_ERROR=0D
  softmmu/physmem: Simplify flatview_write and=0D
    address_space_access_valid=0D
  softmmu/physmem: Introduce MemTxAttrs::memory field and=0D
    MEMTX_BUS_ERROR=0D
=0D
 include/exec/memattrs.h    |  9 +++++++=0D
 hw/intc/arm_gicv3_redist.c |  4 +--=0D
 softmmu/physmem.c          | 54 +++++++++++++++++++++++++++++++-------=0D
 3 files changed, 55 insertions(+), 12 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D


