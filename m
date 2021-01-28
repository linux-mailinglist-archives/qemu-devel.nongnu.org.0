Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 659423074CB
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 12:28:45 +0100 (CET)
Received: from localhost ([::1]:55514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l55Tg-0007bV-HI
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 06:28:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l55R2-0006WD-Q9
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:26:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l55Qy-0000Wm-SK
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:26:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611833149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/U4I15n3ZydCvuAN15vfzSVlpE8THJegaTkNFUADtuc=;
 b=Sf6mjguWol49VcySp6AGCRzf4F8feKoykgp4QUMl+bwLEBxWG+PYptePaz7HzYK0xHsYAz
 v094PcYKrEaqG64AU+W7lwB8ntZt4m+YFcdVP6qnGnYxkJI90yE57d/OpZQWTFKfH7HUJD
 TEu+1Z9pwc8W7z9uUu3wOwE0GHI/XbU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-qOMnk-NxPM2hipETAH9SFA-1; Thu, 28 Jan 2021 06:25:44 -0500
X-MC-Unique: qOMnk-NxPM2hipETAH9SFA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CE27190D342;
 Thu, 28 Jan 2021 11:25:43 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA8915C1BB;
 Thu, 28 Jan 2021 11:25:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2183418000B1; Thu, 28 Jan 2021 12:25:41 +0100 (CET)
Date: Thu, 28 Jan 2021 12:25:41 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Subject: Re: Fwd: VirtioSound device emulation implementation
Message-ID: <20210128112541.qjpve3qbjy46ofkk@sirius.home.kraxel.org>
References: <878s8zptrf.fsf@linaro.org>
 <CAAQ-SiNKXhJcT1XEodQT6kojqppq37Kg8F8igipQ-HVYOU0=zA@mail.gmail.com>
 <87ft33l8an.fsf@linaro.org>
 <CAAQ-SiMY8W9TS7eXgWuHY0m4yjaRbqqsZ+41Xyhxm+gW0sYakg@mail.gmail.com>
 <CAAQ-SiM8_XnW1Ar5xocR7pUG_WW4SrQSnaKhqr1rY62ti2pw7Q@mail.gmail.com>
 <CAAQ-SiPcBeGGgYcPHn7WSnz4jLAza+hE7tSMYSHJ-caC66D48A@mail.gmail.com>
 <CAAQ-SiPPk9EfrEq7ja0X2E7gq5x9dH9C3LBDNc4frNi8Ssijug@mail.gmail.com>
 <CAAQ-SiMsrkDYzqqqRXONw_HCdORqssw-yL9dFGF32y7aG68iCQ@mail.gmail.com>
 <87v9blmf1x.fsf@linaro.org>
 <CAAQ-SiNRykBeMFRvjumJ1hbcT3vjuL2bcGU=RBLpksNJNGYm+Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAQ-SiNRykBeMFRvjumJ1hbcT3vjuL2bcGU=RBLpksNJNGYm+Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 28, 2021 at 09:58:23AM +0530, Shreyansh Chouhan wrote:
> Thanks a lot Alex!
> 
> > All QEMU devices have two parts, a frontend (which the guest sees) and a
> > backend (which is how the data gets to somewhere in the host). Some of
> > the command line options in QEMU elide the details for convenience (-nic
> > and -drive are examples). The -netdev device is all about configuring
> > the backend of the network part for a paired -device front end. There is
> > a similar setup for audio (-audiodev) although I'll defer to Gerd's
> > expertise on how the two interact.
> 
> This helped me understand a bit more about how the devices work. In the
> source
> code, I found the `virtio-net-pci.c` and `virtio-net.c` files, I think the
> pci device is what is visible to the guest.
> So `virtio-net-pci.c` should be the front end?

Well, virtio can have different transports, thats why the separation.
pci is the most common one, but there are also mmio (supported by x86
microvm and arm/aarch64 virt) and ccw (used on s390x).

virtio-net.c is the actual virtio device, virtio-net-pci.c has mostly
glue code to make the virtio device visible on the pci bus.

> For the realize function, I saw that the `virtio_net_device_realize`
> function initializes
> the `net_conf` for the device. So I am guessing that the
> `virtio_snd_device_realize` function
> should initialize the number of jacks and streams a device has, along with
> the configuration
> for all these jacks and streams?

Yes.  net_conf is common config (backend, mac address, maybe more) for
network devices.  For sound devices that would audiodev (link the device
to a backend which then handles alsa/pulse/jack/oss/sdl/whatever).

Configuration can be done either using device properties, or by having
different devices.  Using device properties is probably the easier way
to go.  An example for the latter are the qemu hda codecs.  We have
three different devices:

 (1) hda-output: playback-only, offering a virtual line-out.
 (2) hda-duplex: record/playback, offering line-in and line-out.
 (3) hda-micro:  record/playback, offering microphone and speaker.

The difference between (2) and (3) is just the jack labeling, otherwise
the behavior is 100% identical (and they share the emulation code of
course).  But some windows VoIP apps didn't like the line-in and
complained about a missing microphone, so we added that ...

> The thing is I do not understand `net` devices all that well so I get a bit
> confused with
> what is specific to a net device and what should I actually be worried
> about :)

The only thing really required is the audiodev property.  Everything
else can be hard-coded initially, and once the basics are working
refined (like adding properties for jack labels, ...).

> The device initalization step mentions that the jack and streams
> should be read and a query should be made for the config of all jacks
> and streams. What should be the default values of these
> configurations? I think the realize function is responsible for
> setting these up.

I'd start with offering a single 48000, 16bit, stereo, line-out pcm
playback channel.

HTH,
  Gerd


