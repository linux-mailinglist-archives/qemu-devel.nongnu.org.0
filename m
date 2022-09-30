Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 571CD5F1874
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 03:34:32 +0200 (CEST)
Received: from localhost ([::1]:43682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeROg-0007Vh-TN
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 21:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <e14002270@gmail.com>)
 id 1oePkc-000070-QV
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 19:49:02 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:38755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <e14002270@gmail.com>)
 id 1oePka-0000rS-S0
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 19:49:02 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id c9so6966549ybf.5
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 16:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=e5YzFhpVsnJiS8toGKe0AUV5+P/RmjPuMjO1h0SmVM0=;
 b=cfI5tWi4eRYgxPVx5kXMa4EKTl52MZKEEHPFwzq1YjnKsnRqZ2ZYNLYx8V4q02yxe0
 9gTDLJXSME3Fi7LzRKEr3ZRxDu49xfBYK/IF3PWloG9OkQ3ypzQQLochVZVyhy3wpBcn
 oLaOW2YthmRMRIEcwLXvM8fTbjQRTnxHjJOHySEIHLvqVFFqm200cMozUFwA+PackhjK
 Udrtr7zP1vZFMzjY/1j3j/jhyuoO7zhvXOAiHWqfUXqS8TZvUlQFuGMt4oXFsGHB1wb7
 8fgaHXubPS/mndlCePE5BU4GU6B7dhHvJK4VWmv/K1P8wkvYfbzp123sjYlUBQrTg/DD
 LEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=e5YzFhpVsnJiS8toGKe0AUV5+P/RmjPuMjO1h0SmVM0=;
 b=lLAp7s9pMOWSNOAgm+nTpn3iXUJrcOsLdHRYbxIB0bUH50CAEh0GVA0BpeYnMYNVKO
 FShY4Shqfw3PWV3FlomOf+EtgIYyICPjLIBzfJGFM8Gx0NmT11SPQUFq+0LW2uPOgFAC
 a5K2Co+FTTs/3DcByBQ3RQvnIh401B6iNDqsPPGDt+91OZALIHYgazku+WXfYq2kNAtO
 1DcX/XXVZ0TRXlK6+bH2nwpZySrTOjR4O7PDuOahUJ12ECQVKDH7HJ4/eHDpgWa8VHSo
 69f28fOmqXJcPdKxbrsjdOPg+X4e9EyLnE2z8naWydYWT6fLJI1qdKfOG5Yt1PkGdWLp
 PqWw==
X-Gm-Message-State: ACrzQf1GWav+wWkPdjTnfsSdRca39gHFjDMlWzwhbfiTIcixJT7PM7ik
 nLqJfzQzyl+GJ5S/JE4Y1Ap8Cse+vvc0tReCbmIZsbKcgdu6Eg==
X-Google-Smtp-Source: AMsMyM4yfA2NL6czDVsguCImjBF0XLntlQQHaTxj1LvJxjJauDxbEdbjylSwuOyiUy352MxyNX9DWyb1BdvErAp2s6k=
X-Received: by 2002:a25:b745:0:b0:6b5:338b:f686 with SMTP id
 e5-20020a25b745000000b006b5338bf686mr10965988ybm.216.1664581738702; Fri, 30
 Sep 2022 16:48:58 -0700 (PDT)
MIME-Version: 1.0
From: Eric Chan <e14002270@gmail.com>
Date: Sat, 1 Oct 2022 07:48:47 +0800
Message-ID: <CACv+nXAT-tfuabs04y5+DE-R=Hn81nmM3bKsgOkVkWTOYpTHFA@mail.gmail.com>
Subject: Question about RISC-V brom register a1 set value
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000003c2b9505e9eda308"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=e14002270@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 30 Sep 2022 21:32:50 -0400
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

--0000000000003c2b9505e9eda308
Content-Type: text/plain; charset="UTF-8"

Hi, qemu

As I know, brom will pass 3 parameters to the next stage bootloader, ex:
openSBI.
a0 will pass hartid, a2 will pass fw_dynamic_info start address.
although a1 doesn't use directly in openSBI.
a1 read value is determined in compile time rather than read from the
original a1 that passes from brom.
In qemu/hw/riscv/boot.c
both 32bit and 64bit machines read 4byte that offset 32byte from the brom
start address.

