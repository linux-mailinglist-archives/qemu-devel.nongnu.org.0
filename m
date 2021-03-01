Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0BE328B34
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 19:31:04 +0100 (CET)
Received: from localhost ([::1]:32924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGnJv-00063F-DK
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 13:31:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lGnHX-0005A2-7F
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 13:28:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lGnHU-000744-Ml
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 13:28:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614623308;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V8jW8bw1/4MGdpkh/ePFO/Zjfw1XSYVK6DVZY71D4kE=;
 b=SfmuYBcDwaRTuUeQWuQmCyDavRRqiY4h1FTyD6nZ9/yBC0NZUVY+SQ8qYxeOTXJI+BJmjc
 TWcnc6daTllF9+Oca2WVoUrbxZg113AmUlXzu2ApGM/fECjFuFLBtB0PDQfc+dToc8WGYS
 IKODyPc8HzWMKWgiwVhj1sXMHiAenaY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-8fOKHZz8P9yF6QBSlmnUEQ-1; Mon, 01 Mar 2021 13:28:25 -0500
X-MC-Unique: 8fOKHZz8P9yF6QBSlmnUEQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 723E8E4961;
 Mon,  1 Mar 2021 18:28:24 +0000 (UTC)
Received: from redhat.com (ovpn-113-132.ams2.redhat.com [10.36.113.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B0371F45B;
 Mon,  1 Mar 2021 18:28:20 +0000 (UTC)
Date: Mon, 1 Mar 2021 18:28:17 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v3 2/2] docs: replace insecure /tmp examples in qsd docs
Message-ID: <YD0yQaCV7K5cux/H@redhat.com>
References: <20210301172728.135331-1-stefanha@redhat.com>
 <20210301172728.135331-3-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210301172728.135331-3-stefanha@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 "Richard W . M . Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 01, 2021 at 05:27:28PM +0000, Stefan Hajnoczi wrote:
> World-writeable directories have security issues. Avoid showing them in
> the documentation since someone might accidentally use them in
> situations where they are insecure.
> 
> There tend to be 3 security problems:
> 1. Denial of service. An adversary may be able to create the file
>    beforehand, consume all space/inodes, etc to sabotage us.
> 2. Impersonation. An adversary may be able to create a listen socket and
>    accept incoming connections that were meant for us.
> 3. Unauthenticated client access. An adversary may be able to connect to
>    us if we did not set the uid/gid and permissions correctly.
> 
> These can be prevented or mitigated with private /tmp, carefully setting
> the umask, etc but that requires special action and does not apply to
> all situations. Just avoid using /tmp in examples.
> 
> Reported-by: Richard W.M. Jones <rjones@redhat.com>
> Reported-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  docs/tools/qemu-storage-daemon.rst | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


