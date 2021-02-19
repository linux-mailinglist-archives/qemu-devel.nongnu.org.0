Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6996431F6A0
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 10:39:55 +0100 (CET)
Received: from localhost ([::1]:50200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD2GQ-00074Z-DD
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 04:39:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lD2F4-0006BO-Ou
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 04:38:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lD2F2-0004UM-8R
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 04:38:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613727507;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=3Pi8hvBSrVxmqvapc2/qsWrYdQn18/5fCF9qXfecO1w=;
 b=IZkvWe0/gRPlWXNxUXaXoD8r1gjyWRC6pAdmMY/2MOpognaVx3AdVgbL2MxG2I2X4efbJ6
 NxeH9RbSfd89V8P2ZLFXy07ny+S8OUOV1GrQgCrKi/MvnU8A3xJZekLybzhaM8GU0HMnCo
 d1+bhh6Hr3Wvn+NyVTKNdhNgxf7IxuM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-x4Es63NBNfOBSl4A0v8rug-1; Fri, 19 Feb 2021 04:38:25 -0500
X-MC-Unique: x4Es63NBNfOBSl4A0v8rug-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78E60801965;
 Fri, 19 Feb 2021 09:38:24 +0000 (UTC)
Received: from redhat.com (ovpn-113-184.ams2.redhat.com [10.36.113.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2029E171FE;
 Fri, 19 Feb 2021 09:38:22 +0000 (UTC)
Date: Fri, 19 Feb 2021 09:38:20 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Doug Evans <dje@google.com>
Subject: Re: [PATCH v4 1/4] slirp: Advance libslirp submodule to add ipv6
 host-forward support
Message-ID: <YC+HDHCm0vtoXXs1@redhat.com>
References: <20210218201538.701509-1-dje@google.com>
 <20210218201538.701509-2-dje@google.com>
MIME-Version: 1.0
In-Reply-To: <20210218201538.701509-2-dje@google.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 18, 2021 at 12:15:35PM -0800, Doug Evans wrote:

FWIW, normally when QEMU updates libslirp, the commit message is
set to contain the "git shortlog old..new" output

> Signed-off-by: Doug Evans <dje@google.com>
> ---
> 
> Changes from v3:
> - pick up latest libslirp patch to reject ipv6 addr-any for guest address
>   - libslirp currently only provides a stateless DHCPv6 server, which means
>     it can't know in advance what the guest's IP address is, and thus
>     cannot do the "addr-any -> guest ip address" translation that is done
>     for ipv4
> 
> Changes from v2:
> - this patch is new in v3, split out from v2
> 
>  slirp | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/slirp b/slirp
> index 8f43a99191..26ae658a83 160000
> --- a/slirp
> +++ b/slirp
> @@ -1 +1 @@
> -Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
> +Subproject commit 26ae658a83eeca16780cf5615c8247cbb151c3fa
> -- 
> 2.30.0.617.g56c4b15f3c-goog
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


