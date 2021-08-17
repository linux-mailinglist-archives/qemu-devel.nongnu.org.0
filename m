Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AEF3EEBDD
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 13:43:10 +0200 (CEST)
Received: from localhost ([::1]:34444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFxUr-0005gZ-0w
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 07:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mFxTb-00050K-Vu
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 07:41:52 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:59133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mFxTa-0001J1-6J
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 07:41:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=clmfrX7GqOn17Y3YtNmkXU+AnN3R6XjKZjaaSrnxlJk=; b=IyReSb+Z29q+je59wZz1aQ3byy
 SmSM37pua3FE1K1X1v7ZUHDHWb7XxxKO4npsqr5465rJMOPBZyIBNA1FuStIEp/RUIxrqnOhdF7n2
 z7OJCVrCGbglqxvvJKCaxdQYox1vkNiyQg912v+9em7MYfXtbJMxqs2NSQBvANlHAGZ/fFTKQhkJf
 pNasbgKN2auYv0/31v1h1PsETv9dPjhJRkufr0qD1EQN8toYvAIAlheNBpmfF0lMZ/Fjj1TCy6NZU
 GSVP2Z3lF8ZgF+qKJ9Ag0Od0fJyI19s2XUWTLeCJDDYPNv6cKn1xUZZduouPiLdCiqUrN9SN8BzN4
 mwsy6nURUySVgpoIZ2LKRNzkhPhxOO4daHEL3e3iyMEYnV1Dn3hKgZFJZs5fYpt361/N27eY4SFhS
 TxlUmCBO21NToDuui+IFFpr2y/ktERiPGKGoWVBFLKzKnw7Iqqa5r5RrO30vocIwFjXB4/oe85LLc
 s0PRUlkqyxfmNbZfjopF48xwsd16lGKYEdpWf91RJ5okFGm+BQ6/KL/uSBRqheMIKalJ1a6y/6ACD
 Q7AtD6BrAsMz7ebj4BwkK16H+CrLEgoV+YImFQUAn/GSIF8rfj8qZqDxuofvLsREGYwczag6da9Cz
 oaAfe4ik6f4mJWGtko6qCVRrLA7q35eoWkMQFj+Zo=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 =?utf-8?B?S8WRdsOhZ8OzIFpvbHTDoW4=?= <dirty.ice.hu@gmail.com>,
 Volker =?ISO-8859-1?Q?R=FCmelin?= <vr_qemu@t-online.de>,
 Yonggang Luo <luoyonggang@gmail.com>, clamky@hotmail.com
Subject: Re: [PATCH 3/3] MAINTAINERS: Split Audio backends sections
Date: Tue, 17 Aug 2021 13:41:46 +0200
Message-ID: <2633734.AQBlmsM1iX@silver>
In-Reply-To: <20210816191014.2020783-4-philmd@redhat.com>
References: <20210816191014.2020783-1-philmd@redhat.com>
 <20210816191014.2020783-4-philmd@redhat.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Montag, 16. August 2021 21:10:14 CEST Philippe Mathieu-Daud=E9 wrote:
> Split the Audio backends into multiple sections (OS / framework /
> library), allowing developers with different interests to add their
> contact to the relevant entries.
>=20
> Suggested-by: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> ---
>  MAINTAINERS | 42 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f18fcd76450..94dea726e05 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2270,9 +2270,51 @@ Overall Audio backends
>  M: Gerd Hoffmann <kraxel@redhat.com>
>  S: Odd Fixes
>  F: audio/
> +X: audio/alsaaudio.c
> +X: audio/coreaudio.c
> +X: audio/dsound*
> +X: audio/jackaudio.c
> +X: audio/ossaudio.c
> +X: audio/paaudio.c
> +X: audio/sdlaudio.c
>  X: audio/spiceaudio.c
>  F: qapi/audio.json
>=20
> +ALSA Audio backend
> +M: Gerd Hoffmann <kraxel@redhat.com>
> +S: Odd Fixes
> +F: audio/alsaaudio.c
> +
> +Core Audio framework backend
> +M: Gerd Hoffmann <kraxel@redhat.com>
> +S: Odd Fixes
> +F: audio/coreaudio.c
> +
> +DSound Audio backend
> +M: Gerd Hoffmann <kraxel@redhat.com>
> +S: Odd Fixes
> +F: audio/dsound*
> +
> +JACK Audio Connection Kit backend
> +M: Gerd Hoffmann <kraxel@redhat.com>
> +S: Odd Fixes
> +F: audio/jackaudio.c
> +
> +Open Sound System (OSS) Audio backend
> +M: Gerd Hoffmann <kraxel@redhat.com>
> +S: Odd Fixes
> +F: audio/ossaudio.c
> +
> +PulseAudio backend
> +M: Gerd Hoffmann <kraxel@redhat.com>
> +S: Odd Fixes
> +F: audio/paaudio.c
> +
> +SDL Audio backend
> +M: Gerd Hoffmann <kraxel@redhat.com>
> +S: Odd Fixes
> +F: audio/sdlaudio.c
> +
>  Block layer core
>  M: Kevin Wolf <kwolf@redhat.com>
>  M: Hanna Reitz <hreitz@redhat.com>

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

Best regards,
Christian Schoenebeck



