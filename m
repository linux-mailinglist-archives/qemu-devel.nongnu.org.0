Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3679A40472F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 10:44:28 +0200 (CEST)
Received: from localhost ([::1]:47968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOFfX-0005wt-7G
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 04:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOFdv-0004a0-9i
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 04:42:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOFdt-0000AM-Hv
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 04:42:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631176965;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eNnciRd13yW15mCaqI+APv4wl6XmsMUz8pFGMG+vGCE=;
 b=HAierau39DFPE57d0PrWBt//xYgjTrKIk9tiimdzSakUqyMaX8uL0FbY4v+m8U5gRqXXGt
 3xUC24LmyfSrgTDdy4qnn+Io/dZVlK50T9jKHQlafsHT9Q9uiWHDojjYzbImBnk/0XzSHF
 LAWPdRKoBFn8IWqXf/P65gt9o0k41Ag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-k1Rj3sQKOXevf61Z-YhL8w-1; Thu, 09 Sep 2021 04:42:41 -0400
X-MC-Unique: k1Rj3sQKOXevf61Z-YhL8w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 039E2362FB;
 Thu,  9 Sep 2021 08:42:41 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B2B136B551;
 Thu,  9 Sep 2021 08:42:36 +0000 (UTC)
Date: Thu, 9 Sep 2021 09:42:34 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 1/2] hmp: Unbreak "change vnc"
Message-ID: <YTnI+lPmC2TDDVuP@redhat.com>
References: <20210909081219.308065-1-armbru@redhat.com>
 <20210909081219.308065-2-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210909081219.308065-2-armbru@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, kraxel@redhat.com, qemu-devel@nongnu.org,
 dgilbert@redhat.com, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 09, 2021 at 10:12:18AM +0200, Markus Armbruster wrote:
> HMP command "change vnc" can take the password as argument, or prompt
> for it:
> 
>     (qemu) change vnc password 123
>     (qemu) change vnc password
>     Password: ***
>     (qemu)
> 
> This regressed in commit cfb5387a1d "hmp: remove "change vnc TARGET"
> command", v6.0.0.
> 
>     (qemu) change vnc passwd 123
>     Password: ***
>     (qemu) change vnc passwd
>     (qemu)
> 
> The latter passes NULL to qmp_change_vnc_password(), which is a no-no.
> Looks like it puts the display into "password required, but none set"
> state.
> 
> The logic error is easy to miss in review, but testing should've
> caught it.
> 
> Fix the obvious way.
> 
> Fixes: cfb5387a1de2acda23fb5c97d2378b9e7ddf8025
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  monitor/hmp-cmds.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