for 64 bits machine: a1 read low 32bit data member magic of fw_dynamic_info,
the value will same as FW_DYNAMIC_INFO_MAGIC_VALUE because risc-v is little
endian.

for 32bits machine: each data member of fw_dynamic_info is 4 bytes, so a1
will read the version rather than magic.

Do the 32bit and 64bit pass different parameters are expected?
If it is not expected, I guess the original version is 64bit machine, and
then supports 32bit but misses this detail, I hope I can have an
opportunity to fix this problem.
If it is expected, why they must be done?

Thanks,
Eric Chan

qemu/include/hw/riscv/boot_opensbi.h
#define FW_DYNAMIC_INFO_MAGIC_VALUE     0x4942534f
qemu/hw/riscv/boot.c
void riscv_setup_rom_reset_vec(MachineState *machine, RISCVHartArrayState *
harts,
                               hwaddr start_addr,
                               hwaddr rom_base, hwaddr rom_size,
                               uint64_t kernel_entry,
                               uint64_t fdt_load_addr)
{
    int i;
    uint32_t start_addr_hi32 = 0x00000000;
    uint32_t fdt_load_addr_hi32 = 0x00000000;

    if (!riscv_is_32bit(harts)) {
        start_addr_hi32 = start_addr >> 32;
        fdt_load_addr_hi32 = fdt_load_addr >> 32;
    }
    /* reset vector */
    uint32_t reset_vec[10] = {
        0x00000297,                  /* 1:  auipc  t0, %pcrel_hi(fw_dyn) */
        0x02828613,                  /*     addi   a2, t0, %pcrel_lo(1b) */
        0xf1402573,                  /*     csrr   a0, mhartid  */
        0,
        0,
        0x00028067,                  /*     jr     t0 */
        start_addr,                  /* start: .dword */
        start_addr_hi32,
        fdt_load_addr,               /* fdt_laddr: .dword */
        fdt_load_addr_hi32,
                                     /* fw_dyn: */
    };
    if (riscv_is_32bit(harts)) {
        reset_vec[3] = 0x0202a583;   /*     lw     a1, 32(t0) */
        reset_vec[4] = 0x0182a283;   /*     lw     t0, 24(t0) */
    } else {
        reset_vec[3] = 0x0202b583;   /*     ld     a1, 32(t0) */
        reset_vec[4] = 0x0182b283;   /*     ld     t0, 24(t0) */
    }

    /* copy in the reset vector in little_endian byte order */
    for (i = 0; i < ARRAY_SIZE(reset_vec); i++) {
        reset_vec[i] = cpu_to_le32(reset_vec[i]);
    }
    rom_add_blob_fixed_as("mrom.reset", reset_vec, sizeof(reset_vec),
                          rom_base, &address_space_memory);
    riscv_rom_copy_firmware_info(machine, rom_base, rom_size, sizeof
(reset_vec),
                                 kernel_entry);
}

opensbi/firmware/fw_dynamic.S
fw_boot_hart:
        /* Sanity checks */
        li      a1, FW_DYNAMIC_INFO_MAGIC_VALUE
        REG_L   a0, FW_DYNAMIC_INFO_MAGIC_OFFSET(a2)
        bne     a0, a1, _bad_dynamic_info
        li      a1, FW_DYNAMIC_INFO_VERSION_MAX
        REG_L   a0, FW_DYNAMIC_INFO_VERSION_OFFSET(a2)
        bgt     a0, a1, _bad_dynamic_info

        /* Read boot HART id */
        li      a1, FW_DYNAMIC_INFO_VERSION_2
        blt     a0, a1, 2f
        REG_L   a0, FW_DYNAMIC_INFO_BOOT_HART_OFFSET(a2)
        ret
2:      li      a0, -1
        ret

--0000000000003c2b9505e9eda308
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, qemu<br><br>As I know, brom will pass 3 parameters to =
the next stage bootloader, ex: openSBI.<br>a0 will pass hartid, a2 will pas=
s fw_dynamic_info start address.<br>although a1 doesn&#39;t use directly in=
 openSBI.<br>a1 read value is determined in compile time rather than read f=
