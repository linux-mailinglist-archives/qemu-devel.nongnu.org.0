Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B09C45280FA
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 11:43:13 +0200 (CEST)
Received: from localhost ([::1]:42098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqXFw-00041S-D8
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 05:43:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nqXDS-0002w2-Kh
 for qemu-devel@nongnu.org; Mon, 16 May 2022 05:40:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nqXDO-0004fm-TB
 for qemu-devel@nongnu.org; Mon, 16 May 2022 05:40:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652694025;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=kuLJY7n4maaNPAnooAPFwwZdVJ04iHwTDo3YZJ3WRWE=;
 b=HWFtnoEb+Vz0uaUSdOzQ/s1TMUG+sSYY2o6BtW33XicpP7O5f8o7FVboU9oUOlE3N+U2rn
 oxaXApUUiijDmyD8GCVVoYH5lgVs/++jjPqo+KOkmmU7pRWzobzhOhfNZgTMleEspZh5kn
 7kzWllKh7Dh8+k4umaaLGhas7PUXfWc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-278-_AgQjtyMOWyZc4yYBGeyCg-1; Mon, 16 May 2022 05:40:21 -0400
X-MC-Unique: _AgQjtyMOWyZc4yYBGeyCg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D6781833966
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 09:40:20 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 35C63400E884;
 Mon, 16 May 2022 09:40:18 +0000 (UTC)
Date: Mon, 16 May 2022 10:40:15 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Leonardo Bras Soares Passos <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: Re: [PULL 00/16] migration queue
Message-ID: <YoIb/+zknFIWLyMK@redhat.com>
References: <20220510083355.92738-1-dgilbert@redhat.com>
 <Yno3RvWhwSDZjI7o@work-vm> <Yno8NV5bQPUlqvcx@redhat.com>
 <YnpB4vg2ozbBzUCg@work-vm>
 <CAJ6HWG5Mgaqt9dOVH-0-Y78x96HO5c-TevYeuN5xMvSQqj7W8Q@mail.gmail.com>
 <YoIQgCndgjW1s58k@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YoIQgCndgjW1s58k@stefanha-x1.localdomain>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 16, 2022 at 09:51:12AM +0100, Stefan Hajnoczi wrote:
> On Wed, May 11, 2022 at 12:40:07AM -0300, Leonardo Bras Soares Passos wrote:
> > From a previous thread:
> > 
> > On Thu, Apr 28, 2022 at 1:20 PM Dr. David Alan Gilbert
> > <dgilbert@redhat.com> wrote:
> > >
> > > Leo:
> > >   Unfortunately this is failing a couple of CI tests; the MSG_ZEROCOPY
> > > one I guess is the simpler one; I think Stefanha managed to find the
> > > liburing fix for the __kernel_timespec case, but that looks like a bit
> > > more fun!
> > >
> > > Dave
> > 
> > I thought Stefanha had fixed this bug, and we were just waiting for a
> > new alpine rootfs/image with that fixed.
> > Is that correct?
> 
> I didn't fix the liburing __kernel_timespec issue on alpine Linux. It's
> probably a packaging bug and I gave Dave the email address of the
> package maintainer. I'm not sure if the package maintainer has been
> contacted or released a fixed liburing package.

It was prety easy to bisect the problem with liburing so I filed a
bug pointing to the fix needed:

  https://gitlab.alpinelinux.org/alpine/aports/-/issues/13813

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


