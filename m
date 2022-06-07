Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 406CE53FBD7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 12:47:05 +0200 (CEST)
Received: from localhost ([::1]:53998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyWjm-0000Uz-IA
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 06:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnd@arndb.de>) id 1nyW4i-0000o5-Hf
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 06:04:36 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:45387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnd@arndb.de>) id 1nyW4g-0006G8-J2
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 06:04:36 -0400
Received: from mail-yb1-f175.google.com ([209.85.219.175]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N9MlG-1nkPUS0S6G-015HRX for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022
 12:04:32 +0200
Received: by mail-yb1-f175.google.com with SMTP id p13so30292778ybm.1
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 03:04:31 -0700 (PDT)
X-Gm-Message-State: AOAM533cQzHaM1bLqu5tMsqyWERqKHm82i0GzvIBXxyHJFc9AWmH2TAO
 H3OQgMIGr2qFmoTj8gSFbxLh6md3pFALEN+o1ag=
X-Google-Smtp-Source: ABdhPJzwRpYKwEkLLVAKUKAZ7ioUX6Kw8vDMVEignXpaaC9z+dzb6hkZrFCGT4AEYJViKABnTFhsrvkryOQS+qR8XLM=
X-Received: by 2002:a25:31c2:0:b0:641:660f:230f with SMTP id
 x185-20020a2531c2000000b00641660f230fmr28771253ybx.472.1654596270741; Tue, 07
 Jun 2022 03:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220527172731.1742837-1-shorne@gmail.com>
 <20220527172731.1742837-4-shorne@gmail.com>
 <CACPK8XexaTREY3Y-jp8urTAE+UmQWgygFx1MAss9KcJw5tGMtw@mail.gmail.com>
 <CAMuHMdWF_OwTMZZ=joRsnOAuB5UuKjACt3Ku4-o0--fR6xqQbQ@mail.gmail.com>
 <YpkWllpTFzb2HHY5@antec>
 <CAMuHMdXBtihLpdOYn7nj_fH2g08nDUiUd-_zCZ_EdEyvw1UxWA@mail.gmail.com>
 <YpwNtowUTxRbh2Uq@antec> <Ypxb/VDfYLFg3n2s@antec>
 <CAMuHMdVwAzbAOBDcv4y1WmYgCaFOMdywxUZvwMtDccOgDMN+mw@mail.gmail.com>
 <CAK8P3a3Vpn02uDe3rdXSNXANY=u4ZM+wjm-qqszTXzjOKkAeEg@mail.gmail.com>
 <Yp8epZsizfKMEVZV@antec>
In-Reply-To: <Yp8epZsizfKMEVZV@antec>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 7 Jun 2022 12:04:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3MDDE3ko93E0fMmHoXXveTUeYJXdEJbf0DEy3kcBFn0g@mail.gmail.com>
Message-ID: <CAK8P3a3MDDE3ko93E0fMmHoXXveTUeYJXdEJbf0DEy3kcBFn0g@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] hw/openrisc: Add the OpenRISC virtual machine
To: Stafford Horne <shorne@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Joel Stanley <joel@jms.id.au>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Openrisc <openrisc@lists.librecores.org>, 
 QEMU Development <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:8gLpXKZ6Z6LoShQ8myuVvDAEmY7BpqnJ351JFWHQ7nUV7eRq4Bv
 bnkUcnzO/dPjmJLs6k1SrgTRVzfIff5E8kJ1CGDUWNRoiJfZtKWT3blTPfjkNtwuf/9hqUn
 B27tM5BFEiUf6u+izF4hbGhWFz4UIvYkjNaAZy8RqH6z0aVLmWSKDusy0linAKvvHMnJkpu
 GVrgVOawMukwVw8Qzm03Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ACPVPgLd7IY=:KftE5dgwI5U9ILGuGf/C8N
 RFYvsLFBQuYUs3O+dsGxUhjJ67cVH5D5y4ldG+XoeRtWGpN3O9n0g+eSgu/4EtjCaXMk4j57n
 KE8ONiX7aX4YFw5bet4dihS1t+wnSAug30ySgAhysUkwqOyAHSsIdgZSpfX9Sd94rlMQoT3OU
 MFIbmnM6qRs/oQ5gFjm12I62Cr8Wo0pLEjuiPsJiVGxxeT6d4mJv7Se3M8PVvwsbuL3r5YzVW
 ckG+h8MqmiP7RaxewLn+sPjUC5f1/su/7XumtVQWl5Mdl16EfyHdcfJmsKlVXTfD/FMOVQ0v3
 gEFgdOkYQtiIy0tAe3AeGPj0Amq6tC/lc9+O3/psJ3/Z5GThITHjnThM5Ea+vhmvLDd7gIeIa
 /bqeLvtYVnKmwDIiiFlyvKImA247xbrN1AjEwHancSsEvCDlWfnAyiukDuWfoGScWLGloF9xv
 s3v4P2VPUIBbVAwlLR3qg3yDFtvppFoG9Uvhfnjr4I8+XB02wNjQt3ev1N/znRrtKdLXCz90N
 vbf8zF7Wapilna/ZUWljX3a3djRhrQ8wexSe3pElGXnI5dabCb/M5BFuRxMYOfLKqBtBcWjCV
 utiXW0ljdy60wS1V7XLViW3qgS5uW6yylqhhJf51t3lYi5bpcVAssoS1fvyIeuscNrQEbi+r+
 qIzHyR6/P0VPbpSC0SyF0LR2M0KSaiF5rlUIPANQQ2/kbPzHpOnwIXvAw5jT64qUNnZDZhZIv
 WA5ycyN6PuKVIMTl767eRxjguBO6ai1g3TFjhu72A2X2+WLRKtZq1i6ryDB6Zr6Nv7GMTju78
 s7FOaepTrqLF7LPqEW5JyyWnOA+msGPIdVnbMKNx8bRqlyx+vkR9/FLZvLsgIhCjLxUFnQVjg
 QPHvdgdizXtTStAAaxbtb/fj9t16l1e8kjUXBifOY=
