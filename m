Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9793365776B
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 14:53:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAWqt-00074O-6V; Wed, 28 Dec 2022 08:52:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pAWqn-000740-G7
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 08:52:10 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1pAWqk-0008Fn-8J
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 08:52:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=vDJZgn8ghqvDXnEsyhG6rfeoxXSFo/YKpyaQVeYHrbU=; b=tEFNg5UhRII8BB95YFYPRXoxdg
 X0S9saYfauRc6PQpkGM/nKVZmg36ivaYd6pIAW+/t0SqmlnINvdJy9aiqOO85FTTp2oCGpMzsdPxv
 9PWCkRr+y2wiYisNhek0OGBxqc1LQSOsH1yuGv+94BRl5nMhwX+5ZpcukSKNqqwW691cMprXa9lxq
 weLuRot6AIWG6uKtqyOiBWEPLPHs5ipykLnUArg+gA34aIqxcqS6oMUBFp63D114Vc7RmPACj/6iC
 GXRANLlZ+ROx8jiwX5MtY6i4XOiC4WdSxA0H/SDs8JXCJ+vFNwtG7e4eydU/pSYythmmhMadHLi5q
 lfBceUNWBnisrVQ639OIw7nyKdfjvSYNgBYAEDCeT94C+g6fQ6LgtP9yV0rFUuewlhvveUOjq0Eo8
 Nj9WpdD9Rs7xj1Miw4j91Gg/T6eWWpBkAw7HRVBat6SC1OdMXyduBSnmYHEhTHIzWnvGrwAJX5w/q
 H29eqtkVN0KLwk26ALiGoEERmQ9BNbTQyhTQ2TC+B1vm9plV9Cd9eRKRLqhg7/TkoPNfr1a+NeY8I
 rFuOgQCEfzSmkbU0pBz0OZxyJChJvDl5DQl+Pi4oyo889jDGNQ+NyEO9u/dWJqzkja+9usffIUTqe
 p3AUTN89VOvVOczsL65PqBgSgU2dnk0duCqIo5xNo=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@gmail.com>,
 Volker =?ISO-8859-1?Q?R=FCmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH 10/11] alsaaudio: change default playback settings
Date: Wed, 28 Dec 2022 14:52:02 +0100
Message-ID: <2081398.TCYG2cGmvX@silver>
In-Reply-To: <a257ab88-a779-bb84-e96e-664a3434b417@t-online.de>
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
 <2230283.NDGgU1aIbp@silver>
 <a257ab88-a779-bb84-e96e-664a3434b417@t-online.de>
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

On Monday, December 26, 2022 4:08:37 PM CET Volker R=FCmelin wrote:
> Am 21.12.22 um 12:03 schrieb Christian Schoenebeck:
> > On Sunday, December 18, 2022 6:15:38 PM CET Volker R=FCmelin wrote:
> >> The currently used default playback settings in the ALSA audio
> >> backend are a bit unfortunate. With a few emulated audio devices,
> >> audio playback does not work properly. Here is a short part of
> >> the debug log while audio is playing (elapsed time in seconds).
> > Which emulated devices are these?
>=20
> The hda device and sb16. When I wrote this patch two months ago ac97=20
> also had occasional dropouts, but at the moment ac97 works without issues.
>=20
> >> audio: Elapsed since last alsa run (running): 0.046244
> >> audio: Elapsed since last alsa run (running): 0.023137
> >> audio: Elapsed since last alsa run (running): 0.023170
> >> audio: Elapsed since last alsa run (running): 0.023650
> >> audio: Elapsed since last alsa run (running): 0.060802
> >> audio: Elapsed since last alsa run (running): 0.031931
> >>
> >> For some audio devices the time of more than 23ms between updates
> >> is too long.
> >>
> >> Set the period time to 5.8ms so that the maximum time between
> >> two updates typically does not exceed 11ms. This roughly matches
> >> the 10ms period time when doing playback with the audio timer.
> >> After this patch the debug log looks like this.
> > And what about dynamically adapting that value instead of reducing peri=
od time
> > for everyone by default?
>=20
> It seems this would be only needed for the ALSA backend. All other=20
> backends with the exception of OSS are fine with a 10ms period, and the=20
> ALSA audio backend also uses 10ms with -audiodev=20
> alsa,out.try-poll=3Doff,in.try-poll=3Doff.

