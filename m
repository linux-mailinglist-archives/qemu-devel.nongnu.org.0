Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4182F6340
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 15:38:05 +0100 (CET)
Received: from localhost ([::1]:58762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l03lE-0002Ru-QJ
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 09:38:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l03jT-0001RX-NR
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:36:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1l03jP-0005uN-0q
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:36:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610634968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aEDUyrY7fpS8lqkqJQViX5LpIdaXUXlaK4xDTVGeLQA=;
 b=WpLHc7aFUGBr17f4bT0ZRiPTZbW9w4OMuFMmBEjz1jf5yH7FTGQrPaprKiRBmDyyvaM19A
 cPO95vr3peZbjtsIxdNgE2Q3uX5cKvPxR5rD0a/b+tDO1jVDt/Sxq0d9actyBPDCL/SJw3
 nwrK6bWSJVY/QqCR5Ydw3yM79A38d6I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-UtVQkSQCPMWcetTihV8atw-1; Thu, 14 Jan 2021 09:36:05 -0500
X-MC-Unique: UtVQkSQCPMWcetTihV8atw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0A1131DDE2;
 Thu, 14 Jan 2021 14:36:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C04D519C48;
 Thu, 14 Jan 2021 14:36:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CBE3818000B4; Thu, 14 Jan 2021 15:36:01 +0100 (CET)
Date: Thu, 14 Jan 2021 15:36:01 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Volker =?utf-8?Q?R=C3=BCmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH 00/23] next round of audio patches
Message-ID: <20210114143601.et3x5z3mcpmc467l@sirius.home.kraxel.org>
References: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
MIME-Version: 1.0
In-Reply-To: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
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
Cc: =?utf-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?= <dirty.ice.hu@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jan 10, 2021 at 11:01:29AM +0100, Volker Rümelin wrote:
> A mix of bug fixes and improvements.
> 
> Patches 01/23 - 11/23 have a few SDL fixes and add audio recording
> functions to the SDL audio backend.
> 
> Patch 12/23 removes unnecessary code from audio/audio.c.
> 
> Patches 13/23 - 16/23 fix a few PulseAudio backend bugs.
> 
> Patch 17/23 shows a PulseAudio backend bug. So far I don't think I
> broke any fine tuned user settings and I don't want to do it here.
> 
> Patches 18/23 - 19/23 are the first steps towards glitch free and
> lower latency PulseAudio playback and recording. Currently qemu
> uses incredibly large buffers in the PulseAudio backend. For
> playback this just increases the playback latency but doesn't
> improve dropout safety, because PulseAudio can't access this buffer
> directly. With these patches it's possible to move the large qemu
> buffer to the PulseAudio server side and just keep a small buffer
> on the qemu side. On the PulseAudio server side PulseAudio tries
> to place a part of these buffers directly on the hardware and
> PulseAudio runs with a higher priority than qemu, so it has a
> better chance to deliver audio data in time.
> 
> Here is an example to show how this works:
> -device intel-hda -device hda-duplex,audiodev=audio0
> -machine pcspk-audiodev=audio0 -audiodev pa,id=audio0,
> out.buffer-length=14000,out.latency=46440,in.latency=46440
> 
> Due to a bug in the PulseAudio backend, these command line options
> actually decrease the playback latency compared to current defaults.
> For playback with defaults (16 bits, stereo, 44100 samples/s)
> we have a 15ms server side buffer + 2 * 46.44ms qemu audio buffer
> + 23.22ms hda codec buffer = 131.1ms latency. With my example it's
> 46.44ms + 2 * 14ms + 23.22ms = 97.66ms latency and I guess you
> won't hear any drop outs. Btw.: 14ms = 10ms timer-period + 4ms
> additional playback data the hda codec can produce in timer-period
> time.
> 
> Patches 20/23 - 23/23 fix small issues with DirectSound.

Nice overall improvements.  Some minor nits (see replies to some
patches).  Can be fixed incrementally though, so I'll do some more
testing and if nothing blows up queue the series for merge.

thanks,
  Gerd


