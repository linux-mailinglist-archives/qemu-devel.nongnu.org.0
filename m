Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1179E17E4DD
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 17:37:13 +0100 (CET)
Received: from localhost ([::1]:46716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBLOy-0007iT-4L
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 12:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51098)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1jBLO2-0007Hr-Ov
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 12:36:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1jBLO0-000367-Uy
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 12:36:14 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:31806
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>) id 1jBLO0-00035g-QC
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 12:36:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583771771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZqY78kua6euK7T6jlQgIdw10C7zaiY/jjQ0p+9kzJe8=;
 b=de7MvioqH+Hhb0oTbMW/L4k4nxGxYRHbnLMrr61dtoh2A4C3ZhmuOoBFqxAeYPxLjaUMfD
 VGS/kYT8ta9tHRoAkyNIYNmKKCWegR9g3qvgq6TRv8bH+gK1CDJ8d1MIkJX5lD/DyCBwrj
 848S34F0L6Q5QZxijv0pjnH+s4W818k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-xCIWFIb9P6Kb4iWSgZRu4w-1; Mon, 09 Mar 2020 12:36:10 -0400
X-MC-Unique: xCIWFIb9P6Kb4iWSgZRu4w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C4B9100550E;
 Mon,  9 Mar 2020 16:36:09 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.153])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57C6B2CE1A;
 Mon,  9 Mar 2020 16:35:57 +0000 (UTC)
Message-ID: <617c5b0b8385d195bb73534f677064d88116669a.camel@redhat.com>
Subject: Re: [PATCH v5 05/11] monitor/hmp: move hmp_drive_mirror and
 hmp_drive_backup to block-hmp-cmds.c Moved code was added after 2012-01-13,
 thus under GPLv2+
From: Maxim Levitsky <mlevitsk@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Date: Mon, 09 Mar 2020 18:35:56 +0200
In-Reply-To: <20200309163113.GH3088@work-vm>
References: <20200308092440.23564-1-mlevitsk@redhat.com>
 <20200308092440.23564-6-mlevitsk@redhat.com>
 <9cf9655745608e9a12208524dc72196493644290.camel@redhat.com>
 <20200309163113.GH3088@work-vm>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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

On Mon, 2020-03-09 at 16:31 +0000, Dr. David Alan Gilbert wrote:
> * Maxim Levitsky (mlevitsk@redhat.com) wrote:
> > 
> > I see that I have the same issue of long subject line here.
> > Its because I forgot the space after first line, when adding this.
> > If I need to resend another version of this patchset I'll fix this,
> > but otherwise maybe that can be fixed when applying this to one of maintainer's
> > trees.
> > 
> > Sorry for noise.
> 
> I can just fix the commit message.


Thank you!!
Best regards,
	Maxim Levitsky
