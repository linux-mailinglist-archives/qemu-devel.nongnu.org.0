Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3BB748428D
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 14:34:35 +0100 (CET)
Received: from localhost ([::1]:42350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4jxS-000279-Ri
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 08:34:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n4jwL-0001Pg-NY
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 08:33:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n4jwJ-0004Uc-Us
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 08:33:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641303203;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y4fo/MAayqM1M/YRyXYJjiedjTnvVQ/k8g5j0Q+f02E=;
 b=h134IBHrz6+7vpcx0GO4EqkONYDCEFZq5WSagyNmwI4jjr78fcIqAss7bEw7GFCEOILTsr
 j9aCSZay12rnDzNmJKVCNjPr/gy/My+MRy5O34h7INghBLPnSIzxFw5qww8kgCGmorGnzZ
 owHM/iXvwhjN6s3MnwaU4ODQ2/L07TE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-231INoRrOQKSX-stitM88A-1; Tue, 04 Jan 2022 08:33:20 -0500
X-MC-Unique: 231INoRrOQKSX-stitM88A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED4FA1015DA4;
 Tue,  4 Jan 2022 13:33:18 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AB6B510841E3;
 Tue,  4 Jan 2022 13:33:16 +0000 (UTC)
Date: Tue, 4 Jan 2022 13:33:14 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 2/3] qapi/ui: introduce change-vnc-listen
Message-ID: <YdRMmrC2a9bnabfd@redhat.com>
References: <20211222191731.467706-1-vsementsov@virtuozzo.com>
 <20211222191731.467706-3-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20211222191731.467706-3-vsementsov@virtuozzo.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Cc: bleal@redhat.com, eblake@redhat.com, armbru@redhat.com, wainersm@redhat.com,
 qemu-devel@nongnu.org, marcandre.lureau@gmail.com, kraxel@redhat.com,
 crosa@redhat.com,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 22, 2021 at 08:17:30PM +0100, Vladimir Sementsov-Ogievskiy wrote:
> Add command that can change addresses where VNC server listens for new
> connections. Prior to 6.0 this functionality was available through
> 'change' qmp command which was deleted.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  docs/about/removed-features.rst |  3 ++-
>  qapi/ui.json                    | 19 +++++++++++++++++++
>  ui/vnc.c                        | 26 ++++++++++++++++++++++++++
>  3 files changed, 47 insertions(+), 1 deletion(-)
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
> index 2b4371da37..6a586edff1 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1334,3 +1334,22 @@
>  { 'command': 'display-reload',
>    'data': 'DisplayReloadOptions',
>    'boxed' : true }
> +
> +##
> +# @change-vnc-listen:
> +#
> +# Change set of addresses to listen for connections.
> +#
> +# @id: vnc display identifier
> +#
> +# @addresses: list of addresses for listen at
> +#
> +# @websockets: list of addresses to listen with websockets
> +#
> +# Since: 7.0
> +#
> +##
> +{ 'command': 'change-vnc-listen',
> +  'data': { 'id': 'str', 'addresses': ['SocketAddress'],
> +            '*websockets': ['SocketAddress'] },
> +  'if': 'CONFIG_VNC' }

I replied to your v1 before noticing this v2. So this is just to
point out that I suggested we could use 'display-reload' to update
the address rather than adding a new command.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


