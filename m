Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB67317E729
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 19:31:29 +0100 (CET)
Received: from localhost ([::1]:47828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBNBX-0007Xm-DM
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 14:31:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41086)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1jBNAh-000718-6O
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 14:30:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1jBNAe-0008M4-Vo
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 14:30:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49119
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1jBNAe-0008Lc-Rp
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 14:30:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583778632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=igACWjazqX9irLtEfSplsA0NnMXOOdu73gE6bMOer/g=;
 b=AU8G4izQ8UGez8fU8YeSKF8YY8j6Eoiw4gh34aDfhtVXB4SYKugWppoY4dqyngy0yLWHPE
 Uzp1gY8u7C6h4X21p965De6zijS17OQEOgnE+zaWqhDX/biUq2Y7c6MXDYgGROgIW2qrAY
 N3DkXokjgFAJgONTZKgIt4QKWxQp67w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-VstHnXBdNe6HcpHu_LGiBg-1; Mon, 09 Mar 2020 14:30:28 -0400
X-MC-Unique: VstHnXBdNe6HcpHu_LGiBg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9743DBA7;
 Mon,  9 Mar 2020 18:30:27 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.65])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 802845D9CA;
 Mon,  9 Mar 2020 18:30:23 +0000 (UTC)
Date: Mon, 9 Mar 2020 18:30:21 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH v5 00/11] HMP monitor handlers refactoring
Message-ID: <20200309183021.GA20693@work-vm>
References: <20200308092440.23564-1-mlevitsk@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200308092440.23564-1-mlevitsk@redhat.com>
User-Agent: Mutt/1.13.3 (2020-01-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Maxim Levitsky (mlevitsk@redhat.com) wrote:
> This patch series is bunch of cleanups to the hmp monitor code.
> It mostly moves the blockdev related hmp handlers to its own file,
> and does some minor refactoring.
>=20
> No functional changes expected.

Queued for HMP, with the commit message fix up in 05.

Dave

> Changes from V1:
>    * move the handlers to block/monitor/block-hmp-cmds.c
>    * tiny cleanup for the commit messages
>=20
> Changes from V2:
>    * Moved all the function prototypes to new header (blockdev-hmp-cmds.h=
)
>    * Set the license of blockdev-hmp-cmds.c to GPLv2+
>    * Moved hmp_snapshot_* functions to blockdev-hmp-cmds.c
>    * Moved hmp_drive_add_node to blockdev-hmp-cmds.c
>      (this change needed some new exports, thus in separate new patch)
>    * Moved hmp_qemu_io and hmp_eject to blockdev-hmp-cmds.c
>    * Added 'error:' prefix to vreport, and updated the iotests
>      This is invasive change, but really feels like the right one
>    * Added minor refactoring patch that drops an unused #include
>=20
> Changes from V3:
>    * Dropped the error prefix patches for now due to fact that it seems
>      that libvirt doesn't need that after all. Oh well...
>      I'll send them in a separate series.
>=20
>    * Hopefully correctly merged the copyright info the new files
>      Both files are GPLv2 now (due to code from hmp.h/hmp-cmds.c)
>=20
>    * Addressed review feedback
>    * Renamed the added header to block-hmp-cmds.h
>=20
>    * Got rid of checkpatch.pl warnings in the moved code
>      (cosmetic code changes only)
>=20
>    * I kept the reviewed-by tags, since the changes I did are minor.
>      I hope that this is right thing to do.
>=20
> Changes from V4:
>    * Rebase with recent changes
>    * Fixed review feedback
>=20
> Best regards,
> =09Maxim Levitsky
>=20
> Maxim Levitsky (11):
>   usb/dev-storage: remove unused include
>   monitor/hmp: inline add_init_drive
>   monitor/hmp: rename device-hotplug.c to block/monitor/block-hmp-cmds.c
>   monitor/hmp: move hmp_drive_del and hmp_commit to block-hmp-cmds.c
>   monitor/hmp: move hmp_drive_mirror and hmp_drive_backup to
>     block-hmp-cmds.c Moved code was added after 2012-01-13, thus under
>     GPLv2+
>   monitor/hmp: move hmp_block_job* to block-hmp-cmds.c
>   monitor/hmp: move hmp_snapshot_* to block-hmp-cmds.c
>   monitor/hmp: move hmp_nbd_server* to block-hmp-cmds.c
>   monitor/hmp: move remaining hmp_block* functions to block-hmp-cmds.c
>   monitor/hmp: move hmp_info_block* to block-hmp-cmds.c
>   monitor/hmp: Move hmp_drive_add_node to block-hmp-cmds.c
>=20
>  MAINTAINERS                    |    1 +
>  Makefile.objs                  |    2 +-
>  block/Makefile.objs            |    1 +
>  block/monitor/Makefile.objs    |    1 +
>  block/monitor/block-hmp-cmds.c | 1015 ++++++++++++++++++++++++++++++++
>  blockdev.c                     |  137 +----
>  device-hotplug.c               |   91 ---
>  hw/usb/dev-storage.c           |    1 -
>  include/block/block-hmp-cmds.h |   54 ++
>  include/block/block_int.h      |    5 +-
>  include/monitor/hmp.h          |   24 -
>  include/sysemu/blockdev.h      |    4 -
>  include/sysemu/sysemu.h        |    3 -
>  monitor/hmp-cmds.c             |  782 ------------------------
>  monitor/misc.c                 |    1 +
>  15 files changed, 1085 insertions(+), 1037 deletions(-)
>  create mode 100644 block/monitor/Makefile.objs
>  create mode 100644 block/monitor/block-hmp-cmds.c
>  delete mode 100644 device-hotplug.c
>  create mode 100644 include/block/block-hmp-cmds.h
>=20
> --=20
> 2.17.2
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


