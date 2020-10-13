Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED17728CAF1
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 11:26:00 +0200 (CEST)
Received: from localhost ([::1]:38216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSGZE-0006pK-24
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 05:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kSGWy-0005eC-0x
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 05:23:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kSGWt-00035t-Tf
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 05:23:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602581014;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=6mmj6iQ3aki0Q45UrxEnOVZYzy4lfpdA8FbYaLKw2D4=;
 b=Reu+vO8XMeJUb2tu6h0mNkGQWdBxT/1PEigoKQiXu2NHeTSBce5yoLE39rwSGt/gL++q/q
 WfojxAz/nfsSLmYd1WRk9DhkzyEPe/SDeZO2S1K7/chFJs7070/CEL10g/WEahHUg0MWnk
 i6bS8hTo9u5S+X4uvlbo7COoxumutq8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-qRnK-jxfO9-xfrqNO9xO2A-1; Tue, 13 Oct 2020 05:23:30 -0400
X-MC-Unique: qRnK-jxfO9-xfrqNO9xO2A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 741FE1800D42
 for <qemu-devel@nongnu.org>; Tue, 13 Oct 2020 09:23:29 +0000 (UTC)
Received: from redhat.com (ovpn-114-78.ams2.redhat.com [10.36.114.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9284773664;
 Tue, 13 Oct 2020 09:23:25 +0000 (UTC)
Date: Tue, 13 Oct 2020 10:23:22 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] qemu-edid: drop cast
Message-ID: <20201013092322.GE70612@redhat.com>
References: <20201013091615.14166-1-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201013091615.14166-1-kraxel@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 02:06:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 13, 2020 at 11:16:15AM +0200, Gerd Hoffmann wrote:
> Not needed and makes some compilers error out with:
> 
> qemu-edid.c:15:1: error: initializer element is not constant

Which compilers do this. If we're not seeing this failure in our
CI, then we have a CI gap that likely needs filling.

> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  qemu-edid.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qemu-edid.c b/qemu-edid.c
> index 1db3372b982c..1cd6a9517238 100644
> --- a/qemu-edid.c
> +++ b/qemu-edid.c
> @@ -9,7 +9,7 @@
>  #include "qemu/cutils.h"
>  #include "hw/display/edid.h"
>  
> -static qemu_edid_info info = (qemu_edid_info) {
> +static qemu_edid_info info = {
>      .prefx = 1024,
>      .prefy = 768,
>  };
> -- 
> 2.27.0
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


