Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A6869F2F3
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 11:51:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUmhJ-0006D9-Al; Wed, 22 Feb 2023 05:50:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmhH-0006Cd-9p
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:50:03 -0500
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pUmhF-0000M5-KX
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 05:50:03 -0500
Received: by mail-lj1-x231.google.com with SMTP id f16so7272758ljq.10
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 02:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FnVajmiFx49cNB9HOlsvZVRFfOJ9zEVw3tRYVeUmXmU=;
 b=VpVY4FoYrdtLlRTVU+yCj6OWjk+YgGpIiZCEe8BX3LdRmww5wO6HP/Yceq3SbT7uJm
 8ghtGHG/Qy9nrFn+PshTfnEZwQjioC/t2gz+IrDkMut4UjXo2MD8ujZjaTNdJZjtTdBr
 cQifWvdpkrLgRL57YR5uv/rD1f0fS8EXvRWFVMNNorasFtlSK8bIuED0nUNaFVltwz4N
 ucrcr09TN3iXJZp6pjHvfbVXwarO6p4OPNqbBKMHY/dkAvVNWIe/O04XJ1RsF7z0E0jO
 5DagYVZx5JfDiqO7CLQmQTn+88NWUkd8ZmoJTI4YeSwTv3YwbThX4XHdur9HT3xeuGpT
 hBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FnVajmiFx49cNB9HOlsvZVRFfOJ9zEVw3tRYVeUmXmU=;
 b=T9xHPh8kn3JJMU3LL2ffgRnsZM06vPouI0O43ShT3lgjeSM3EVGC5B98NDSoF6uGhT
 lkggNtFndu2zIlp0+YBakRowH7urfnOcjkVBrZUlWOs5nmAZ6mUkuoKSgcBe9is/Oswu
 QWkMFctsBhYyIN/WHxmlAJBiGAM5egscafxPHi9ClWpIOwt0zo64M43XWlLVw74Bc0zB
 1SPGwHLEU/mzG9j97PqmHb+A1F6ZcF5IvVGKNlYAEdG/ie3UwPIzYDuEDgUsUdI8QkcQ
 sghWE+H23GkQ/GwLzjKt+g7dRIZFcmii3Q9CO+EiVeNYhxsLtDBES1cKd2XdZypAuR4s
 1YaQ==
X-Gm-Message-State: AO0yUKXxZDxPmPmzSKAv1/xhzeKfp6u2NZIhYvEHK9h8fRXLzMWakwGU
 IcdHHMFYghsWQhXS2Pl9KHb/s1nTiHwDSuaZmks=
X-Google-Smtp-Source: AK7set/PkGRqcl+kHQfYn2gHIPGd8+2BSbL8iDgGBaWH5knj+dxs18hfvM8Fgi6XCKkbEInekpPbVif2GK1ry7s7yW4=
X-Received: by 2002:a05:651c:b9b:b0:295:945d:b382 with SMTP id
 bg27-20020a05651c0b9b00b00295945db382mr1087180ljb.4.1677063000010; Wed, 22
 Feb 2023 02:50:00 -0800 (PST)
MIME-Version: 1.0
References: <df6510fe-1dfd-1585-8590-db230c71d367@t-online.de>
 <20230206185237.8358-5-vr_qemu@t-online.de>
In-Reply-To: <20230206185237.8358-5-vr_qemu@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 22 Feb 2023 14:49:46 +0400
Message-ID: <CAJ+F1CJzjgD8cJnrWygY4dC7XUVxN3DNs7E+bsB9Vy--+piyyw@mail.gmail.com>
Subject: Re: [PATCH v2 05/17] audio: remove sw == NULL check
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Mon, Feb 6, 2023 at 10:52 PM Volker R=C3=BCmelin <vr_qemu@t-online.de> w=
rote:
>
> All call sites of audio_pcm_sw_write() guarantee that sw is not
> NULL. Remove the unnecessary NULL check.
>
> Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>



> ---
>  audio/audio.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/audio/audio.c b/audio/audio.c
> index 4412b5fad8..8f1c0e77b0 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -712,10 +712,6 @@ static size_t audio_pcm_sw_write(SWVoiceOut *sw, voi=
d *buf, size_t size)
>      size_t hw_free;
>      size_t ret, total;
>
> -    if (!sw) {
> -        return size;
> -    }
> -
>      hwsamples =3D sw->hw->mix_buf.size;
>
>      live =3D sw->total_hw_samples_mixed;
> --
> 2.35.3
>


--
Marc-Andr=C3=A9 Lureau

