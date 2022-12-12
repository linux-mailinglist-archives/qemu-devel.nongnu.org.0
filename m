Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A7F649D3D
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 12:14:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4gjn-00047E-Cj; Mon, 12 Dec 2022 06:12:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1p4gjc-00045I-5Y
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 06:12:36 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1p4gja-0006ue-9o
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 06:12:35 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 z8-20020a17090abd8800b00219ed30ce47so15329304pjr.3
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 03:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Sf0UZ4il3EIhaGajJ2rvWe7Dl58A73/cedFrnuwjG08=;
 b=PRuDDf1HhlHba/vvO3gF3zTNRLe1CS2Rpna8bw2SSZDdP6O2/uegZiqAd6BniD5USO
 426/Z5udjVctDgUQH+AvutwE8Cchjqs2CDLMA6k0uZPUnw1+pBBuZtP5aoN5/YwBYXol
 x6D3oEoBximzOPTpl5W4qoyaHtDZkAWp1pBQHLR4ssDMAMpNGekmZlBzxWl2WO0iafyr
 bPIcQzyAZ8JdNQ6p/EPoXqVfmIr5VUIBmGlB+ZzV5xM1BdX71cMi0mkGoCQD3vPtsril
 SYhc73DnRoq+7Wla4tOZekVzJtCMUu7hhUd1hNTu9xu3kE0RolaG7AjJJ8ywRS7ht3GL
 fvfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sf0UZ4il3EIhaGajJ2rvWe7Dl58A73/cedFrnuwjG08=;
 b=hy7TL28PeJplaWAVu35ZS1ug/6jRNXCR5fXLB4stpVSPfjWZ3vouE2j2FQy2z76Igx
 ljG8YmOmqA0EAS6PJdhFzLDtUZmRizfD9xqj33PHTjDRfqjrNtEvuxLTrfOrPeTw2Qfg
 KfDBbe5aYl6E3ROrLKsvoHNDkDGw6e42a2bVyWEoe//PWcphynFeJr2dPTgU3hThlpjh
 KyBmzlE89P3+7BcC9WfeIdwWlD8dTfrt6Uk9xlprnivrgqyy+BwIUbHfmWlX24S1D93h
 hVubvKjR3R57j3ZT5zu/VbfRzIrVHSTSilI2kbsB/Qmtx54GKmbwIFT8eKymaVJDaTuW
 MBRQ==
X-Gm-Message-State: ANoB5pkGs8Eqnvsf1Gpg8+U+nD7+SYRBsi06JgwAEkwdrU9kJ+h68fJe
 7/xB6iHWKrFYDNaQW2phgEwU6df/nbXEiI/MP98prw==
X-Google-Smtp-Source: AA0mqf5MbfgeRYacJ8mUXlp6WHN1olo7vTfYtMPGA76fP+aoX5jf4Du/kZCbBwCrBTNKJn5WrnlR78TR8aeuVEvtnVA=
X-Received: by 2002:a17:902:e20c:b0:189:a934:ee37 with SMTP id
 u12-20020a170902e20c00b00189a934ee37mr41671013plb.141.1670843552126; Mon, 12
 Dec 2022 03:12:32 -0800 (PST)
MIME-Version: 1.0
References: <20221108125703.1463577-1-apatel@ventanamicro.com>
 <20221108125703.1463577-3-apatel@ventanamicro.com>
 <CAKmqyKP+hc4N6Z2AqkQpCmF=oyTE_rf-XfSsTHChwcUWRE5gsg@mail.gmail.com>
 <CAK9=C2Uu1bCcZht+ydiazSmgnkD_hhLetXP4WcA92DypE4m9=A@mail.gmail.com>
 <CAKmqyKPw54F0uVy+7SjoY16o7RYyW6qwLhaYaKR7aNpP4Nz27Q@mail.gmail.com>
In-Reply-To: <CAKmqyKPw54F0uVy+7SjoY16o7RYyW6qwLhaYaKR7aNpP4Nz27Q@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 12 Dec 2022 16:42:20 +0530
Message-ID: <CAK9=C2V21JcgyUKub1JGVT0DEaeyzJ1GXQYcyaZy4Xv26F5fyA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] target/riscv: Update VS timer whenever htimedelta
 changes
