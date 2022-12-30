Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B48E065993F
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 15:06:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBG14-0001Pm-L3; Fri, 30 Dec 2022 09:05:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pBG12-0001Pe-T7
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 09:05:44 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pBG11-0006Ho-79
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 09:05:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=kA4uzwZnGxS8tqISuYqKdNiykwprVuGjHDU4agITom8=; b=uZ66oIerJU8lD7/FcZugkkyH1J
 gm8G/nHm6TQ/v/v2eH6bm9YFh3nsePLNX2IkkD+dlOJsq5dobBFXlix5JqfnvyX4owbmrRxVRXkcc
 CyklvFJ+hYU/hzhKGO673VgPBRhBEL4OkZl6mHeGXq1g975hf6vLYvqlrXwm6ufuPv9shwSk6XNte
 8ywIX1Zb11YwAI9qHushY8NuMImxBYVZh58cKMLFglSTzU2eObN3Y7W1VvnhpzxB5uRi56MT5JT4a
 g0MIdB0JX/A1oLfhRSa2Sju0WklLeoLk+5lZgge3ZPiV260PLT0/6vzM/cqkqThYRSGUOSa0CPziR
 S7PTDvKiMAN52doeyk4Q22a+bhM0ftFkWnsKhVSziirYMYlJ+BmoZTN96hbTwIa/wXJXFAQm+0A82
 FIruT8MUyQZsOPSFcMdankBGuKhIDwRYKZOOQWsFKUf59kQu5yaAR4fPIzcN8GwpFulZGMmU4+Ugt
 jb+E7+ob0S3SEhLyr5dglbtokiGPxcXM0bmw1OO4SbImJ8bXLZ3ha9B2xxJsawNCirIZuKC59VrbO
 sbh4Df6wktaPf876sZ1ZR9ExaU+2n66r1wKf0vtxB91iV36MBTQwJYD5EeuTw4iDcYK+bEXDQL8XE
 Xj3OxKUQYaTWUT6DiLxPIiJJ8x/AflTpTtmLCEdRk=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Volker =?ISO-8859-1?Q?R=FCmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH 10/11] alsaaudio: change default playback settings
Date: Fri, 30 Dec 2022 15:05:40 +0100
Message-ID: <8757559.3c4BtADfnu@silver>
In-Reply-To: <fa8fbff9-5c8d-d8c8-ae87-01d235ad5f98@t-online.de>
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
 <2081398.TCYG2cGmvX@silver>
 <fa8fbff9-5c8d-d8c8-ae87-01d235ad5f98@t-online.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Friday, December 30, 2022 10:01:47 AM CET Volker R=FCmelin wrote:
> Am 28.12.22 um 14:52 schrieb Christian Schoenebeck:
> > On Monday, December 26, 2022 4:08:37 PM CET Volker R=FCmelin wrote:
> >> Am 21.12.22 um 12:03 schrieb Christian Schoenebeck:
> >>> On Sunday, December 18, 2022 6:15:38 PM CET Volker R=FCmelin wrote:
> >>>> The currently used default playback settings in the ALSA audio
> >>>> backend are a bit unfortunate. With a few emulated audio devices,
> >>>> audio playback does not work properly. Here is a short part of
> >>>> the debug log while audio is playing (elapsed time in seconds).
> >>> Which emulated devices are these?
> >> The hda device and sb16. When I wrote this patch two months ago ac97
> >> also had occasional dropouts, but at the moment ac97 works without iss=
ues.
> >>
> >>>> audio: Elapsed since last alsa run (running): 0.046244
> >>>> audio: Elapsed since last alsa run (running): 0.023137
> >>>> audio: Elapsed since last alsa run (running): 0.023170
> >>>> audio: Elapsed since last alsa run (running): 0.023650
> >>>> audio: Elapsed since last alsa run (running): 0.060802
> >>>> audio: Elapsed since last alsa run (running): 0.031931
> >>>>
> >>>> For some audio devices the time of more than 23ms between updates
> >>>> is too long.
> >>>>
> >>>> Set the period time to 5.8ms so that the maximum time between
> >>>> two updates typically does not exceed 11ms. This roughly matches
> >>>> the 10ms period time when doing playback with the audio timer.
> >>>> After this patch the debug log looks like this.
> >>> And what about dynamically adapting that value instead of reducing pe=
riod time
> >>> for everyone by default?
> >> It seems this would be only needed for the ALSA backend. All other
> >> backends with the exception of OSS are fine with a 10ms period, and the
> >> ALSA audio backend also uses 10ms with -audiodev
> >> alsa,out.try-poll=3Doff,in.try-poll=3Doff.
> > OK, but all it would need was adjusting dev->timer_period appropriately=
 either
> > in audio_validate_opts() [audio/audio.c, line 2126] to handle it genera=
lized
> > or at the end of alsa_audio_init() [audio/alsaaudio.c, line 944] if
> > specifically for ALSA only, no?
>=20
> I think this should be the other way around. If period-length wasn't=20
> specified on the command line, it should be calculated from=20
> timer-period. With timer based playback or recording, the guest should=20
> be able to write or read new audio frames every timer-period=20
> microseconds. To have a high probability that the guest can write or=20
> read new frames every timer-period, the asynchronous updates of the=20
> audio backend have to be faster than timer-period e.g. 75-80% of=20
> timer-period. But that's a different patch.

Probably in both directions, depending on what the user supplied.

I still have this feeling that this patch might just move the problem to ot=
her
users (dropouts) until properly addressed, but anyway, for the time being:

Acked-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

> >>> 23ms is usually a good trade off between low latency, CPU load and po=
tential
> >>> for audio dropouts.
> >> Quite often it's longer than 23ms. For the rest of the audio backends a
> >> timer period of 10ms was selected as a good trade off between CPU load
> >> and audio dropouts. But you are right, this patch increases the CPU lo=
ad.
> >>
> >> On my system the CPU load is increased by 0.9%. This was measured with=
 a
> >> Linux guest using rhythmbox for audio playback. The guest was configur=
ed
> >> to use pulseaudio as sound server. The measurement was done with top -b
> >> -d 10 -n 14 over a period of two minutes. The first and last measureme=
nt
> >> was dropped. The average QEMU CPU load was 10.7% with and 9.8% without
> >> this patch.
> >>
> >> I would prefer a system with a 0.9% increased CPU load where audio just
> >> works over a system where you have to fine tune audio parameters.
> >>



