Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1AE139F4C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 03:04:40 +0100 (CET)
Received: from localhost ([::1]:58222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irBZP-0006UU-KO
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 21:04:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47349)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1irBVr-0003dA-1W
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 21:01:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1irBVp-0002Pc-U3
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 21:00:58 -0500
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:43799)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1irBVp-0002OX-Mi; Mon, 13 Jan 2020 21:00:57 -0500
Received: by mail-lf1-x141.google.com with SMTP id 9so8471341lfq.10;
 Mon, 13 Jan 2020 18:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jIOw/CbzXybkeMH1o84BTHPma96iahA5s5mXf7EbPk0=;
 b=F/2EGDDC2WMeINqtbvPOP6hek9GQs8wGt5hGy2hjzrUb+9ElYoc0NdDXkcStJx3NUM
 dY+yg5+BJY9/galzSJ6/BnzwwDlHVHm7vY+3lCjUlap+A/NRZyB8XrhB2CbucKLr2ICo
 NXi6qbwodf9FCH/h1Rgs5hAULbEk5h+wWwdJXAffR9ukxUykbQ0ClU687A0xvKGB0dxM
 3GCEOgcMaPrcOjCyPGKR7kooF/lagCH882ycJtKvvAY2qhCQ1V9UdwNECGVZffPyZRqc
 XGxqgretv6V6c/cs1s/DYMUqTDmAyTXxO6CZvHp4yBtmdAThPBr7BjDDZBwAIrbjY8Ug
 XBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jIOw/CbzXybkeMH1o84BTHPma96iahA5s5mXf7EbPk0=;
 b=prkozXEH+rpH5+zOhyb4IIGGHKwQ0Iz4SN5eqOZB3q7cbkZihVJ8WjaYjGGJQ1GWPX
 fEXr+Ve1X6sojBVr0fX62MBc+C95u1wkeVgLl5AYPWGrPFIe42XcuvcByfV+GxdjGGJE
 47LE/big+BVfi/WcFubxKpDBnnkfsqJxLV0vf1Q39LjQ9uKafmhw2GzGV8IDfzc/ZW8b
 Hp9ELR1O7gHHF+v1ujD0PjSuN5SD/DSeHpzjVHSeV1fp99fBA7bwR1zLtgHyoedkxJJI
 Lrv/L5v2tfXwiBtjwIW/EJ3zbRR42CnuZ1OkchOxHciAg4RuzATX3juG2/s2gp4WdUeC
 YoQw==
X-Gm-Message-State: APjAAAUJ3L8Yc2kJpU6M5TbyDLXGCsZu8iV/ymk4eNe5/K5FLJ55Blvt
 cxWGE/4csc+fT/QO8mDT5oXr7Rl05RVkL1KmlQk=
X-Google-Smtp-Source: APXvYqy0yOxpo2ZhrAVQmvYzqkDqXbC7rHMR28Xir3J+/oJ9W0WgJXcuHpsQDEKYMEI20F51m0GHIdp0kwKp1u+TE+I=
X-Received: by 2002:a19:4ac2:: with SMTP id x185mr215459lfa.131.1578967256625; 
 Mon, 13 Jan 2020 18:00:56 -0800 (PST)
MIME-Version: 1.0
References: <20200109152133.23649-1-philmd@redhat.com>
 <20200109152133.23649-16-philmd@redhat.com>
In-Reply-To: <20200109152133.23649-16-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 14 Jan 2020 12:00:30 +1000
Message-ID: <CAKmqyKPZ-=Njnv9KhS7yN_UE_Cij_eD=uUxdKhB5r8+dddiCyg@mail.gmail.com>
Subject: Re: [PATCH 15/15] vl: Make current_machine a local variable
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::141
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
 Eduardo Habkost <ehabkost@redhat.com>,
 "open list:Overall" <kvm@vger.kernel.org>, Juan Quintela <quintela@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 "open list:New World" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 10, 2020 at 1:34 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Since we now only use current_machine in vl.c, stop exporting
> it as a global variable in "hw/board.h", and make it static
> to vl.c.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/hw/boards.h | 2 --
>  vl.c                | 4 ++--
>  2 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 61f8bb8e5a..b0c0d4376d 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -59,8 +59,6 @@ void memory_region_allocate_system_memory(MemoryRegion =
*mr, Object *owner,
>  #define MACHINE_CLASS(klass) \
>      OBJECT_CLASS_CHECK(MachineClass, (klass), TYPE_MACHINE)
>
> -extern MachineState *current_machine;
> -
>  void machine_run_board_init(MachineState *machine);
>  bool machine_usb(MachineState *machine);
>  int machine_phandle_start(MachineState *machine);
> diff --git a/vl.c b/vl.c
> index 3ff3548183..7a69af4bef 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -214,6 +214,8 @@ static int default_sdcard =3D 1;
>  static int default_vga =3D 1;
>  static int default_net =3D 1;
>
> +static MachineState *current_machine;
> +
>  static struct {
>      const char *driver;
>      int *flag;
> @@ -1164,8 +1166,6 @@ static int usb_parse(const char *cmdline)
>  /***********************************************************/
>  /* machine registration */
>
> -MachineState *current_machine;
> -
>  static MachineClass *find_machine(const char *name, GSList *machines)
>  {
>      GSList *el;
> --
> 2.21.1
>
>

