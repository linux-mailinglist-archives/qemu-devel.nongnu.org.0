Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1A22EB036
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 17:37:23 +0100 (CET)
Received: from localhost ([::1]:48884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwpKk-00021l-T9
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 11:37:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kwpBH-0001p3-LC
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:27:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kwpBF-0001VY-A2
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:27:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609864052;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=vX2DK+ceQRc9eKWkXgK6fnSsn1BXKGMOylXrRcCONnQ=;
 b=H0wLrk342GxBmJI3qf0tsfhNt6c+VCFCpY0VIhA+uugHP38rl3B+eV8QHswZCHe33StE6B
 XqKitBcBVuCokcC+JyZKPU1lKthXC0fjQYNw2KxmAqtmmkIcz4ddDhUo1u9bjh+e9nZTdR
 GjuxZYhgrNh2cs9nSelaboRGyuRtxDo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-uWn4HdvtMmGSfEKrqQgseA-1; Tue, 05 Jan 2021 11:27:31 -0500
X-MC-Unique: uWn4HdvtMmGSfEKrqQgseA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 937BE802B42;
 Tue,  5 Jan 2021 16:27:29 +0000 (UTC)
Received: from redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 916C160BFA;
 Tue,  5 Jan 2021 16:27:11 +0000 (UTC)
Date: Tue, 5 Jan 2021 16:27:08 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V2 05/22] vl: memfd-alloc option
Message-ID: <20210105162708.GH724458@redhat.com>
References: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
 <1609861330-129855-6-git-send-email-steven.sistare@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1609861330-129855-6-git-send-email-steven.sistare@oracle.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 05, 2021 at 07:41:53AM -0800, Steve Sistare wrote:
> Allocate anonymous memory using memfd_create if the memfd-alloc option is
> set.
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  exec.c                  | 38 ++++++++++++++++++++++++++++++--------
>  include/sysemu/sysemu.h |  1 +
>  qemu-options.hx         | 11 +++++++++++
>  softmmu/vl.c            |  4 ++++
>  trace-events            |  1 +
>  5 files changed, 47 insertions(+), 8 deletions(-)

> diff --git a/qemu-options.hx b/qemu-options.hx
> index 708583b..455b43b7 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4094,6 +4094,17 @@ SRST
>      an unmigratable state.
>  ERST
>  
> +#ifdef __linux__
> +DEF("memfd-alloc", 0,  QEMU_OPTION_memfd_alloc, \
> +    "-memfd-alloc         allocate anonymous memory using memfd_create\n",
> +    QEMU_ARCH_ALL)
> +#endif
> +
> +SRST
> +``-memfd-alloc``
> +    Allocate anonymous memory using memfd_create (Linux only).
> +ERST

Do we really need a new arg for this ? It is already possible to request
use of memfd for the guest RAM using

  -object memory-backend-memfd,id=ram-node0,size=NNNN

this memory backend object framework was intended to remove the need to
add new ad-hoc CLI args for controlling memory allocation.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


