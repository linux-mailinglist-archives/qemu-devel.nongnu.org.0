Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 296A4653009
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 12:05:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7wtJ-0004oH-A9; Wed, 21 Dec 2022 06:04:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1p7wtE-0004o6-PA
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 06:04:02 -0500
Received: from kylie.crudebyte.com ([5.189.157.229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1p7wtC-0007ap-OS
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 06:04:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=MzbjyeYuyl2KfKhg4XyXWdtd+RO5fZ3NwGADhuSinHg=; b=Z7GadPObX05TTyV1MVt9ncoPWK
 1LSqVdGANKM9k/BU7mMhHWriIiR8VxTq2291ZKymSC5GP//W+uB1RK+W4cwuEe8275ywii5/NfwCT
 7XP7kWggtfN+KkQznMTu93GlhYZ4WEjLDSG4diYmKVo8XEX9GauwXUWYNnnZWl60pOIrFALkFXctX
 p4OsoTehv97kyfPBVaO+4lVZ7Pl36KeOBWvIik5WbYc5RgzzRXxtRrshdJPPMb3Z2GgQ107e5W3ej
 /wMfyhT6ldmxiqyY3g5a+AkO0Cbi6Y38kiPb7PaksPWxoT+YA1MSJd9XjpyPfJ6PSauAsUL/wjBR2
 7YEaO1BdMHYOwzrf6PL0lfKdCqAV8RLJbfIpstiIPR/YKQKpOgvHGsN9dEnGSK0xCzGuXW3IqksTA
 W7uzdjKGhRZPqZ5idVaQZM916MXJk+tkmTlNnMgq8XzZXkZkAgujKp520vTtqh9clof5+CuBXH5nx
 qoYMmLe2sFaLl3/JqWsM20UIF126XmidryjHBCJfEM5cI4V8eelacIMtF8TsmfHsnl6kdf6Yazu4q
 f8ud7Mzx28mJccoq7xkuv+LJBcfE18O52NXA7Q7MWdjzTquYrgjY5nD94TKWS6XfWwg+1C/x/80JL
 LGgDN1Q0XP4mlt+lt8katOHcKRJWcOxmc04z1WvFY=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org,
 Volker =?ISO-8859-1?Q?R=FCmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH 10/11] alsaaudio: change default playback settings
Date: Wed, 21 Dec 2022 12:03:53 +0100
Message-ID: <2230283.NDGgU1aIbp@silver>
In-Reply-To: <20221218171539.11193-10-vr_qemu@t-online.de>
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
 <20221218171539.11193-10-vr_qemu@t-online.de>
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

On Sunday, December 18, 2022 6:15:38 PM CET Volker R=FCmelin wrote:
> The currently used default playback settings in the ALSA audio
> backend are a bit unfortunate. With a few emulated audio devices,
> audio playback does not work properly. Here is a short part of
> the debug log while audio is playing (elapsed time in seconds).

Which emulated devices are these?

> audio: Elapsed since last alsa run (running): 0.046244
> audio: Elapsed since last alsa run (running): 0.023137
> audio: Elapsed since last alsa run (running): 0.023170
> audio: Elapsed since last alsa run (running): 0.023650
> audio: Elapsed since last alsa run (running): 0.060802
> audio: Elapsed since last alsa run (running): 0.031931
>=20
> For some audio devices the time of more than 23ms between updates
> is too long.
>=20
> Set the period time to 5.8ms so that the maximum time between
> two updates typically does not exceed 11ms. This roughly matches
> the 10ms period time when doing playback with the audio timer.
> After this patch the debug log looks like this.

And what about dynamically adapting that value instead of reducing period t=
ime
for everyone by default?

23ms is usually a good trade off between low latency, CPU load and potential
for audio dropouts.

> audio: Elapsed since last alsa run (running): 0.011919
> audio: Elapsed since last alsa run (running): 0.005788
> audio: Elapsed since last alsa run (running): 0.005995
> audio: Elapsed since last alsa run (running): 0.011069
> audio: Elapsed since last alsa run (running): 0.005901
> audio: Elapsed since last alsa run (running): 0.006084
>=20
> Signed-off-by: Volker R=FCmelin <vr_qemu@t-online.de>
> ---
>  audio/alsaaudio.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>=20
> diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
> index 5f50dfa0bf..0cc982e61f 100644
> --- a/audio/alsaaudio.c
> +++ b/audio/alsaaudio.c
> @@ -913,17 +913,14 @@ static void *alsa_audio_init(Audiodev *dev)
>      alsa_init_per_direction(aopts->in);
>      alsa_init_per_direction(aopts->out);
> =20
> -    /*
> -     * need to define them, as otherwise alsa produces no sound
> -     * doesn't set has_* so alsa_open can identify it wasn't set by the =
user
> -     */
> +    /* don't set has_* so alsa_open can identify it wasn't set by the us=
er */
>      if (!dev->u.alsa.out->has_period_length) {
> -        /* 1024 frames assuming 44100Hz */
> -        dev->u.alsa.out->period_length =3D 1024 * 1000000 / 44100;
> +        /* 256 frames assuming 44100Hz */
> +        dev->u.alsa.out->period_length =3D 5805;
>      }
>      if (!dev->u.alsa.out->has_buffer_length) {
>          /* 4096 frames assuming 44100Hz */
> -        dev->u.alsa.out->buffer_length =3D 4096ll * 1000000 / 44100;
> +        dev->u.alsa.out->buffer_length =3D 92880;

Not a big fan of magic numbers, as it makes code less readable.

>      }
> =20
>      /*
>=20




