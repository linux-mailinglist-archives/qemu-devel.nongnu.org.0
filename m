Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCEA6C0396
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Mar 2023 18:51:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdxAG-0004jZ-94; Sun, 19 Mar 2023 13:49:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pdxAE-0004jO-65
 for qemu-devel@nongnu.org; Sun, 19 Mar 2023 13:49:50 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pdxAC-0004fM-8l
 for qemu-devel@nongnu.org; Sun, 19 Mar 2023 13:49:49 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 76E867457E7;
 Sun, 19 Mar 2023 18:49:08 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 39130745712; Sun, 19 Mar 2023 18:49:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 36F867456E3;
 Sun, 19 Mar 2023 18:49:08 +0100 (CET)
Date: Sun, 19 Mar 2023 18:49:08 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Volker_R=FCmelin?= <vr_qemu@t-online.de>
cc: Rene Engel <ReneEngel80@emailn.de>, kraxel@redhat.com, 
 marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Subject: Re: Audio playback speed issue on sam460ex and pegasos2
In-Reply-To: <ad098507-98ff-3ffe-e5f3-2c508d911a67@t-online.de>
Message-ID: <b80d09c7-b9e6-debe-9678-f6ac3bbed388@eik.bme.hu>
References: <5207a2d9-e72b-3ce6-5b91-a9b187759b69@eik.bme.hu>
 <f6d1f455-97a3-f7ab-4101-8249148f0384@eik.bme.hu>
 <f3d99778-ec4b-ac34-91f6-25dd19d00254@eik.bme.hu>
 <efc13913-cf16-0323-403c-61b36139b4bc@t-online.de>
 <84a29575-d924-054e-565b-8cc14da7a8de@eik.bme.hu>
 <073253fedbbcc9467ca42ced0ef7f5e7@mail.emailn.de>
 <ad098507-98ff-3ffe-e5f3-2c508d911a67@t-online.de>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-722963814-1679245297=:44244"
Content-ID: <0da09df6-c90f-acdd-1704-b09a3815c3c8@eik.bme.hu>
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-722963814-1679245297=:44244
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <274d0f17-b423-691a-d174-3b430aa01a17@eik.bme.hu>

On Sun, 12 Mar 2023, Volker Rümelin wrote:
> Am 12.03.23 um 15:09 schrieb Rene Engel:
>> Tested with -audiodev coreaudio,id=audio0,out.buffer-count=1 to 12
>> 
>> 1 is too slow the rest up to 12 has no effect
>> 
>> The sampling frequency of the via-ac97 driver is 48000 Hz under AmigaOs4.1
>> 
>> Any other ideas?
>> 
>> 
>
> In audio/audio_template.h in the AUD_open_ functions there is one
>
>     ldebug ("open %s, freq %d, nchannels %d, fmt %d\n",
>             name, as->freq, as->nchannels, as->fmt);
>
> line. Please replace this line with
>
>     fprintf(stderr, "open %s, freq %d, nchannels %d, fmt %d\n",
>             name, as->freq, as->nchannels, as->fmt);
>
> compile and start AmigaOS. Use the default out.buffer-count. I would like to 
> know the via-ac97 drivers idea of the sampling frequency.

Not sure this helps but I get these with DEBUG enabled in qemu/audio on 
Linux host with alsa set to 44100 Hz dmix rate with default settings 
without any -audiodev options with AmigaOS guest.
With pegasos2:

audio: open via-ac97.out, freq 44100, nchannels 1, fmt 1##############] 100 %
audio: open via-ac97.out, freq 44100, nchannels 2, fmt 3
alsa: enabling voice
alsa: disabling voice
alsa: alsa_fini

or pegasos2 with ES1370:

audio: open via-ac97.out, freq 44100, nchannels 2, fmt 3
alsa: enabling voice
alsa: disabling voice
alsa: alsa_fini

this does not play as slow as with sam460ex below but maybe a bit slow 
which seems to improve with try-poll=off so this may be because of the 
alsa backend issue. It's a bit faster with sdl backend, not sure if that's 
the right speed or too fast but at least the backend seems to influence 
playback speed.

With sam460ex and ES1370:

audio: open es1370.dac2, freq 44100, nchannels 1, fmt 0
audio: open es1370.adc, freq 44100, nchannels 1, fmt 0
audio: open es1370.dac2, freq 48662, nchannels 1, fmt 0
audio: open es1370.adc, freq 48662, nchannels 1, fmt 0
audio: open es1370.dac2, freq 48662, nchannels 2, fmt 3
alsa: enabling voice
alsa: disabling voice
alsa: alsa_fini

this plays definitely slow and the freq also seems to be off. I may have 
different AmigaOS versions on pegasos2 and sam460ex but I they seem to use 
the same driver as there were no updates to that part. I'm not sure what 
the driver in AmigaOS looks like but it may be similar to the AROS AHI 
SB128 one. I don't know if higher level parts in AHI may try to measure 
something like you mentioned but at least the card driver does not seem to 
do that.

There seems to be two independent problems, one is the bug in alsa backend 
that you mentioned and something else only affecting sam460ex which causes 
the wrong freq to be selected but I have no idea why or what to check 
further to find out.

Regards,
BALATON Zoltan
--3866299591-722963814-1679245297=:44244--

