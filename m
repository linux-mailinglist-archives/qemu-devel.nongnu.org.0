Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA9964D58C
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 04:27:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5esf-0003lb-Vb; Wed, 14 Dec 2022 22:25:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p5ese-0003lM-IK; Wed, 14 Dec 2022 22:25:56 -0500
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1p5esc-0002b2-L2; Wed, 14 Dec 2022 22:25:56 -0500
Received: by mail-vs1-xe2c.google.com with SMTP id b189so1724414vsc.10;
 Wed, 14 Dec 2022 19:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3K6eMlO0pd3wUpWBYySXfBOF1Rp+4J+sMwT+R/JMkKw=;
 b=d90+Dfjwq8aF1NqKDZuYTrESg843R7SIilrPSONBLWQ+6kGiC9cj7+njqy/hdyl5oX
 sxHaccRpuiYyz54mSxCc3LvENZXj+h7HJm/Idfc9L2z8Ws5O0eVGzK81TwaCa695fPwz
 yCpE1THVXml9SHMjZMDf2O4L1YuBp+rUMTn3+S3tHGoHm/oXBIz0TQwkXOKUGKL45WvB
 3gG9aCQ58cAuRaw/XrBeUZ0xFY95EG4m8TSapDj3hogQPbr5U4vVTzhjzxsWM06/tpCY
 2LubIxWxtmNp75EEAtOyTxuqJTw5WjMmkvtUdrbv7QGOTtwzlDD/Ymq5ON8AlKDhSgea
 KIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3K6eMlO0pd3wUpWBYySXfBOF1Rp+4J+sMwT+R/JMkKw=;
 b=LWjHMJqmBeBlx5+j3OUmwHEo6mrak96XicEdkcQDfrv+dwRW+0V6l18URRqDVi6N1a
 FYNTPkyFShXHko5l9G5Y0kniH6cCk9WjKRgXoLVPbHAnKcDdworC8RAMPtJt+RtMVWv7
 3dLebXq5cbd5pI04QCp8j4JSiF081ddPtY6HM6sdT6sVTB76ntnA0iIZ9wYvrw58Tr4D
 ar3gpub77ay5f0jOLwOyxCDyTiKjWtXDb9I6LSMgBTRXaJ/Cr6xJwJqaDSXW1KCr+vGf
 8b1jh/hzEQWa93dx49/cShMRvN9ertiRZJNZYdRY16WHtpmzHybOL6aHpVT569mDxVj4
 0bqw==
X-Gm-Message-State: ANoB5pmIqaumeDHsL7GpzIjcfC7A/PZ7cEmHWB9ta0j1JpeWy470fVF9
 FWmDU6w7BjVEfWFRpHi7nZosKqBxCwJmo2FPxnc=
X-Google-Smtp-Source: AA0mqf4b51OCRG7APQW25Ozh5d3V5/YsWCe87pta9ItFirf8PxPF3WJ2yqn9LIOYgNq/MGrgJ62azmO7pOlFCr7LinY=
X-Received: by 2002:a67:c519:0:b0:3b1:2b83:1861 with SMTP id
 e25-20020a67c519000000b003b12b831861mr14143072vsk.10.1671074752896; Wed, 14
 Dec 2022 19:25:52 -0800 (PST)
MIME-Version: 1.0
References: <20221108125703.1463577-1-apatel@ventanamicro.com>
 <20221108125703.1463577-3-apatel@ventanamicro.com>
 <CAKmqyKP+hc4N6Z2AqkQpCmF=oyTE_rf-XfSsTHChwcUWRE5gsg@mail.gmail.com>
 <CAK9=C2Uu1bCcZht+ydiazSmgnkD_hhLetXP4WcA92DypE4m9=A@mail.gmail.com>
 <CAKmqyKPw54F0uVy+7SjoY16o7RYyW6qwLhaYaKR7aNpP4Nz27Q@mail.gmail.com>
 <CAK9=C2V21JcgyUKub1JGVT0DEaeyzJ1GXQYcyaZy4Xv26F5fyA@mail.gmail.com>
In-Reply-To: <CAK9=C2V21JcgyUKub1JGVT0DEaeyzJ1GXQYcyaZy4Xv26F5fyA@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 15 Dec 2022 13:25:26 +1000
Message-ID: <CAKmqyKOc+xKEy1nhp6vCOtVHspfQ5WY7oE6wx5aGURhxQOrdqQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] target/riscv: Update VS timer whenever htimedelta
 changes
To: Anup Patel <apatel@ventanamicro.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Anup Patel <anup@brainfault.org>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=alistair23@gmail.com; helo=mail-vs1-xe2c.google.com
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

