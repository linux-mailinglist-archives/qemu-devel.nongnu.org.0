Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FD0508370
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 10:31:14 +0200 (CEST)
Received: from localhost ([::1]:47130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nh5k1-0000su-C6
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 04:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nh5ZQ-0001AK-AJ
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 04:20:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nh5ZN-0003GZ-6M
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 04:20:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650442811;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NydFK4e1f4iBVC6xB9MczMHR4OUBS5h4vPJEmSW+Hm8=;
 b=eq5Lh8rzVFvDde8uAbRtkn4iaVwDKy7jzbDCWtqdFEgyp4ruT6D8+SGewy7SKj4cbhGMu4
 b7lwylKW8qXWB8ANENlIebmSOx4jDN/F0JSm3+02JEMTrInjN0ZVXLNa3t5NOItB3bBFfK
 7zBOf29q5QGtcSwudpP2eACoMakvbgA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-O0jFnDfpOb6TXlKgcwAyZA-1; Wed, 20 Apr 2022 04:20:08 -0400
X-MC-Unique: O0jFnDfpOb6TXlKgcwAyZA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B96738041C8;
 Wed, 20 Apr 2022 08:20:08 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0498F401E4E;
 Wed, 20 Apr 2022 08:20:04 +0000 (UTC)
Date: Wed, 20 Apr 2022 09:20:02 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 1/2] python/machine.py: upgrade vm.command() method
Message-ID: <Yl/CMgN4ITRYVbAy@redhat.com>
References: <20220408170214.45585-1-vsementsov@openvz.org>
 <20220408170214.45585-2-vsementsov@openvz.org>
 <Yl7miQpTpPeLhfrK@redhat.com>
 <CAFn=p-Ym3_irrG_p8Wb5bmw9SQ3AOy+fAXMP3Qwm-uMLZVJwOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFn=p-Ym3_irrG_p8Wb5bmw9SQ3AOy+fAXMP3Qwm-uMLZVJwOA@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>,
 Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 vsementsov@openvz.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 19, 2022 at 01:08:06PM -0400, John Snow wrote:
> On Tue, Apr 19, 2022, 12:42 PM Daniel P. Berrangé <berrange@redhat.com>
> wrote:
> 
> > On Fri, Apr 08, 2022 at 08:02:13PM +0300, Vladimir Sementsov-Ogievskiy
> > wrote:
> > > The method is not popular, we prefer use vm.qmp() and then check
> > > success by hand.. But that's not optimal. To simplify movement to
> > > vm.command() support same interface improvements like in vm.qmp() and
> > > rename to shorter vm.cmd().
> > >
> > > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> > > ---
> > >  python/qemu/machine/machine.py | 16 ++++++++++++---
> > >  tests/qemu-iotests/256         | 34 ++++++++++++++++----------------
> > >  tests/qemu-iotests/257         | 36 +++++++++++++++++-----------------
> > >  3 files changed, 48 insertions(+), 38 deletions(-)
> > >
> > > diff --git a/python/qemu/machine/machine.py
> > b/python/qemu/machine/machine.py
> > > index 07ac5a710b..a3fb840b93 100644
> > > --- a/python/qemu/machine/machine.py
> > > +++ b/python/qemu/machine/machine.py
> > > @@ -648,14 +648,24 @@ def qmp(self, cmd: str,
> > >              self._quit_issued = True
> > >          return ret
> > >
> > > -    def command(self, cmd: str,
> > > -                conv_keys: bool = True,
> > > -                **args: Any) -> QMPReturnValue:
> > > +    def cmd(self, cmd: str,
> >
> > FYI, the original 'command' name matches semantics of 'command'
> > in the QEMUMonitorProtocol class.  The QEMUMonitorProtocol
> > class has a 'cmd' method that matches semantics of 'qmp' in
> > QEMUMachine.
> >
> > I think it is desirable to have consistency between naming in
> > the two classes.
> >
> 
> Broadly agree.
> 
> 
> > The current use of both 'cmd' and 'command' in QEMUMonitorProtocol
> > is horrible naming though. How is anyone supposed to remember which
> > name raises the exception and which doesn't ? Urgh.
> >
> 
> Also agree.
> 
> 
> > I agree with your desire to simplify things, but if anything I would
> > suggest we change both QEMUMonitorProtocol and QEMUMachine to have a
> > convention more like python's subprocess module:
> >
> >  - 'cmd' runs without error checking, just returning the
> >    reply data as is
> >
> >  - 'check_cmd' calls 'cmd' but raises an exception on error.
> >
> 
> Not sure I'm on board here, though.
> 
> For what it's worth, in async qmp I added a single method "execute()",
> mimicking the name of the field used over the wire. It uses semantics like
> command() here, in that it raises an exception on error and returns only
> the response data and not the entire QMP response.
> 
> I'm in favor of, broadly, an approach wherein the default behavior raises
> an exception and the caller must opt-in to squelch it; either via
> try-except or a check=False argument. It should be a conscious decision.

I'd be happy with a single 'cmd' method with 'check=False' to turn
off exceptions on demand.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