OK, but all it would need was adjusting dev->timer_period appropriately eit=
her
in audio_validate_opts() [audio/audio.c, line 2126] to handle it generalized
or at the end of alsa_audio_init() [audio/alsaaudio.c, line 944] if
specifically for ALSA only, no?

> > 23ms is usually a good trade off between low latency, CPU load and pote=
ntial
> > for audio dropouts.
>=20
> Quite often it's longer than 23ms. For the rest of the audio backends a=20
> timer period of 10ms was selected as a good trade off between CPU load=20
> and audio dropouts. But you are right, this patch increases the CPU load.
>=20
> On my system the CPU load is increased by 0.9%. This was measured with a=
=20
> Linux guest using rhythmbox for audio playback. The guest was configured=
=20
> to use pulseaudio as sound server. The measurement was done with top -b=20
> -d 10 -n 14 over a period of two minutes. The first and last measurement=
=20
> was dropped. The average QEMU CPU load was 10.7% with and 9.8% without=20
> this patch.
>=20
> I would prefer a system with a 0.9% increased CPU load where audio just=20
> works over a system where you have to fine tune audio parameters.
>=20
> >> audio: Elapsed since last alsa run (running): 0.011919
> >> audio: Elapsed since last alsa run (running): 0.005788
> >> audio: Elapsed since last alsa run (running): 0.005995
> >> audio: Elapsed since last alsa run (running): 0.011069
> >> audio: Elapsed since last alsa run (running): 0.005901
> >> audio: Elapsed since last alsa run (running): 0.006084
> >>
> >> Signed-off-by: Volker R=FCmelin<vr_qemu@t-online.de>
> >> ---
> >>   audio/alsaaudio.c | 11 ++++-------
> >>   1 file changed, 4 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
> >> index 5f50dfa0bf..0cc982e61f 100644
> >> --- a/audio/alsaaudio.c
> >> +++ b/audio/alsaaudio.c
> >> @@ -913,17 +913,14 @@ static void *alsa_audio_init(Audiodev *dev)
> >>       alsa_init_per_direction(aopts->in);
> >>       alsa_init_per_direction(aopts->out);
> >>  =20
> >> -    /*
> >> -     * need to define them, as otherwise alsa produces no sound
> >> -     * doesn't set has_* so alsa_open can identify it wasn't set by t=
he user
> >> -     */
> >> +    /* don't set has_* so alsa_open can identify it wasn't set by the=
 user */
> >>       if (!dev->u.alsa.out->has_period_length) {
> >> -        /* 1024 frames assuming 44100Hz */
> >> -        dev->u.alsa.out->period_length =3D 1024 * 1000000 / 44100;
> >> +        /* 256 frames assuming 44100Hz */
> >> +        dev->u.alsa.out->period_length =3D 5805;
> >>       }
> >>       if (!dev->u.alsa.out->has_buffer_length) {
> >>           /* 4096 frames assuming 44100Hz */
> >> -        dev->u.alsa.out->buffer_length =3D 4096ll * 1000000 / 44100;
> >> +        dev->u.alsa.out->buffer_length =3D 92880;
> > Not a big fan of magic numbers, as it makes code less readable.
>=20
> I can't see how this can be improved. The buffer length is unchanged. I=20
> just evaluated the constant expression to have a time in microseconds=20
> like the rest of the audio backends. And libasound tells me to use=20
> 5804us for the period length which I rounded up to 5805us. I would=20
> prefer a period length of 5000us.

Probably nitpicking as the preceding comment indicates the numbers, but may=
be
simply like this?

dev->u.alsa.out->period_length =3D ceil(256.0 * 1000000.0 / 44100.0);
=2E..
dev->u.alsa.out->buffer_length =3D ceil(4096.0 * 1000000.0 / 44100.0);

I mean these are number literals passed to a built-in function, so the
compiler should automatically evaluate this constant expression at compile
time, so it should end up in the binary with the same constant value as you
did directly in code, at least if optimization was turned on.

> ./qemu-system-x86_64 -device ich9-intel-hda -device=20
> hda-duplex,audiodev=3Daudio0 -audiodev=20
> alsa,id=3Daudio0,out.period-length=3D5000,out.dev=3DPCH,,0
> alsa: Requested period time 5000 was rejected, using 5804
>=20
> >>       }
> >>  =20
> >>       /*
> >>
>=20
>=20
>=20



