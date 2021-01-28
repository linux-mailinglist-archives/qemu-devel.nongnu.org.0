Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D895307B07
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 17:34:43 +0100 (CET)
Received: from localhost ([::1]:35530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5AFm-0007D0-KG
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 11:34:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l5ABR-0004El-HW
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:30:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l5ABN-00072j-Cp
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:30:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611851407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qs67lq4EnCGW4fvFgXyGpON3eOmr5qHse8pfAyPqQ/A=;
 b=GU7mwBx4SRJO0KMFnDFxvNJtjLt5mArDJFuzvDvzJxcOaKcODNNSjr9rQC2N0mRIR1wCnx
 uog+VV8Iuj/SJuZsqxzASe3UiPPyDG3RhyMGqFwfaf+73OElCdyhs9ILNonPHv5zqJo96i
 OGATwUgX5npmbx5Fes7au2K/Ue1LP1Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-pER30-UmOoOt1rba6ZWxrw-1; Thu, 28 Jan 2021 11:30:04 -0500
X-MC-Unique: pER30-UmOoOt1rba6ZWxrw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99838192D7A0;
 Thu, 28 Jan 2021 16:30:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com
 [10.36.113.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 58FBB5D720;
 Thu, 28 Jan 2021 16:30:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4AAB018000B1; Thu, 28 Jan 2021 17:30:01 +0100 (CET)
Date: Thu, 28 Jan 2021 17:30:01 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Subject: Re: Fwd: VirtioSound device emulation implementation
Message-ID: <20210128163001.jjptft2t5fbdlvyn@sirius.home.kraxel.org>
References: <87ft33l8an.fsf@linaro.org>
 <CAAQ-SiMY8W9TS7eXgWuHY0m4yjaRbqqsZ+41Xyhxm+gW0sYakg@mail.gmail.com>
 <CAAQ-SiM8_XnW1Ar5xocR7pUG_WW4SrQSnaKhqr1rY62ti2pw7Q@mail.gmail.com>
 <CAAQ-SiPcBeGGgYcPHn7WSnz4jLAza+hE7tSMYSHJ-caC66D48A@mail.gmail.com>
 <CAAQ-SiPPk9EfrEq7ja0X2E7gq5x9dH9C3LBDNc4frNi8Ssijug@mail.gmail.com>
 <CAAQ-SiMsrkDYzqqqRXONw_HCdORqssw-yL9dFGF32y7aG68iCQ@mail.gmail.com>
 <87v9blmf1x.fsf@linaro.org>
 <CAAQ-SiNRykBeMFRvjumJ1hbcT3vjuL2bcGU=RBLpksNJNGYm+Q@mail.gmail.com>
 <20210128112541.qjpve3qbjy46ofkk@sirius.home.kraxel.org>
 <CAAQ-SiOYkxRMw=OjnPb5tFD0aNb+ZQykLVfAjOGmwFa2Lzc26w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAQ-SiOYkxRMw=OjnPb5tFD0aNb+ZQykLVfAjOGmwFa2Lzc26w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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

On Thu, Jan 28, 2021 at 09:20:31PM +0530, Shreyansh Chouhan wrote:
> (Gerd, I wasn't able to get gmail to quote your email, so I have just copy
> pasted the relavant parts.)
> 
> > Yes.  net_conf is common config (backend, mac address, maybe more) for
> > network devices.  For sound devices that would audiodev (link the device
> > to a backend which then handles alsa/pulse/jack/oss/sdl/whatever).
> 
> Ah I see, so the net_conf corresponds to audiodev?

Oops.  Confused that.  nic_conf (struct NICConf) is the common config
for all network devices, not net_conf.

See DEFINE_NIC_PROPERTIES() in include/net/net.h

NICConf.peers (exposed as "netdev" property) links the emulated device
(frontend) to a netdev (backend) which actually processes the packets
sent by the guest.

In a simliar way the audiodev property links the emulated audio device
to a backend which handles the host-side audio playback using alsa,
pulseaudio or something else.

> I thought it would correspond to `virtio_snd_conf`. So as alex said,
> `virtio_snd_conf` is the front end configuration.

Correct.

The backend is configured separately, i.e.

  -netdev user,id=net0,$moreargs

or

  -audiodev alsa,id=snd0,$moreargs

Then the two are linked by id, i.e.

  -device virtio-net-pci,netdev=net0

or

  -device virtio-sound-pci,audiodev=snd0

> > The only thing really required is the audiodev property.  Everything
> > else can be hard-coded initially, and once the basics are working
> > refined (like adding properties for jack labels, ...).
> 
> So in the realize function I set up the audiodev, right? Also in that case
> why the difference between the net and sound devices? In the net
> device we set up the common config in net_conf. Does the net_conf
> somehow later sets up NetDev too?
> 
> And what is a NetClientState? Is the NetClient the emulated guest? This
> confuses me a lot. I can't understand what will be the parellel audio device
> property.

Not fully sure what NetClientState is, I guess it is shared struct for
both frontend and backend to manage the connection state.

The audio subsystem has simliar structs, SWVoiceIn and SWVoiceOut for
example.  There also is QEMUSoundCard.  I'd suggest to check out the
source code of other audio devices for code examples.

> Also I can't seem to find where we parse the command line options
> passed to qemu.  The code structure is a bit different from what I had
> expected. In virtio_net_device_realize we set duplex to half or full
> depending on the value of the net_conf.duplex_str. But I couldn't find
> where we actually set it.

See virtio_net_properties[].  There is a line in the array:

    DEFINE_PROP_STRING("duplex", VirtIONet, net_conf.duplex_str),

And the whole array is registered using:

   device_class_set_props(dc, virtio_net_properties);

That is enough to make those properties work, the qemu core handles
everything for you.  See hw/core/qdev-properties.c if you are curious,
but you can also just consider that a black box at service for you ;)

take care,
  Gerd


