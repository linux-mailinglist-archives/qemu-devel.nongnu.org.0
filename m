Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBE05531A0
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 14:05:51 +0200 (CEST)
Received: from localhost ([::1]:39756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3cdh-0005lF-Qp
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 08:05:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1o3cb9-0004Hd-5f
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 08:03:11 -0400
Received: from forwardcorp1j.mail.yandex.net ([5.45.199.163]:55454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1o3cb4-0004om-Dh
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 08:03:09 -0400
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 824242E1FBB;
 Tue, 21 Jun 2022 15:02:59 +0300 (MSK)
Received: from myt6-81d8ab6a9f9d.qloud-c.yandex.net
 (myt6-81d8ab6a9f9d.qloud-c.yandex.net [2a02:6b8:c12:520a:0:640:81d8:ab6a])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 Q5DJtUpsZm-2wJ4Y0cS; Tue, 21 Jun 2022 15:02:59 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1655812979; bh=gYUJeVL5mM1xYDqxB+GpUMuiXy4zicRuZMwLD02oLA4=;
 h=In-Reply-To:Subject:Cc:Date:References:To:From:Message-ID;
 b=ViLVfAf2ea9ICVsuFk0cyMxZE8r4MEDWmGEpZKTJq1YRC052/2AgTeJdfQLQgbP/i
 y0SzDZRXgYPVoKmzYiRFcAmRWauTen8ehQbOqMBO93w9/mh6V24iRA+Kmn2po3mmp1
 NQVh+zB1QHCFdfcJoeEZbpEqnCqKNofiFMeuAyGE=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from rvkaganb (unknown [2a02:6b8:b081:a404::1:2])
 by myt6-81d8ab6a9f9d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 8shE2vpcda-2wMGOemr; Tue, 21 Jun 2022 15:02:58 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Tue, 21 Jun 2022 15:02:56 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Markus Armbruster <armbru@redhat.com>
Cc: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@gmail.com>, Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 1/4] qdev: add DEVICE_RUNTIME_ERROR event
Message-ID: <YrGzcCPp1kb6RaLl@rvkaganb>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 Markus Armbruster <armbru@redhat.com>,
 Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@gmail.com>,
 Eric Blake <eblake@redhat.com>
References: <165296995578.196133.16183155555450040914.stgit@buzz>
 <87zgj5hog8.fsf@pond.sub.org> <YpDI5IMRzTbDu93A@rvkaganb>
 <87sforb6pa.fsf@pond.sub.org> <YpTdAPAo8RGD735z@rvkaganb>
 <YrB60nlxNeelb6r0@rvkaganb> <87y1xqs02a.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y1xqs02a.fsf@pond.sub.org>
Received-SPF: pass client-ip=5.45.199.163; envelope-from=rvkagan@yandex-team.ru;
 helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Jun 21, 2022 at 01:55:25PM +0200, Markus Armbruster wrote:
> Roman Kagan <rvkagan@yandex-team.ru> writes:
> 
> > On Mon, May 30, 2022 at 06:04:32PM +0300, Roman Kagan wrote:
> >> On Mon, May 30, 2022 at 01:28:17PM +0200, Markus Armbruster wrote:
> >> > Roman Kagan <rvkagan@yandex-team.ru> writes:
> >> > 
> >> > > On Wed, May 25, 2022 at 12:54:47PM +0200, Markus Armbruster wrote:
> >> > >> Konstantin Khlebnikov <khlebnikov@yandex-team.ru> writes:
> >> > >> 
> >> > >> > This event represents device runtime errors to give time and
> >> > >> > reason why device is broken.
> >> > >> 
> >> > >> Can you give an or more examples of the "device runtime errors" you have
> >> > >> in mind?
> >> > >
> >> > > Initially we wanted to address a situation when a vhost device
> >> > > discovered an inconsistency during virtqueue processing and silently
> >> > > stopped the virtqueue.  This resulted in device stall (partial for
> >> > > multiqueue devices) and we were the last to notice that.
> >> > >
> >> > > The solution appeared to be to employ errfd and, upon receiving a
> >> > > notification through it, to emit a QMP event which is actionable in the
> >> > > management layer or further up the stack.
> >> > >
> >> > > Then we observed that virtio (non-vhost) devices suffer from the same
> >> > > issue: they only log the error but don't signal it to the management
> >> > > layer.  The case was very similar so we thought it would make sense to
> >> > > share the infrastructure and the QMP event between virtio and vhost.
> >> > >
> >> > > Then Konstantin went a bit further and generalized the concept into
> >> > > generic "device runtime error".  I'm personally not completely convinced
> >> > > this generalization is appropriate here; we'd appreciate the opinions
> >> > > from the community on the matter.
> >> > 
> >> > "Device emulation sending an even on entering certain error states, so
> >> > that a management application can do something about it" feels
> >> > reasonable enough to me as a general concept.
> >> > 
> >> > The key point is of course "can do something": the event needs to be
> >> > actionable.  Can you describe possible actions for the cases you
> >> > implement?
> >> 
> >> The first one that we had in mind was informational, like triggering an
> >> alert in the monitoring system and/or painting the VM as malfunctioning
> >> in the owner's UI.
> >> 
> >> There can be more advanced scenarios like autorecovery by resetting the
> >> faulty VM, or fencing it if it's a cluster member.
> >
> > The discussion kind of stalled here.
> 
> My apologies...
> 
> >                                       Do you think the approach makes
> > sense or not?  Should we try and resubmit the series with a proper cover
> > letter and possibly other improvements or is it a dead end?
> 
> As QAPI schema maintainer, my concern is interface design.  To sell this
> interface to me (so to speak), you have to show it's useful and
> reasonably general.  Reasonably general, because we don't want to
> accumulate one-offs, even if they have their uses.
> 
> I think this is mostly a matter of commit message(s) and documentation
> here.  Explain your intended use cases.  Maybe hand-wave at other use
> cases you can think of.  Document that you're implementing the event
> only for the specific errors you need, but that it could be implemented
> more widely as needed.  "Complete" feels impractical, though.
> 
> Makes sense?

Absolutely.  We'll rework and resubmit the series addressing the issues
you've noted, and we'll see how it goes.

Thanks,
Roman.