Received-SPF: none client-ip=217.72.192.73; envelope-from=arnd@arndb.de;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

On Tue, Jun 7, 2022 at 11:47 AM Stafford Horne <shorne@gmail.com> wrote:
> On Tue, Jun 07, 2022 at 10:42:08AM +0200, Arnd Bergmann wrote:

> > Goldfish is a very old platform, as far as I know only the kernel port =
is new.
> > I don't know when qemu started shipping goldfish, but changing it now w=
ould
> > surely break compatibility with whatever OS the port was originally mad=
e for.
>
> Hi Arnd,
>
> As far as I can tell goldfish in qemu is not very old. There are 3 device=
s, 2 were
> added for the m68k virt machine, and 1 for riscv virt.
>
>     $ git lo -- hw/char/goldfish_tty.c
>     2021-11-09 65b4c8c759 Philippe Mathieu-Daud=C3=A9 hw/m68k: Fix typo i=
n SPDX tag
>     2021-03-15 8c6df16ff6 Laurent Vivier   hw/char: add goldfish-tty
>
>     $  git lo -- hw/intc/goldfish_pic.c
>     2021-11-09 65b4c8c759 Philippe Mathieu-Daud=C3=A9 hw/m68k: Fix typo i=
n SPDX tag
>     2021-03-15 8785559390 Laurent Vivier   hw/intc: add goldfish-pic

That is much younger than Laurent made it appear, from his earlier explanat=
ions
I expected this to have shipped a long time ago and been used in other
OSs to the
point where it cannot be fixed.

> The mips/loongson3_virt machine now also uses the goldfish_rtc.
>
> The problem with the goldfish device models is that they were defined as
> DEVICE_NATIVE_ENDIAN.
>
>     $ grep endianness hw/*/goldfish*
>     hw/char/goldfish_tty.c:    .endianness =3D DEVICE_NATIVE_ENDIAN,
>     hw/intc/goldfish_pic.c:    .endianness =3D DEVICE_NATIVE_ENDIAN,
>     hw/rtc/goldfish_rtc.c:    .endianness =3D DEVICE_NATIVE_ENDIAN,
>
> RISC-V is little-endian so when it was added there was no problem with ru=
nning
> linux goldfish drivers.
>
> MIPS Longson3, added last year, seems to be running as little-endian well=
, I
> understand MIPS can support both big and little endian. However according=
 to
> this all Loongson cores are little-endian.
>
>     https://en.wikipedia.org/wiki/Loongson
>
> As I understand when endianness of the devices in qemu are defined as
> DEVICE_NATIVE_ENDIAN the device endian takes the endian of the target CPU=
.
>
> This means that MIPS Loongson3 and RISC-V are affectively running as
> little-endian which is what would be expected.

Not really, the definition of DEVICE_NATIVE_ENDIAN in qemu is much less
well-defined than that as I understand, it is just whatever the person addi=
ng
support for that CPU thought would be the right one. A lot of CPUs can
run either big-endian or little-endian code, and e.g. on ARM, qemu
DEVICE_NATIVE_ENDIAN is just always little-endian, regardless of
what the CPU runs, while I think on MIPS it would be whatever the CPU
is actually executing.

      Arnd

