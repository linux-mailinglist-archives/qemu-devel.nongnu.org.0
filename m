Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C3B6F671F
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 10:17:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puU92-0003ys-Eo; Thu, 04 May 2023 04:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1puU90-0003x3-07
 for qemu-devel@nongnu.org; Thu, 04 May 2023 04:16:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1puU8v-0004I8-0X
 for qemu-devel@nongnu.org; Thu, 04 May 2023 04:16:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683188207;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=YKwDqnQTezwmPkvMCgYJATdebEigPFWKQtJxfefUykg=;
 b=jJxKUwzEBwZ/1K36p1TwUjJHlyg1cXngwuWfV1/dAkpVskhbYmU0k9g+bJjKZYvl9V2nVl
 9eUDoWmSviyvKy0ibeBHK4VKfcs8EInhun68sWfLLo9YsiWWg4IUzwfwgBtlz/xE3rAHZ4
 CI0Swdmyv6yW+Mfq6/W0+eGksywu7Qw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-279-xuq-AfX5Mheq3SrPOd9CqA-1; Thu, 04 May 2023 04:16:46 -0400
X-MC-Unique: xuq-AfX5Mheq3SrPOd9CqA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5A83857FBB;
 Thu,  4 May 2023 08:16:45 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB55B492C13;
 Thu,  4 May 2023 08:16:44 +0000 (UTC)
Date: Thu, 4 May 2023 09:16:42 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "tejus.gk" <tejus.gk@nutanix.com>
Cc: qemu-devel@nongnu.org, quintela@redhat.com, peterx@redhat.com,
 leobras@redhat.com
Subject: Re: [RFC 1/1] migration: Update error description whenever migration
 fails
Message-ID: <ZFNp6t1DAhhRKc9q@redhat.com>
References: <20230503203116.42429-1-tejus.gk@nutanix.com>
 <20230503203116.42429-2-tejus.gk@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230503203116.42429-2-tejus.gk@nutanix.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, May 03, 2023 at 08:31:16PM +0000, tejus.gk wrote:
> There are places in the code where the migration is marked failed with
> MIGRATION_STATUS_FAILED, but the failiure reason is never updated. Hence
> libvirt doesn't know why the migration failed when it queries for it.
> 
> Signed-off-by: tejus.gk <tejus.gk@nutanix.com>
> ---
>  migration/migration.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index feb5ab7493..0d7d34bf4d 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1665,8 +1665,11 @@ void qmp_migrate(const char *uri, bool has_blk, bool blk,
>          }
>          error_setg(errp, QERR_INVALID_PARAMETER_VALUE, "uri",
>                     "a valid migration protocol");
> +        error_setg(&local_err, QERR_INVALID_PARAMETER_VALUE, "uri",
> +                   "a valid migration protocol");
>          migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
>                            MIGRATION_STATUS_FAILED);
> +        migrate_set_error(s, local_err);
>          block_cleanup_parameters();
>          return;

Most of this  "} else {"  block is duplicating what is done in
the following "if (local_error)" block. As such I think this
should be deleted and replaced with merely

   } else {
        error_setg(&local_err, QERR_INVALID_PARAMETER_VALUE, "uri",
                   "a valid migration protocol");
        block_cleanup_parameters();
   }

...so we just fallthruogh to the local_error cleanup block.

>      }
> @@ -2059,6 +2062,7 @@ static int postcopy_start(MigrationState *ms)
>      int64_t bandwidth = migrate_max_postcopy_bandwidth();
>      bool restart_block = false;
>      int cur_state = MIGRATION_STATUS_ACTIVE;
> +    Error *local_err = NULL;
>  
>      if (migrate_postcopy_preempt()) {
>          migration_wait_main_channel(ms);
> @@ -2203,8 +2207,10 @@ static int postcopy_start(MigrationState *ms)
>      ret = qemu_file_get_error(ms->to_dst_file);
>      if (ret) {
>          error_report("postcopy_start: Migration stream errored");
> +        error_setg(&local_err, "postcopy_start: Migration stream errored");

There is an earlier place in this method which also calls
error_report which you've not changed to call migrate_set_error.

Even more crazy is that the caller of postcopy_start() also
calls error_report() but with a useless error message.

ALso nothing is free'ing the local_err object once set.

IMHO, the postcopy_start() method should be changed to accept
an "Error **errp" parameter, and then the caller should be
responsible for calling error_report_err and migrate_set_error


>          migrate_set_state(&ms->state, MIGRATION_STATUS_POSTCOPY_ACTIVE,
>                                MIGRATION_STATUS_FAILED);
> +        migrate_set_error(ms, local_err);
>      }
>  
>      trace_postcopy_preempt_enabled(migrate_postcopy_preempt());
> @@ -3233,7 +3239,9 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
>      if (migrate_postcopy_ram() || migrate_return_path()) {
>          if (open_return_path_on_source(s, !resume)) {
>              error_report("Unable to open return-path for postcopy");
> +            error_setg(&local_err, "Unable to open return-path");

Having two different error messages is bad and again nothing free's
the local_err object. Remove the error_report call and have it call
error_report_err(&local_err) which does free the object

>              migrate_set_state(&s->state, s->state, MIGRATION_STATUS_FAILED);
> +            migrate_set_error(s, local_err);
>              migrate_fd_cleanup(s);
>              return;
>          }
> -- 
> 2.22.3
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


