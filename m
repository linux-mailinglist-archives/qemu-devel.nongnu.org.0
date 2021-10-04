Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4C4421A84
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 01:20:29 +0200 (CEST)
Received: from localhost ([::1]:40314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXXG0-00008S-A7
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 19:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mXXEU-0007R8-GM; Mon, 04 Oct 2021 19:18:54 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:44846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1mXXEP-00034J-Q2; Mon, 04 Oct 2021 19:18:52 -0400
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id D345E2E048D;
 Tue,  5 Oct 2021 02:18:42 +0300 (MSK)
Received: from myt6-76f0a6db1a7e.qloud-c.yandex.net
 (2a02:6b8:c12:422d:0:640:76f0:a6db [2a02:6b8:c12:422d:0:640:76f0:a6db])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 JI5Bin8ngo-Igtu6K1f; Tue, 05 Oct 2021 02:18:42 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1633389522; bh=Il7SOTUu5WMtq4Bgwog08F7VjW+Fwid6VTuUlA9OSVU=;
 h=In-Reply-To:Message-ID:Subject:Date:References:To:From:Cc;
 b=uUepGnCY1Rc5nIocr3lsdvmRZ66Du5L/oC9HmVGVadlKu30lBPmBcV+f0tJnVxaIX
 kKYoD4LiLkt4supnnlDiQnBxNAocu+c5smWZG+r9f1+wSL0W13UCLhXilOSW0pwQU4
 Cp8Rtg4RzAEylCYBhUw62LiIjVUf54qk2ybVjdu8=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from rvkaganb.lan (2a02:6b8:b081:1317::1:c [2a02:6b8:b081:1317::1:c])
 by myt6-76f0a6db1a7e.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPS id
 3OM03jikDL-Ig04iPjV; Tue, 05 Oct 2021 02:18:42 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Tue, 5 Oct 2021 02:18:40 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v0 0/2] virtio-blk and vhost-user-blk cross-device
 migration
Message-ID: <YVuL0FRN5ilRN2Pd@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Denis Plotnikov <den-plotnikov@yandex-team.ru>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org,
 raphael.norwitz@nutanix.com, kwolf@redhat.com,
 yc-core@yandex-team.ru
References: <20211004150731.191270-1-den-plotnikov@yandex-team.ru>
 <20211004110855-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211004110855-mutt-send-email-mst@kernel.org>
Received-SPF: pass client-ip=77.88.29.217; envelope-from=rvkagan@yandex-team.ru;
 helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 raphael.norwitz@nutanix.com, Denis Plotnikov <den-plotnikov@yandex-team.ru>,
 yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 04, 2021 at 11:11:00AM -0400, Michael S. Tsirkin wrote:
> On Mon, Oct 04, 2021 at 06:07:29PM +0300, Denis Plotnikov wrote:
> > It might be useful for the cases when a slow block layer should be replaced
> > with a more performant one on running VM without stopping, i.e. with very low
> > downtime comparable with the one on migration.
> > 
> > It's possible to achive that for two reasons:
> > 
> > 1.The VMStates of "virtio-blk" and "vhost-user-blk" are almost the same.
> >   They consist of the identical VMSTATE_VIRTIO_DEVICE and differs from
> >   each other in the values of migration service fields only.
> > 2.The device driver used in the guest is the same: virtio-blk
> > 
> > In the series cross-migration is achieved by adding a new type.
> > The new type uses virtio-blk VMState instead of vhost-user-blk specific
> > VMstate, also it implements migration save/load callbacks to be compatible
> > with migration stream produced by "virtio-blk" device.
> > 
> > Adding the new type instead of modifying the existing one is convenent.
> > It ease to differ the new virtio-blk-compatible vhost-user-blk
> > device from the existing non-compatible one using qemu machinery without any
> > other modifiactions. That gives all the variety of qemu device related
> > constraints out of box.
> 
> Hmm I'm not sure I understand. What is the advantage for the user?
> What if vhost-user-blk became an alias for vhost-user-virtio-blk?
> We could add some hacks to make it compatible for old machine types.

The point is that virtio-blk and vhost-user-blk are not
migration-compatible ATM.  OTOH they are the same device from the guest
POV so there's nothing fundamentally preventing the migration between
the two.  In particular, we see it as a means to switch between the
storage backend transports via live migration without disrupting the
guest.

Migration-wise virtio-blk and vhost-user-blk have in common

- the content of the VMState -- VMSTATE_VIRTIO_DEVICE

The two differ in

- the name and the version of the VMStateDescription

- virtio-blk has an extra migration section (via .save/.load callbacks
  on VirtioDeviceClass) containing requests in flight

It looks like to become migration-compatible with virtio-blk,
vhost-user-blk has to start using VMStateDescription of virtio-blk and
provide compatible .save/.load callbacks.  It isn't entirely obvious how
to make this machine-type-dependent, so we came up with a simpler idea
of defining a new device that shares most of the implementation with the
original vhost-user-blk except for the migration stuff.  We're certainly
open to suggestions on how to reconcile this under a single
vhost-user-blk device, as this would be more user-friendly indeed.

We considered using a class property for this and defining the
respective compat clause, but IIUC the class constructors (where .vmsd
and .save/.load are defined) are not supposed to depend on class
properties.

Thanks,
Roman.

