Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC0232B8D3
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 16:06:30 +0100 (CET)
Received: from localhost ([::1]:60254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHT53-0004ux-Rw
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 10:06:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHT36-0003eJ-6o
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 10:04:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lHT33-0007yS-7A
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 10:04:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614783864;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ZSYBQSiHByxFxUpYcdUL1yVIQx1HPlCGs9RB2Dzrpw=;
 b=g7GctwPUOw0z6ij+PtOQ+mJ11yrwTnfnV0Gje9a1zY1rv4+BvMJ1lEQ49a2AaHLp4muxiY
 4BAhKFrmzVj3wI3/sv0IWYZ9wUO9HY9abH/y9GjF7iL8/wwaTINxn8Rmo2Dwu/bMlkrs1w
 2ubtibOgcny62sObSi/fpsArWNfBjIM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-GXlma92SO9WXsnYpO2m-TQ-1; Wed, 03 Mar 2021 10:04:20 -0500
X-MC-Unique: GXlma92SO9WXsnYpO2m-TQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AEBC1966321
 for <qemu-devel@nongnu.org>; Wed,  3 Mar 2021 15:04:19 +0000 (UTC)
Received: from redhat.com (ovpn-115-145.ams2.redhat.com [10.36.115.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1E1410016FF;
 Wed,  3 Mar 2021 15:04:18 +0000 (UTC)
Date: Wed, 3 Mar 2021 15:04:16 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 13/25] tests/docker: expand centos7 package list
Message-ID: <YD+lcOxMNxB/8gD3@redhat.com>
References: <20210114130245.1654081-1-berrange@redhat.com>
 <20210114130245.1654081-14-berrange@redhat.com>
 <3baf6615-f5d9-396f-98aa-ebe8d0414f46@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3baf6615-f5d9-396f-98aa-ebe8d0414f46@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Wed, Mar 03, 2021 at 03:51:02PM +0100, Thomas Huth wrote:
> On 14/01/2021 14.02, Daniel P. Berrangé wrote:
> > This is the fully expanded list of build pre-requisites QEMU can
> > conceivably use in any scenario.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >   tests/docker/dockerfiles/centos7.docker | 58 +++++++++++++++++++++++++
> >   1 file changed, 58 insertions(+)
> > 
> > diff --git a/tests/docker/dockerfiles/centos7.docker b/tests/docker/dockerfiles/centos7.docker
> > index 1eb3455144..d2daaae25b 100644
> > --- a/tests/docker/dockerfiles/centos7.docker
> > +++ b/tests/docker/dockerfiles/centos7.docker
> > @@ -6,37 +6,95 @@ RUN yum -y update
> >   # Please keep this list sorted alphabetically
> >   ENV PACKAGES \
> >       SDL2-devel \
> > +    alsa-lib-devel \
> > +    bc \
> 
> Why is bc suddenly required now?

It is used by acceptance tests / avocado IIUC. Other dockrefiles
already have it present, and this is making centos consistent.

> 
> > +    brlapi-devel \
> >       bzip2 \
> >       bzip2-devel \
> > +    ca-certificates \
> > +    capstone-devel \
> 
> capstone in Centos 7 is definitely too old - we need >= 4.0 now, and Centos
> 7 still uses 3.0 if I've got that right.

Possibly, but the goal here is to have a consistent set of packages installed
across all dockerfiles. In fact having it installed is good because it will
prove that QEMU does the right thing and detect that it needs to use its
bundled copy.

> > +    python3-PyYAML \
> > +    python3-numpy \
> > +    python3-pillow \
> > +    python3-pip \
> > +    python3-setuptools \
> > +    python3-sphinx \
> > +    python3-virtualenv \
> > +    python3-wheel \
> >       rdma-core-devel \
> > +    rpm \
> 
> Why rpm ?

Acceptance tests run rpm2cpio

> 
> > +    sed \
> 
> Do we really need to specify sed separately?

Any tool that is used should be listed explicitly, even if it
happens to get pulled in indirectly via another dep.

> 
> >       snappy-devel \
> >       spice-protocol \
> >       spice-server-devel \
> > +    systemd-devel \
> > +    systemtap-sdt-devel \
> >       tar \
> > +    texinfo \
> > +    usbredir-devel \
> > +    vim-minimal \
> 
> vim? Why that?

The ubuntu dockerfile had this, so I was trying to make it
consistent. I've since removed it though, since others
thought the inclusion in ubuntu dockerfile was really a
bug.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


