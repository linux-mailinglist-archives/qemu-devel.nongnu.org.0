Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE7B2C2EA5
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 18:34:08 +0100 (CET)
Received: from localhost ([::1]:40784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khcCd-0002gh-TM
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 12:34:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1khc8Q-0001Qk-N8
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:29:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1khc8J-0003rD-Il
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 12:29:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606238978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0xbmULjSBlF1/fldx1No4mtW934e3EqoLJO/Fqj2eYE=;
 b=ST+Y6QFlpO+E2Cgl9jx6GcKSMddg45n+ptNa8ZuGSoUMW9VOcvDpxIkaZIQdLv6G/nNzxz
 eKXBQE4WpltGlbLexEN1FAN506tKmqhgVfFkwuWxAKRH6W7te9GZxWQlbx2oYD2dOYU3UH
 6qEawhM5+g4frevfzChb+gKCgspQmzY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-hybAW8C5MyS5pOdi92CTHQ-1; Tue, 24 Nov 2020 12:29:34 -0500
X-MC-Unique: hybAW8C5MyS5pOdi92CTHQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 296868042C7;
 Tue, 24 Nov 2020 17:29:33 +0000 (UTC)
Received: from work-vm (ovpn-115-42.ams2.redhat.com [10.36.115.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AB4D4D;
 Tue, 24 Nov 2020 17:29:17 +0000 (UTC)
Date: Tue, 24 Nov 2020 17:29:14 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC v3] VFIO Migration
Message-ID: <20201124172914.GL3366@work-vm>
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
 <MW2PR02MB372398B3CD4B91201A9D84558BE80@MW2PR02MB3723.namprd02.prod.outlook.com>
 <20201116152418.GG96297@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20201116152418.GG96297@stefanha-x1.localdomain>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: John G Johnson <john.g.johnson@oracle.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "mtsirkin@redhat.com" <mtsirkin@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "quintela@redhat.com" <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Zeng, Xin" <xin.zeng@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 John Levon <levon@movementarian.org>, Yan Zhao <yan.y.zhao@intel.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Felipe Franciosi <felipe@nutanix.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 "changpeng.liu@intel.com" <changpeng.liu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> On Wed, Nov 11, 2020 at 04:18:34PM +0000, Thanos Makatos wrote:
> > 
> > > VFIO Migration
> > > ==============
> > > This document describes how to ensure migration compatibility for VFIO
> > > devices,
> > > including mdev and vfio-user devices.
> > 
> > Is this something all VFIO/user devices will have to support? If it's not
> > mandatory, how can a device advertise support?
> 
> The --print-migration-info-json command-line option described below must
> be implemented by the vfio-user device emulation program. Similarly,
> VFIO/mdev devices must provide the migration/ sysfs group.
> 
> If the device implementation does not expose these standard interfaces
> then management tools can still attempt to migrate them, but there is no
> migration compatibility check or algorithm for setting up the
> destination device. In other words, it will only succeed with some luck
> or by hardcoding knowledge of the specific device implementation into
> the management tool.
> 
> > 
> > > Multiple device implementations can support the same device model. Doing
> > > so
> > > means that the device implementations can offer migration compatiblity
> > > because
> > > they support the same hardware interface, device state representation, and
> > > migration parameters.
> > 
> > Does the above mean that a passthrough function can be migrated to a vfio-user
> > program and vice versa? If so, then it's worth mentioning.
> 
> Yes, if they are migration compatible (they support the same device
> model and migration parameters) then migration is possible. I'll make
> this clear in the next revision.
> 
> Note VFIO migration is currently only working for mdev devices. Alex
> Williamson mentioned that it could be extended to core VFIO PCI devices
> (without mdev) in the future.
> 
> > > More complex device emulation programs may host multiple devices. The
> > > interface
> > > for configuring these device emulation programs is not standardized.
> > > Therefore,
> > > migrating these devices is beyond the scope of this document.
> > 
> > Most likely a device emulation program hosting multile devices would allow
> > some form of communication for control purposes (e.g. SPDK implements a JSON-RPC
> > server). So maybe it's possible to define interacting with such programs in
> > this document?
> 
> Yes, it's definitely possible. There needs to be agreement on the RPC
> mechanism. QEMU implements QMP, SPDK has something similar but
> different, gRPC/Protobuf is popular, and D-Bus is another alternative. I
> asked about RPC mechanisms on the muser Slack instance to see if there
> was consensus but it seems to be a bit early for that.
> 
> Perhaps the most realistic option will be to define bindings to several
> RPC mechanisms. That way everyone can use their preferred RPC mechanism,
> at the cost of requiring management tools to support more than one
> (which some already do, e.g. libvirt uses XDR itself but also implements
> QEMU's QMP).
> 
> > > 
> > > The migration information JSON is printed to standard output by a vfio-user
> > > device emulation program as follows:
> > > 
> > > .. code:: bash
> > > 
> > >   $ my-device --print-migration-info-json
> > > 
> > > The device is instantiated by launching the destination process with the
> > > migration parameter list from the source:
> > 
> > Must 'my-device --print-migration-info-json' always generate the same migration
> > information JSON? If so, then what if the output generated by
> > 'my-device --print-migration-info-json' depends on additional arguments passed
> > to 'my-device' when it was originally started?
> 
> Yes, it needs to be stable in the sense that you can invoke the program
> with --print-migration-info-json and then expect launching the program
> to succeed with migration parameters that are valid according to the
> JSON.
> 
> Running the same device emulation binary on different hosts can produce
> different JSON. This is because the binary may rely on host hardware
> resources or features (e.g. does this host have GPUs available?).
> 
> It gets trickier when considering host reboots. I think the JSON can
> change between reboots. However, the management tools may cache the JSON
> so there needs to be a rule about when to refresh it.

libvirt does something similar for QEMU's current capabilities; it
normally works fine; very occasionally you have to flush the cache
though if you do something surprising which causes it to change
capabilities.

Dave

> Regarding additional command-line arguments, they can affect the JSON
> output. For example, they could include the connection details to an
> iSCSI LUN and affect the block size migration parameter. This leads to
> the same issue - can they be cached by the management tool? The answer
> is the same - stability is needed in the short-term to avoid unexpected
> failures when launching the program, but over the longer term we should
> allow JSON changes.
> 
> Thanks for raising these points. I'll add details to the next revision.
> 
> Stefan


-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


