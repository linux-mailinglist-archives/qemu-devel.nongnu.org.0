Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A40134B142D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 18:27:14 +0100 (CET)
Received: from localhost ([::1]:58946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIDDt-0007EQ-Ob
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 12:27:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nIAVx-0007bT-9z
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 09:33:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nIAVv-00061t-K8
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 09:33:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644503618;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jY55IaQMLXTHgr+tSXTzgC2vvLP7WuEZjDfoLGjTfno=;
 b=XUHIk92cO3KzNhYGo+f0b+yMujR8AmhNhXS5+Hpnq/8uqubZ9BrkFjo3jgGcU7TCW7jGjE
 zRHM6jUQO3oipFbVc+G2UGsdluFWBtMlmxZfpkaI9gC269pspHLSjgkqx/7P4VnUC7wqij
 +8Pf7qn/aHs6BgntFsghNG5klYVb7oo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-oNBT8PkFP6-OYxQFC656nQ-1; Thu, 10 Feb 2022 09:33:37 -0500
X-MC-Unique: oNBT8PkFP6-OYxQFC656nQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44197E77E;
 Thu, 10 Feb 2022 14:33:36 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 047FA84D01;
 Thu, 10 Feb 2022 14:32:53 +0000 (UTC)
Date: Thu, 10 Feb 2022 14:32:49 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v4 2/3] qapi/ui: display-update: add possibility to
 change listen address
Message-ID: <YgUiEZaD6eUWmqM3@redhat.com>
References: <20220210141457.539582-1-vsementsov@virtuozzo.com>
 <20220210141457.539582-3-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20220210141457.539582-3-vsementsov@virtuozzo.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: bleal@redhat.com, armbru@redhat.com, f4bug@amsat.org, wainersm@redhat.com,
 qemu-devel@nongnu.org, kraxel@redhat.com, crosa@redhat.com,
 marcandre.lureau@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For $SUBJECT - i'd reword slightly

     qapi/ui: add 'display-update' command for changing listen address

On Thu, Feb 10, 2022 at 03:14:56PM +0100, Vladimir Sementsov-Ogievskiy wrote:
> Add possibility to change addresses where VNC server listens for new
> connections. Prior to 6.0 this functionality was available through
> 'change' qmp command which was deleted.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  docs/about/removed-features.rst |  3 +-
>  qapi/ui.json                    | 65 +++++++++++++++++++++++++++++++++
>  include/ui/console.h            |  1 +
>  monitor/qmp-cmds.c              | 15 ++++++++
>  ui/vnc.c                        | 23 ++++++++++++
>  5 files changed, 106 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
> index 4c4da20d0f..63aba60873 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -355,7 +355,8 @@ documentation of ``query-hotpluggable-cpus`` for additional details.
>  ``change`` (removed in 6.0)
>  '''''''''''''''''''''''''''
>  
> -Use ``blockdev-change-medium`` or ``change-vnc-password`` instead.
> +Use ``blockdev-change-medium`` or ``change-vnc-password`` or
> +``display-update`` instead.
>  
>  ``query-events`` (removed in 6.0)
>  '''''''''''''''''''''''''''''''''
> diff --git a/qapi/ui.json b/qapi/ui.json
> index 9354f4c467..a0851eeefa 100644
> --- a/qapi/ui.json
> +++ b/qapi/ui.json
> @@ -1334,3 +1334,68 @@
>  { 'command': 'display-reload',
>    'data': 'DisplayReloadOptions',
>    'boxed' : true }
> +
> +##
> +# @DisplayUpdateType:
> +#
> +# Available DisplayUpdate types.
> +#
> +# @vnc: VNC display
> +#
> +# Since: 7.0
> +#
> +##
> +{ 'enum': 'DisplayUpdateType',
> +  'data': ['vnc'] }
> +
> +##
> +# @DisplayUpdateOptionsVNC:
> +#
> +# Specify the VNC reload options.
> +#
> +# @addresses: If specified, change set of addresses
> +#             to listen for connections. Addresses configured
> +#             for websockets are not touched.
> +#
> +# Since: 7.0
> +#
> +##
> +{ 'struct': 'DisplayUpdateOptionsVNC',
> +  'data': { '*addresses': ['SocketAddress'] } }
> +
> +##
> +# @DisplayUpdateOptions:
> +#
> +# Options of the display configuration reload.
> +#
> +# @type: Specify the display type.
> +#
> +# Since: 7.0
> +#
> +##
> +{ 'union': 'DisplayUpdateOptions',
> +  'base': {'type': 'DisplayUpdateType'},
> +  'discriminator': 'type',
> +  'data': { 'vnc': 'DisplayUpdateOptionsVNC' } }
> +
> +##
> +# @display-update:
> +#
> +# Update display configuration.
> +#
> +# Returns: Nothing on success.
> +#
> +# Since: 7.0
> +#
> +# Example:
> +#
> +# -> { "execute": "display-reload",

typo   s/reload/update/


With the minor tweaks

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


