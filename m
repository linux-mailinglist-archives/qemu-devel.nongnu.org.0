Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DC6C3D2881
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 18:44:14 +0200 (CEST)
Received: from localhost ([::1]:50132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6bnx-00031k-5A
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 12:44:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m6bnC-0002EW-AN
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 12:43:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m6bnA-0005Mw-Jc
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 12:43:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626972203;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=yxJ//88x5BwC33fwZb33ulv5NxWYn77Io3f+9mQfUVw=;
 b=FHa/uqFHEF2tSnDj8xqxlWAmfSHmOMRFkkbxJummjhSdiLWvwzx/t6KY9cICjJRKHm9Vyd
 G90aVrJisiROtlHAg08t6L3xwW/1/ig9BH5jK294jvo4vtG+RFS3GB3IbgfKj6iM8IorbO
 n65A+8JXq68vmjPVGKNcRJyBKWTqg58=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-zf16q9f7PxKFdhrcadolBA-1; Thu, 22 Jul 2021 12:43:22 -0400
X-MC-Unique: zf16q9f7PxKFdhrcadolBA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A541A8015DB;
 Thu, 22 Jul 2021 16:43:21 +0000 (UTC)
Received: from redhat.com (ovpn-114-245.ams2.redhat.com [10.36.114.245])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 13E916F97F;
 Thu, 22 Jul 2021 16:43:19 +0000 (UTC)
Date: Thu, 22 Jul 2021 17:43:16 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: [PATCH] nbd/server: Add --selinux-label option
Message-ID: <YPmgJOvrBzar9KjI@redhat.com>
References: <20210722163240.1722364-1-rjones@redhat.com>
 <20210722163240.1722364-2-rjones@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210722163240.1722364-2-rjones@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: vsementsov@virtuozzo.com, eblake@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 22, 2021 at 05:32:40PM +0100, Richard W.M. Jones wrote:
> Under SELinux, Unix domain sockets have two labels.  One is on the
> disk and can be set with commands such as chcon(1).  There is a
> different label stored in memory (called the process label).  This can
> only be set by the process creating the socket.  When using SELinux +
> SVirt and wanting qemu to be able to connect to a qemu-nbd instance,
> you must set both labels correctly first.
> 
> For qemu-nbd the options to set the second label are awkward.  You can
> create the socket in a wrapper program and then exec into qemu-nbd.
> Or you could try something with LD_PRELOAD.
> 
> This commit adds the ability to set the label straightforwardly on the
> command line, via the new --selinux-label flag.  (The name of the flag
> is the same as the equivalent nbdkit option.)
> 
> A worked example showing how to use the new option can be found in
> this bug: https://bugzilla.redhat.com/show_bug.cgi?id=1984938
> 
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1984938
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> ---
>  configure         |  9 ++++++++-
>  meson.build       | 10 +++++++++-
>  meson_options.txt |  3 +++
>  qemu-nbd.c        | 33 +++++++++++++++++++++++++++++++++
>  4 files changed, 53 insertions(+), 2 deletions(-)


> diff --git a/meson.build b/meson.build
> index 2f377098d7..2d7206233e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1064,6 +1064,11 @@ keyutils = dependency('libkeyutils', required: false,
>  
>  has_gettid = cc.has_function('gettid')
>  
> +# libselinux
> +selinux = dependency('libselinux',
> +                     required: get_option('selinux'),
> +                     method: 'pkg-config', kwargs: static_kwargs)
> +

For the new build dep we'll need updated package lists in
tests/docker/dockerfiles. For centos, fedra ,opensuse
add libselinux-devel and for ubuntu 18/20 add libselinux-dev

That'll make sure this new code gets tested in CI.


The rest looks ok to me

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


