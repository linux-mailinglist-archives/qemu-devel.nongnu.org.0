Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F523282C8
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 16:47:44 +0100 (CET)
Received: from localhost ([::1]:42530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGklr-0004kr-1B
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 10:47:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lGkjC-0003XS-Jg
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 10:44:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lGkj8-0007js-I2
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 10:44:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614613493;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5vgCJf3GvkDIu11cpWTNGUPrrAM9VbaQdb4tn2SRnQw=;
 b=KIpjUX9ao2S7uZ6S4YfIgANhmug98MQmFKKYQbxXm/0bY8im+y30+lPLn1QnT+8dm01bA4
 g74VJBNFSXCuRHbwsNhR0pdIKNF5zlRVTnSwCIssLAu4VamY+sxas2udmIBDURPgHKpK3U
 jPPmIyjjF8AS9skqs8alQXhlJRHIs4s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-DH3zGH7OMm2zjALgxKnSdw-1; Mon, 01 Mar 2021 10:44:51 -0500
X-MC-Unique: DH3zGH7OMm2zjALgxKnSdw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9AB8F8030BB;
 Mon,  1 Mar 2021 15:44:50 +0000 (UTC)
Received: from redhat.com (ovpn-113-132.ams2.redhat.com [10.36.113.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D955619C45;
 Mon,  1 Mar 2021 15:44:45 +0000 (UTC)
Date: Mon, 1 Mar 2021 15:44:42 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: [PATCH] docs: show how to spawn qemu-storage-daemon with fd
 passing
Message-ID: <YD0L6r68S+Rv8a+R@redhat.com>
References: <20210301153159.35660-1-stefanha@redhat.com>
 <20210301153906.GZ30079@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210301153906.GZ30079@redhat.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 01, 2021 at 03:39:06PM +0000, Richard W.M. Jones wrote:
> On Mon, Mar 01, 2021 at 03:31:59PM +0000, Stefan Hajnoczi wrote:
> > The QMP monitor, NBD server, and vhost-user-blk export all support file
> > descriptor passing. This is a useful technique because it allows the
> > parent process to spawn and wait for qemu-storage-daemon without busy
> > waiting, which may delay startup due to arbitrary sleep() calls.
> > 
> > This Python example is inspired by the test case written for libnbd by
> > Richard W.M. Jones <rjones@redhat.com>:
> > https://gitlab.com/nbdkit/libnbd/-/commit/89113f484effb0e6c322314ba75c1cbe07a04543
> > 
> > Thanks to Daniel P. Berrangé <berrange@redhat.com> for suggestions on
> > how to get this working. Now let's document it!
> > 
> > Reported-by: Richard W.M. Jones <rjones@redhat.com>
> > Cc: Kevin Wolf <kwolf@redhat.com>
> > Cc: Daniel P. Berrangé <berrange@redhat.com>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  docs/tools/qemu-storage-daemon.rst | 38 ++++++++++++++++++++++++++++--
> >  1 file changed, 36 insertions(+), 2 deletions(-)
> > 
> > diff --git a/docs/tools/qemu-storage-daemon.rst b/docs/tools/qemu-storage-daemon.rst
> > index f63627eaf6..45854c131e 100644
> > --- a/docs/tools/qemu-storage-daemon.rst
> > +++ b/docs/tools/qemu-storage-daemon.rst
> > @@ -101,10 +101,12 @@ Standard options:
> >  
> >  .. option:: --nbd-server addr.type=inet,addr.host=<host>,addr.port=<port>[,tls-creds=<id>][,tls-authz=<id>][,max-connections=<n>]
> >    --nbd-server addr.type=unix,addr.path=<path>[,tls-creds=<id>][,tls-authz=<id>][,max-connections=<n>]
> > +  --nbd-server addr.type=fd,addr.str=<fd>[,tls-creds=<id>][,tls-authz=<id>][,max-connections=<n>]
> >  
> >    is a server for NBD exports. Both TCP and UNIX domain sockets are supported.
> > -  TLS encryption can be configured using ``--object`` tls-creds-* and authz-*
> > -  secrets (see below).
> > +  A listen socket can be provided via file descriptor passing (see Examples
> > +  below). TLS encryption can be configured using ``--object`` tls-creds-* and
> > +  authz-* secrets (see below).
> >  
> >    To configure an NBD server on UNIX domain socket path ``/tmp/nbd.sock``::
> >  
> > @@ -127,6 +129,38 @@ QMP commands::
> >        --chardev socket,path=qmp.sock,server,nowait,id=char1 \
> >        --monitor chardev=char1
> >  
> > +Launch the daemon from Python with a QMP monitor socket using file descriptor
> > +passing so there is no need to busy wait for the QMP monitor to become
> > +available::
> > +
> > +  #!/usr/bin/env python3
> > +  import os
> > +  import subprocess
> > +  import socket
> > +
> > +  sock_path = '/tmp/qmp-{}.sock'.format(os.getpid())
> 
> Not sure how much you worry about the insecure / easily guessable tmp
> path here.  I notice that there's already one in the surrounding
> documentation (/tmp/nbd.sock) so maybe it's not a problem :-)
> 
> > +  with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as listen_sock:
> > +      listen_sock.bind(sock_path)
> > +      listen_sock.listen()
> > +
> > +      fd = listen_sock.fileno()
> > +
> > +      subprocess.Popen(
> > +          ['qemu-storage-daemon',
> > +           '--chardev', f'socket,fd={fd},server=on,id=char1',
> > +           '--monitor', 'chardev=char1'],
> > +          pass_fds=[fd],
> > +      )
> > +
> > +  qmp_sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
> > +  qmp_sock.connect(sock_path)
> 
> A note that the order of opening the sockets is slightly different
> from how I did it in the interop test.  But I believe it makes no
> difference, as long as you don't connect to the socket until it's in
> the listening state, which is what you're doing here.  So it should be
> fine.

Nothing here is closing listen_sock in the parent though.

The trick of passing the listener FD into the child relies on the
listener being closed in the parent, so that the parent can get
a socket error if the child exits abnormally during startup. Keeping
the listen socket open means the parent will wait forever for an
accept() that never comes.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


