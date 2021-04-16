Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5350D361ECD
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 13:34:54 +0200 (CEST)
Received: from localhost ([::1]:48542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXMkP-0003qI-7R
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 07:34:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lXMic-0002su-TL
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 07:33:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lXMiZ-0001sW-2K
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 07:33:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618572777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8lt11oPsd7T6TrHCGR4J1c/NLupT8dZsaMET/No/REs=;
 b=HykzSJ2eWsrt9wk/RqHBlhS9C5liqIGZ7jSs52bsSB/gCbGtgnSBWiFy1DvwxkpBdIUPXB
 yWJm2AXGAHI/5v/OZ6ST70NFLKhbv2s2ioUT5mKockvS/d7lcwZTts2C7mJ46sBVr36blj
 kkZ/gSADYT0TclEjBPPmcSGUh1iInt0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-BwbDmXgbNOW5DoHkLXhuHQ-1; Fri, 16 Apr 2021 07:32:55 -0400
X-MC-Unique: BwbDmXgbNOW5DoHkLXhuHQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE1EF8189C6;
 Fri, 16 Apr 2021 11:32:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-165.ams2.redhat.com
 [10.36.114.165])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A73B66A05;
 Fri, 16 Apr 2021 11:32:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F190D18000A1; Fri, 16 Apr 2021 13:32:52 +0200 (CEST)
Date: Fri, 16 Apr 2021 13:32:52 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Subject: Re: Fwd: VirtioSound device emulation implementation
Message-ID: <20210416113252.km4w72vnruv6s2oi@sirius.home.kraxel.org>
References: <CAAQ-SiMsrkDYzqqqRXONw_HCdORqssw-yL9dFGF32y7aG68iCQ@mail.gmail.com>
 <87v9blmf1x.fsf@linaro.org>
 <CAAQ-SiNRykBeMFRvjumJ1hbcT3vjuL2bcGU=RBLpksNJNGYm+Q@mail.gmail.com>
 <20210128112541.qjpve3qbjy46ofkk@sirius.home.kraxel.org>
 <CAAQ-SiOYkxRMw=OjnPb5tFD0aNb+ZQykLVfAjOGmwFa2Lzc26w@mail.gmail.com>
 <20210128163001.jjptft2t5fbdlvyn@sirius.home.kraxel.org>
 <CAAQ-SiOU5vkcVODOvBEf=PXzRDQbhzJC6ZU3wLpnRzhD58cuGg@mail.gmail.com>
 <CAAQ-SiMpZZ3yVCRjapCuResP38HFmtykFuLvpwH_23kEPg6v_w@mail.gmail.com>
 <20210215143934.sz6tdtoaaffkvla7@sirius.home.kraxel.org>
 <CAAQ-SiO_cTe3bQKDQ-tyeUU-DqTSf=1kRUcc+a=tktZb0ZhVog@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAQ-SiO_cTe3bQKDQ-tyeUU-DqTSf=1kRUcc+a=tktZb0ZhVog@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

> Starting off with the get config function for pcm streams. Initially I
> thought I was supposed to store those configs in the VirtIOSound
> struct but then I realized these configurations should be queried from
> the backend and then be presented to the driver/guest.

No.  The device can completely ignore the backend capabilities.

We have mixing-engine and fixed-settings.

With mixing-engine=on and fixed-settings=on (default) qemu will mix all
streams, resample if needed, and pass a single stream to the backend.

mixing-engine=off will turn disable the qemu mixer, the streams are
passed as-is to the backend then.  This requires fixed-settings=off too
(see documentation comments in qapi/audio.json).  The backend must
handle the settings the device asks for, either by configuring the audio
hardware accordingly (oss/alsa), or by passing on the settings to the
sound daemon (pulseaudio).

> Now, the virtio sound card supports multiple formats and bit rates. If
> we have fixed settings turned on in the audiodev, the virtio sound
> card should support only a single freq and frame rate depending upon
> what was passed to the command line which we can get from
> audio_get_pdo_out.  Is this correct?

No, see above, qemu will resample if needed.

> Secondly if fixed settings was not set, what should the get config
> query return with for supported formats and bitrates? For now I am
> returning the formats defined in the enum for the qemu audio
> subsystem.

The device can support every format and sample rate which is supported
by both qemu and the virtio spec.  Whenever it actually makes sense to
support outdated formats like S8 is questionable.  On the other hand not
supporting it will not simplify the code much.  Your choice.

> Thirdly, for the set params function, how do I change the params for
> an SWVoiceOut stream?  I could not find a function for changing the
> audsettings for a stream. Should I close the stream and reopen it?

Call AUD_open_out() again with the new settings.

> I learned that the callback passed in AUD_open_out, (lets call it the write
> audio callback,)  is supposed to mix and write the
> buffers to HWVoiceOut. I have written that, the basic algorithm being:
> 
> 1. Pop element from tx virtqueue.
> 2. Get the xfer header from the elem->out_sg (iov_to_buf(elem->out_sg, 1,
> 0, &hdr, sizeof(hdr)))
> 3. Get the buffer from elem->out_sg (iov_to_buf(elem->out_sg, 1,
> sizeof(hdr), &mixbuf, period_bytes))
> 4. AUD_write the buffer

AUD_write returns the number of bytes actually accepted.

In case the audio backend consumed the complete buffer you can go ahead
as described.  Otherwise stop here and resume (try AUD_write() the
remaining data) when the callback is called again.

> Also I do not understand what the tx virtqueue handler is supposed to
> do. I have written a handler for the control queue. But I don't know
> what to do about the tx queue for now. I thought it would be something
> similar to what the callback does, it wouldn't play the audio though.

The tx handler probably doesn't need to do much if anything in case you
do the virtqueue processing in the audio callback as described above.

> Also since the callback does so many things, I do not understand how I
> can implement the pcm stream prepare, start, stop and release
> functions. The prepare function is supposed to allocate resources for
> the stream, but we already do that in the realize_fn for the device
> (AUD_open_out). So should I move that part out of the realize function
> and into the prepare stream function?

start/stop maps to AUD_set_active_out(card, true/false);
You can probably just ignore prepare + release.

> Another thing that I wanted to ask was about the hda codec. The
> specification mentions that the virtio sound card has a single codec
> device in it. I saw a lot of codec device related code in hda-codec.c
> which I think can be re-used for this. But there were no headers that
> exposed the code elsewhere. After reading through the hda
> specification I realized that these function group nids all come under
> the codec, so the jacks will be pin widgets attached to this codec.
> And the streams will be the streams associated with this codec. But I
> do not understand how I should go about implementing the codec, or if
> I need to implement it considering the already existing source from
> intel-hda and hda-codec.c.

I don't think you can reuse much code, if any.

The AC_* #defines in intel-hda-defs.h should be useful though (jack
colors etc).  Move them to a separate header file is probably a good
idea.

> Also sorry for the late response, I had fallen ill. Also I had to move
> thrice in the past month, so I couldn't really work on this a lot, and
> I didn't want to write a mail without having any work to show to you
> guys. Thanks a lot for being patient with me. :)

No problem.  I'm likewise busy or on (easter) vacation at times and fail
to send timely answers (sorry for that).

HTH & take care,
  Gerd


