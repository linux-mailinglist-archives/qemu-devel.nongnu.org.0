Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 602B93B2C6C
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 12:27:11 +0200 (CEST)
Received: from localhost ([::1]:42136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwMZi-0002pp-0h
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 06:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tom.ty89@gmail.com>)
 id 1lwMXZ-0001Mj-6T; Thu, 24 Jun 2021 06:24:57 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:35379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tom.ty89@gmail.com>)
 id 1lwMXX-0002cz-8f; Thu, 24 Jun 2021 06:24:56 -0400
Received: by mail-lj1-x22f.google.com with SMTP id u11so7033633ljh.2;
 Thu, 24 Jun 2021 03:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0cN8nw9c6BNRFwRoI635HASzXunzHVA06il7cElP/og=;
 b=KALCqOgoLRQ5GmAp6Q3FBKfQsP5CG/VGmz/PPxk/3Q2PIBSd9qukLb5rTQ6sVHJ6gA
 Oxlsz4kMqrJX2geRpC5A/3OybE/HwYXtfoXgTBf0I8S8jcIrUkZ6vgxz0kA3LkYS4a28
 8UhqPSXc/1wrXp6Hz7yZR9NpdxP4xNMsCFtkvWMPoWxth4PgZMYdtdCafIVKJwbP96ya
 J1QN+sFHG3ZcSnbzc+evSkewSDf9njec0FCy55dhdNJOwIsPgf+4hQwvxD8g3YUaqhba
 UbmhmtbLlos6zyt11Gws4zjY4+XKW/954f4mOAkbVhKu7adFoT1UPsr0fdeN0BQCNFD9
 Uisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0cN8nw9c6BNRFwRoI635HASzXunzHVA06il7cElP/og=;
 b=tBOL04gI9oIbJ9/Vyhc5H2zyf9Kf1Dt9GxsXlM7AaFz7IgRCn2arKv+NqTRXasBaVV
 fz5qxn5QQx2fweLBgu0AP6FCHTCJI6mEXKs7lNLwDhSrTYXr6DnhD9T8lQCkuT2rcYU4
 FUjw7SqzdV01PMycNk+ws0CJseFeNiIH7VXNHlgqsh8XDsrHTDoCppPyUKHqmnChlkvG
 FpWZ1eV7JXOyCAnp6vtnjcpnwkgrljps3AVnkKHHnYsPTHqtZcKh2rMPLhhEkbINyZ59
 vdtkBB++d2Gxp1G/VD3bT6/HsqR1m+3/Mhb+4iWMDkmz+FGSFyAOjr6Xn19SMDcklcfg
 WbLw==
X-Gm-Message-State: AOAM531qcCvkry8xS3n26OIuiUUZBEL3jTOvkdIETp9zuFY+VC3HFfhg
 cU7ruJXd22NBvFjfsBGgqKikTNbUJ5ELxLsG9+U=
X-Google-Smtp-Source: ABdhPJw9r6ygL7fK+Ax36rj52EuUcJGpNxjUbRMGeLN3m6yFqr7TFjbQDwpMIyyoWJpOov0INVsiyDDi/7/smmsDvp8=
X-Received: by 2002:a2e:7f09:: with SMTP id a9mr3358682ljd.45.1624530292654;
 Thu, 24 Jun 2021 03:24:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210623180021.898286-1-f4bug@amsat.org>
 <20210623180021.898286-10-f4bug@amsat.org>
In-Reply-To: <20210623180021.898286-10-f4bug@amsat.org>
From: Tom Yan <tom.ty89@gmail.com>
Date: Thu, 24 Jun 2021 18:24:41 +0800
Message-ID: <CAGnHSE=CoXHKXeM+-PTv-EADcxisuqU3f91W1mCC0GTZO3UOuw@mail.gmail.com>
Subject: Re: [RFC PATCH 9/9] hw/sd: Allow card size not power of 2 again
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=tom.ty89@gmail.com; helo=mail-lj1-x22f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On Thu, 24 Jun 2021 at 02:01, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> In commit a9bcedd15a5 ("hw/sd/sdcard: Do not allow invalid SD card
> sizes") we tried to protect us from CVE-2020-13253 by only allowing
> card with power-of-2 sizes. However doing so we disrupted valid user
> cases. As a compromise, allow any card size, but warn only power of 2
> sizes are supported, still suggesting the user how to increase a
> card with 'qemu-img resize'.
>
> Cc: Tom Yan <tom.ty89@gmail.com>
> Cc: Warner Losh <imp@bsdimp.com>
> Buglink: https://bugs.launchpad.net/qemu/+bug/1910586
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/sd/sd.c | 25 +++++++++----------------
>  1 file changed, 9 insertions(+), 16 deletions(-)
>
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 9c8dd11bad1..cab4aab1475 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -2131,23 +2131,16 @@ static void sd_realize(DeviceState *dev, Error **=
errp)
>          blk_size =3D blk_getlength(sd->blk);
>          if (blk_size > 0 && !is_power_of_2(blk_size)) {
>              int64_t blk_size_aligned =3D pow2ceil(blk_size);
> -            char *blk_size_str;
> +            g_autofree char *blk_size_s =3D size_to_str(blk_size);
> +            g_autofree char *blk_size_aligned_s =3D size_to_str(blk_size=
_aligned);
>
> -            blk_size_str =3D size_to_str(blk_size);
> -            error_setg(errp, "Invalid SD card size: %s", blk_size_str);
> -            g_free(blk_size_str);
> -
> -            blk_size_str =3D size_to_str(blk_size_aligned);
> -            error_append_hint(errp,
> -                              "SD card size has to be a power of 2, e.g.=
 %s.\n"
> -                              "You can resize disk images with"
> -                              " 'qemu-img resize <imagefile> <new-size>'=
\n"
> -                              "(note that this will lose data if you mak=
e the"
> -                              " image smaller than it currently is).\n",
> -                              blk_size_str);
> -            g_free(blk_size_str);
> -
> -            return;
> +            warn_report("SD card size is not a power of 2 (%s). It might=
 work"
> +                        " but is not supported by QEMU. If possible, res=
ize"
> +                        " your disk image to %s with:",
> +                        blk_size_s, blk_size_aligned_s);
> +            warn_report(" 'qemu-img resize <imagefile> <new-size>'");
> +            warn_report("(note that this will lose data if you make the"
> +                        " image smaller than it currently is).");

Not trying to be picky, but I don't think this is much better. IMHO
it's quite irresponsible to give a warning like that, leaving users in
a state like "Should I use it or not then?", without giving a concrete
reference to what exactly might/would lead to the warned problem.

I really think we should get (/ have gotten) things clear first. What
exactly is the bug we have been talking about here? I mean like, where
does it occur and what's the nature of it.

1. Is it specific to a certain type / model of backend / physical
storage device that will be made use of by qemu for the emulated
storage? (I presume not since you mention about image, unless you
irrationally related/bound the emulated storage type and the physical
storage type together.)

2. Does it have anything to do with a certain flaw in qemu itself?
Like the code that does read/write operation is flawed that it cannot
be handled by a certain *proper* backend device?

3. Or is it actually a bug in a certain driver / firmware blob that
will be used by an *emulated* device in the guest? In that case, can
we emulate another model so that it won't be using the problematic
driver / firmware?

Also, could you provide any information / reference to what the bug
really is? Like a bug report (for the problem itself, not some vague
claim that qemu should workaround the problem)?

>          }
>
>          ret =3D blk_set_perm(sd->blk, BLK_PERM_CONSISTENT_READ | BLK_PER=
M_WRITE,
> --
> 2.31.1
>

