Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0849860283E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 11:24:56 +0200 (CEST)
Received: from localhost ([::1]:49702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okiqE-0008Ma-0N
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 05:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1okicl-0005BU-8y
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 05:10:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59239)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1okicb-0000kz-6F
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 05:10:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666084247;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=wS1weF5ZwcqSPFUlKrwPiT6j0pbf39wbgyp9JeUVomE=;
 b=gu+m8XDxMO6yQ6UTJHgvWtZwpDKA3yaOSmLshIfWrswZOCwsRBaIgCkMmrrSwcwokp6qEK
 RAc2HwVC8yzTX1bgYZbcnctYKJnbUSQ5ZclHE+E63ZS+Kj+pnrBin3p5FD0qR9RGAVFDWD
 LlxHDjDCijAmVMhH5ZBAsAK3X9eKJH4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-330-cL-moBVOPri5jWM2GP6WFw-1; Tue, 18 Oct 2022 05:10:44 -0400
X-MC-Unique: cL-moBVOPri5jWM2GP6WFw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0BFD85A5A6;
 Tue, 18 Oct 2022 09:10:43 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A4E3CC1E87F;
 Tue, 18 Oct 2022 09:10:42 +0000 (UTC)
Date: Tue, 18 Oct 2022 10:10:40 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Nikolay Borisov <nborisov@suse.com>
Cc: dgilbert@redhat.com, qemu-devel@nongnu.org, jfehlig@suse.com,
 Claudio.Fontana@suse.com, dfaggioli@suse.com
Subject: Re: [PATCH v2 01/11] migration: support file: uri for source migration
Message-ID: <Y05tkGrthAe0Wy65@redhat.com>
References: <20221010133408.3214433-1-nborisov@suse.com>
 <20221010133408.3214433-2-nborisov@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221010133408.3214433-2-nborisov@suse.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 10, 2022 at 04:33:58PM +0300, Nikolay Borisov wrote:
> Implement support for a "file:" uri so that a migration can be initiated
> directly to a file from QEMU.

Can we add a reminder here

  Unlike other migration protocol backends, the 'file' protocol cannot
  honour non-blocking mode. POSIX file/block storage will always report
  ready to read/write, regardless of how slow the underlying storage
  will be at servicing the request.

  For outgoing migration this limitation is not a serious problem as
  the migration data transfer always happens in a dedicated thread.
  It may, however, result in delays in honouring a request to cancel
  the migration operation.

> 
> Signed-off-by: Nikolay Borisov <nborisov@suse.com>
> ---
>  migration/file.c      | 23 +++++++++++++++++++++++
>  migration/file.h      |  9 +++++++++
>  migration/meson.build |  1 +
>  migration/migration.c |  3 +++
>  4 files changed, 36 insertions(+)
>  create mode 100644 migration/file.c
>  create mode 100644 migration/file.h
> 
> diff --git a/migration/file.c b/migration/file.c
> new file mode 100644
> index 000000000000..02896a7cab99
> --- /dev/null
> +++ b/migration/file.c
> @@ -0,0 +1,23 @@
> +#include "qemu/osdep.h"
> +#include "channel.h"
> +#include "io/channel-file.h"
> +#include "file.h"
> +#include "qemu/error-report.h"
> +
> +
> +void file_start_outgoing_migration(MigrationState *s, const char *fname, Error **errp)
> +{
> +	QIOChannelFile *ioc;
> +
> +	ioc = qio_channel_file_new_path(fname, O_CREAT|O_TRUNC|O_WRONLY, 0660, errp);
> +	if (!ioc) {
> +		error_report("Error creating a channel");
> +		return;
> +	}
> +
> +	qio_channel_set_name(QIO_CHANNEL(ioc), "migration-file-outgoing");
> +	migration_channel_connect(s, QIO_CHANNEL(ioc), NULL, NULL);
> +	object_unref(OBJECT(ioc));
> +}
> +
> +
> diff --git a/migration/file.h b/migration/file.h
> new file mode 100644
> index 000000000000..d476eb1157f9
> --- /dev/null
> +++ b/migration/file.h
> @@ -0,0 +1,9 @@
> +#ifndef QEMU_MIGRATION_FILE_H
> +#define QEMU_MIGRATION_FILE_H
> +
> +void file_start_outgoing_migration(MigrationState *s,
> +                                   const char *filename,
> +                                   Error **errp);
> +
> +#endif
> +
> diff --git a/migration/meson.build b/migration/meson.build
> index 690487cf1a81..30a8392701c3 100644
> --- a/migration/meson.build
> +++ b/migration/meson.build
> @@ -17,6 +17,7 @@ softmmu_ss.add(files(
>    'colo.c',
>    'exec.c',
>    'fd.c',
> +  'file.c',
>    'global_state.c',
>    'migration.c',
>    'multifd.c',
> diff --git a/migration/migration.c b/migration/migration.c
> index bb8bbddfe467..8813b78b9a6b 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -20,6 +20,7 @@
>  #include "migration/blocker.h"
>  #include "exec.h"
>  #include "fd.h"
> +#include "file.h"
>  #include "socket.h"
>  #include "sysemu/runstate.h"
>  #include "sysemu/sysemu.h"
> @@ -2414,6 +2415,8 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>          exec_start_outgoing_migration(s, p, &local_err);
>      } else if (strstart(uri, "fd:", &p)) {
>          fd_start_outgoing_migration(s, p, &local_err);
> +    } else if (strstart(uri, "file:", &p)) {
> +	file_start_outgoing_migration(s, p, &local_err);
>      } else {
>          if (!(has_resume && resume)) {
>              yank_unregister_instance(MIGRATION_YANK_INSTANCE);
> -- 
> 2.34.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