rom the original a1 that passes from brom.<br>In qemu/hw/riscv/boot.c<br>bo=
th 32bit and 64bit machines read 4byte that offset 32byte from the brom sta=
rt address.<br><br>for 64 bits machine: a1 read low 32bit data member magic=
 of fw_dynamic_info,<br>the value will same as FW_DYNAMIC_INFO_MAGIC_VALUE =
because risc-v is little endian.<br><br>for 32bits machine: each data membe=
r of fw_dynamic_info is 4 bytes, so a1 will read the version rather than ma=
gic.<br><br>Do the 32bit and 64bit pass different parameters are expected?<=
br>If it is not expected, I guess the original version is 64bit machine, an=
d then supports 32bit but misses this detail, I hope I can have an opportun=
ity to fix this problem.<br>If it is expected, why they must be done?<br><d=
iv></div><div><br></div><div>Thanks,</div><div>Eric Chan</div><div><br></di=
v><div>qemu/include/hw/riscv/boot_opensbi.h<br></div><div>#define FW_DYNAMI=
C_INFO_MAGIC_VALUE =C2=A0 =C2=A0 0x4942534f<br></div><div>qemu/hw/riscv/boo=
t.c<br></div><div><div style=3D"color:rgb(212,212,212);background-color:rgb=
(30,30,30);font-family:Consolas,&quot;Courier New&quot;,monospace;font-size=
:14px;line-height:19px;white-space:pre"><div><span style=3D"color:rgb(86,15=
6,214)">void</span> <span style=3D"color:rgb(220,220,170)">riscv_setup_rom_=
reset_vec</span>(MachineState *<span style=3D"color:rgb(156,220,254)">machi=
ne</span>, RISCVHartArrayState *<span style=3D"color:rgb(156,220,254)">hart=
s</span>,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwaddr <span style=
=3D"color:rgb(156,220,254)">start_addr</span>,</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0hwaddr <span style=3D"color:rgb(156,220,254)">rom_base<=
/span>, hwaddr <span style=3D"color:rgb(156,220,254)">rom_size</span>,</div=
><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<span style=3D"color:rgb(86,156,2=
14)">uint64_t</span> <span style=3D"color:rgb(156,220,254)">kernel_entry</s=
pan>,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<span style=3D"color:rg=
b(86,156,214)">uint64_t</span> <span style=3D"color:rgb(156,220,254)">fdt_l=
oad_addr</span>)</div><div>{</div><div>=C2=A0 =C2=A0 <span style=3D"color:r=
gb(86,156,214)">int</span> i;</div><div>=C2=A0 =C2=A0 <span style=3D"color:=
rgb(86,156,214)">uint32_t</span> start_addr_hi32 =3D <span style=3D"color:r=
gb(181,206,168)">0x00000000</span>;</div><div>=C2=A0 =C2=A0 <span style=3D"=
color:rgb(86,156,214)">uint32_t</span> fdt_load_addr_hi32 =3D <span style=
=3D"color:rgb(181,206,168)">0x00000000</span>;</div><br><div>=C2=A0 =C2=A0 =
<span style=3D"color:rgb(197,134,192)">if</span> (!<span style=3D"color:rgb=
(220,220,170)">riscv_is_32bit</span>(harts)) {</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 start_addr_hi32 =3D start_addr &gt;&gt; <span style=3D"color:rgb=
(181,206,168)">32</span>;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 fdt_load_ad=
dr_hi32 =3D fdt_load_addr &gt;&gt; <span style=3D"color:rgb(181,206,168)">3=
2</span>;</div><div>=C2=A0 =C2=A0 }</div><div><span style=3D"color:rgb(106,=
153,85)">=C2=A0 =C2=A0 /* reset vector */</span></div><div>=C2=A0 =C2=A0 <s=
pan style=3D"color:rgb(86,156,214)">uint32_t</span> <span style=3D"color:rg=
b(156,220,254)">reset_vec</span>[<span style=3D"color:rgb(181,206,168)">10<=
/span>] =3D {</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rg=
b(181,206,168)">0x00000297</span>,<span style=3D"color:rgb(106,153,85)"> =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* 1: =C2=A0a=
uipc =C2=A0t0, %pcrel_hi(fw_dyn) */</span></div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 <span style=3D"color:rgb(181,206,168)">0x02828613</span>,<span style=
=3D"color:rgb(106,153,85)"> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* =C2=A0 =C2=A0 addi =C2=A0 a2, t0, %pcrel_lo(1b) */</spa=
n></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(181,206,1=
68)">0xf1402573</span>,<span style=3D"color:rgb(106,153,85)"> =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* =C2=A0 =C2=A0 csrr =C2=
=A0 a0, mhartid =C2=A0*/</span></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span=
 style=3D"color:rgb(181,206,168)">0</span>,</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 <span style=3D"color:rgb(181,206,168)">0</span>,</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(181,206,168)">0x00028067</spa=
n>,<span style=3D"color:rgb(106,153,85)"> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* =C2=A0 =C2=A0 jr =C2=A0 =C2=A0 t0 */</spa=
n></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 start_addr,<span style=3D"color:rg=
b(106,153,85)"> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* start: .dword */</span></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 start_a=
ddr_hi32,</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 fdt_load_addr,<span style=
=3D"color:rgb(106,153,85)"> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* fdt_laddr: .dword */</span></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 fd=
t_load_addr_hi32,</div><div><span style=3D"color:rgb(106,153,85)">=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* fw_dyn: */</span></d=
iv><div>=C2=A0 =C2=A0 };</div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(1=
97,134,192)">if</span> (<span style=3D"color:rgb(220,220,170)">riscv_is_32b=
it</span>(harts)) {</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"co=
lor:rgb(156,220,254)">reset_vec</span>[<span style=3D"color:rgb(181,206,168=
)">3</span>] =3D <span style=3D"color:rgb(181,206,168)">0x0202a583</span>;<=
span style=3D"color:rgb(106,153,85)"> =C2=A0 /* =C2=A0 =C2=A0 lw =C2=A0 =C2=
=A0 a1, 32(t0) */</span></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=
=3D"color:rgb(156,220,254)">reset_vec</span>[<span style=3D"color:rgb(181,2=
06,168)">4</span>] =3D <span style=3D"color:rgb(181,206,168)">0x0182a283</s=
pan>;<span style=3D"color:rgb(106,153,85)"> =C2=A0 /* =C2=A0 =C2=A0 lw =C2=
=A0 =C2=A0 t0, 24(t0) */</span></div><div>=C2=A0 =C2=A0 } <span style=3D"co=
lor:rgb(197,134,192)">else</span> {</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <=
span style=3D"color:rgb(156,220,254)">reset_vec</span>[<span style=3D"color=
:rgb(181,206,168)">3</span>] =3D <span style=3D"color:rgb(181,206,168)">0x0=
202b583</span>;<span style=3D"color:rgb(106,153,85)"> =C2=A0 /* =C2=A0 =C2=
=A0 ld =C2=A0 =C2=A0 a1, 32(t0) */</span></div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 <span style=3D"color:rgb(156,220,254)">reset_vec</span>[<span style=
=3D"color:rgb(181,206,168)">4</span>] =3D <span style=3D"color:rgb(181,206,=
168)">0x0182b283</span>;<span style=3D"color:rgb(106,153,85)"> =C2=A0 /* =
=C2=A0 =C2=A0 ld =C2=A0 =C2=A0 t0, 24(t0) */</span></div><div>=C2=A0 =C2=A0=
 }</div><br><div><span style=3D"color:rgb(106,153,85)">=C2=A0 =C2=A0 /* cop=
y in the reset vector in little_endian byte order */</span></div><div>=C2=
=A0 =C2=A0 <span style=3D"color:rgb(197,134,192)">for</span> (i =3D <span s=
tyle=3D"color:rgb(181,206,168)">0</span>; i &lt; <span style=3D"color:rgb(2=
20,220,170)">ARRAY_SIZE</span>(reset_vec); i++) {</div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 <span style=3D"color:rgb(156,220,254)">reset_vec</span>[i] =
=3D <span style=3D"color:rgb(220,220,170)">cpu_to_le32</span>(<span style=
=3D"color:rgb(156,220,254)">reset_vec</span>[i]);</div><div>=C2=A0 =C2=A0 }=
</div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(220,220,170)">rom_add_blo=
b_fixed_as</span>(<span style=3D"color:rgb(206,145,120)">&quot;mrom.reset&q=
uot;</span>, reset_vec, <span style=3D"color:rgb(86,156,214)">sizeof</span>=
(reset_vec),</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rom_base, &amp;address_space_memory)=
;</div><div>=C2=A0 =C2=A0 <span style=3D"color:rgb(220,220,170)">riscv_rom_=
copy_firmware_info</span>(machine, rom_base, rom_size, <span style=3D"color=
:rgb(86,156,214)">sizeof</span>(reset_vec),</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0kernel_entry);</div><div>}</div></div></div><div><b=
r></div><div>opensbi/firmware/fw_dynamic.S<br></div><div><div style=3D"colo=
r:rgb(212,212,212);background-color:rgb(30,30,30);font-family:Consolas,&quo=
t;Courier New&quot;,monospace;font-size:14px;line-height:19px;white-space:p=
re"><div><span style=3D"color:rgb(220,220,170)">fw_boot_hart</span>:</div><=
div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(106,153,85)">/* Sa=
nity checks */</span></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"=
color:rgb(220,220,170)">li</span> =C2=A0 =C2=A0 =C2=A0<span style=3D"color:=
rgb(156,220,254)">a1</span>, FW_DYNAMIC_INFO_MAGIC_VALUE</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 REG_L =C2=A0 <span style=3D"color:rgb(156,220,254)">a0=
</span>, FW_DYNAMIC_INFO_MAGIC_OFFSET(<span style=3D"color:rgb(156,220,254)=
">a2</span>)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb=
(220,220,170)">bne</span> =C2=A0 =C2=A0 <span style=3D"color:rgb(156,220,25=
4)">a0</span>, <span style=3D"color:rgb(156,220,254)">a1</span>, _bad_dynam=
ic_info</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(220,=
220,170)">li</span> =C2=A0 =C2=A0 =C2=A0<span style=3D"color:rgb(156,220,25=
4)">a1</span>, FW_DYNAMIC_INFO_VERSION_MAX</div><div>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 REG_L =C2=A0 <span style=3D"color:rgb(156,220,254)">a0</span>, FW_DY=
NAMIC_INFO_VERSION_OFFSET(<span style=3D"color:rgb(156,220,254)">a2</span>)=
</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(220,220,170=
)">bgt</span> =C2=A0 =C2=A0 <span style=3D"color:rgb(156,220,254)">a0</span=
>, <span style=3D"color:rgb(156,220,254)">a1</span>, _bad_dynamic_info</div=
><br><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(106,153,85)"=
>/* Read boot HART id */</span></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span=
 style=3D"color:rgb(220,220,170)">li</span> =C2=A0 =C2=A0 =C2=A0<span style=
=3D"color:rgb(156,220,254)">a1</span>, FW_DYNAMIC_INFO_VERSION_2</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(220,220,170)">blt</spa=
n> =C2=A0 =C2=A0 <span style=3D"color:rgb(156,220,254)">a0</span>, <span st=
yle=3D"color:rgb(156,220,254)">a1</span>, 2f</div><div>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 REG_L =C2=A0 <span style=3D"color:rgb(156,220,254)">a0</span>, FW_D=
YNAMIC_INFO_BOOT_HART_OFFSET(<span style=3D"color:rgb(156,220,254)">a2</spa=
n>)</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <span style=3D"color:rgb(220,220,=
170)">ret</span></div><div><span style=3D"color:rgb(220,220,170)">2</span>:=
 =C2=A0 =C2=A0 =C2=A0<span style=3D"color:rgb(220,220,170)">li</span> =C2=
=A0 =C2=A0 =C2=A0<span style=3D"color:rgb(156,220,254)">a0</span>, -<span s=
tyle=3D"color:rgb(181,206,168)">1</span></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 <span style=3D"color:rgb(220,220,170)">ret
</span></div></div></div></div>

--0000000000003c2b9505e9eda308--

