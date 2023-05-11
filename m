Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F5D6FF20A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 15:02:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px5us-0003wF-Lu; Thu, 11 May 2023 09:01:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ernunes@redhat.com>)
 id 1px5uq-0003vO-BT
 for qemu-devel@nongnu.org; Thu, 11 May 2023 09:01:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ernunes@redhat.com>)
 id 1px5uo-0005og-Hz
 for qemu-devel@nongnu.org; Thu, 11 May 2023 09:01:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683810061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=RxMMHiS+7GvgJIDXoFm0/qU/lXYKhTFRle+8yAOXGHU=;
 b=ecBFL25AO2zXbBIsnBXT+J3JZS9mmM+e6svwk7Icq9gwL+uCK4EcXxJ2g6GPNtKeOP1yDZ
 bmozvVYMRvtpEl9VWW0E0upfNVyRIAIiRj/4Xu7SxvgFPg8LR0wxKqp3YAesv3SNqUTA3u
 M8oCL8wB29Q7EMtUDLWYR59Nn7Zn4Kg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-Dy9fmvUjN46Wxht4167G5A-1; Thu, 11 May 2023 08:59:16 -0400
X-MC-Unique: Dy9fmvUjN46Wxht4167G5A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 410671C05EA7
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 12:59:16 +0000 (UTC)
Received: from centennial.enunes.eu.com (unknown [10.45.225.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24F2463F8A;
 Thu, 11 May 2023 12:59:14 +0000 (UTC)
From: Erico Nunes <ernunes@redhat.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, mst@redhat.com, kraxel@redhat.com,
 Erico Nunes <ernunes@redhat.com>
Subject: [PATCH 0/2] vhost-user-gpu get_edid feature
Date: Thu, 11 May 2023 14:58:01 +0200
Message-Id: <20230511125803.594963-1-ernunes@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=ernunes@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This adds support to the virtio-gpu get_edid command when using the
vhost-user-gpu implementation in contrib/.
So far, qemu has been outputting the following message:
  EDID requested but the backend doesn't support it.
when using that implementation.

This is tested with vhost-user-gpu, the dbus ui backend and the
monitor-edid application, which now shows complete "QEMU Monitor" edid
data.

In this v1, I would appreciate some feedback especially regarding:
- Can we enable it by default or do need to create another config option
  flag for it?
- Can we now also remove the "EDID requested but the backend doesn't
  support it." warning and logic from hw/display or do we still want to
  keep that around for other potential implementations of
  vhost-user-gpu?
- The structs used as payloads of the vhost-user-gpu messages. Looks
  like there was no command so far requiring bidirectional messages with
  different payloads so I just based it on similar available ones.

Thanks


Erico Nunes (2):
  virtio-gpu: refactor generate_edid function to virtio_gpu_base
  vhost-user-gpu: implement get_edid feature

 contrib/vhost-user-gpu/vhost-user-gpu.c | 53 ++++++++++++++++++++++++-
 contrib/vhost-user-gpu/virgl.c          |  3 ++
 contrib/vhost-user-gpu/vugpu.h          |  8 ++++
 docs/interop/vhost-user-gpu.rst         |  9 +++++
 hw/display/vhost-user-gpu.c             | 31 +++++++++++++++
 hw/display/virtio-gpu-base.c            | 17 ++++++++
 hw/display/virtio-gpu.c                 | 20 +---------
 include/hw/virtio/virtio-gpu.h          |  2 +
 8 files changed, 122 insertions(+), 21 deletions(-)

-- 
2.39.2


