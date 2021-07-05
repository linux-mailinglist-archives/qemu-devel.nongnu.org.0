Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B82E3BBD1A
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 14:50:37 +0200 (CEST)
Received: from localhost ([::1]:36916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0O3Y-0002pS-CK
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 08:50:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0O1c-00022F-17
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 08:48:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m0O1Y-0002Oj-K0
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 08:48:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625489310;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=HsN12ZxqMw4p5TpfOGPnJ50NVxXHMdCl3bF3XsWZlQ0=;
 b=e2LKbTjRmpMzYZjNUQYIce6za1bfecx1SSggjWjdgPoqeuvBrMP0Ji2fE+lujopdtfGcUa
 vDnjaTnOTciABYcwu0pkPlUo8WACtHnftOM/XM0nq4Epx5zz3s5TUygyPGcNbS1OXwp+iC
 LPoL2uRiy9PRKMk1CzQftnwbN5/zTek=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-JW_f2TmBMJi5Oc-KjDH3rw-1; Mon, 05 Jul 2021 08:48:26 -0400
X-MC-Unique: JW_f2TmBMJi5Oc-KjDH3rw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 034CD800C78;
 Mon,  5 Jul 2021 12:48:25 +0000 (UTC)
Received: from redhat.com (ovpn-114-184.ams2.redhat.com [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 012801036D03;
 Mon,  5 Jul 2021 12:48:22 +0000 (UTC)
Date: Mon, 5 Jul 2021 13:48:19 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Kunkun Jiang <jiangkunkun@huawei.com>
Subject: Re: [PATCH 1/2] qapi/run-state: Add a new shutdown cause
 'migration-completed'
Message-ID: <YOL/kw0lxn2ggGx4@redhat.com>
References: <20210705123653.1315-1-jiangkunkun@huawei.com>
 <20210705123653.1315-2-jiangkunkun@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210705123653.1315-2-jiangkunkun@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: Juan Quintela <quintela@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, wanghaibin.wang@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 05, 2021 at 08:36:52PM +0800, Kunkun Jiang wrote:
> In the current version, the source QEMU process does not automatic
> exit after a successful migration. Additional action is required,
> such as sending { "execute": "quit" } or ctrl+c. For simplify, add
> a new shutdown cause 'migration-completed' to exit the source QEMU
> process after a successful migration.

IIUC, 'STATUS_COMPLETED' state is entered on the source host
once it has finished sending all VM state, and thus does not
guarantee that the target host has successfully received and
loaded all VM state.

Typically a mgmt app will need to directly confirm that the
target host QEMU has succesfully started running, before it
will tell the source QEMU to quit.

So, AFAICT, this automatic exit after STATUS_COMPLETED is 
not safe and could lead to total loss of the running VM in
error scenarios.



> 
> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> ---
>  migration/migration.c | 1 +
>  qapi/run-state.json   | 4 +++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 4228635d18..16782c93c2 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -3539,6 +3539,7 @@ static void migration_iteration_finish(MigrationState *s)
>      case MIGRATION_STATUS_COMPLETED:
>          migration_calculate_complete(s);
>          runstate_set(RUN_STATE_POSTMIGRATE);
> +        qemu_system_shutdown_request(SHUTDOWN_CAUSE_MIGRATION_COMPLETED);
>          break;
>  
>      case MIGRATION_STATUS_ACTIVE:
> diff --git a/qapi/run-state.json b/qapi/run-state.json
> index 43d66d700f..66aaef4e2b 100644
> --- a/qapi/run-state.json
> +++ b/qapi/run-state.json
> @@ -86,12 +86,14 @@
>  #                   ignores --no-reboot. This is useful for sanitizing
>  #                   hypercalls on s390 that are used during kexec/kdump/boot
>  #
> +# @migration-completed: Reaction to the successful migration
> +#
>  ##
>  { 'enum': 'ShutdownCause',
>    # Beware, shutdown_caused_by_guest() depends on enumeration order
>    'data': [ 'none', 'host-error', 'host-qmp-quit', 'host-qmp-system-reset',
>              'host-signal', 'host-ui', 'guest-shutdown', 'guest-reset',
> -            'guest-panic', 'subsystem-reset'] }
> +            'guest-panic', 'subsystem-reset', 'migration-completed'] }
>  
>  ##
>  # @StatusInfo:
> -- 
> 2.23.0
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