On Mon, Dec 12, 2022 at 9:12 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> On Mon, Dec 12, 2022 at 11:23 AM Alistair Francis <alistair23@gmail.com> wrote:
> >
> > On Thu, Dec 8, 2022 at 6:41 PM Anup Patel <apatel@ventanamicro.com> wrote:
> > >
> > > On Thu, Dec 8, 2022 at 9:00 AM Alistair Francis <alistair23@gmail.com> wrote:
> > > >
> > > > On Tue, Nov 8, 2022 at 11:07 PM Anup Patel <apatel@ventanamicro.com> wrote:
> > > > >
> > > > > The htimedelta[h] CSR has impact on the VS timer comparison so we
> > > > > should call riscv_timer_write_timecmp() whenever htimedelta changes.
> > > > >
> > > > > Fixes: 3ec0fe18a31f ("target/riscv: Add vstimecmp suppor")
> > > > > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > > > > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > > >
> > > > This patch breaks my Xvisor test. When running OpenSBI and Xvisor like this:
> > > >
> > > > qemu-system-riscv64 -machine virt \
> > > >     -m 1G -serial mon:stdio -serial null -nographic \
> > > >     -append 'vmm.console=uart@10000000 vmm.bootcmd="vfs mount initrd
> > > > /;vfs run /boot.xscript;vfs cat /system/banner.txt; guest kick guest0;
> > > > vserial bind guest0/uart0"' \
> > > >     -smp 4 -d guest_errors \
> > > >     -bios none \
> > > >     -device loader,file=./images/qemuriscv64/vmm.bin,addr=0x80200000 \
> > > >     -kernel ./images/qemuriscv64/fw_jump.elf \
> > > >     -initrd ./images/qemuriscv64/vmm-disk-linux.img -cpu rv64,h=true
> > > >
> > > > Running:
> > > >
> > > > Xvisor v0.3.0-129-gbc33f339 (Jan  1 1970 00:00:00)
> > > >
> > > > I see this failure:
> > > >
> > > > INIT: bootcmd:  guest kick guest0
> > > >
> > > > guest0: Kicked
> > > >
> > > > INIT: bootcmd:  vserial bind guest0/uart0
> > > >
> > > > [guest0/uart0] cpu_vcpu_stage2_map: guest_phys=0x000000003B9AC000
> > > > size=0x4096 map failed
> > > >
> > > > do_error: CPU3: VCPU=guest0/vcpu0 page fault failed (error -1)
> > > >
> > > >        zero=0x0000000000000000          ra=0x0000000080001B4E
> > > >
> > > >          sp=0x000000008001CF80          gp=0x0000000000000000
> > > >
> > > >          tp=0x0000000000000000          s0=0x000000008001CFB0
> > > >
> > > >          s1=0x0000000000000000          a0=0x0000000010001048
> > > >
> > > >          a1=0x0000000000000000          a2=0x0000000000989680
> > > >
> > > >          a3=0x000000003B9ACA00          a4=0x0000000000000048
> > > >
> > > >          a5=0x0000000000000000          a6=0x0000000000019000
> > > >
> > > >          a7=0x0000000000000000          s2=0x0000000000000000
> > > >
> > > >          s3=0x0000000000000000          s4=0x0000000000000000
> > > >
> > > >          s5=0x0000000000000000          s6=0x0000000000000000
> > > >
> > > >          s7=0x0000000000000000          s8=0x0000000000000000
> > > >
> > > >          s9=0x0000000000000000         s10=0x0000000000000000
> > > >
> > > >         s11=0x0000000000000000          t0=0x0000000000004000
> > > >
> > > >          t1=0x0000000000000100          t2=0x0000000000000000
> > > >
> > > >          t3=0x0000000000000000          t4=0x0000000000000000
> > > >
> > > >          t5=0x0000000000000000          t6=0x0000000000000000
> > > >
> > > >        sepc=0x0000000080001918     sstatus=0x0000000200004120
> > > >
> > > >     hstatus=0x00000002002001C0     sp_exec=0x0000000010A64000
> > > >
> > > >      scause=0x0000000000000017       stval=0x000000003B9ACAF8
> > > >
> > > >       htval=0x000000000EE6B2BE      htinst=0x0000000000D03021
> > > >
> > > > I have tried updating to a newer Xvisor release, but with that I don't
> > > > get any serial output.
> > > >
> > > > Can you help get the Xvisor tests back up and running?
> > >
> > > I tried the latest Xvisor-next (https://github.com/avpatel/xvisor-next)
> > > with your QEMU riscv-to-apply.next branch and it works fine (both
> > > with and without Sstc).
> >
> > Does it work with the latest release?
>
> Yes, the latest Xvisor-next repo works for QEMU v7.2.0-rc4 and
> your riscv-to-apply.next branch (commit 51bb9de2d188)

I can't get anything to work with this patch. I have dropped this and
the patches after this.

I'm building the latest Xvisor release with:

export CROSS_COMPILE=riscv64-linux-gnu-
ARCH=riscv make generic-64b-defconfig
make

and running it as above, yet nothing. What am I missing here?

Alistair

>
> Regards,
> Anup
>
> >
> > Alistair
> >
> > >
> > > Here's the QEMU command which I use:
> > >
> > > qemu-system-riscv64 -M virt -m 512M -nographic \
> > > -bios opensbi/build/platform/generic/firmware/fw_jump.bin \
> > > -kernel ../xvisor-next/build/vmm.bin \
> > > -initrd rbd_v64.img \
> > > -append "vmm.bootcmd=\"vfs mount initrd /;vfs run /boot.xscript;vfs
> > > cat /system/banner.txt\"" \
> > > -smp 4
> > >
> > > Also, I will be releasing Xvisor-0.3.2 by the end of Dec 2022 so I
> > > suggest using this upcoming release in your test.
> > >
> > > Regards,
> > > Anup

