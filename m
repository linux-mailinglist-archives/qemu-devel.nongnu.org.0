Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9D4454920
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 15:47:44 +0100 (CET)
Received: from localhost ([::1]:56734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnMDv-0003RG-Dw
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 09:47:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mnMCm-0002N1-0c
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:46:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mnMCi-0000d5-LP
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:46:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637160388;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=smEZ1/pdrC6k4DK218s69AL6Y2CI25CKISa/c8K4aS4=;
 b=DYAAEUvbNSF7S+yNwT0dJi+mF/0l/YLeSeQMAtzP0rWEnFLlIosS/DLaQhimJWAwsn06sl
 +PpfaDpBv1lsyHXNdD+R6GaeHO3BfDQFrBI5kJo331Id+4eqW94gEmpGR3TZx0mei0nxeq
 vJXSGs0ehRqSvEBxRkGWllFNK6zTeCY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-Zkz37Gb-OhupnCjiklPsjw-1; Wed, 17 Nov 2021 09:46:26 -0500
X-MC-Unique: Zkz37Gb-OhupnCjiklPsjw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9EBD87D542;
 Wed, 17 Nov 2021 14:46:25 +0000 (UTC)
Received: from redhat.com (unknown [10.22.16.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95F1E60BF1;
 Wed, 17 Nov 2021 14:46:24 +0000 (UTC)
Date: Wed, 17 Nov 2021 14:46:22 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: Failing QEMU iotests
Message-ID: <YZUVvs9/iWzJtEQ/@redhat.com>
References: <a3273a3c-c294-6340-7ea7-73e5696c7b2e@redhat.com>
 <fabb0f91-48d4-47f7-562e-395f0acf4b81@redhat.com>
 <fc5a6743-8d0b-58a0-00d1-169bb87691f7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <fc5a6743-8d0b-58a0-00d1-169bb87691f7@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 17, 2021 at 01:50:12PM +0100, Thomas Huth wrote:
> On 17/11/2021 11.59, Hanna Reitz wrote:
> > On 17.11.21 11:07, Thomas Huth wrote:
> > > 
> > >  Hi!
> > > 
> > > I think it has been working fine for me a couple of weeks ago,
> > > but when I now run:
> > > 
> > >  make check SPEED=slow
> > > 
> > > I'm getting a couple of failing iotests... not sure whether
> > > these are known issues already, so I thought I'd summarize them
> > > here:
> ...
> > > --- /home/thuth/devel/qemu/tests/qemu-iotests/206.out
> > > +++ 206.out.bad
> > > @@ -99,55 +99,19 @@
> > > 
> > >  {"execute": "blockdev-create", "arguments": {"job-id": "job0",
> > > "options": {"driver": "qcow2", "encrypt": {"cipher-alg":
> > > "twofish-128", "cipher-mode": "ctr", "format": "luks", "hash-alg":
> > > "sha1", "iter-time": 10, "ivgen-alg": "plain64", "ivgen-hash-alg":
> > > "md5", "key-secret": "keysec0"}, "file": {"driver": "file",
> > > "filename": "TEST_DIR/PID-t.qcow2"}, "size": 33554432}}}
> > >  {"return": {}}
> > > +Job failed: Unsupported cipher algorithm twofish-128 with ctr mode
> > >  {"execute": "job-dismiss", "arguments": {"id": "job0"}}
> > >  {"return": {}}
> > > 
> > >  image: TEST_IMG
> > >  file format: IMGFMT
> > >  virtual size: 32 MiB (33554432 bytes)
> > > -encrypted: yes
> > >  cluster_size: 65536
> > >  Format specific information:
> > >      compat: 1.1
> > >      compression type: zlib
> > >      lazy refcounts: false
> > >      refcount bits: 16
> > > -    encrypt:
> > > -        ivgen alg: plain64
> > > -        hash alg: sha1
> > > -        cipher alg: twofish-128
> > > -        uuid: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
> > > -        format: luks
> > > -        cipher mode: ctr
> > > -        slots:
> > > -            [0]:
> > > -                active: true
> > > -                iters: XXX
> > > -                key offset: 4096
> > > -                stripes: 4000
> > > -            [1]:
> > > -                active: false
> > > -                key offset: 69632
> > > -            [2]:
> > > -                active: false
> > > -                key offset: 135168
> > > -            [3]:
> > > -                active: false
> > > -                key offset: 200704
> > > -            [4]:
> > > -                active: false
> > > -                key offset: 266240
> > > -            [5]:
> > > -                active: false
> > > -                key offset: 331776
> > > -            [6]:
> > > -                active: false
> > > -                key offset: 397312
> > > -            [7]:
> > > -                active: false
> > > -                key offset: 462848
> > > -        payload offset: 528384
> > > -        master key iters: XXX
> > >      corrupt: false
> > >      extended l2: false
> > 
> > I doubt this worked a couple of weeks ago, but it’s definitely one that
> > we should just get around to fixing. :/
> 
> Hm, maybe I've did the successful run on a different system last time ... I
> even slightly remember now having seen this before in the past on my current
> system, so yes, likely not something new.

Triggered by me switching QEMU to prefer GNUTLS for crypto by default
in 6.1, as it doesn't bother to support obscure crypto algs that no
one uses in practice for LUKS.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


