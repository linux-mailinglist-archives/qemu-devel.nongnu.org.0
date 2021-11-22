Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E070D458D49
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 12:23:22 +0100 (CET)
Received: from localhost ([::1]:52812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp7Pu-00040O-2Y
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 06:23:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mp7HP-0008E5-Is
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 06:14:35 -0500
Received: from [2a00:1450:4864:20::429] (port=33770
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mp7HN-0003H8-Ob
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 06:14:35 -0500
Received: by mail-wr1-x429.google.com with SMTP id d24so32047519wra.0
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 03:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yoFdkWO62twBanTX65W0CEzc9tStIbxUYO8OnbTVzjw=;
 b=nur0CyPscKh+zNJuTK12QgxLqnqL4NhoiVnJIj4jjDy+VteHKqELy1Haw1rYv4nE7U
 ESG1347CidssyvLdluEe3ACafw3zJvcHg0ET1oaq1+Ag7MCldtBsNQT+H8gP161cPB9N
 h7ADPZwDU2go6w4CSvAOH23kQFrsBz8rKrcWDKTdk6lpk6MJzAVgXD+j2Tdv2ykgibV9
 rwCHCoWCuPvr1aONicP6vA1E3XYv4+ONCJ0aZr/yaZbCN+K/vNwf6tosXQ/RSA/jJ0gA
 sg+S8zYtzoLfdxeSskFWr7Be8QuVwde3YANdWWWpX49edHjaq6GS7odXsQPIAzFNJpv5
 0XsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yoFdkWO62twBanTX65W0CEzc9tStIbxUYO8OnbTVzjw=;
 b=6I2u+CWjfJaqmU4NkS7BtApL8ojK5eoB8eEC7lO5I5YfAhdBB7M5L/SVi8IlO1wy3V
 TbjnuXWo6aFnTp4v/Ac47lNW0hbtXyx863NmzvyUWqTUzAfaQw5BdDHQu045LyqR5myu
 P9TRGn1OYYNgkPWDhiBwE4FqjLFjXAO+rsVu2hpCB4Sdg20eAbFtfvzXXFkJ+nYt3L6B
 8ldD/IuUJVzY8OC4j5c9Pe0kY2r25+wFLt8RkKyG3sTeQvwRC4XTWuPreYspOrcEmmV6
 jFLILRId192O8lwnk8Obx9QICgFSFg9uF1sJbGudgNiSdqgkRORjb3qK5ME4uUmEQtII
 pH7g==
X-Gm-Message-State: AOAM532phyLGaYdstfa++kQzERiAXMD9jGrorvdc7zVrthzXp21v5BU5
 193LmIjVYU3cUgnQgM9lIa4c6V2mV2jwjvo6StxuwQ==
X-Google-Smtp-Source: ABdhPJygWV4EY0Z8ZAB77tXm5TzUm7hjJTXvihZf52gOC/T0TbK1s4z/iJOw/XTCA9mrVvU2G82DrAfyxuve3fCzync=
X-Received: by 2002:a5d:6da1:: with SMTP id u1mr37524846wrs.263.1637579672483; 
 Mon, 22 Nov 2021 03:14:32 -0800 (PST)
MIME-Version: 1.0
References: <20211105172127.224462-1-f4bug@amsat.org>
 <20211105172127.224462-4-f4bug@amsat.org>
In-Reply-To: <20211105172127.224462-4-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Nov 2021 11:14:21 +0000
Message-ID: <CAFEAcA-xNhWGV46SY5K9uChAZWvU44YYgTgXu5wVjKtMq8XTug@mail.gmail.com>
Subject: Re: [PATCH 3/3] hw/input/pckbd: Rename i8042_setup_a20_line() and its
 a20 irq argument
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Nov 2021 at 17:21, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> 'a20_out' is an input IRQ, rename it as 'a20_input'.
> i8042_setup_a20_line() doesn't take a Device parameter
> but an ISADevice one. Rename it as i8042_isa_*() to
> make it explicit.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/input/i8042.h | 2 +-
>  hw/i386/pc.c             | 2 +-
>  hw/input/pckbd.c         | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
> index 1d90432daef..3534fcc4b43 100644
> --- a/include/hw/input/i8042.h
> +++ b/include/hw/input/i8042.h
> @@ -21,6 +21,6 @@ void i8042_mm_init(qemu_irq kbd_irq, qemu_irq mouse_irq=
,
>                     MemoryRegion *region, ram_addr_t size,
>                     hwaddr mask);
>  void i8042_isa_mouse_fake_event(ISAKBDState *isa);
> -void i8042_setup_a20_line(ISADevice *dev, qemu_irq a20_out);
> +void i8042_isa_setup_a20_line(ISADevice *dev, qemu_irq a20_input);
>
>  #endif /* HW_INPUT_I8042_H */
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 2592a821486..06ef74ca22b 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -1043,7 +1043,7 @@ static void pc_superio_init(ISABus *isa_bus, bool c=
reate_fdctrl, bool no_vmport)
>      port92 =3D isa_create_simple(isa_bus, TYPE_PORT92);
>
>      a20_line =3D qemu_allocate_irqs(handle_a20_line_change, first_cpu, 2=
);
> -    i8042_setup_a20_line(i8042, a20_line[0]);
> +    i8042_isa_setup_a20_line(i8042, a20_line[0]);

I think these days we can directly call
    qdev_connect_gpio_out_named(DEVICE(i8042), I8042_A20_LINE, 0, a20_line[=
0]);
and drop the i8042_setup_a20_line() wrapper entirely,
since the named GPIO lines are a "public" interface to the device.
We only have this i8042_setup_a20_line() because the original
implementation (added in commit 956a3e6bb738) predates gpio lines
and did an assignment into the KBDState struct which needed to
be private to pckbd.c.

>      qdev_connect_gpio_out_named(DEVICE(port92),
>                                  PORT92_A20_LINE, 0, a20_line[1]);

That would then make it consistent with how we're wiring up the
other A20 input source here.

(Some day we should perhaps make the A20 input to the CPU an actual
GPIO input on the CPU device object, so we could wire the I8042_A20_LINE
and PORT92_A20_LINE to it via an OR gate, and drop the intermidate
qemu_irq array and handle_a20_line_change function. But needing
the OR gate makes that a little clunky so I'm not sure it's
really worth the effort.)

-- PMM

