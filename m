Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F25C555B7C6
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 07:43:40 +0200 (CEST)
Received: from localhost ([::1]:53156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5hX9-0007Wk-LX
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 01:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o5hUy-0006mE-QO
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 01:41:24 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:51159)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1o5hUx-000273-3V
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 01:41:24 -0400
Received: by mail-pj1-x1033.google.com with SMTP id go6so8236164pjb.0
 for <qemu-devel@nongnu.org>; Sun, 26 Jun 2022 22:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=44Pd4G2+iDEO9VYngz3lzb0T/d6dttUrgpewfisYIl4=;
 b=X634DBrl5eu3B1tZwU43slORa1PaEOXpCKCUUlW7WKZddfsY7Fhmxk3JzRQN2zsRiy
 K1jzhXBfL1rHEdnSJVjNCWfroKYSDkBapkbgws32QxfjktbaWBPywoNXW2CCGlr5B1dU
 s5BUJ1VnZL6T8dnkIsRjoq0pZE9I0lTLu6mBWs4oddg/NOTiLeTcmVKNarM0YUK86iow
 /wMu7gDHIy0TxljmiCYRrFFcBNKBcBwnLzgKPYWezg52MK4eNAMhULrCWBe1WxZAibs8
 FwbWxsDvmBlxG2BpFhIBEHbm5AZpi4JtJitJRCczXG68OvDLyWWXdtUX/uklF5eh9eN2
 3MKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=44Pd4G2+iDEO9VYngz3lzb0T/d6dttUrgpewfisYIl4=;
 b=n6lfn3rpgU1l1jIHUfwOodrS1+ygSZqjxa8Bp1yC0sWBw4hgjl95XP3zAF5uJcRRVL
 rH+2Iy4oeHw1WmnncsCFdK+vzbgubCeZpH0Cs9kkJNcTqbmUbMTeUSGV0ZyTyDTZFi+M
 o0H1O/c+hgKyUnb6VbOCorCcSISVPwegYqOxxZARlmd25nzHO1ab54Jq1py4cTpLXBn6
 hVOWYi+fD37VORjdhrFvZfr24D1pyZfhKdW36dE4GecK9WkBn+H4RGqZ9eJbLmpX6sN7
 eQjB0awz6gAvVgLorqYG9GiXHqh5h8Pb4MvFHGcE8JMoJc9QcWu8sUwlXHDUXqXzWl+d
 fOfg==
X-Gm-Message-State: AJIora8SIQM2V6jEXBLiWx2uVRQSOqI+k7mkqg6qLKTVqEHLBtW9yb55
 EF0QhxZJeObEEVeZEJ+D4UtJlGxzbVqSL1B4sWE=
X-Google-Smtp-Source: AGRyM1tjnBc1afwSaj5BklSUfz3tCypm3l0iHjO4gC7wuFdXqODhbSpINFCKeVb1iZ6aTLO9XWtAzXJU5XUyHReh0xk=
X-Received: by 2002:a17:903:216:b0:167:921c:6590 with SMTP id
 r22-20020a170903021600b00167921c6590mr13004012plh.83.1656308480997; Sun, 26
 Jun 2022 22:41:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220625223458.1273408-1-simon.sapin@exyr.org>
 <da785d05-e322-2e40-7a89-e926256c6dbe@exyr.org>
In-Reply-To: <da785d05-e322-2e40-7a89-e926256c6dbe@exyr.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 27 Jun 2022 15:40:54 +1000
Message-ID: <CAKmqyKN+xvOseT_5XeFgZ=b77giU+wdaZy=w9OgEFL8EXNGDVg@mail.gmail.com>
Subject: Re: Booting bare-metal RISC-V virt (Was: [PATCH] Add some
 documentation for "dtb" devices tree blobs)
To: Simon Sapin <simon.sapin@exyr.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=alistair23@gmail.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jun 26, 2022 at 9:04 AM Simon Sapin <simon.sapin@exyr.org> wrote:
>
> On 26/06/2022 00:34, Simon Sapin wrote:
> > +On startup, the dtb is memory-mapped and its address is passed to the =
guest
> > +in a target-specific way:
> > +
> > +* Arm: :ref:`arm-baremetal`
> > +* **TODO**: document other targets
>
> Hello,

Hello

>
> My current interest is playing with bare-metal / freestanding RISC-V, usi=
ng QEMU as a
> reference emulator. Based on various blog posts, reading QEMU source code=
, and lots
> of trial-and-error I=E2=80=99ve managed to get something running[1] but i=
t wasn=E2=80=99t easy.

Written in Rust as well, nice!

I'm sorry to hear that you had so much trouble getting started with
RISC-V QEMU. We do try to make it easy, but everyone is busy and
documentation usually ends up being the last thing we do.

>
> In comparison, the docs for Arm virt have a very helpful section[2] for t=
his
> scenario. I would like to contribute similar docs for RISC-V virt but I=
=E2=80=99d need
> confirmation of the information to put in it:
>
> * Through `dumpdtb` I see that flash memory starts at address 0x2_000_000=
0, and RAM
> at 0x8_000_0000. Is this information that guest code can rely on and hard=
-code? What
> details can or cannot be similarly relied on?

Good question.

So first up, you can see all of the memory mappings in the
hw/riscv/virt.c file, if you find that easier than dumping device
trees.

We have previously kept the addresses backwards compatible. So that
software for an older virt machine will work on a newer one. There is
currently talks about changing the virt machine memory layout in a
breaking way and versioning in the current one though.

So I don't really have a good answer for you. I would recommend
reading as much as possible from the device tree dynamically at boot.

In general though we don't want to break people, we just might have to
make changes in the future to allow for new functionality.

>
> * With `qemu-system-riscv32 -machine virt -bios none -kernel something.el=
f -s -S`,
> GDB shows that execution starts at the lowest address of RAM, not of flas=
h like I
> expected. Then what is emulated flash for?

If you supply a flash image we will start executing from flash automaticall=
y.

>
> * What=E2=80=99s the difference between a bios and a kernel? The previous=
 command is based on
> a blog post but I don=E2=80=99t fully quite the details.

For a bare metal setup like yours there isn't really a difference. We
use -bios to specify the OpenSBI firmware and -kernel to specify a
Linux kernel. For your use you can use `-bios none -kernel ...`

>
> * I see in source code[3] that QEMU passes some arguments to the firmware=
. Register
> a0 gets the hart ID, a1 is the dtb address, but what=E2=80=99s in a2?

a2 stores the "dynamic firmware info" which is used by OpenSBI. The
riscv_rom_copy_firmware_info() copies the data to memory

>
> * To what extent is the above calling convention standardized? I found si=
milar things
> in coreboot[4] and in OpenSBI[5]

Good question. I don't think it's specified in a spec, but it is very commo=
n

Alistair

>
>
> [1] https://github.com/SimonSapin/riscv-qemu-demo
>
> [2]
> https://www.qemu.org/docs/master/system/arm/virt.html#hardware-configurat=
ion-information-for-bare-metal-programming
>
> [3] https://gitlab.com/qemu-project/qemu/-/blob/v7.0.0/hw/riscv/boot.c#L2=
97-317
>
> [4] https://doc.coreboot.org/arch/riscv/index.html#stage-handoff-protocol
>
> [5]
> https://github.com/riscv-software-src/opensbi/blob/v1.1/platform/generic/=
platform.c#L59-L75
>
>
> Thanks!
> --
> Simon Sapin
>

