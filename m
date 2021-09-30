Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8783141D56D
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 10:31:57 +0200 (CEST)
Received: from localhost ([::1]:46288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVrTw-0002oX-FS
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 04:31:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVrRw-0001dX-Ez
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 04:29:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVrRt-0006i3-OQ
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 04:29:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632990589;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=nT9yS815aCM6c51T81B1ah6lot1o5zbHQyLhdKfqo6U=;
 b=T4u/+gtjsZKi8eTlvJ29KINIyVWxvk9lxKlIC8bBUum7Q/uQPGzuYOqbOPELJjRoKcNWOF
 DJykLYxzTlNwKZ+aAlc2B99dyV9lX+fUQIHAeAAxGNXeBPDXWDJA5IrkH5gW5L7J3wEur+
 ulPpdMQcJ4Ib4AO80tHvPHkaHdrxsCg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-PKf58IDKM8GjnsZpPnYsmA-1; Thu, 30 Sep 2021 04:29:47 -0400
X-MC-Unique: PKf58IDKM8GjnsZpPnYsmA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C01D91274;
 Thu, 30 Sep 2021 08:29:46 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 42ED7100760B;
 Thu, 30 Sep 2021 08:29:43 +0000 (UTC)
Date: Thu, 30 Sep 2021 09:29:40 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PULL 00/20] NBD patches through 2021-09-27
Message-ID: <YVV1dFgJnh2+rAub@redhat.com>
References: <20210927215545.3930309-1-eblake@redhat.com>
 <CAFEAcA9P_xzSce_3bVKO95HOdhbf1aqVJ-eiXOkJ09Hj4ow+bg@mail.gmail.com>
 <97e67c45-21f9-2630-7173-991d01871116@redhat.com>
 <CAFXwXrnZzyUBSikVr6uFLHQeD5hWcXDq+eG=uwBC5xQ8FVivmg@mail.gmail.com>
 <9ba3ebe2-4d74-628f-fb76-5541f629ff9e@redhat.com>
 <20210929182921.t3g4ozzweoo4vpyu@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210929182921.t3g4ozzweoo4vpyu@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, rjones@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 29, 2021 at 01:29:21PM -0500, Eric Blake wrote:
> On Wed, Sep 29, 2021 at 05:03:08PM +0200, Paolo Bonzini wrote:
> > On 29/09/21 15:58, Richard Henderson wrote:
> > > 
> > >      > /usr/bin/ld: /usr/lib64/libselinux.so: error adding symbols: file in
> > >      > wrong format
> > >      > collect2: error: ld returned 1 exit status
> > > 
> > >     Missing libselinux-devel.i686 in
> > >     tests/docker/dockerfiles/fedora-i386-cross.docker, I think?
> > > 
> > > But additionally, incorrect package probing, I think.
> > 
> > Probably Meson deciding to look at --print-search-dirs and crossing fingers.
> > But -m32 and other multilib flags should be added to config-meson.cross
> > rather than QEMU_CFLAGS.
> 
> Rich, Dan, this is caused by 'nbd/server: Add --selinux-label option'
> (20/20 in this pull request); can you investigate?

I think this is a bug in the fedora-i386-cross.docker file

It sets

  ENV PKG_CONFIG_PATH /usr/lib/pkgconfig

which *adds* /usr/lib/pkgconfig to the pkg-config search path, in
additional to all existing search paths. IOW, it'll look in this
32-bit directory, and then carry on looking in all the 64-bit
directories.

For cross compiling it is neccessary to set PKG_CONFIG_LIBDIR
instead, which completely replaces the default paths.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


