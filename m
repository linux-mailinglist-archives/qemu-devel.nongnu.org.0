Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B640266291F
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:54:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEtOL-0002Ql-Qs; Mon, 09 Jan 2023 09:44:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pEtOI-0002Q1-UJ
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:44:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pEtOH-0007Xb-6V
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:44:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673275484;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=yMloKxmUSArezKXuyLYDo6aqshfD8TmurnNTTr/1qas=;
 b=X4tpX2A5zVJs2yE00HsP5OVEmAmvj3fTXS/pl5njxe2kfpfRD538ii9etdCdJSLHsTHPVc
 AM1Jr8QeiKzdbjCeGiEQTJK+XHCivK53I7mhuwwoNoBE+J/PEKN25Bu48P50NJ422pCvw2
 oBcxle7hX2UjfbXkQyzTt8Iwl6GBHx8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-MXdg0jz3ONmdgXHYkvQBxA-1; Mon, 09 Jan 2023 09:44:41 -0500
X-MC-Unique: MXdg0jz3ONmdgXHYkvQBxA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D95118E0921;
 Mon,  9 Jan 2023 14:44:40 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 63A7A492B00;
 Mon,  9 Jan 2023 14:44:38 +0000 (UTC)
Date: Mon, 9 Jan 2023 14:44:32 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Jiang Jiacheng <jiangjiacheng@huawei.com>
Cc: qemu-devel@nongnu.org, yubihong@huawei.com, xiexiangyou@huawei.com,
 zhengchuan@huawei.com, linyilu@huawei.com
Subject: Re: [PATCH 2/2] migration: report multiFd related thread pid to
 libvirt
Message-ID: <Y7woUMY8dtVWzTlJ@redhat.com>
References: <20230109111631.2386894-1-jiangjiacheng@huawei.com>
 <20230109111631.2386894-3-jiangjiacheng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230109111631.2386894-3-jiangjiacheng@huawei.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Jan 09, 2023 at 07:16:31PM +0800, Jiang Jiacheng via wrote:
> From: Zheng Chuan <zhengchuan@huawei.com>
> 
> Report multiFd related thread pid to libvirt in order to
> pin multiFd thread to different cpu.
> ---
>  migration/multifd.c |  4 ++++
>  qapi/migration.json | 12 ++++++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/migration/multifd.c b/migration/multifd.c
> index 000ca4d4ec..f3f7e8ae31 100644
> --- a/migration/multifd.c
> +++ b/migration/multifd.c
> @@ -17,6 +17,7 @@
>  #include "exec/ramblock.h"
>  #include "qemu/error-report.h"
>  #include "qapi/error.h"
> +#include "qapi/qapi-events-migration.h"
>  #include "ram.h"
>  #include "migration.h"
>  #include "socket.h"
> @@ -650,6 +651,9 @@ static void *multifd_send_thread(void *opaque)
>      int ret = 0;
>      bool use_zero_copy_send = migrate_use_zero_copy_send();
>  
> +    /* report multifd thread pid to libvirt */
> +    qapi_event_send_migration_multifd_pid(qemu_get_thread_id());
> +
>      trace_multifd_send_thread_start(p->id);
>      rcu_register_thread();
>  
> diff --git a/qapi/migration.json b/qapi/migration.json
> index aafc940617..33fc319329 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1286,6 +1286,18 @@
>  { 'event': 'MIGRATION_PASS',
>    'data': { 'pass': 'int' } }
>  
> +##
> +# @MIGRATION_MULTIFD_PID:
> +#
> +# Emitted when multifd thread appear
> +#
> +# @pid: pid of multifd thread
> +#
> +# Since: 7.2
> +##
> +{ 'event': 'MIGRATION_MULTIFD_PID',
> +  'data': { 'pid': 'int' } }

Why do we need to have separate events instead of emitting MIGRATION_PID
multiple times, possibly with a 'type' field if clients genuinely need
to distinguish multifd threads.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


