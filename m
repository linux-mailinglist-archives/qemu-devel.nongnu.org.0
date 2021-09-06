Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F95401A28
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 12:51:00 +0200 (CEST)
Received: from localhost ([::1]:55320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNCDL-00055E-Er
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 06:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNC62-0004dA-C0
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 06:43:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNC5z-0005ar-FT
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 06:43:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630925002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xvuXxVHmv2idZBtpsAw4vPcoZcdSmvGe/MnfTJTOmD0=;
 b=ivZiub0hI4Ns3wqUDMcFIkrKwlntyCnEifiHLknefykcwzkiYqZrQOaSYDPV0rfNG3bC2s
 3qxHcj4RWq7SJJ3Y/Mb94Rx9kADnjOMo+syRRv0OuDM07H0nI32Qn9sNnhB19KWWjANnhB
 XMHSBanL8FDG0+IqCpVkx1zC0uaZmYQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-C93F4nmuOBewEHA_GQYJdw-1; Mon, 06 Sep 2021 06:43:21 -0400
X-MC-Unique: C93F4nmuOBewEHA_GQYJdw-1
Received: by mail-wm1-f72.google.com with SMTP id
 m22-20020a7bcb96000000b002f7b840d9dcso3078322wmi.1
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 03:43:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9l0bY/MjBXyG8qsyvZmEqValARkh6Su6Uq6Ij+q2MDs=;
 b=M1DbjiWRsMaHV0z6g6wxk54z9YvA5IK9Iq6BDIvF9Z3hkHw/i+v1m3F+zqPKhKef+I
 3Aq4IIYhydLrxCKmne/9J69e6Mxruz0bZsLFzPF98nplGkrf0QZLGAvZf9qqim+aAi1B
 IoCl9N+5OuTZGNS2XzabJLJ5+IGa6JsWHapDhcVnilhqhGjlyDgVLb7wcr0WiJInISeA
 GIxcjdf3hsEuym2T2AZxTdB041I+0krR73OQq87yEUV04NN4XrS4rsIyoaLMylrKt+Et
 xaAxVwPURYXh+z6NHMnsJB8kkXi/F2bwysTXtV+LTSzT3o7aL2+rEhzQCcgDnBuhTr06
 mhdw==
X-Gm-Message-State: AOAM531+qt24NmnMPclDW7NkGwwp3Vp6OiVaVxzCcGis4FpuSbnh/vOL
 fwMAP/ck4PX5ss/aOrQXwO/ujRioXKkC8JMnL5q46y/SVALa8MkeAy+ocCLDpEqgd6n/EP3foYh
 /kgblP1YQN4rwmbuGUKGNmKnN2eoEdBWkN/KWaSkxrA1cWfnyvu4JV0PBlipmq7a/
X-Received: by 2002:adf:efc2:: with SMTP id i2mr12693094wrp.94.1630925000078; 
 Mon, 06 Sep 2021 03:43:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJljQnaS5mHTDBOIiMRZvkAXX1Zcv6IV3egieyT1cjrnJLpm6EgIspEKVJqvgENODLsOP7kg==
X-Received: by 2002:adf:efc2:: with SMTP id i2mr12693064wrp.94.1630924999818; 
 Mon, 06 Sep 2021 03:43:19 -0700 (PDT)
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id r26sm6740537wmh.27.2021.09.06.03.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Sep 2021 03:43:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] hw/virtio: Minor housekeeping patches
Date: Mon,  6 Sep 2021 12:43:15 +0200
Message-Id: <20210906104318.1569967-1-philmd@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This series contains few patches I gathered while tooking notes=0D
trying to understand issues #300-#302.=0D
=0D
Since v2:=0D
- Rebased on top of 88afdc92b64 ("Merge 'remotes/mst/tags/for_upstream' int=
o staging")=0D
=0D
Since v1:=0D
- Added virtqueue_flush comment (Stefano)=0D
- Call RCU_READ_LOCK_GUARD in virtqueue_packed_drop_all (Stefano)=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/virtio: Comment virtqueue_flush() must be called with RCU read lock=0D
  hw/virtio: Acquire RCU read lock in virtqueue_packed_drop_all()=0D
  hw/virtio: Have virtqueue_get_avail_bytes() pass caches arg to callees=0D
=0D
 include/hw/virtio/virtio.h |  7 +++++++=0D
 hw/virtio/virtio.c         | 32 +++++++++++++++-----------------=0D
 2 files changed, 22 insertions(+), 17 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


