Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7AC508702
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 13:30:21 +0200 (CEST)
Received: from localhost ([::1]:42062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh8XN-0003YX-02
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 07:30:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nh8Gv-0006Hy-RE
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 07:13:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nh8Gt-0005UG-BN
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 07:13:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650453198;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=VHw9Q+B+xgWMtuFlsr9X1RZTtdKGdr5P9phdke0R5kA=;
 b=b7g0muhoyLRMjSmoYgTiUDzVV9luu7HVo+bVb8ggN3cn1gfF/6hiDjt4x2Rf2TN+s8bBlf
 MNxCKOsbkxIdoJ7GIaVnLadOK594D85v0naZMtaTUM8BBHs6U06jkcEUMTutzA/e7Pzbsx
 OtCVHPTLeY/ezJKTSKlrmUZrdpRHF24=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-G66EmdmqOXSVBrtV-TQR5w-1; Wed, 20 Apr 2022 07:13:17 -0400
X-MC-Unique: G66EmdmqOXSVBrtV-TQR5w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD9F880346E
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 11:13:16 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA9C28144;
 Wed, 20 Apr 2022 11:13:09 +0000 (UTC)
Date: Wed, 20 Apr 2022 12:13:07 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v4 15/19] migration: Export tls-[creds|hostname|authz]
 params to cmdline too
Message-ID: <Yl/qw5ogeSjgrnuX@redhat.com>
References: <20220331150857.74406-1-peterx@redhat.com>
 <20220331150857.74406-16-peterx@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220331150857.74406-16-peterx@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 31, 2022 at 11:08:53AM -0400, Peter Xu wrote:
> It's useful for specifying tls credentials all in the cmdline (along with
> the -object tls-creds-*), especially for debugging purpose.
> 
> The trick here is we must remember to not free these fields again in the
> finalize() function of migration object, otherwise it'll cause double-free.
> 
> The thing is when destroying an object, we'll first destroy the properties
> that bound to the object, then the object itself.  To be explicit, when
> destroy the object in object_finalize() we have such sequence of
> operations:
> 
>     object_property_del_all(obj);
>     object_deinit(obj, ti);
> 
> So after this change the two fields are properly released already even
> before reaching the finalize() function but in object_property_del_all(),
> hence we don't need to free them anymore in finalize() or it's double-free.


I believe this is also fixing a small memory leak

> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  migration/migration.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 899084f993..1dc80be1f4 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -4349,6 +4349,9 @@ static Property migration_properties[] = {
>                        DEFAULT_MIGRATE_ANNOUNCE_STEP),
>      DEFINE_PROP_BOOL("x-postcopy-preempt-break-huge", MigrationState,
>                        postcopy_preempt_break_huge, true),
> +    DEFINE_PROP_STRING("tls-creds", MigrationState, parameters.tls_creds),
> +    DEFINE_PROP_STRING("tls-hostname", MigrationState, parameters.tls_hostname),
> +    DEFINE_PROP_STRING("tls-authz", MigrationState, parameters.tls_authz),
>  
>      /* Migration capabilities */
>      DEFINE_PROP_MIG_CAP("x-xbzrle", MIGRATION_CAPABILITY_XBZRLE),
> @@ -4382,12 +4385,9 @@ static void migration_class_init(ObjectClass *klass, void *data)
>  static void migration_instance_finalize(Object *obj)
>  {
>      MigrationState *ms = MIGRATION_OBJ(obj);
> -    MigrationParameters *params = &ms->parameters;
>  
>      qemu_mutex_destroy(&ms->error_mutex);
>      qemu_mutex_destroy(&ms->qemu_file_lock);
> -    g_free(params->tls_hostname);
> -    g_free(params->tls_creds);

tls_authz wasn't previously freed here, and now it will be

>      qemu_sem_destroy(&ms->wait_unplug_sem);
>      qemu_sem_destroy(&ms->rate_limit_sem);
>      qemu_sem_destroy(&ms->pause_sem);

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


