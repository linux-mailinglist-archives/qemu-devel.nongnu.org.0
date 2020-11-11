Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B242AF45B
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 16:04:49 +0100 (CET)
Received: from localhost ([::1]:39096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcrg0-0006jB-Pr
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 10:04:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kcrf7-0006Jv-N8
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:03:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kcrf2-0006lD-2H
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 10:03:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605107026;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=tJ4vskFANQr5QS54tuQvRVBZFN3yPU3TA6V8W493JCc=;
 b=bRAaizjOH2EdaxMpssf2mVx7+U4YLKP0GFbDNqK1fPPcBGSvfYO+JX+Cw7JbuccgRI00jj
 ExjWYV/QMX3JOS7/nBKC8mnnnkJaqJPY+QRtJML+R0gYsSEwZjkHraJThCi/cA/Q3mw+EP
 UAaZH6Tn335b5sJdCtiWQg3K4fVqsI0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-ITO3SIHROmS9Pr-8wpzidg-1; Wed, 11 Nov 2020 10:03:41 -0500
X-MC-Unique: ITO3SIHROmS9Pr-8wpzidg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 143B01E5C92
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 15:03:41 +0000 (UTC)
Received: from redhat.com (ovpn-114-221.ams2.redhat.com [10.36.114.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FDD86198C;
 Wed, 11 Nov 2020 15:03:39 +0000 (UTC)
Date: Wed, 11 Nov 2020 15:03:36 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] vl, qemu-config: remove -set
Message-ID: <20201111150336.GF906488@redhat.com>
References: <20201111135716.1209421-1-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201111135716.1209421-1-pbonzini@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Wed, Nov 11, 2020 at 08:57:16AM -0500, Paolo Bonzini wrote:
> -set as far as I can see has basically no use.  It was intended as an override
> mechanism for configuration files, but even configuration files themselves
> are hardly used.  Drop it with prejudice.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  docs/system/deprecated.rst |  6 ++++++
>  include/qemu/config-file.h |  1 -
>  qemu-options.hx            |  9 ---------
>  softmmu/vl.c               |  4 ----
>  util/qemu-config.c         | 33 ---------------------------------
>  5 files changed, 6 insertions(+), 47 deletions(-)

iotest 068 uses -set and qtest vhost-user-text.c also does

IOW, it looks like it is valid to use -set, even if you're not using
-readconfig.

Libvirt doesn't use -set, but we've had users who make use of libvirt
command line passthrough for QEMU with -set.

IOW, I'm not convinced real world usage is near zero as suggested.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


