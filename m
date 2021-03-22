Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACCE344019
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 12:46:27 +0100 (CET)
Received: from localhost ([::1]:48258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOJ0s-0004r5-7g
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 07:46:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lOIy3-0004Fd-RQ
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:43:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lOIy1-0007Xk-12
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:43:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616413407;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=DVMf6PjuM2a8roao7/fxuHXtEwCYxHXNP8rCy22Fc7M=;
 b=hvfw2l+/7lNwFrSOfzvGUVkdfSwMn3lE4ih9ERkqHU0l3wRhB0HS4tOGL03hZassjY2JUP
 MYf08GwYObwzAPEdMUzSFC4sBG255Gl7iZt7EKRfbi0ztccTpgXOJlFJ8Sr0SPgpBnvMD2
 KwN0LHmJAOtPpQY4apUfWqzPq5M26jg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-skLussYMOZqfBEMeEbqQ8w-1; Mon, 22 Mar 2021 07:43:25 -0400
X-MC-Unique: skLussYMOZqfBEMeEbqQ8w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B533D911E9
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 11:43:24 +0000 (UTC)
Received: from redhat.com (ovpn-112-245.ams2.redhat.com [10.36.112.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F6A919C78;
 Mon, 22 Mar 2021 11:43:16 +0000 (UTC)
Date: Mon, 22 Mar 2021 11:43:13 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 4/8] meson: move qxl trace events to separate file
Message-ID: <YFiC0agIU3Qi4/bV@redhat.com>
References: <20210121125028.3247190-1-kraxel@redhat.com>
 <20210121125028.3247190-5-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210121125028.3247190-5-kraxel@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 21, 2021 at 01:50:24PM +0100, Gerd Hoffmann wrote:
> Move qxl trace events to separate trace-events-qxl file.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/display/qxl-render.c     |  1 +
>  hw/display/qxl.c            |  1 +
>  hw/display/meson.build      |  5 +++
>  hw/display/trace-events     | 67 -------------------------------------
>  hw/display/trace-events-qxl | 66 ++++++++++++++++++++++++++++++++++++
>  5 files changed, 73 insertions(+), 67 deletions(-)
>  create mode 100644 hw/display/trace-events-qxl
> 
> diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
> index 3ce2e57b8feb..cc4862e26eb6 100644
> --- a/hw/display/qxl-render.c
> +++ b/hw/display/qxl-render.c
> @@ -23,6 +23,7 @@
>  #include "qxl.h"
>  #include "sysemu/runstate.h"
>  #include "trace.h"
> +#include "trace/trace-hw_display_qxl.h"

I'm not a fan of this, as it feels like we're setting
up a completely different naming convention from the
one that already exists.

The previous "trace.h" header is relative to the source
directory. ie, "trace.h" is pulling in "hw/display/trace.h".

IMHO, we should be generating 'trace-qxl.h', alongside
the existing trace.h, so we can use a bare "trace-qxl.h"
include that refers to "hw/display/trace-qxl.h".

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


