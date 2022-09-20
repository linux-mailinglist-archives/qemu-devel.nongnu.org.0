Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B985BEE68
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 22:23:39 +0200 (CEST)
Received: from localhost ([::1]:50612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oajmN-0003kX-4B
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 16:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1oafa9-0000yw-RT
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:54:52 -0400
Received: from forwardcorp1o.mail.yandex.net ([2a02:6b8:0:1a2d::193]:60094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1oafa4-00043O-KP
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 11:54:43 -0400
Received: from iva8-3a65cceff156.qloud-c.yandex.net
 (iva8-3a65cceff156.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:2d80:0:640:3a65:ccef])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id E55C32E122F;
 Tue, 20 Sep 2022 18:46:42 +0300 (MSK)
Received: from rvkaganb (unknown [2a02:6b8:0:419:7359:4dc3:71d:4c5a])
 by iva8-3a65cceff156.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 vqYHV2L26b-kfPiip51; Tue, 20 Sep 2022 18:46:42 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1663688802; bh=eZ6Nhl3L416tbfKFZJ9RwjFTbtMiF1Jj1k84AAJhzCA=;
 h=In-Reply-To:Cc:Message-ID:Subject:Date:References:To:From;
 b=BpW/PNN9+Mm0NsAESIomiYiXEMgxQJtKp8a9XZr2WOAq90qUKLAd0dGx1dCXx3Bqx
 cPw5b3HoHpnKUVlpf7wtgyTWf0fme7oyGa47lIivuBv/g1oradlYbwOkyQfKqczoVs
 5fvkhgAgjC7OMy+rTGkTFNYynTJbnQaSjALJq1ms=
Authentication-Results: iva8-3a65cceff156.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Date: Tue, 20 Sep 2022 18:46:40 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 eblake@redhat.com, eduardo@habkost.net, berrange@redhat.com,
 pbonzini@redhat.com, mst@redhat.com, yc-core@yandex-team.ru
Subject: Re: [PATCH] virtio: add VIRTQUEUE_ERROR QAPI event
Message-ID: <YyngYCZ0JBT/r877@rvkaganb>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 eblake@redhat.com, eduardo@habkost.net, berrange@redhat.com,
 pbonzini@redhat.com, mst@redhat.com, yc-core@yandex-team.ru
References: <20220919194805.195952-1-vsementsov@yandex-team.ru>
 <87czbqw1aq.fsf@pond.sub.org>
 <fefba94b-03c3-4c43-55bb-032740f4bd47@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fefba94b-03c3-4c43-55bb-032740f4bd47@yandex-team.ru>
Received-SPF: pass client-ip=2a02:6b8:0:1a2d::193;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 20, 2022 at 06:10:08PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> On 9/20/22 17:47, Markus Armbruster wrote:
> > Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> writes:
> > 
> > > For now we only log the vhost device error, when virtqueue is actually
> > > stopped. Let's add a QAPI event, which makes possible:
> > > 
> > >   - collect statistics of such errors
> > >   - make immediate actions: take coredums or do some other debugging

+ inform the user through a management API or UI, so that (s)he can
  react somehow, e.g. reset the device driver in the guest or even build
  up some automation to do so

Note that basically every inconsistency discovered during virtqueue
processing results in a silent virtqueue stop.  The guest then just sees
the requests getting stuck somewhere in the device for no visible
reason.  This event provides a means to inform the management layer of
this situation in a timely fashion.

> > 
> > Core dumps, I presume.
> > 
> > Is QMP the right tool for the job?  Or could a trace point do?
> 
> Management tool already can collect QMP events. So, if we want to
> forward some QMP events to other subsystems (to immediately inform
> support team, or to update some statistics) it's simple to realize for
> QMP events. But I'm not sure how to do it for trace-events.. Scanning
> trace logs is not convenient.

Right.  Trace points are a debugging tool: when you expect the problem
to reproduce, you activate them and watch the logs.  On the contrary,
QMP events can trigger some logic in the management layer and provide
for some recovery action.

> > > +##
> > > +# @VIRTQUEUE_ERROR:
> > > +#
> > > +# Emitted when a device virtqueue fails in runtime.
> > > +#
> > > +# @device: the device's ID if it has one
> > > +# @path: the device's QOM path
> > > +# @virtqueue: virtqueue index
> > > +# @error: error identifier
> > > +# @description: human readable description
> > > +#
> > > +# Since: 7.2
> > > +##
> > > +{ 'event': 'VIRTQUEUE_ERROR',
> > > + 'data': { '*device': 'str', 'path': 'str', 'virtqueue': 'int',
> > > +            'error': 'VirtqueueError', 'description': 'str'} }
> > 
> > Can the guest trigger the event?
> 
> Yes, but as I understand, only once per virtqueue.

Right, in the sense that every relevant dataplane implementation would
stop the virtqueue on such an error, so in order to trigger a new one
the driver would need to reset the device first.  I guess rate-limiting
is unnecessary here.

Thanks,
Roman.

