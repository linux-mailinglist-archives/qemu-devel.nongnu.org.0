Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85590551D67
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 15:56:26 +0200 (CEST)
Received: from localhost ([::1]:36440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3HtB-0001M1-3Y
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 09:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1o3HrC-0000WB-03
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 09:54:22 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:57822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1o3Hr7-0004uL-5i
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 09:54:20 -0400
Received: from iva5-51baefb7689f.qloud-c.yandex.net
 (iva5-51baefb7689f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:69d:0:640:51ba:efb7])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 5664B2E1222;
 Mon, 20 Jun 2022 16:49:08 +0300 (MSK)
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net [2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by iva5-51baefb7689f.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 mlixkhEaIo-n7K4UOBL; Mon, 20 Jun 2022 16:49:08 +0300
X-Yandex-Fwd: 2
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1655732948; bh=VW4jczBlzPW7u+WnViM8Caw81Zq6j6mZ/Tk+fN2g6K8=;
 h=In-Reply-To:Subject:Cc:Date:References:To:From:Message-ID;
 b=UpeaARCoH7+xkmdmxnPpBlcuoxKd0Ucg+g5vym3joryIM/2DO/6aPGiKdhDPHOZLg
 m2W2DABhMC6eTrgLIvju6EELTgsUIdoU4+fDwJnBIlNRo+i7Meax1JxEUugZ/YME/j
 a+qa2vLtdqw0175dIILAIZZ5Ni3u1cdHLzd8OolI=
Authentication-Results: iva5-51baefb7689f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from rvkaganb (unknown [2a02:6b8:b081:b597::1:1d])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 dvI0qKWP2T-n7MaCVeV; Mon, 20 Jun 2022 16:49:07 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Mon, 20 Jun 2022 16:49:06 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: Markus Armbruster <armbru@redhat.com>
Cc: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
 qemu-devel@nongnu.org, yc-core@yandex-team.ru,
 Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@gmail.com>, Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 1/4] qdev: add DEVICE_RUNTIME_ERROR event
Message-ID: <YrB60nlxNeelb6r0@rvkaganb>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YpTdAPAo8RGD735z@rvkaganb>
Received-SPF: pass client-ip=77.88.29.217; envelope-from=rvkagan@yandex-team.ru;
 helo=forwardcorp1p.mail.yandex.net
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

On Mon, May 30, 2022 at 06:04:32PM +0300, Roman Kagan wrote:
> On Mon, May 30, 2022 at 01:28:17PM +0200, Markus Armbruster wrote:
> > Roman Kagan <rvkagan@yandex-team.ru> writes:
> > 
> > > On Wed, May 25, 2022 at 12:54:47PM +0200, Markus Armbruster wrote:
> > >> Konstantin Khlebnikov <khlebnikov@yandex-team.ru> writes:
> > >> 
> > >> > This event represents device runtime errors to give time and
> > >> > reason why device is broken.
> > >> 
> > >> Can you give an or more examples of the "device runtime errors" you have
> > >> in mind?
> > >
> > > Initially we wanted to address a situation when a vhost device
> > > discovered an inconsistency during virtqueue processing and silently
> > > stopped the virtqueue.  This resulted in device stall (partial for
> > > multiqueue devices) and we were the last to notice that.
> > >
> > > The solution appeared to be to employ errfd and, upon receiving a
> > > notification through it, to emit a QMP event which is actionable in the
> > > management layer or further up the stack.
> > >
> > > Then we observed that virtio (non-vhost) devices suffer from the same
> > > issue: they only log the error but don't signal it to the management
> > > layer.  The case was very similar so we thought it would make sense to
> > > share the infrastructure and the QMP event between virtio and vhost.
> > >
> > > Then Konstantin went a bit further and generalized the concept into
> > > generic "device runtime error".  I'm personally not completely convinced
> > > this generalization is appropriate here; we'd appreciate the opinions
> > > from the community on the matter.
> > 
> > "Device emulation sending an even on entering certain error states, so
> > that a management application can do something about it" feels
> > reasonable enough to me as a general concept.
> > 
> > The key point is of course "can do something": the event needs to be
> > actionable.  Can you describe possible actions for the cases you
> > implement?
> 
> The first one that we had in mind was informational, like triggering an
> alert in the monitoring system and/or painting the VM as malfunctioning
> in the owner's UI.
> 
> There can be more advanced scenarios like autorecovery by resetting the
> faulty VM, or fencing it if it's a cluster member.

The discussion kind of stalled here.  Do you think the approach makes
sense or not?  Should we try and resubmit the series with a proper cover
letter and possibly other improvements or is it a dead end?

Thanks,
Roman.

