Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FB340DA3A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 14:43:56 +0200 (CEST)
Received: from localhost ([::1]:43550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQqk7-0005U3-I2
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 08:43:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mQqhe-0003j4-Ew
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 08:41:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mQqha-0007rM-1r
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 08:41:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631796076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pfLQXE8EDK8px8qgDQUPa6qZlD+62//WpNZQx26y7WE=;
 b=dmJiIqF4WifH8tyhx/9Lwo5T5DExxdH9MsGYj/0378Mqc7+WViza7RQkSgEHiWVk4wyEmj
 ucz9lVPzZUgBNmiUAkCTf2vpb0GuQQ/2Tz79sw7R1VLXrnmGqzdMVFnUn/ZpNH17g6wHZ6
 pJzPrzkR3P+3hnGoOI+i5q5GJ27OB4s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-1iPBJfsVPtWXZgF7GAKWBA-1; Thu, 16 Sep 2021 08:41:15 -0400
X-MC-Unique: 1iPBJfsVPtWXZgF7GAKWBA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87413835DE1;
 Thu, 16 Sep 2021 12:41:13 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 69F8760CCC;
 Thu, 16 Sep 2021 12:41:05 +0000 (UTC)
Date: Thu, 16 Sep 2021 14:41:04 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH RFC 00/13] hw/nvme: experimental user-creatable objects
Message-ID: <YUM7YEQDQ2L3Qdh9@redhat.com>
References: <20210914203737.182571-1-its@irrelevant.dk>
MIME-Version: 1.0
In-Reply-To: <20210914203737.182571-1-its@irrelevant.dk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.392, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 14.09.2021 um 22:37 hat Klaus Jensen geschrieben:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Hi,
> 
> This is an attempt at adressing a bunch of issues that have presented
> themselves since we added subsystem support. It's been brewing for a
> while now.
> 
> Fundamentally, I've come to the conclusion that modeling namespaces and
> subsystems as "devices" is wrong. They should have been user-creatable
> objects. We've run into multiple issues with wrt. hotplugging due to how
> namespaces hook up to the controller with a bus. The bus-based design
> made a lot of sense when we didn't have subsystem support and it follows
> the design of hw/scsi. But, the problem here is that the bus-based
> design dictates a one parent relationship, and with shared namespaces,
> that is just not true. If the namespaces are considered to have a single
> parent, that parent is the subsystem, not any specific controller.
> 
> This series adds a set of experimental user-creatable objects:
> 
>   -object x-nvme-subsystem
>   -object x-nvme-ns-nvm
>   -object x-nvme-ns-zoned
> 
> It also adds a new controller device (-device x-nvme-ctrl) that supports
> these new objects (and gets rid of a bunch of deprecated and confusing
> parameters). This new approach has a bunch of benefits (other than just
> fixing the hotplugging issues properly) - we also get support for some
> nice introspection through some new dynamic properties:
> 
>   (qemu) qom-get /machine/peripheral/nvme-ctrl-1 attached-namespaces
>   [
>       "/objects/nvm-1",
>       "/objects/zns-1"
>   ]
> 
>   (qemu) qom-list /objects/zns-1
>   type (string)
>   subsys (link<x-nvme-subsystem>)
>   nsid (uint32)
>   uuid (string)
>   attached-ctrls (str)
>   eui64 (string)
>   blockdev (string)
>   pi-first (bool)
>   pi-type (NvmeProtInfoType)
>   extended-lba (bool)
>   metadata-size (uint16)
>   lba-size (size)
>   zone-descriptor-extension-size (size)
>   zone-cross-read (bool)
>   zone-max-open (uint32)
>   zone-capacity (size)
>   zone-size (size)
>   zone-max-active (uint32)
> 
>   (qemu) qom-get /objects/zns-1 pi-type
>   "none"
> 
>   (qemu) qom-get /objects/zns-1 eui64
>   "52:54:00:17:67:a0:40:15"
> 
>   (qemu) qom-get /objects/zns-1 zone-capacity
>   12582912
> 
> Currently, there are no shortcuts, so you have to define the full
> topology to get it up and running. Notice that the topology is explicit
> (the 'subsys' and 'attached-ctrls' links). There are no 'nvme-bus'
> anymore.
> 
>   -object x-nvme-subsystem,id=subsys0,subnqn=foo
>   -device x-nvme-ctrl,id=nvme-ctrl-0,serial=foo,subsys=subsys0
>   -device x-nvme-ctrl,id=nvme-ctrl-1,serial=bar,subsys=subsys0
>   -drive  id=nvm-1,file=nvm-1.img,format=raw,if=none,discard=unmap
>   -object x-nvme-ns-nvm,id=nvm-1,blockdev=nvm-1,nsid=1,subsys=subsys0,attached-ctrls=nvme-ctrl-1
>   -drive  id=nvm-2,file=nvm-2.img,format=raw,if=none,discard=unmap
>   -object x-nvme-ns-nvm,id=nvm-2,blockdev=nvm-2,nsid=2,subsys=subsys0,attached-ctrls=nvme-ctrl-0

I may be wrong here, but my first gut feeling when seeing this was that
referencing the controller device in the namespace object feels
backwards. Usually, we have objects that are created independently and
then the devices reference them.

Your need to use a machine_done notifier is probably related to that,
too, because it goes against the normal initialisation order, so you
have to wait. Error handling also isn't really possible in the notifier
any more, so this series seems to just print something to stderr, but
ignore the error otherwise.

Did you consider passing a list of namespaces to the controller device
instead?

I guess a problem that you have with both ways is that support for list
options isn't great in QemuOpts, which is still used both for -object
and -device in the system emulator...

Kevin


