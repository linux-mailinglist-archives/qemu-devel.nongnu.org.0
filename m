Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BAC3A1956
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:24:11 +0200 (CEST)
Received: from localhost ([::1]:43788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr03u-0006kz-65
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:24:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lr01c-0003d7-4k
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:21:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lr01T-0002hX-Qa
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:21:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623252097;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=omyg2qTLei9fQrzgQ9241wVxll7x4V8biEqgy9tV/S0=;
 b=KygnRHva8MhEm0FQxnNzkb/ImyEnLunD+S5h7j4D46gp9GgfZ4yU+my2a5MdhjJb7ikWbY
 kCXR9VbjFM3t8obcai8AoV0tCpx8LG555IuvQO/d3t5DjTug56QgEaddQBKpMKHBikZZ84
 RJTMsBsav/qsbQOogFheXYQ6TkivXBY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-eIFK8j3DNTedyZBSBSgP5A-1; Wed, 09 Jun 2021 11:21:33 -0400
X-MC-Unique: eIFK8j3DNTedyZBSBSgP5A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E6ECCC626
 for <qemu-devel@nongnu.org>; Wed,  9 Jun 2021 15:21:33 +0000 (UTC)
Received: from redhat.com (ovpn-115-127.ams2.redhat.com [10.36.115.127])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69DA05D9E2;
 Wed,  9 Jun 2021 15:21:19 +0000 (UTC)
Date: Wed, 9 Jun 2021 16:21:16 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 01/13] qemu-trace-stap: changing SYSTEMTAP_TAPSET
 considered harmful.
Message-ID: <YMDcbD2NvFje1LI/@redhat.com>
References: <20210601132414.432430-1-kraxel@redhat.com>
 <20210601132414.432430-2-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210601132414.432430-2-kraxel@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 01, 2021 at 03:24:02PM +0200, Gerd Hoffmann wrote:
> Setting SYSTEMTAP_TAPSET to some value other than
> /usr/share/systemtap/tapsets results in systemtap not finding the
> standard tapset library any more, which in turn breaks tracing because
> pid() and other standard systemtap functions are not available any more.
> 
> So using SYSTEMTAP_TAPSET to point systemtap to the qemu probes will
> only work for the prefix=/usr installs because both qemu and system
> tapsets in the same directory then.  All other prefixes are broken.
> 
> Fix that by using the "-I $tapsetdir" command line switch instead.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  scripts/qemu-trace-stap | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


I'm still a little confused how I ever missed this problem
when testing usage !


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


