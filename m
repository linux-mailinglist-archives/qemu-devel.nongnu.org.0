Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B039C305925
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 12:05:56 +0100 (CET)
Received: from localhost ([::1]:56002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4ie3-0007Z4-Np
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 06:05:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l4iZh-0004vt-Fh
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 06:01:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:51759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l4iZe-00063n-Ni
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 06:01:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611745281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=D3OD59clNFpFlxbQN1m/+32F+z0phEu/jJGuOiC30Y4=;
 b=aSaGvqhPkoz/KIg+qBHYlOo1Vsz3tRd1jSCIPYx6foie+pHnNCtVcOOEb2wd7wW7ttyWXA
 65iKQOspYNkdfarjx12fk9RDT4M8CeZkusSXH8KuX1535SVuRH+17IGv3GdoksD5030k3J
 dKXMX8djolvxCq5/jPG/IBg0UOItNW0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-blGIzci0MEaaR1-TOoMjAA-1; Wed, 27 Jan 2021 06:01:19 -0500
X-MC-Unique: blGIzci0MEaaR1-TOoMjAA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18BDF1005504
 for <qemu-devel@nongnu.org>; Wed, 27 Jan 2021 11:01:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F25DA6EF55;
 Wed, 27 Jan 2021 11:01:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0903B1800394; Wed, 27 Jan 2021 12:01:13 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/3] Ui 20210127 patches
Date: Wed, 27 Jan 2021 12:01:09 +0100
Message-Id: <20210127110113.2111855-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 9cd69f1a270235b652766f00b94114f48a2d603f=
:=0D
=0D
  Merge remote-tracking branch 'remotes/stefanberger/tags/pull-tpm-2021-01-=
25=3D=0D
-1' into staging (2021-01-26 09:51:02 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/ui-20210127-pull-request=0D
=0D
for you to fetch changes up to 15b08119add1e49ccbc7f7d6b3a04932d2430d7e:=0D
=0D
  hw/display/vmware_vga: Remove dependency on VNC header (2021-01-27 09:48:=
04=3D=0D
 +0100)=0D
=0D
----------------------------------------------------------------=0D
vnc: fix gtk-vnc compatibility issues.=0D
vnc: vmware svga cleanup=0D
=0D
----------------------------------------------------------------=0D
=0D
Gerd Hoffmann (2):=0D
  Revert "vnc: move initialization to framebuffer_update_request"=0D
  vnc: send extended desktop resize on update requests=0D
=0D
Peter Maydell (1):=0D
  hw/display/vmware_vga: Remove dependency on VNC header=0D
=0D
 hw/display/vmware_vga.c |  3 +--=0D
 ui/vnc.c                | 14 ++++++++++----=0D
 2 files changed, 11 insertions(+), 6 deletions(-)=0D
=0D
--=3D20=0D
2.29.2=0D
=0D


