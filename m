Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9926A4CFEB0
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 13:33:41 +0100 (CET)
Received: from localhost ([::1]:37158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRCYW-0007g1-N4
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 07:33:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nRB9N-0008UH-7F
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:03:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nRB9L-0003mj-JM
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:03:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646651014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=eUVb8mdhgXF3j93ujDXuaXNQHGs3QgISf+3jZyTmH+g=;
 b=AE+q98DEm8qATOxNkYJw6lVI62piAy+cH7H0JF+7I+R1kNYx0+Cj9YJa1bhCNgDLRaDb5I
 b7YIm9nUlWBlYflxdOxIFFPMZHCEJQjggpjvB3Obej5O1BcVnYSM9zUiRAGEU+xEAAhWd9
 bC12maPfzZ4DWfvF6UGTSbwX+Ltyjxk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-206-MpKbIuYKNDa97IjuYG2pEw-1; Mon, 07 Mar 2022 06:03:33 -0500
X-MC-Unique: MpKbIuYKNDa97IjuYG2pEw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B907F180FCD1
 for <qemu-devel@nongnu.org>; Mon,  7 Mar 2022 11:03:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A91C78212;
 Mon,  7 Mar 2022 11:03:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 22ABF1800612; Mon,  7 Mar 2022 12:03:03 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] Seabios 20220307 patches
Date: Mon,  7 Mar 2022 12:03:01 +0100
Message-Id: <20220307110303.1698186-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 9d662a6b22a0838a85c5432385f35db2488a33a5=
:=0D
=0D
  Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220305' in=
to staging (2022-03-05 18:03:15 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://git.kraxel.org/qemu tags/seabios-20220307-pull-request=0D
=0D
for you to fetch changes up to d877ada1b8c768d10c39b63bb70c9e5ed1c0a4bc:=0D
=0D
  update seabios binaries to 1.16.0 (2022-03-07 11:20:21 +0100)=0D
=0D
----------------------------------------------------------------=0D
update seabios to 1.16.0=0D
=0D
----------------------------------------------------------------=0D
=0D
Gerd Hoffmann (2):=0D
  update seabios submodule to 1.16.0=0D
  update seabios binaries to 1.16.0=0D
=0D
 pc-bios/bios-256k.bin             | Bin 262144 -> 262144 bytes=0D
 pc-bios/bios-microvm.bin          | Bin 131072 -> 131072 bytes=0D
 pc-bios/bios.bin                  | Bin 131072 -> 131072 bytes=0D
 pc-bios/vgabios-ati.bin           | Bin 39936 -> 39936 bytes=0D
 pc-bios/vgabios-bochs-display.bin | Bin 28672 -> 28672 bytes=0D
 pc-bios/vgabios-cirrus.bin        | Bin 39424 -> 39424 bytes=0D
 pc-bios/vgabios-qxl.bin           | Bin 39424 -> 39424 bytes=0D
 pc-bios/vgabios-ramfb.bin         | Bin 28672 -> 28672 bytes=0D
 pc-bios/vgabios-stdvga.bin        | Bin 39424 -> 39424 bytes=0D
 pc-bios/vgabios-virtio.bin        | Bin 39424 -> 39424 bytes=0D
 pc-bios/vgabios-vmware.bin        | Bin 39424 -> 39424 bytes=0D
 pc-bios/vgabios.bin               | Bin 38912 -> 38912 bytes=0D
 roms/seabios                      |   2 +-=0D
 13 files changed, 1 insertion(+), 1 deletion(-)=0D
=0D
--=20=0D
2.35.1=0D
=0D


