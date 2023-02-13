Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2BED6947C3
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:13:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRZaD-0006hN-KW; Mon, 13 Feb 2023 09:13:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pRZaC-0006hE-3d
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:13:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pRZa9-00084R-1K
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:13:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676297604;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=LRTghOnWsoTGmc6Z7RxRJ7D0PgkR6rshDdlI6gmd2rI=;
 b=VPkvWKRcMnmULsAxXU4OrIS5yzwVZTU3uWTDqsPnUlsr0TWdiWYCP9hDNN6rauFiIeXab+
 79e6vxV+MiKtz4B3yklRFT4nm5gj5YHpPLFWCFrfO7eIxiYwP7/irpG3clMFLweGanmHjA
 3VYPMRZ2kdgby54MzomoXU8YhTbRBms=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-171-0vQsUq3KPd-q8CnV3jgnMw-1; Mon, 13 Feb 2023 09:13:20 -0500
X-MC-Unique: 0vQsUq3KPd-q8CnV3jgnMw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E80102999B2A;
 Mon, 13 Feb 2023 14:13:19 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.54])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 091E740CF8ED;
 Mon, 13 Feb 2023 14:13:17 +0000 (UTC)
Date: Mon, 13 Feb 2023 14:13:15 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 eduardo@habkost.net, pbonzini@redhat.com,
 marcel.apfelbaum@gmail.com, mst@redhat.com, philmd@linaro.org,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>
Subject: Re: [PATCH v4 14/16] qapi: deprecate "device" field of DEVICE_* events
Message-ID: <Y+pFe4bRCqbJJbp0@redhat.com>
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
 <20230213140103.1518173-15-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230213140103.1518173-15-vsementsov@yandex-team.ru>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

On Mon, Feb 13, 2023 at 05:01:01PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> The device field is redundant, because QOM path always include device
> ID when this ID exist.

The flipside to that view is that applications configuring QEMU are
specifying the device ID for -device (CLI) / device_add (QMP) and
not the QOM path. IOW, the device ID is the more interesting field
than QOM path, so feels like the wrong one to be dropping.

Is there any real benefit to dropping this ? 

> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>  docs/about/deprecated.rst |  9 +++++++++
>  qapi/qdev.json            | 12 ++++++++++--
>  2 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index da2e6fe63d..b389934691 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -171,6 +171,15 @@ accepted incorrect commands will return an error. Users should make sure that
>  all arguments passed to ``device_add`` are consistent with the documented
>  property types.
>  
> +QEMU Machine Protocol (QMP) events
> +----------------------------------
> +
> +``DEVICE_DELETED`` & ``DEVICE_UNPLUG_GUEST_ERROR`` field ``device`` (since 8.0)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +Devices that has ``ID`` always has QOM path `/machine/peripheral/ID`. So, the
> +``device`` field is redundant and deprecated. Use the ``path`` field instead.
> +
>  Host Architectures
>  ------------------
>  
> diff --git a/qapi/qdev.json b/qapi/qdev.json
> index 2708fb4e99..325ef554f9 100644
> --- a/qapi/qdev.json
> +++ b/qapi/qdev.json
> @@ -124,6 +124,9 @@
>  #
>  # @path: the device's QOM path
>  #
> +# Features:
> +# @deprecated: Member @device is deprecated as redundant. Use @path instead.
> +#
>  # Since: 1.5
>  #
>  # Example:
> @@ -135,7 +138,8 @@
>  #
>  ##
>  { 'event': 'DEVICE_DELETED',
> -  'data': { '*device': 'str', 'path': 'str' } }
> +  'data': { '*device': { 'type': 'str', 'features': [ 'deprecated' ] },
> +            'path': 'str' } }
>  
>  ##
>  # @DEVICE_UNPLUG_GUEST_ERROR:
> @@ -146,6 +150,9 @@
>  #
>  # @path: the device's QOM path
>  #
> +# Features:
> +# @deprecated: Member @device is deprecated as redundant. Use @path instead.
> +#
>  # Since: 6.2
>  #
>  # Example:
> @@ -157,4 +164,5 @@
>  #
>  ##
>  { 'event': 'DEVICE_UNPLUG_GUEST_ERROR',
> -  'data': { '*device': 'str', 'path': 'str' } }
> +  'data': { '*device': { 'type': 'str', 'features': [ 'deprecated' ] },
> +            'path': 'str' } }
> -- 
> 2.34.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


