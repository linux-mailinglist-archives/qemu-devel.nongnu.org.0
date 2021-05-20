Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB71F38AA42
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 13:12:12 +0200 (CEST)
Received: from localhost ([::1]:37322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljgb3-0001Vg-Gw
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 07:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljgYU-0007hT-FW
 for qemu-devel@nongnu.org; Thu, 20 May 2021 07:09:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42949)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ljgYR-0004LX-FP
 for qemu-devel@nongnu.org; Thu, 20 May 2021 07:09:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621508966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=noEF/n3472Pt3J3P8PT32smX5f68TFqzx+Dl9pe7hFE=;
 b=g9VLTcSXVGwSE7zjB/Nf2xG8b8pzl+IR5kHdBe8TtQcacIbXeUID2ixN0tVj1gv1tgu8qG
 E2MNAgddeP1psmL0K/oononYkx0KEebhha9uYJvH5ZyuM1Ro15wfXPgdbrlD+F9aqIKVzG
 Xlx5zymIlGNSyneS43Vf9Yez61lV68M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-8KDa3iGJPs2vLxS5ysTcGQ-1; Thu, 20 May 2021 07:09:22 -0400
X-MC-Unique: 8KDa3iGJPs2vLxS5ysTcGQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 u19-20020a05600c19d3b029017ae5ad2798so423384wmq.3
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 04:09:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QQzTceknd4eB2G2G4Gz+OwN4+YaFxjwGlubhtyxKKPs=;
 b=JdIlHDlsetJ1iTskuxwOmjgaJPtFVFWFhWFjZnp8KulokmoyRZc9TcJPKEK4/mC+1i
 tEB7ELbfdeqbLU5NWj5ctAg/2K43zSqwAdTAqio4l4GKj2CO74KdWt7Ve00WUAAiC+48
 XpIJz+jLpeiqneyp96GTh5MmgN8lMTgLxWq672sAm2Mk6e/CVKuhwiurm4dSPOKI7W++
 1rpiOYDTiNDTuyDF1C8TvHhVSIkVQJIhsGErSuD7lBzVaAEuVY48uxjREE5P4vL/dZRy
 0WQ28lfjo9OOUbT7EBHMzqzIgz1sEs6m1GvGVnhwNZhaJgKCKfBx0jf0+HSlK+bTTAWg
 ezHQ==
X-Gm-Message-State: AOAM532yUY08Og/cx7NOi154038/7lFGCwMhIeMaszlcZP08Hy/Wg9aN
 RtEcABZSNrKcChYeEa1Rppo5j7ROWCBXRYg8JLkhAWdU/OcUaH9CsdxHKfNPZW+YWtRm/JDf5vK
 7/49x6Isa5qZqUFdGl3ffA5KaWrwfqLotCycPZzx2UcORshMaVbrjEjx+g6uRJsFc
X-Received: by 2002:a05:600c:3553:: with SMTP id
 i19mr2362115wmq.159.1621508961237; 
 Thu, 20 May 2021 04:09:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiqlgCkteLa02ykY975EFkq1g2NYaBplroGxVft6a7eL0SshDA93GavOCub42u9yvys7S/ig==
X-Received: by 2002:a05:600c:3553:: with SMTP id
 i19mr2362086wmq.159.1621508960980; 
 Thu, 20 May 2021 04:09:20 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id o3sm2834498wrj.7.2021.05.20.04.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 04:09:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 00/12] exec/memory: Experimental API to catch unaligned
 accesses
Date: Thu, 20 May 2021 13:09:07 +0200
Message-Id: <20210520110919.2483190-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Xu <peterx@redhat.com>,
 Bibo Mao <maobibo@loongson.cn>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This series is an experiment after chatting with Stefan and having=0D
received review from Peter / Richard on an orthogonal series aiming=0D
to handle unaligned pointers (atomically):=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg808954.html=0D
=0D
Here we don't aim to fix unatomic accesses, however we are interested=0D
in catching malicious unaligned accesses from guests.=0D
=0D
For that we introduce the MemTxAttrs::aligned field which allow=0D
accessors to return MEMTX_UNALIGNED_ERROR early enough, instead=0D
of trying the unaligned access which can potentially trigger a=0D
SIGBUS and abort the process.=0D
=0D
To be able to pass/return alignment information we modify the=0D
memory load/store cached API, then add the=0D
virtio_ld/st*_phys_cached_with_attrs() handler (we only implement=0D
lduw for this experiment).=0D
=0D
Finaly we modify vring_avail_flags() to return whether the guest=0D
requested an illegal (unaligned) memory access.=0D
=0D
Note: The current virtio_ld/st*_phys_cached_with_attrs() API returns=0D
the value, and take the MemTxResult as argument, so I choose to=0D
return -1 (marked with /* XXX */ comment. We should switch to using=0D
an API which returns a MemTxResult and takes the value accessed as=0D
argument, this way we don't have to return random meaningless value.=0D
=0D
But this is beyond the scope of this experiment, here we want to=0D
emphasize the introduction of the MemTxAttrs::aligned field and the=0D
MEMTX_UNALIGNED_ERROR return value.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (12):=0D
  exec/memory_ldst: Use correct type sizes=0D
  exec/memattrs: Add attribute/error for address alignment=0D
  exec/memory_ldst: Return MEMTX_UNALIGNED_ERROR for unaligned addresses=0D
  exec/memory_ldst_cached: Sort declarations=0D
  exec/memory_ldst_cached: Use correct type size=0D
  exec/memory_ldst_cached: Set MemTxResult on success=0D
  exec/memory_ldst_cached: Document aligned addresses are expected=0D
  exec/memory_ldst_cached: Check address alignment if requested=0D
  hw/virtio: Use correct type sizes=0D
  hw/virtio: Extract virtio_lduw_phys_cached_with_attrs()=0D
  hw/virtio: Have vring_avail_flags() return a boolean value=0D
  hw/virtio: Display error if vring flag field is not aligned=0D
=0D
 include/exec/memattrs.h               |   3 +=0D
 include/hw/virtio/virtio-access.h     |  39 +++++++--=0D
 include/exec/memory_ldst.h.inc        |  16 ++--=0D
 include/exec/memory_ldst_cached.h.inc | 114 ++++++++++++++++++++------=0D
 hw/virtio/virtio.c                    |  22 ++++-=0D
 memory_ldst.c.inc                     |  69 +++++++++++++---=0D
 6 files changed, 211 insertions(+), 52 deletions(-)=0D
=0D
--=20=0D
2.26.3=0D
=0D


