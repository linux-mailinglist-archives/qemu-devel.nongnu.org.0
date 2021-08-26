Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 228203F8D4D
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:50:36 +0200 (CEST)
Received: from localhost ([::1]:53308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJWN-0007E5-4w
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJJ9f-0005dl-Vb
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:27:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mJJ9c-0007KW-Rd
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:27:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629998823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ryKGLH5jMWX7Q22KSxyMfBQDReifUX8CAm9DMtMmYg0=;
 b=dGDRsxzqeuG3T1hcPVyLJVFmnXPf4Tl/Fbn9VTduBp5Mg3TUWQILtv0MevnD+wcoBY5Qci
 aWFE7saURgtXtyQR8uscVDF2lfwleJXzQ2X/+QMWipRPVaa/TZrRL3ufNMm1ELoNWVdbCA
 2urBxO1ItJ3YbaGwSttl4XAkds+qN/s=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-s6L0H9eJPLGdmqGGkqfe-A-1; Thu, 26 Aug 2021 13:27:01 -0400
X-MC-Unique: s6L0H9eJPLGdmqGGkqfe-A-1
Received: by mail-wr1-f72.google.com with SMTP id
 z15-20020adff74f000000b001577d70c98dso1076811wrp.12
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KvJr2p3qmVij0GOIJJY/8HskqWNgA4g73pQ65Cj2Li0=;
 b=hDYPcgEeH6jdBXhMgzjdiB4ahNJnyYYhX4ngOS9uGxYJ322bnfUXCUaKuLJM3oixMo
 +fOoQCrrxWVWiQdXcdFV3RsoMNoQj2XyBh0z3fvy39iIZvESOFccEfBr2IisJd3wdpPb
 AZakyZUCgx8V/OsGKLHiRtspL05VsqQXLTIxp8pQ6mXMUGzIKz+0+Pb1N2eeyx2ajVU0
 Ns388OJbvkX8wfnx+PO4C7PIYRzihSetCUwkbMCIK/KZJZ1WSMMdmDrwKSZK7BiEz3s4
 Syd5ZMIoXQL6ExsGjr9dRWHelQPhvnZSMVAmJReUZ7cCpS2XKVgcYotifPPWdO9Hafk5
 S4pA==
X-Gm-Message-State: AOAM531ZxtAdQqMQj0oyuE7c3sOvUqWj7yEkM4OSXYg0qBoBrerl9Dd0
 q1olgyqXk105t90KP9mhAAacKJpcITWkJIdjlNfgxWUwHBOhxgN0/Wil2qUBHYhwSRtj6CKcx0F
 lp977VTw5n8iw2KrjwtkITeNWEksjihCkljCfM89DXIhzF2BqIsZedYAmCn2aeNMV
X-Received: by 2002:a1c:a544:: with SMTP id o65mr4766175wme.53.1629998820504; 
 Thu, 26 Aug 2021 10:27:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyW9fN9ZEuCvXMByKRcRp+c66W1D9fBaTKEBSjOJ04An6FM1+cEtPIjr9H0FaGIPn0voPtc5w==
X-Received: by 2002:a1c:a544:: with SMTP id o65mr4766155wme.53.1629998820324; 
 Thu, 26 Aug 2021 10:27:00 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 j17sm3707771wrh.67.2021.08.26.10.26.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:26:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] hw/virtio: Minor housekeeping patches
Date: Thu, 26 Aug 2021 19:26:55 +0200
Message-Id: <20210826172658.2116840-1-philmd@redhat.com>
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This series contains few patches I gathered while tooking notes=0D
trying to understand issues #300-#302. Nothing very exciting :)=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/virtio: Document virtio_queue_packed_empty_rcu is called within RCU=0D
  hw/virtio: Remove NULL check in virtio_free_region_cache()=0D
  hw/virtio: Have virtqueue_get_avail_bytes() pass caches arg to callees=0D
=0D
 hw/virtio/virtio.c | 36 +++++++++++++++---------------------=0D
 1 file changed, 15 insertions(+), 21 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


