Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D93A4462C9
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 12:34:51 +0100 (CET)
Received: from localhost ([::1]:52712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mixUg-0005W4-Gb
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 07:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mixRh-0001Cw-30
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 07:31:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mixRY-00069G-4Y
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 07:31:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636111895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9lhVmTDhn5cZbyX0AD0QzMvil7u9EnmpIFFFBBhLXjY=;
 b=cY7ndEp4Wttnmv4uisnahUahElYONRXRxP7Crl7dDhhM7ysU10bdtlLndTfqdHM/58GSa/
 9JA7BARhcgxLsdfYfv9xgLEMA36sn1odUA1aej2yQq20CJS59ErYoupu1VHEIdWk8q6Pg7
 yfAwl+K66+Ng36yflBZEgYGdLA0Dl/Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-ZcfzW3rrMZmWP6KXb1KLZg-1; Fri, 05 Nov 2021 07:31:33 -0400
X-MC-Unique: ZcfzW3rrMZmWP6KXb1KLZg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E2C280A5C2
 for <qemu-devel@nongnu.org>; Fri,  5 Nov 2021 11:31:33 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.194.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 213CD5B826;
 Fri,  5 Nov 2021 11:30:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C7ED61805C86; Fri,  5 Nov 2021 12:30:43 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/6] Egl 20211105 patches
Date: Fri,  5 Nov 2021 12:30:37 +0100
Message-Id: <20211105113043.4059361-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit b1fd92137e4d485adeec8e9f292f928ff335b76c=
:=0D
=0D
  Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' into sta=
ging (2021-11-03 13:07:30 -0400)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/egl-20211105-pull-request=0D
=0D
for you to fetch changes up to 1350ff156b25be65c599ecca9957ce6726c6d383:=0D
=0D
  ui/gtk-egl: blitting partial guest fb to the proper scanout surface (2021=
-11-05 12:29:44 +0100)=0D
=0D
----------------------------------------------------------------=0D
gtk: a collection of egl fixes.=0D
=0D
----------------------------------------------------------------=0D
=0D
Dongwon Kim (6):=0D
  virtio-gpu: splitting one extended mode guest fb into n-scanouts=0D
  ui/gtk-egl: un-tab and re-tab should destroy egl surface and context=0D
  ui/gtk-egl: make sure the right context is set as the current=0D
  ui/gtk-egl: guest fb texture needs to be regenerated when=0D
    reinitializing egl=0D
  ui/gtk: gd_draw_event returns FALSE when no cairo surface is bound=0D
  ui/gtk-egl: blitting partial guest fb to the proper scanout surface=0D
=0D
 include/hw/virtio/virtio-gpu.h        |  5 +++--=0D
 include/ui/console.h                  |  4 ++++=0D
 hw/display/virtio-gpu-udmabuf-stubs.c |  3 ++-=0D
 hw/display/virtio-gpu-udmabuf.c       | 22 ++++++++++++++--------=0D
 hw/display/virtio-gpu.c               |  4 ++--=0D
 ui/egl-helpers.c                      | 25 +++++++++++++++++++++----=0D
 ui/gtk-egl.c                          | 10 ++++++++++=0D
 ui/gtk.c                              | 23 +++++++++++++++++++++++=0D
 8 files changed, 79 insertions(+), 17 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


