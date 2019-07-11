Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D2065435
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 11:55:19 +0200 (CEST)
Received: from localhost ([::1]:39904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlVnK-0005Zh-B9
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 05:55:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52590)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <geert.uytterhoeven@gmail.com>) id 1hlVmi-0005Az-7X
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 05:54:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <geert.uytterhoeven@gmail.com>) id 1hlVmg-0002J3-FR
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 05:54:40 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37426)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <geert.uytterhoeven@gmail.com>)
 id 1hlVmg-0002I6-AO
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 05:54:38 -0400
Received: by mail-ot1-f67.google.com with SMTP id s20so5226462otp.4
 for <qemu-devel@nongnu.org>; Thu, 11 Jul 2019 02:54:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O/5PBzbOSkarM0fR7QZKIT7PJomPF+Mz3qw+l6PgF5Y=;
 b=DlNxn8yxB3nQJnEp8UT7IkBbpLu8ubVTAmcNGVae4nIgZ+xQ9QSY53dHCoUKwy092s
 l+Bj44QOCaHIhNCMs9dQ8O1JZhIrcgKXzILJDUTWpbIPxaugUSXfKWjTPrzyiZiyY7ln
 PgHU6jPCO5iAEOfG/NhLmZ62Z99t0+VYe23NDv5ZxjlJO6xIAe3vuv/bTVxrqhRGDbXe
 dqwUbUctNp9UwxLggKWKGzJJmLOyL2si/5mi/6GpU+MuIr8LTHUhzlBlKxqwHPSy4VMw
 nMG7jPPh8rruz1+cU4JO2JNMK4Dti+6xwtI8vKgthiSdqgXD/ncytZbqaocJu8W4IR12
 OH/Q==
X-Gm-Message-State: APjAAAUITuDfM4AUx7Mun22zhkCq9SomHFKnyaWgeytNmj2tbdChOmYu
 zrK1DnP9iZQSInX8bnuYSSqY7KoLjBji+7uP/NI=
X-Google-Smtp-Source: APXvYqyK0DKq3ZkjRdl7YQmWxsya6hifOg7+4DokzYCRW2KnOdJBEZwbn4B17kuLWtHJCatZb6xcjHbBhlJ8ZYeniDE=
X-Received: by 2002:a9d:7a90:: with SMTP id l16mr2691084otn.297.1562838876685; 
 Thu, 11 Jul 2019 02:54:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190705160536.12047-1-geert+renesas@glider.be>
 <8500a069-9e29-d6ad-e5e4-22d5a3eead59@electromag.com.au>
 <CAMuHMdWLcr0pf-ZM3+iWQGwDLB2xoHAZaeCKAjtEVEaiNed63Q@mail.gmail.com>
 <1fc3a5ad-6eb6-3356-5fd4-93ce0482bb7e@electromag.com.au>
In-Reply-To: <1fc3a5ad-6eb6-3356-5fd4-93ce0482bb7e@electromag.com.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Jul 2019 11:54:25 +0200
Message-ID: <CAMuHMdXTyN0wHJyZJavER7b5h5j=7j8MADhZvFwBLpH60x39sA@mail.gmail.com>
To: Phil Reid <preid@electromag.com.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.210.67
Subject: Re: [Qemu-devel] [PATCH RFC] gpio: Add Virtual Aggregator GPIO
 Driver
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>,
 Alexander Graf <agraf@suse.de>, QEMU Developers <qemu-devel@nongnu.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Phil,

On Thu, Jul 11, 2019 at 11:24 AM Phil Reid <preid@electromag.com.au> wrote:
> On 10/07/2019 18:21, Geert Uytterhoeven wrote:
> > On Wed, Jul 10, 2019 at 4:00 AM Phil Reid <preid@electromag.com.au> wrote:
> >> On 6/07/2019 00:05, Geert Uytterhoeven wrote:
> >>> GPIO controllers are exported to userspace using /dev/gpiochip*
> >>> character devices.  Access control to these devices is provided by
> >>> standard UNIX file system permissions, on an all-or-nothing basis:
> >>> either a GPIO controller is accessible for a user, or it is not.
> >>> Currently no mechanism exists to control access to individual GPIOs.
> >>>
> >>> Hence add a virtual GPIO driver to aggregate existing GPIOs (up to 32),
> >>> and expose them as a new gpiochip.  This is useful for implementing
> >>> access control, and assigning a set of GPIOs to a specific user.
> >>> Furthermore, it would simplify and harden exporting GPIOs to a virtual
> >>> machine, as the VM can just grab the full virtual GPIO controller, and
> >>> no longer needs to care about which GPIOs to grab and which not,
> >>> reducing the attack surface.
> >>>
> >>> Virtual GPIO controllers are instantiated by writing to the "new_device"
> >>> attribute file in sysfs:
> >>>
> >>>       $ echo "<gpiochipA> <gpioA1> [<gpioA2> ...]"
> >>>              "[, <gpiochipB> <gpioB1> [<gpioB2> ...]] ...]"
> >>>               > /sys/bus/platform/drivers/gpio-virt-agg/new_device
> >>>
> >>> Likewise, virtual GPIO controllers can be destroyed after use:
> >>>
> >>>       $ echo gpio-virt-agg.<N> \
> >>>               > /sys/bus/platform/drivers/gpio-virt-agg/delete_device
> >>>

> >> Would it be possible to do the lookup via line names?
> >
> > Doesn't the fact that a GPIO has a line name means that it is in use, and
> > thus cannot be aggregated and exported to another user?
>
> They can be given line names via the dt property gpio-line-names.
> Which can be used by user space to find a gpio. Not sure if there's an equivalent api inkerenl.
> But it looks like we can find the info via struct gpiochip_info / gpioline_info linfo and work
> out the chip name and line offsets. So probably not required.
>
> Find the right gpio always seems tricky.
> We have systems with multiple i2c gpio behind muxes that may or may not be present.
> So i2c bus numbers are never consistent. And then different board revisions move the
> same gpio line to a different pin (or cahnge the gpio chip type completely) to make routing easier etc.

OK, so extending lookup to line names makes sense.
This requires making gpio_name_to_desc() public.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

