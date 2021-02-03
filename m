Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A2430E0C6
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 18:22:29 +0100 (CET)
Received: from localhost ([::1]:38474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7LrH-0005kK-2t
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 12:22:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7Lo9-0003ij-Qv
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:19:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l7Lo2-0003mh-VY
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:19:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612372745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=h6frNj198wOn7HcZYed01kE3VrvFztZItKvs8s6wRtE=;
 b=KbSRoyMgQeCzzvxKZUrP5t5eklykWflS/MKkxfoYw14Z94u1Is96ecLsk9O/Jkv97hb0Ck
 eivzlG0dBXGaNhoCkVQYff0RyGA58cyLuGhw/OHiolQtOi3UvL+2GN0u0cLgh3deITM9uf
 LB8xZRNs5/95BFB8MVaAFcmNqjVYLWA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-haeFY-oYMYuLI_mxjt4d5g-1; Wed, 03 Feb 2021 12:19:03 -0500
X-MC-Unique: haeFY-oYMYuLI_mxjt4d5g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D8B31074645;
 Wed,  3 Feb 2021 17:19:02 +0000 (UTC)
Received: from thuth.com (ovpn-112-165.ams2.redhat.com [10.36.112.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A49A658899;
 Wed,  3 Feb 2021 17:18:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 0/4] Remove the deprecated pc-1.x machine types and related
 stuff
Date: Wed,  3 Feb 2021 18:18:28 +0100
Message-Id: <20210203171832.483176-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, libvir-list@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The pc-1.x machine types have been deprecated since QEMU v5.0 already, and
nobody complained, so they can now be removed. While we're at it, also
remove some compatibility switches and related code that are now not
necessary anymore after these machine types have been removed.
(We could maybe even remove more stuff like the various host_features
switches in the virtio devices, but they still might be useful in certain
cases, so I decided not to remove them yet)

Thomas Huth (4):
  hw/i386: Remove the deprecated pc-1.x machine types
  hw/block/fdc: Remove the check_media_rate property
  hw/virtio/virtio-balloon: Remove the "class" property
  hw/usb/bus: Remove the "full-path" property

 docs/system/deprecated.rst       |  6 --
 docs/system/removed-features.rst |  6 ++
 hw/block/fdc.c                   | 17 +-----
 hw/i386/pc_piix.c                | 94 --------------------------------
 hw/usb/bus.c                     |  7 +--
 hw/virtio/virtio-balloon-pci.c   | 11 +---
 include/hw/usb.h                 |  2 +-
 tests/qemu-iotests/172.out       | 35 ------------
 8 files changed, 11 insertions(+), 167 deletions(-)

-- 
2.27.0


