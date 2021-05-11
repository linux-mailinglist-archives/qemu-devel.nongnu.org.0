Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2778D37A5B5
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 13:25:35 +0200 (CEST)
Received: from localhost ([::1]:36086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgQW6-000123-8g
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 07:25:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <movement@li1368-133.members.linode.com>)
 id 1lgPrw-00013J-IS
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:44:04 -0400
Received: from ssh.movementarian.org ([2a01:7e00::f03c:92ff:fefb:3ad2]:47728
 helo=movementarian.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <movement@li1368-133.members.linode.com>)
 id 1lgPru-0003FB-RB
 for qemu-devel@nongnu.org; Tue, 11 May 2021 06:44:04 -0400
Received: from movement by movementarian.org with local (Exim 4.93)
 (envelope-from <movement@li1368-133.members.linode.com>)
 id 1lgPrp-008G8C-Tr; Tue, 11 May 2021 10:43:57 +0000
Date: Tue, 11 May 2021 10:43:57 +0000
From: John Levon <levon@movementarian.org>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v8] introduce vfio-user protocol specification
Message-ID: <20210511104357.GA1964660@li1368-133.members.linode.com>
References: <20210414114122.236193-1-thanos.makatos@nutanix.com>
 <YJlmARxX5ZADZD5w@stefanha-x1.localdomain>
 <20210510222541.GA1916565@li1368-133.members.linode.com>
 <YJpX8XT+WvXYkyMD@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJpX8XT+WvXYkyMD@stefanha-x1.localdomain>
X-Url: http://www.movementarian.org/
Received-SPF: none client-ip=2a01:7e00::f03c:92ff:fefb:3ad2;
 envelope-from=movement@li1368-133.members.linode.com; helo=movementarian.org
X-Spam_score_int: 31
X-Spam_score: 3.1
X-Spam_bar: +++
X-Spam_report: (3.1 / 5.0 requ) BAYES_00=-1.9, FORGED_SPF_HELO=1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, KHOP_HELO_FCRDNS=0.398,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: benjamin.walker@intel.com, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John G Johnson <john.g.johnson@oracle.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Christophe de Dinechin <cdupontd@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, jag.raman@oracle.com,
 james.r.harris@intel.com, John Levon <john.levon@nutanix.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Kanth.Ghatraju@oracle.com,
 Felipe Franciosi <felipe@nutanix.com>, marcandre.lureau@redhat.com,
 Yan Zhao <yan.y.zhao@intel.com>, konrad.wilk@oracle.com,
 yuvalkashtan@gmail.com, dgilbert@redhat.com, eafanasova@gmail.com,
 ismael@linux.com, Paolo Bonzini <pbonzini@redhat.com>, changpeng.liu@intel.com,
 tomassetti.andrea@gmail.com, mpiszczek@ddn.com,
 Cornelia Huck <cohuck@redhat.com>, alex.williamson@redhat.com,
 tina.zhang@intel.com, xiuchun.lu@intel.com,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 11, 2021 at 11:09:53AM +0100, Stefan Hajnoczi wrote:

> > > > +* *sub-regions* is the array of Sub-Region IO FD info structures
> > > > +
> > > > +The reply message will additionally include at least one file descriptor in the
> > > > +ancillary data. Note that more than one sub-region may share the same file
> > > > +descriptor.
> > > 
> > > How does this interact with the maximum number of file descriptors,
> > > max_fds? It is possible that there are more sub-regions than max_fds
> > > allows...
> > 
> > I think this would just be a matter of the client advertising a reasonably large
> > enough size for max_msg_fds. Do we need to worry about this?
> 
> vhost-user historically only supported passing 8 fds and it became a
> problem there.
> 
> I can imagine devices having 10s to 100s of sub-regions (e.g. 64 queue
> doorbells). Probably not 1000s.
> 
> If I was implementing a server I would check the negotiated max_fds and
> refuse to start the vfio-user connection if the device has been
> configured to require more sub-regions. Failing early and printing an
> error would allow users to troubleshoot the issue and re-configure the
> client/server.
> 
> This seems okay but the spec doesn't mention it explicitly so I wanted
> to check what you had in mind.

Not for the spec, but I filed https://github.com/nutanix/libvfio-user/issues/489
to track this on the library side. Thanks.

> Fleshing out irqs sounds like a 1.0 milestone to me. It will definitely
> be necessary but for now this can be dropped.

I could be wrong, and probably am, but I believe we're basically fine for IRQs
right now, until we want to support servers on separate hosts where we'll
obviously have to re-introduce something like the VM_INTERRUPT message.

> > > > +VFIO_USER_DEVICE_RESET
> > > > +----------------------
> > > 
> > > Any requirements for how long VFIO_USER_DEVICE_RESET takes to complete?
> > > In some cases a reset involves the server communicating with other
> > > systems or components and this can take an unbounded amount of time.
> > > Therefore this message could hang. For example, if a vfio-user NVMe
> > > device was accessing data on a hung NFS export and there were I/O
> > > requests in flight that need to be aborted.
> > 
> > I'm not sure this is something we could put in the generic spec. Perhaps a
> > caveat?
> 
> It's up to you whether you want to discuss this in the spec or let
> client implementors figure it out themselves. Any vfio-user message can
> take an unbounded amount of time and we could assume that readers will
> think of this.

I'm going to start an "implementation notes" section.

regards
john

