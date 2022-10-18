Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F47602933
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 12:17:26 +0200 (CEST)
Received: from localhost ([::1]:45842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okjf2-0004Xn-Bw
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 06:17:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1okjUz-0002ue-Ic
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 06:07:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1okjUo-0001dU-V2
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 06:07:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666087609;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=pk7Tu8tC+qtuxSIj2mpcDRESoA5ZC96B4yd5HXSBEAc=;
 b=bmHAKnRnvGRA70/1Kp6UvdcEV44krEYu9sgImqAAsvyfJzZiqtLZDMCr1FKl9rK2wSSnSy
 zYp6IUb4NBTGfU9C8uYQ/0eBwJWYkU9HLa6h3RdV+6PWO++Zk4Lb2h/A3oLM0tHmTYKMGN
 UMqGgyi5HzrTtPK7omWvtFSIKHGR7tM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118--vEdZmlaM2eD3i_UB0_zZQ-1; Tue, 18 Oct 2022 06:06:48 -0400
X-MC-Unique: -vEdZmlaM2eD3i_UB0_zZQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 653B83C3C962;
 Tue, 18 Oct 2022 10:06:48 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D8A762024CBB;
 Tue, 18 Oct 2022 10:06:46 +0000 (UTC)
Date: Tue, 18 Oct 2022 11:06:44 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Nikolay Borisov <nborisov@suse.com>
Cc: dgilbert@redhat.com, qemu-devel@nongnu.org, jfehlig@suse.com,
 Claudio.Fontana@suse.com, dfaggioli@suse.com
Subject: Re: [PATCH v2 03/11] migration: Make migration json writer part of
 MigrationState struct
Message-ID: <Y056tM+EUKMMC8PI@redhat.com>
References: <20221010133408.3214433-1-nborisov@suse.com>
 <20221010133408.3214433-4-nborisov@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221010133408.3214433-4-nborisov@suse.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Oct 10, 2022 at 04:34:00PM +0300, Nikolay Borisov wrote:
> This is required so that migration stream configuration is written
> to the migration stream. This would allow analyze-migration to
> parse enabled capabilities for the migration and adjust its behavior
> accordingly. This is in preparation for analyze-migration.py to support
> 'fixed-ram' capability format changes.
> 
> Signed-off-by: Nikolay Borisov <nborisov@suse.com>
> ---
>  migration/migration.c |  5 +++++
>  migration/migration.h |  3 +++
>  migration/savevm.c    | 38 ++++++++++++++++++++++----------------
>  3 files changed, 30 insertions(+), 16 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 140b0f1a54bd..d0779bbaf862 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1896,6 +1896,8 @@ static void migrate_fd_cleanup(MigrationState *s)
>      g_free(s->hostname);
>      s->hostname = NULL;
>  
> +    json_writer_free(s->vmdesc);
> +
>      qemu_savevm_state_cleanup();
>  
>      if (s->to_dst_file) {
> @@ -2154,6 +2156,7 @@ void migrate_init(MigrationState *s)
>      error_free(s->error);
>      s->error = NULL;
>      s->hostname = NULL;
> +    s->vmdesc = NULL;
>  
>      migrate_set_state(&s->state, MIGRATION_STATUS_NONE, MIGRATION_STATUS_SETUP);
>  
> @@ -4269,6 +4272,8 @@ void migrate_fd_connect(MigrationState *s, Error *error_in)
>          return;
>      }
>  
> +    s->vmdesc = json_writer_new(false);
> +
>      if (multifd_save_setup(&local_err) != 0) {
>          error_report_err(local_err);
>          migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
> diff --git a/migration/migration.h b/migration/migration.h
> index cdad8aceaaab..96f27aba2210 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -17,6 +17,7 @@
>  #include "exec/cpu-common.h"
>  #include "hw/qdev-core.h"
>  #include "qapi/qapi-types-migration.h"
> +#include "qapi/qmp/json-writer.h"
>  #include "qemu/thread.h"
>  #include "qemu/coroutine_int.h"
>  #include "io/channel.h"
> @@ -261,6 +262,8 @@ struct MigrationState {
>  
>      int state;
>  
> +    JSONWriter *vmdesc;
> +
>      /* State related to return path */
>      struct {
>          /* Protected by qemu_file_lock */
> diff --git a/migration/savevm.c b/migration/savevm.c
> index 48e85c052c2c..174cdbefc29d 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -1137,13 +1137,18 @@ void qemu_savevm_non_migratable_list(strList **reasons)
>  
>  void qemu_savevm_state_header(QEMUFile *f)
>  {
> +    MigrationState *s = migrate_get_current();
>      trace_savevm_state_header();
>      qemu_put_be32(f, QEMU_VM_FILE_MAGIC);
>      qemu_put_be32(f, QEMU_VM_FILE_VERSION);
>  
> -    if (migrate_get_current()->send_configuration) {
> +    if (s->send_configuration) {
>          qemu_put_byte(f, QEMU_VM_CONFIGURATION);
> -        vmstate_save_state(f, &vmstate_configuration, &savevm_state, 0);
> +	json_writer_start_object(s->vmdesc, NULL);
> +	json_writer_start_object(s->vmdesc, "configuration");
> +        vmstate_save_state(f, &vmstate_configuration, &savevm_state, s->vmdesc);
> +	json_writer_end_object(s->vmdesc);
> +

IIUC, this is changing the info that is written in the VM
configuration section, by adding an extra level of nesting
to the object.

Isn't this going to cause backwards compatibility problems ?

Nothing in the patch seems to take account of the exctra
'configuiration' object that has been started

Also, there's two  json_writer_start_object calls, but only
one json_writer_end_object.

BTW, some <tab> crept into this patch.


>      }
>  }
>  
> @@ -1364,15 +1369,16 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>                                                      bool in_postcopy,
>                                                      bool inactivate_disks)
>  {
> -    g_autoptr(JSONWriter) vmdesc = NULL;
> +    MigrationState *s = migrate_get_current();
>      int vmdesc_len;
>      SaveStateEntry *se;
>      int ret;
>  
> -    vmdesc = json_writer_new(false);
> -    json_writer_start_object(vmdesc, NULL);
> -    json_writer_int64(vmdesc, "page_size", qemu_target_page_size());
> -    json_writer_start_array(vmdesc, "devices");
> +    if (!s->send_configuration) {
> +	    json_writer_start_object(s->vmdesc, NULL);
> +    }
> +    json_writer_int64(s->vmdesc, "page_size", qemu_target_page_size());
> +    json_writer_start_array(s->vmdesc, "devices");
>      QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
>  
>          if ((!se->ops || !se->ops->save_state) && !se->vmsd) {
> @@ -1385,12 +1391,12 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>  
>          trace_savevm_section_start(se->idstr, se->section_id);
>  
> -        json_writer_start_object(vmdesc, NULL);
> -        json_writer_str(vmdesc, "name", se->idstr);
> -        json_writer_int64(vmdesc, "instance_id", se->instance_id);
> +        json_writer_start_object(s->vmdesc, NULL);
> +        json_writer_str(s->vmdesc, "name", se->idstr);
> +        json_writer_int64(s->vmdesc, "instance_id", se->instance_id);
>  
>          save_section_header(f, se, QEMU_VM_SECTION_FULL);
> -        ret = vmstate_save(f, se, vmdesc);
> +        ret = vmstate_save(f, se, s->vmdesc);
>          if (ret) {
>              qemu_file_set_error(f, ret);
>              return ret;
> @@ -1398,7 +1404,7 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>          trace_savevm_section_end(se->idstr, se->section_id, 0);
>          save_section_footer(f, se);
>  
> -        json_writer_end_object(vmdesc);
> +        json_writer_end_object(s->vmdesc);
>      }
>  
>      if (inactivate_disks) {
> @@ -1417,14 +1423,14 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
>          qemu_put_byte(f, QEMU_VM_EOF);
>      }
>  
> -    json_writer_end_array(vmdesc);
> -    json_writer_end_object(vmdesc);
> -    vmdesc_len = strlen(json_writer_get(vmdesc));
> +    json_writer_end_array(s->vmdesc);
> +    json_writer_end_object(s->vmdesc);
> +    vmdesc_len = strlen(json_writer_get(s->vmdesc));
>  
>      if (should_send_vmdesc()) {
>          qemu_put_byte(f, QEMU_VM_VMDESCRIPTION);
>          qemu_put_be32(f, vmdesc_len);
> -        qemu_put_buffer(f, (uint8_t *)json_writer_get(vmdesc), vmdesc_len);
> +        qemu_put_buffer(f, (uint8_t *)json_writer_get(s->vmdesc), vmdesc_len);
>      }
>  
>      return 0;
> -- 
> 2.34.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


