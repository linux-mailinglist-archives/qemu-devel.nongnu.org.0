Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF04235AA5A
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Apr 2021 04:45:44 +0200 (CEST)
Received: from localhost ([::1]:39672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lV3d1-0000YH-Dm
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 22:45:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1lV3bU-00005X-8i
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 22:44:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:37570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenhuacai@kernel.org>)
 id 1lV3bS-0007ib-JT
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 22:44:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 01E08610A2
 for <qemu-devel@nongnu.org>; Sat, 10 Apr 2021 02:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618022644;
 bh=UvEHqi8mVEpcnBo/dQF8JEMP7dsNow4lpzWSAoxfSQA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Yu9rY69Bv06ouvBOPWP8YXjFPdiwqlnJ4WFPN3bcwg08jPkGBR6JviutqcsgJARfY
 I6iI+h4m3ejK0xRlkMV1ykZcHKkijXIF8HFeO8x8V3HB+ammqWOr1N3WEMqy/w9tvm
 WgKz7p0TXV1CvfVQ/IQ6unsrWQRGti0fgPxbGyBY18i3dEHPwq+BDCRIYGVIzqxNBU
 LRgZV5uhyivx14EbviciVHRTGFcIUTIm3AO+0kjhOIHTiLePUAe5nnXVkWP32zmCym
 OKGt70yn9EsgKt4GfzTztQjggcm/HaMq7RGWFbzQLV8i2iJp+Zm8tqIgHyGJxtJTfY
 H8UcRVP2btm3g==
Received: by mail-io1-f52.google.com with SMTP id x17so7883110iog.2
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 19:44:03 -0700 (PDT)
X-Gm-Message-State: AOAM5306UvYRYHUPrHzQQxkXlhYfUwCgMk9DyuDmJYk1ACifSQai30ow
 98y9HshZJwfsPPVSvBWe+7IAG/iBH6ARsiMYJjs=
X-Google-Smtp-Source: ABdhPJzyxnuhqvI7usp6OOHEDah522OUHAVaha5HYtMDpTxnK2SfPUNnUvEBFBHGEHAcrrxjAALwPq063/YSgOQ+MsU=
X-Received: by 2002:a05:6602:2be1:: with SMTP id
 d1mr13496094ioy.148.1618022643466; 
 Fri, 09 Apr 2021 19:44:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210409093623.2402750-1-f4bug@amsat.org>
 <20210409093623.2402750-7-f4bug@amsat.org>
In-Reply-To: <20210409093623.2402750-7-f4bug@amsat.org>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 10 Apr 2021 10:43:52 +0800
X-Gmail-Original-Message-ID: <CAAhV-H76XQZxvp9b2fE-R-Eq26GViaPR-iC2tG6PYhWtxNasxA@mail.gmail.com>
Message-ID: <CAAhV-H76XQZxvp9b2fE-R-Eq26GViaPR-iC2tG6PYhWtxNasxA@mail.gmail.com>
Subject: Re: [RFC PATCH-for-6.1 v2 6/6] hw/mips/loongson3_virt: Raise CPU
 clock to 2 GHz
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=198.145.29.99; envelope-from=chenhuacai@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Luc Michel <luc@lmichel.fr>,
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Philippe,

On Fri, Apr 9, 2021 at 5:36 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> Commit cd3a53b727d ("clock: Add clock_ns_to_ticks() function")
> removed the limitation of using clock with a frequency of 1 GHz
> or more.
>
> The previous commit converted the MIPS CP0 timer to use this
> new clock_ns_to_ticks() function. We can now use a clock of
> 2 GHz with the Loongson3 virt board.
Yes, we can do this, but why should we do this? I don't think this can
bring any advantages.

Huacai
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/mips/loongson3_virt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/mips/loongson3_virt.c b/hw/mips/loongson3_virt.c
> index b15071defc6..0b72ef8a684 100644
> --- a/hw/mips/loongson3_virt.c
> +++ b/hw/mips/loongson3_virt.c
> @@ -152,7 +152,7 @@ static const MemoryRegionOps loongson3_pm_ops =3D {
>      }
>  };
>
> -#define DEF_LOONGSON3_FREQ (800 * 1000 * 1000)
> +#define DEF_LOONGSON3_FREQ (2000 * 1000 * 1000)
>
>  static uint64_t get_cpu_freq_hz(void)
>  {
> --
> 2.26.3
>

