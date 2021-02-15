Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D3A31BB43
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 15:40:56 +0100 (CET)
Received: from localhost ([::1]:46858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBf3V-0006JZ-QW
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 09:40:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lBf2O-0005ss-Ts
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 09:39:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lBf2K-0007Wm-Vx
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 09:39:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613399979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q3gufn4AbiGXRbhuFPGpXElx7/+MWechuUoqameCnf4=;
 b=YG2/nkRphxMxQY9WOkhF8i5pjEDrvpSWBfIQqIICI3JEbe87RlGsiY6lppUEQnXqi+r4AL
 TwGTA7OLaB59PoiWlnuDaHfmFDasq0Cq0klcjyC/wbvrzCYoWjuZA3Ezm5sjWDYmljTKHR
 jmakhNAlqaPPkX7vir0fUT7pdYvwm9Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-CTvxTdq2O6-JbOcrru3xuQ-1; Mon, 15 Feb 2021 09:39:37 -0500
X-MC-Unique: CTvxTdq2O6-JbOcrru3xuQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E62F100CCC0;
 Mon, 15 Feb 2021 14:39:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-184.ams2.redhat.com
 [10.36.114.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 393E55C5DF;
 Mon, 15 Feb 2021 14:39:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 56AEB18000AA; Mon, 15 Feb 2021 15:39:34 +0100 (CET)
Date: Mon, 15 Feb 2021 15:39:34 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Subject: Re: Fwd: VirtioSound device emulation implementation
Message-ID: <20210215143934.sz6tdtoaaffkvla7@sirius.home.kraxel.org>
References: <CAAQ-SiPcBeGGgYcPHn7WSnz4jLAza+hE7tSMYSHJ-caC66D48A@mail.gmail.com>
 <CAAQ-SiPPk9EfrEq7ja0X2E7gq5x9dH9C3LBDNc4frNi8Ssijug@mail.gmail.com>
 <CAAQ-SiMsrkDYzqqqRXONw_HCdORqssw-yL9dFGF32y7aG68iCQ@mail.gmail.com>
 <87v9blmf1x.fsf@linaro.org>
 <CAAQ-SiNRykBeMFRvjumJ1hbcT3vjuL2bcGU=RBLpksNJNGYm+Q@mail.gmail.com>
 <20210128112541.qjpve3qbjy46ofkk@sirius.home.kraxel.org>
 <CAAQ-SiOYkxRMw=OjnPb5tFD0aNb+ZQykLVfAjOGmwFa2Lzc26w@mail.gmail.com>
 <20210128163001.jjptft2t5fbdlvyn@sirius.home.kraxel.org>
 <CAAQ-SiOU5vkcVODOvBEf=PXzRDQbhzJC6ZU3wLpnRzhD58cuGg@mail.gmail.com>
 <CAAQ-SiMpZZ3yVCRjapCuResP38HFmtykFuLvpwH_23kEPg6v_w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAQ-SiMpZZ3yVCRjapCuResP38HFmtykFuLvpwH_23kEPg6v_w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

  Hi,

> I read the source code for the `gus` sound device. (gus.c) And set up the
> audiosettings and SWVoiceOut
> from there. Here is my first question, I feel as if SWVoiceOut should be
> available per stream.

Correct.

> So the `VirtIOSound` device would have a list of `SWVoiceOut`?

In the simplest case just one, most devices have two (one 'out' for
playback, one 'in' for recording).  Can be more.

> Secondly I saw in the `ac97.c` source, (which is a PCI sound device,) a lot
> of PCIDev related set up in
> the realize function, but they were not present in the `virtio-net.c`
> source. Do I need them? (`ac97.c` set
> up PCI_COMMAND, PCI_STATUS, PCI_BASE_ADDRESS and similar things in PCIDev.
> For now the pci
> setup in `virtio-snd-pci.c` basically mimics `virtio-net-pci.c` which uses
> a `VirtIOPCIProxy` obj.)

In case of a virtio-pci device VirtIOPCIProxy will deal with all the pci
details, no need for you to set this up.

> Thirdly, the properties are registered at two different places, once in the
> `virtio-net.c` source and once
> in the `virtio-net-pci.c` source. I understand the the ones in
> `virito-net.c`/`virtio-snd.c` they are the device
> properties, as in the configurations we can set for the device and other,
> well, properties. But what
> exactly are the properties defined in the `virtio-net-pci.c` source file? I
> have a vague idea of
> what they are, but I can't exactly put my finger on it. It's almost as if
> `virtio-net` and `virito-net-pci`
> are two different devices each with thier own properties, and the
> virtio-net-pci helps communication
> between virtio-net and QEMU guest.

virtio-net-pci.c is a small wrapper which combines virtio-net.c and
VirtIOPCIProxy.  Most properties virtio-net-pci.c has are just aliases
and come from either VirtIOPCIProxy or virtio-net.c

> Since there can be more than on streams and more than one jacks, we
> need to have a list of configurations for them, and since they should
> be index adressable, should I use an array for them? When I was
> reading the source I did not come across a QEMU list structure with
> indexed adressing.  If there is one please let me know.

I'd suggest to simply use an array.

> Finally, I do understand what the pcm streams are, and I have been able to
> set them up with hardcoded
> initial configs (modulo the hda part). But I do not understand what exactly
> are `jacks` and what should I do to set them up.
> Which source file should I look at for this? I came across a few jack
> related structs, but didn't see
> a device using them. (I did not search for it as vigorously, I only tried
> grepping in `hw/audio` and the
> only results were from `intel-hda-defs`. They were comments on enums. Again
> since I was writing
> this mail I thought I should ask it here too.)

Jacks are modeled after hda specification.  See also hda-codec-common.h
They basically describe the inputs and outputs, along the lines of "this
output is a green line-out jack / blue line-out jack / speaker / ...".

In case of qemu it is all virtual anyway and doesn't matter that much.
The guest might show this in the audio config tools though, so it
should be something commonly used.  hda-duplex for example uses "red
line-in" for recording and "green line-out" for playback because those
are the colors typically used for these jacks on your laptop.

HTH,
  Gerd