To: Alistair Francis <alistair23@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=apatel@ventanamicro.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Mon, Dec 12, 2022 at 11:23 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Thu, Dec 8, 2022 at 6:41 PM Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > On Thu, Dec 8, 2022 at 9:00 AM Alistair Francis <alistair23@gmail.com> wrote:
> > >
> > > On Tue, Nov 8, 2022 at 11:07 PM Anup Patel <apatel@ventanamicro.com> wrote:
> > > >
> > > > The htimedelta[h] CSR has impact on the VS timer comparison so we
> > > > should call riscv_timer_write_timecmp() whenever htimedelta changes.
> > > >
> > > > Fixes: 3ec0fe18a31f ("target/riscv: Add vstimecmp suppor")
> > > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > >
> > > This patch breaks my Xvisor test. When running OpenSBI and Xvisor like this:
> > >
> > > qemu-system-riscv64 -machine virt \
> > >     -m 1G -serial mon:stdio -serial null -nographic \
> > >     -append 'vmm.console=uart@10000000 vmm.bootcmd="vfs mount initrd
> > > /;vfs run /boot.xscript;vfs cat /system/banner.txt; guest kick guest0;
> > > vserial bind guest0/uart0"' \
> > >     -smp 4 -d guest_errors \
> > >     -bios none \
> > >     -device loader,file=./images/qemuriscv64/vmm.bin,addr=0x80200000 \
> > >     -kernel ./images/qemuriscv64/fw_jump.elf \
> > >     -initrd ./images/qemuriscv64/vmm-disk-linux.img -cpu rv64,h=true
> > >
> > > Running:
> > >
> > > Xvisor v0.3.0-129-gbc33f339 (Jan  1 1970 00:00:00)
> > >
> > > I see this failure:
> > >
> > > INIT: bootcmd:  guest kick guest0
> > >
> > > guest0: Kicked
> > >
> > > INIT: bootcmd:  vserial bind guest0/uart0
> > >
> > > [guest0/uart0] cpu_vcpu_stage2_map: guest_phys=0x000000003B9AC000
> > > size=0x4096 map failed
> > >
> > > do_error: CPU3: VCPU=guest0/vcpu0 page fault failed (error -1)
> > >
> > >        zero=0x0000000000000000          ra=0x0000000080001B4E
> > >
> > >          sp=0x000000008001CF80          gp=0x0000000000000000
> > >
> > >          tp=0x0000000000000000          s0=0x000000008001CFB0
> > >
> > >          s1=0x0000000000000000          a0=0x0000000010001048
> > >
> > >          a1=0x0000000000000000          a2=0x0000000000989680
> > >
> > >          a3=0x000000003B9ACA00          a4=0x0000000000000048
> > >
> > >          a5=0x0000000000000000          a6=0x0000000000019000
> > >
> > >          a7=0x0000000000000000          s2=0x0000000000000000
> > >
> > >          s3=0x0000000000000000          s4=0x0000000000000000
> > >
> > >          s5=0x0000000000000000          s6=0x0000000000000000
> > >
> > >          s7=0x0000000000000000          s8=0x0000000000000000
> > >
> > >          s9=0x0000000000000000         s10=0x0000000000000000
> > >
> > >         s11=0x0000000000000000          t0=0x0000000000004000
> > >
> > >          t1=0x0000000000000100          t2=0x0000000000000000
> > >
> > >          t3=0x0000000000000000          t4=0x0000000000000000
> > >
> > >          t5=0x0000000000000000          t6=0x0000000000000000
> > >
> > >        sepc=0x0000000080001918     sstatus=0x0000000200004120
> > >
> > >     hstatus=0x00000002002001C0     sp_exec=0x0000000010A64000
> > >
> > >      scause=0x0000000000000017       stval=0x000000003B9ACAF8
> > >
> > >       htval=0x000000000EE6B2BE      htinst=0x0000000000D03021
> > >
> > > I have tried updating to a newer Xvisor release, but with that I don't
> > > get any serial output.
> > >
> > > Can you help get the Xvisor tests back up and running?
> >
> > I tried the latest Xvisor-next (https://github.com/avpatel/xvisor-next)
> > with your QEMU riscv-to-apply.next branch and it works fine (both
> > with and without Sstc).
>
> Does it work with the latest release?

Yes, the latest Xvisor-next repo works for QEMU v7.2.0-rc4 and
your riscv-to-apply.next branch (commit 51bb9de2d188)

Regards,
Anup

>
> Alistair
>
> >
> > Here's the QEMU command which I use:
> >
> > qemu-system-riscv64 -M virt -m 512M -nographic \
> > -bios opensbi/build/platform/generic/firmware/fw_jump.bin \
> > -kernel ../xvisor-next/build/vmm.bin \
> > -initrd rbd_v64.img \
> > -append "vmm.bootcmd=\"vfs mount initrd /;vfs run /boot.xscript;vfs
> > cat /system/banner.txt\"" \
> > -smp 4
> >
> > Also, I will be releasing Xvisor-0.3.2 by the end of Dec 2022 so I
> > suggest using this upcoming release in your test.
> >
> > Regards,
> > Anup