> 
> Dave
> 
> > Best regards,
> > 	Maxim Levitsky
> > 
> > On Sun, 2020-03-08 at 11:24 +0200, Maxim Levitsky wrote:
> > > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > ---
> > >  block/monitor/block-hmp-cmds.c | 60 ++++++++++++++++++++++++++++++++++
> > >  include/block/block-hmp-cmds.h | 12 +++++--
> > >  include/monitor/hmp.h          |  2 --
> > >  monitor/hmp-cmds.c             | 58 --------------------------------
> > >  4 files changed, 69 insertions(+), 63 deletions(-)
> > > 
> > > diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
> > > index ad727a6b08..d6dd5d97f7 100644
> > > --- a/block/monitor/block-hmp-cmds.c
> > > +++ b/block/monitor/block-hmp-cmds.c
> > > @@ -37,10 +37,12 @@
> > >  #include "qapi/qapi-commands-block.h"
> > >  #include "qapi/qmp/qdict.h"
> > >  #include "qapi/error.h"
> > > +#include "qapi/qmp/qerror.h"
> > >  #include "qemu/config-file.h"
> > >  #include "qemu/option.h"
> > >  #include "sysemu/sysemu.h"
> > >  #include "monitor/monitor.h"
> > > +#include "monitor/hmp.h"
> > >  #include "block/block_int.h"
> > >  #include "block/block-hmp-cmds.h"
> > >  
> > > @@ -187,3 +189,61 @@ void hmp_commit(Monitor *mon, const QDict *qdict)
> > >          error_report("'commit' error for '%s': %s", device, strerror(-ret));
> > >      }
> > >  }
> > > +
> > > +void hmp_drive_mirror(Monitor *mon, const QDict *qdict)
> > > +{
> > > +    const char *filename = qdict_get_str(qdict, "target");
> > > +    const char *format = qdict_get_try_str(qdict, "format");
> > > +    bool reuse = qdict_get_try_bool(qdict, "reuse", false);
> > > +    bool full = qdict_get_try_bool(qdict, "full", false);
> > > +    Error *err = NULL;
> > > +    DriveMirror mirror = {
> > > +        .device = (char *)qdict_get_str(qdict, "device"),
> > > +        .target = (char *)filename,
> > > +        .has_format = !!format,
> > > +        .format = (char *)format,
> > > +        .sync = full ? MIRROR_SYNC_MODE_FULL : MIRROR_SYNC_MODE_TOP,
> > > +        .has_mode = true,
> > > +        .mode = reuse ? NEW_IMAGE_MODE_EXISTING : NEW_IMAGE_MODE_ABSOLUTE_PATHS,
> > > +        .unmap = true,
> > > +    };
> > > +
> > > +    if (!filename) {
> > > +        error_setg(&err, QERR_MISSING_PARAMETER, "target");
> > > +        hmp_handle_error(mon, err);
> > > +        return;
> > > +    }
> > > +    qmp_drive_mirror(&mirror, &err);
> > > +    hmp_handle_error(mon, err);
> > > +}
> > > +
> > > +void hmp_drive_backup(Monitor *mon, const QDict *qdict)
> > > +{
> > > +    const char *device = qdict_get_str(qdict, "device");
> > > +    const char *filename = qdict_get_str(qdict, "target");
> > > +    const char *format = qdict_get_try_str(qdict, "format");
> > > +    bool reuse = qdict_get_try_bool(qdict, "reuse", false);
> > > +    bool full = qdict_get_try_bool(qdict, "full", false);
> > > +    bool compress = qdict_get_try_bool(qdict, "compress", false);
> > > +    Error *err = NULL;
> > > +    DriveBackup backup = {
> > > +        .device = (char *)device,
> > > +        .target = (char *)filename,
> > > +        .has_format = !!format,
> > > +        .format = (char *)format,
> > > +        .sync = full ? MIRROR_SYNC_MODE_FULL : MIRROR_SYNC_MODE_TOP,
> > > +        .has_mode = true,
> > > +        .mode = reuse ? NEW_IMAGE_MODE_EXISTING : NEW_IMAGE_MODE_ABSOLUTE_PATHS,
> > > +        .has_compress = !!compress,
> > > +        .compress = compress,
> > > +    };
> > > +
> > > +    if (!filename) {
> > > +        error_setg(&err, QERR_MISSING_PARAMETER, "target");
> > > +        hmp_handle_error(mon, err);
> > > +        return;
> > > +    }
> > > +
> > > +    qmp_drive_backup(&backup, &err);
> > > +    hmp_handle_error(mon, err);
> > > +}
> > > diff --git a/include/block/block-hmp-cmds.h b/include/block/block-hmp-cmds.h
> > > index 30b0f56415..a64b737b3a 100644
> > > --- a/include/block/block-hmp-cmds.h
> > > +++ b/include/block/block-hmp-cmds.h
> > > @@ -3,10 +3,13 @@
> > >   *
> > >   * Copyright (c) 2003-2008 Fabrice Bellard
> > >   * Copyright (c) 2020 Red Hat, Inc.
> > > + * Copyright IBM, Corp. 2011
> > >   *
> > > - * This work is licensed under the terms of the GNU GPL, version 2.
> > > - * or (at your option) any later version.
> > > - * See the COPYING file in the top-level directory.
> > > + * Authors:
> > > + *  Anthony Liguori   <aliguori@us.ibm.com>
> > > + *
> > > + * This work is licensed under the terms of the GNU GPL, version 2.  See
> > > + * the COPYING file in the top-level directory.
> > >   */
> > >  
> > >  #ifndef BLOCK_HMP_COMMANDS_H
> > > @@ -17,4 +20,7 @@ void hmp_drive_add(Monitor *mon, const QDict *qdict);
> > >  void hmp_commit(Monitor *mon, const QDict *qdict);
> > >  void hmp_drive_del(Monitor *mon, const QDict *qdict);
> > >  
> > > +void hmp_drive_mirror(Monitor *mon, const QDict *qdict);
> > > +void hmp_drive_backup(Monitor *mon, const QDict *qdict);
> > > +
> > >  #endif
> > > diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> > > index 3d329853b2..c1b363ee57 100644
> > > --- a/include/monitor/hmp.h
> > > +++ b/include/monitor/hmp.h
> > > @@ -64,8 +64,6 @@ void hmp_block_resize(Monitor *mon, const QDict *qdict);
> > >  void hmp_snapshot_blkdev(Monitor *mon, const QDict *qdict);
> > >  void hmp_snapshot_blkdev_internal(Monitor *mon, const QDict *qdict);
> > >  void hmp_snapshot_delete_blkdev_internal(Monitor *mon, const QDict *qdict);
> > > -void hmp_drive_mirror(Monitor *mon, const QDict *qdict);
> > > -void hmp_drive_backup(Monitor *mon, const QDict *qdict);
> > >  void hmp_loadvm(Monitor *mon, const QDict *qdict);
> > >  void hmp_savevm(Monitor *mon, const QDict *qdict);
> > >  void hmp_delvm(Monitor *mon, const QDict *qdict);
> > > diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> > > index fb4c2fd2a8..06f0cb4bb9 100644
> > > --- a/monitor/hmp-cmds.c
> > > +++ b/monitor/hmp-cmds.c
> > > @@ -1342,64 +1342,6 @@ void hmp_block_resize(Monitor *mon, const QDict *qdict)
> > >      hmp_handle_error(mon, err);
> > >  }
> > >  
> > > -void hmp_drive_mirror(Monitor *mon, const QDict *qdict)
> > > -{
> > > -    const char *filename = qdict_get_str(qdict, "target");
> > > -    const char *format = qdict_get_try_str(qdict, "format");
> > > -    bool reuse = qdict_get_try_bool(qdict, "reuse", false);
> > > -    bool full = qdict_get_try_bool(qdict, "full", false);
> > > -    Error *err = NULL;
> > > -    DriveMirror mirror = {
> > > -        .device = (char *)qdict_get_str(qdict, "device"),
> > > -        .target = (char *)filename,
> > > -        .has_format = !!format,
> > > -        .format = (char *)format,
> > > -        .sync = full ? MIRROR_SYNC_MODE_FULL : MIRROR_SYNC_MODE_TOP,
> > > -        .has_mode = true,
> > > -        .mode = reuse ? NEW_IMAGE_MODE_EXISTING : NEW_IMAGE_MODE_ABSOLUTE_PATHS,
> > > -        .unmap = true,
> > > -    };
> > > -
> > > -    if (!filename) {
> > > -        error_setg(&err, QERR_MISSING_PARAMETER, "target");
> > > -        hmp_handle_error(mon, err);
> > > -        return;
> > > -    }
> > > -    qmp_drive_mirror(&mirror, &err);
> > > -    hmp_handle_error(mon, err);
> > > -}
> > > -
> > > -void hmp_drive_backup(Monitor *mon, const QDict *qdict)
> > > -{
> > > -    const char *device = qdict_get_str(qdict, "device");
> > > -    const char *filename = qdict_get_str(qdict, "target");
> > > -    const char *format = qdict_get_try_str(qdict, "format");
> > > -    bool reuse = qdict_get_try_bool(qdict, "reuse", false);
> > > -    bool full = qdict_get_try_bool(qdict, "full", false);
> > > -    bool compress = qdict_get_try_bool(qdict, "compress", false);
> > > -    Error *err = NULL;
> > > -    DriveBackup backup = {
> > > -        .device = (char *)device,
> > > -        .target = (char *)filename,
> > > -        .has_format = !!format,
> > > -        .format = (char *)format,
> > > -        .sync = full ? MIRROR_SYNC_MODE_FULL : MIRROR_SYNC_MODE_TOP,
> > > -        .has_mode = true,
> > > -        .mode = reuse ? NEW_IMAGE_MODE_EXISTING : NEW_IMAGE_MODE_ABSOLUTE_PATHS,
> > > -        .has_compress = !!compress,
> > > -        .compress = compress,
> > > -    };
> > > -
> > > -    if (!filename) {
> > > -        error_setg(&err, QERR_MISSING_PARAMETER, "target");
> > > -        hmp_handle_error(mon, err);
> > > -        return;
> > > -    }
> > > -
> > > -    qmp_drive_backup(&backup, &err);
> > > -    hmp_handle_error(mon, err);
> > > -}
> > > -
> > >  void hmp_snapshot_blkdev(Monitor *mon, const QDict *qdict)
> > >  {
> > >      const char *device = qdict_get_str(qdict, "device");
> > 
> > 
> 
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK



