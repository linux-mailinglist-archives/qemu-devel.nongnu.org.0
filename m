Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EDC5A771
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jun 2019 01:13:19 +0200 (CEST)
Received: from localhost ([::1]:36856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hh03S-0001zc-H3
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 19:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49980)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hh022-0001Ei-OE
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 19:11:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hh021-0005sJ-F0
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 19:11:50 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:36002)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hh020-0005r0-Vg; Fri, 28 Jun 2019 19:11:49 -0400
Received: by mail-lj1-x242.google.com with SMTP id i21so7523590ljj.3;
 Fri, 28 Jun 2019 16:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Qccsu5x6kB7jCaLQxuOMBdY/fI0UO2VS1SdP2VVyGk8=;
 b=IGZ67m6icfCTAT9pHsv3SlJlXQ3bh03DrZsIiXGsOR8Q/k1cQdZkG+wyVIJcZncemC
 gU2RSLsGEVvjMGIvmcKEIIC8IqCv8/qJpV/BStBTQbiYYw8WsGCky7H6xvUbMto9/ui7
 +WA3qF/GqWFBZ7yXr/GcMdQSuigHLL8H4rIvO1uPlcsT3sZrAMCCgcoIVGhM2Fv+G63n
 +M1fz8N+4NcGUtRDoEVlRtfW2pm6K6D/3iqmwSA/FllH1wNoDfeedW2k7du+31uT5q5K
 OYcbM9LR5j9EJRcUyuNrL0JafjGcDcYefVjTgBu4Zj11hSW1UPs9P+OU0cGv5USBHSmh
 PTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Qccsu5x6kB7jCaLQxuOMBdY/fI0UO2VS1SdP2VVyGk8=;
 b=mbpIb9zt5iJ8+FAbCuQUrBMzVoTQ1lbLbn63C00bw+uuxHQb9+7JeR8bw6z5p5YgfX
 yfRmadwwO7WHXeZ5gWQq5bICcwM5PS5nwfum9doQIi5t9pukWRR/EVW8GYxf7Qc4v6Tu
 OVPR3mgta7SgZC6Uq3QBh6NmKhp/7CVlOZItNEuWz85bm8JREQjRK18aciQnFAB6NfxQ
 sp0FnFiia5DyMBi1ZgxZv6rAcJH2tv1gacBSK/dVBlRtVWBqR/fQzgd31g7pduf3E+xU
 Pzw4t3lZny1OOAGHPGjQDI5z4OAT4UvHkrteHneVumzGQzAP1nbsBvcjUnQ/kqVjf4V6
 NFJA==
X-Gm-Message-State: APjAAAWEMBS4zi4QrQGp/TxAa5mkfSfuodBJUpaGJXfTaQwYrCpoDOeT
 BNRqQiiffuZ62v4cvNecX1wkBYahfVD3ZF3Zp9o=
X-Google-Smtp-Source: APXvYqy79NVVizY6RqRQ0IfOPnbJDd8b5qQGC6oBOGQ6Jv5CtNYODUAmY61f7bF6Mg2/Sh50f+Ly8FlATIX/evH/f7M=
X-Received: by 2002:a2e:5d5a:: with SMTP id r87mr7628182ljb.196.1561763507836; 
 Fri, 28 Jun 2019 16:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190627202719.17739-1-philmd@redhat.com>
 <20190627202719.17739-22-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-22-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 28 Jun 2019 16:08:47 -0700
Message-ID: <CAKmqyKOX0qNuLGEj1xCritNStfgq9tPKkqdy3P8gd4+y-yuXZg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-devel] [PATCH v5 21/28] hw/block/pflash_cfi02: Fix CFI in
 autoselect mode
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
 Stephen Checkoway <stephen.checkoway@oberlin.edu>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Qemu-block <qemu-block@nongnu.org>, John Snow <jsnow@redhat.com>,
 Magnus Damm <magnus.damm@gmail.com>, Markus Armbruster <armbru@redhat.com>,
 Antony Pavlov <antonynpavlov@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Michael Walle <michael@walle.cc>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 27, 2019 at 2:09 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> From: Stephen Checkoway <stephen.checkoway@oberlin.edu>
>
> After a flash device enters CFI mode from autoselect mode, the reset
> command returns the device to autoselect mode. An additional reset
> command is necessary to return to read array mode.
>
> Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
> Acked-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20190426162624.55977-7-stephen.checkoway@oberlin.edu>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/block/pflash_cfi02.c   | 22 ++++++++++++++++++----
>  tests/pflash-cfi02-test.c | 39 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 57 insertions(+), 4 deletions(-)
>
> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
> index 08b2bc83cb..13f76fa71d 100644
> --- a/hw/block/pflash_cfi02.c
> +++ b/hw/block/pflash_cfi02.c
> @@ -66,6 +66,7 @@ do {                                                   =
    \
>  /* Special write cycles for CFI queries. */
>  enum {
>      WCYCLE_CFI              =3D 7,
> +    WCYCLE_AUTOSELECT_CFI   =3D 8,
>  };
>
>  struct PFlashCFI02 {
> @@ -311,6 +312,12 @@ static void pflash_write(void *opaque, hwaddr offset=
, uint64_t value,
>      cmd =3D value;
>      if (pfl->cmd !=3D 0xA0) {
>          if (cmd =3D=3D 0xF0) {
> +            if (pfl->wcycle =3D=3D WCYCLE_AUTOSELECT_CFI) {
> +                /* Return to autoselect mode. */
> +                pfl->wcycle =3D 3;
> +                pfl->cmd =3D 0x90;
> +                return;
> +            }
>              goto reset_flash;
>          }
>      }
> @@ -333,7 +340,6 @@ static void pflash_write(void *opaque, hwaddr offset,=
 uint64_t value,
>          /* We're in read mode */
>      check_unlock0:
>          if (boff =3D=3D 0x55 && cmd =3D=3D 0x98) {
> -        enter_CFI_mode:
>              /* Enter CFI query mode */
>              pfl->wcycle =3D WCYCLE_CFI;
>              pfl->cmd =3D 0x98;
> @@ -410,9 +416,16 @@ static void pflash_write(void *opaque, hwaddr offset=
, uint64_t value,
>                  /* Unlock bypass reset */
>                  goto reset_flash;
>              }
> -            /* We can enter CFI query mode from autoselect mode */
> -            if (boff =3D=3D 0x55 && cmd =3D=3D 0x98)
> -                goto enter_CFI_mode;
> +            /*
> +             * We can enter CFI query mode from autoselect mode, but we =
must
> +             * return to autoselect mode after a reset.
> +             */
> +            if (boff =3D=3D 0x55 && cmd =3D=3D 0x98) {
> +                /* Enter autoselect CFI query mode */
> +                pfl->wcycle =3D WCYCLE_AUTOSELECT_CFI;
> +                pfl->cmd =3D 0x98;
> +                return;
> +            }
>              /* No break here */
>          default:
>              DPRINTF("%s: invalid write for command %02x\n",
> @@ -493,6 +506,7 @@ static void pflash_write(void *opaque, hwaddr offset,=
 uint64_t value,
>          break;
>      /* Special values for CFI queries */
>      case WCYCLE_CFI:
> +    case WCYCLE_AUTOSELECT_CFI:
>          DPRINTF("%s: invalid write in CFI query mode\n", __func__);
>          goto reset_flash;
>      default:
> diff --git a/tests/pflash-cfi02-test.c b/tests/pflash-cfi02-test.c
> index 1659eaebce..00e2261742 100644
> --- a/tests/pflash-cfi02-test.c
> +++ b/tests/pflash-cfi02-test.c
> @@ -407,6 +407,42 @@ static void test_geometry(const void *opaque)
>      qtest_quit(qtest);
>  }
>
> +/*
> + * Test that
> + * 1. enter autoselect mode;
> + * 2. enter CFI mode; and then
> + * 3. exit CFI mode
> + * leaves the flash device in autoselect mode.
> + */
> +static void test_cfi_in_autoselect(const void *opaque)
> +{
> +    const FlashConfig *config =3D opaque;
> +    QTestState *qtest;
> +    qtest =3D qtest_initf("-M musicpal,accel=3Dqtest"
> +                        " -drive if=3Dpflash,file=3D%s,format=3Draw,copy=
-on-read",
> +                        image_path);
> +    FlashConfig explicit_config =3D expand_config_defaults(config);
> +    explicit_config.qtest =3D qtest;
> +    const FlashConfig *c =3D &explicit_config;
> +
> +    /* 1. Enter autoselect. */
> +    unlock(c);
> +    flash_cmd(c, UNLOCK0_ADDR, AUTOSELECT_CMD);
> +    g_assert_cmpint(flash_query(c, FLASH_ADDR(0)), =3D=3D, replicate(c, =
0xBF));
> +
> +    /* 2. Enter CFI. */
> +    flash_cmd(c, CFI_ADDR, CFI_CMD);
> +    g_assert_cmpint(flash_query(c, FLASH_ADDR(0x10)), =3D=3D, replicate(=
c, 'Q'));
> +    g_assert_cmpint(flash_query(c, FLASH_ADDR(0x11)), =3D=3D, replicate(=
c, 'R'));
> +    g_assert_cmpint(flash_query(c, FLASH_ADDR(0x12)), =3D=3D, replicate(=
c, 'Y'));
> +
> +    /* 3. Exit CFI. */
> +    reset(c);
> +    g_assert_cmpint(flash_query(c, FLASH_ADDR(0)), =3D=3D, replicate(c, =
0xBF));
> +
> +    qtest_quit(qtest);
> +}
> +
>  static void cleanup(void *opaque)
>  {
>      unlink(image_path);
> @@ -474,6 +510,9 @@ int main(int argc, char **argv)
>          qtest_add_data_func(path, config, test_geometry);
>          g_free(path);
>      }
> +
> +    qtest_add_data_func("pflash-cfi02/cfi-in-autoselect", &configuration=
[0],
> +                        test_cfi_in_autoselect);
>      int result =3D g_test_run();
>      cleanup(NULL);
>      return result;
> --
> 2.20.1
>
>

