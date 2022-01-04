Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 677B7484251
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 14:24:23 +0100 (CET)
Received: from localhost ([::1]:33214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4jna-0003vi-Hy
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 08:24:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n4jl5-0002Qm-6q
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 08:21:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n4jl0-0002Bi-9R
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 08:21:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641302500;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=2tjDpBcGfXYYwmZ880D8DB0mJYFoql+QvhKu/xydZtU=;
 b=aggJW/9UEQihQ+wlQ2oWRZiHpDPIBIorMJkoDZCyHrO3x4aJUGNS+yd4kcTgWpVXL6lXQb
 DRYY5IpQpVs49So1KGQrNtDgV+At1RroeWFSMipcuxWO7PH3ECgwiQEZqKrPQQblLsWMeQ
 6UAyqPON4Vp4EhbxsAZtfWNqRRSh9qQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-A8FbZuvGPji21Ys0KyyHlw-1; Tue, 04 Jan 2022 08:21:37 -0500
X-MC-Unique: A8FbZuvGPji21Ys0KyyHlw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6F77100F943;
 Tue,  4 Jan 2022 13:21:36 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 731167E64D;
 Tue,  4 Jan 2022 13:21:27 +0000 (UTC)
Date: Tue, 4 Jan 2022 13:21:23 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 2/2] qapi/ui: introduce change-vnc-listen
Message-ID: <YdRJ06CS4qoDJI/F@redhat.com>
References: <20211220154418.1554279-1-vsementsov@virtuozzo.com>
 <20211220154418.1554279-3-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20211220154418.1554279-3-vsementsov@virtuozzo.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: armbru@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 20, 2021 at 04:44:18PM +0100, Vladimir Sementsov-Ogievskiy wrote:
> Add command that can change addresses where VNC server listens for new
> connections. Prior to 6.0 this functionality was available through
> 'change' qmp command which was deleted.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  docs/about/removed-features.rst |  3 ++-
>  qapi/ui.json                    | 12 ++++++++++++
>  ui/vnc.c                        | 26 ++++++++++++++++++++++++++
>  3 files changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
> index d42c3341de..20e6901a82 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -348,7 +348,8 @@ documentation of ``query-hotpluggable-cpus`` for additional details.
>  ``change`` (removed in 6.0)
>  '''''''''''''''''''''''''''
>  
> -Use ``blockdev-change-medium`` or ``change-vnc-password`` instead.
> +Use ``blockdev-change-medium`` or ``change-vnc-password`` or
> +``change-vnc-listen`` instead.
>  
>  ``query-events`` (removed in 6.0)
>  '''''''''''''''''''''''''''''''''
> diff --git a/qapi/ui.json b/qapi/ui.json
> index d7567ac866..14e6fe0b4c 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1304,3 +1304,15 @@
>  { 'command': 'display-reload',
>    'data': 'DisplayReloadOptions',
>    'boxed' : true }
> +
> +##
> +# @change-vnc-listen:
> +#
> +# Change set of addresses to listen for connections.
> +#
> +# Since: 7.0
> +#
> +##
> +{ 'command': 'change-vnc-listen',
> +  'data': { 'id': 'str', 'addresses': ['SocketAddress'],
> +            '*websockets': ['SocketAddress'] } }

We already have a general purpose command above 'display-reload'
for doing live changes to the display backends.

THis should instead be

{ 'struct': 'DisplayReloadOptionsVNC',
  'data': { '*tls-certs': 'bool',
            '*addresses': ['SocketAddress'],
	    '*websockets': ['SocketAddress'] } }

if 'addresses' is non-null then the listener can be updated.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


