Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C6C365485
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 10:48:50 +0200 (CEST)
Received: from localhost ([::1]:46186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYm3t-0000pH-0s
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 04:48:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lYlrA-0007NS-9O
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 04:35:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lYlr7-0007TV-DY
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 04:35:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618907736;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mlr1s5GFXrSOpjydFEugEkOaNdClE9z+2OFqQ3Dvf0U=;
 b=CEk/34VPnJwqRr9gR8eg9L4AZ69klM8Y5J3kENE2xuJm35qTcdaidyYXj6Rzd2qCzaBPSJ
 9gpc7ODS5ZkHWeQxmmBs3Eeu4l4P8MnoWYVdglNk18pASQ4DoN3cPqOZqcHMoCowvlv0Q/
 Da5E8dAIpbgv1UKh3Zjz9spxdlE4vpI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-260-CeGuOI2iMf-FuFJpqPpbCA-1; Tue, 20 Apr 2021 04:35:34 -0400
X-MC-Unique: CeGuOI2iMf-FuFJpqPpbCA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0682107ACFE;
 Tue, 20 Apr 2021 08:35:33 +0000 (UTC)
Received: from redhat.com (ovpn-114-178.ams2.redhat.com [10.36.114.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E4E3D50AC0;
 Tue, 20 Apr 2021 08:35:26 +0000 (UTC)
Date: Tue, 20 Apr 2021 09:35:23 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2] migration: Drop redundant query-migrate result @blocked
Message-ID: <YH6SS7gm3Ic6T49h@redhat.com>
References: <20210420051907.891470-2-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210420051907.891470-2-armbru@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, peterx@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 20, 2021 at 07:19:07AM +0200, Markus Armbruster wrote:
> Result @blocked is true when and only when result @blocked-reasons is
> present.  It's always non-empty when present.  @blocked is redundant.
> It was introduced in commit 3af8554bd0 "migration: Add blocker
> information", and has not been released.  This gives us a chance to
> fix the interface with minimal fuss: drop @blocked.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
> This is alternative to "[PATCH] migration: Deprecate redundant
> query-migrate result @blocked".
> 
>  qapi/migration.json   |  7 +++----
>  migration/migration.c | 29 +++++++++++++----------------
>  monitor/hmp-cmds.c    |  2 +-
>  3 files changed, 17 insertions(+), 21 deletions(-)
> 
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 9bf0bc4d25..7a5bdf9a0d 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -224,9 +224,9 @@
>  #        only returned if VFIO device is present, migration is supported by all
>  #        VFIO devices and status is 'active' or 'completed' (since 5.2)
>  #
> -# @blocked: True if outgoing migration is blocked (since 6.0)
> -#
> -# @blocked-reasons: A list of reasons an outgoing migration is blocked (since 6.0)
> +# @blocked-reasons: A list of reasons an outgoing migration is blocked.
> +#                   Present and non-empty when migration is blocked.
> +#                   (since 6.0)
>  #
>  # Since: 0.14
>  ##
> @@ -241,7 +241,6 @@
>             '*setup-time': 'int',
>             '*cpu-throttle-percentage': 'int',
>             '*error-desc': 'str',
> -           'blocked': 'bool',
>             '*blocked-reasons': ['str'],
>             '*postcopy-blocktime' : 'uint32',
>             '*postcopy-vcpu-blocktime': ['uint32'],
> diff --git a/migration/migration.c b/migration/migration.c
> index 8ca034136b..fdadee290e 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1073,27 +1073,24 @@ static void populate_vfio_info(MigrationInfo *info)
>  static void fill_source_migration_info(MigrationInfo *info)
>  {
>      MigrationState *s = migrate_get_current();
> +    GSList *cur_blocker = migration_blockers;
>  
> -    info->blocked = migration_is_blocked(NULL);

So migration_is_blocked() method returns true if either of the
following conditions is met

 - qemu_savevm_state_blocked  returns true - this happens
   if a savevm state handler has 'unmigratable' flag set

 - if any migration blockers are registered.

We're then calling qemu_savevm_non_migratable_list to populate
blocked_reasons  based on "unmigratable" flag, and then further
populate blocked_reasons based on migration blockers.

So I agree it is functionally the same result old and new code.


> -    info->has_blocked_reasons = info->blocked;
>      info->blocked_reasons = NULL;
> -    if (info->blocked) {
> -        GSList *cur_blocker = migration_blockers;
>  
> -        /*
> -         * There are two types of reasons a migration might be blocked;
> -         * a) devices marked in VMState as non-migratable, and
> -         * b) Explicit migration blockers
> -         * We need to add both of them here.
> -         */
> -        qemu_savevm_non_migratable_list(&info->blocked_reasons);
> +    /*
> +     * There are two types of reasons a migration might be blocked;
> +     * a) devices marked in VMState as non-migratable, and
> +     * b) Explicit migration blockers
> +     * We need to add both of them here.
> +     */
> +    qemu_savevm_non_migratable_list(&info->blocked_reasons);
>  
> -        while (cur_blocker) {
> -            QAPI_LIST_PREPEND(info->blocked_reasons,
> -                              g_strdup(error_get_pretty(cur_blocker->data)));
> -            cur_blocker = g_slist_next(cur_blocker);
> -        }
> +    while (cur_blocker) {
> +        QAPI_LIST_PREPEND(info->blocked_reasons,
> +                          g_strdup(error_get_pretty(cur_blocker->data)));
> +        cur_blocker = g_slist_next(cur_blocker);
>      }
> +    info->has_blocked_reasons = info->blocked_reasons != NULL;
>  
>      switch (s->state) {
>      case MIGRATION_STATUS_NONE:


Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


