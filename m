Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CFF12D3E9
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 04:42:02 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45936 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVoXR-0003hM-Gf
	for lists+qemu-devel@lfdr.de; Tue, 28 May 2019 22:42:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57680)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hVoWW-0003O4-4w
	for qemu-devel@nongnu.org; Tue, 28 May 2019 22:41:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1hVoWT-0007hW-Mt
	for qemu-devel@nongnu.org; Tue, 28 May 2019 22:41:04 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:35649)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1hVoWR-0007TB-QU
	for qemu-devel@nongnu.org; Tue, 28 May 2019 22:41:00 -0400
Received: by mail-qk1-f196.google.com with SMTP id l128so516079qke.2
	for <qemu-devel@nongnu.org>; Tue, 28 May 2019 19:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=IdflxEZdyI2LNkeIyhEC2MlHd8bbffi7s8wHFZHpbB0=;
	b=RWZ46f5Jb63/eyOSR+aTQKVsdm+vZ+RxJp2yjgk2ZtT3cC82Da9meZ3+Rk5CsSJjqE
	nyRqXowSDe7Xh4zIvABSCdFQbN0A2yw1XcCS7qOf5qjN+rALLm6nqwK/57yyUQdKbL7U
	o7+emR6zjwfnuUkXv95W76VTA9yswmlsX1mVIdA007sCfsjNSPoUKr2WeIEqMA907Vqc
	9EjZTmDNgpWgpvN18SWTa4O+SP/7PHOiHbmE9ZNmB8c/yEbm7vfHj2Od0J83VF1mnk/d
	Cn+FKIsSofW6fA+StYwoabazqn7SyYb75R1QQ/VSvpDwLDB0qQbVgT9Oe0iS01n4ery4
	3bvA==
X-Gm-Message-State: APjAAAXqGzHXoCn1+V2GmRVxF5bFJyzyOh3EzGUpuk6m7H5H3j9DWyUH
	2JS6EOx4RnmsjAkTXynY9kmrEw==
X-Google-Smtp-Source: APXvYqzKphDX8EIfgIa43ve69qrEF5DmbCRqeMKpYOTriH8DVdfI98bKT/nLKi3TDSI35mSUp8Qc0g==
X-Received: by 2002:a05:620a:34d:: with SMTP id
	t13mr16454337qkm.201.1559097646586; 
	Tue, 28 May 2019 19:40:46 -0700 (PDT)
Received: from redhat.com (pool-100-0-197-103.bstnma.fios.verizon.net.
	[100.0.197.103])
	by smtp.gmail.com with ESMTPSA id k5sm2038329qtj.40.2019.05.28.19.40.44
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 28 May 2019 19:40:45 -0700 (PDT)
Date: Tue, 28 May 2019 22:40:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jens Freimann <jfreimann@redhat.com>
Message-ID: <20190528223900-mutt-send-email-mst@kernel.org>
References: <20190517125820.2885-1-jfreimann@redhat.com>
	<20190520165657.2293c5d7@x1.home>
	<20190521072157.wpb77wlc5mhfcdes@jenstp.localdomain>
	<20190521073511-mutt-send-email-mst@kernel.org>
	<20190521184918.n4nnk6ack3ssp6jv@jenstp.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190521184918.n4nnk6ack3ssp6jv@jenstp.localdomain>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.222.196
Subject: Re: [Qemu-devel] [PATCH 0/4] add failover feature for assigned
 network devices
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: pkrempa@redhat.com, berrange@redhat.com, ehabkost@redhat.com,
	aadam@redhat.com, qemu-devel@nongnu.org,
	Alex Williamson <alex.williamson@redhat.com>, laine@redhat.com,
	ailan@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, May 21, 2019 at 08:49:18PM +0200, Jens Freimann wrote:
> On Tue, May 21, 2019 at 07:37:19AM -0400, Michael S. Tsirkin wrote:
> > On Tue, May 21, 2019 at 09:21:57AM +0200, Jens Freimann wrote:
> > > On Mon, May 20, 2019 at 04:56:57PM -0600, Alex Williamson wrote:
> > > > On Fri, 17 May 2019 14:58:16 +0200
> > > > Jens Freimann <jfreimann@redhat.com> wrote:
> > > > > Command line example:
> > > > >
> > > > > qemu-system-x86_64 -enable-kvm -m 3072 -smp 3 \
> > > > >         -machine q35,kernel-irqchip=split -cpu host   \
> > > > >         -k fr   \
> > > > >         -serial stdio   \
> > > > >         -net none \
> > > > >         -qmp unix:/tmp/qmp.socket,server,nowait \
> > > > >         -monitor telnet:127.0.0.1:5555,server,nowait \
> > > > >         -device pcie-root-port,id=root0,multifunction=on,chassis=0,addr=0xa \
> > > > >         -device pcie-root-port,id=root1,bus=pcie.0,chassis=1 \
> > > > >         -device pcie-root-port,id=root2,bus=pcie.0,chassis=2 \
> > > > >         -netdev tap,script=/root/bin/bridge.sh,downscript=no,id=hostnet1,vhost=on \
> > > > >         -device virtio-net-pci,netdev=hostnet1,id=net1,mac=52:54:00:6f:55:cc,bus=root2,failover=on \
> > > > >         /root/rhel-guest-image-8.0-1781.x86_64.qcow2
> > > > >
> > > > > Then the primary device can be hotplugged via
> > > > >  (qemu) device_add vfio-pci,host=5e:00.2,id=hostdev0,bus=root1,standby=net1
> > > >
> > > > Is this standby= option only valid for Network/Ethernet class code
> > > > devices?  If so, perhaps vfio-pci code should reject the option on any
> > > > non-ethernet devices.  The option is also non-intuitive for users, only
> > > > through examples like above can we see it relates to the id of the
> > > > secondary device.  Could we instead name it something like
> > > > "standby_net_failover_pair_id="?
> > > 
> > > It is only for ethernet (VFs), I will add code to reject non-ethernet VF devices.
> > > I agree the name is not descriptive and the one you suggest seems good to
> > > me.
> > > >
> > > > Also, this feature requires matching MAC addresses per the description,
> > > > where is that done?  Is it the user's responsibility to set the MAC on
> > > > the host device prior to the device_add?  If so, is this actually not
> > > > only specific to ethernet devices, but ethernet VFs?
> > > 
> > > Yes, it's the users responsibility and the MACs are then matched by
> > > the net_failover driver in the guest. It makes sense for ethernet VFs only,
> > > I'll add a check for that.
> > 
> > Actually is there a list of devices for which this has been tested
> > besides mlx5? I think someone said some old intel cards
> > don't support this well, we might need to blacklist these ...
> 
> So far I've tested mlx5 and XL710 which both worked, but I'm
> working on testing with more devices. But of course help with testing
> is greatly appreciated.
> 
> regards,
> Jens

A testing tool that people can run to get a pass/fail
result would be needed for that.
Do you have something like this?

-- 
MST

