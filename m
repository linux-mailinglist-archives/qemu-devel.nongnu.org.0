Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F625475C12
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 16:46:13 +0100 (CET)
Received: from localhost ([::1]:59230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxWTs-0001kO-Bg
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 10:46:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mxVl5-0006Kd-LC
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:59:57 -0500
Received: from [2a00:1450:4864:20::42f] (port=34308
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mxVl4-00056X-07
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 09:59:55 -0500
Received: by mail-wr1-x42f.google.com with SMTP id s1so4568124wrg.1
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 06:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=idg0JHwnigHF3Mw2XPMfh2O4vI0/PwM7HnDqsuQBCgw=;
 b=AXbt57fMudQI9ihz1rVQvIUpEUOOIYTYrDWDXicUWG1Qkc3yqWclXXH5CkH8p/+4iO
 2HKYNzvUHxFaCPoNgmdMN7EvZo3ekbrZ5GVBCfqEFzshKA4TCN64Lpht79E/NtlfsTB8
 E8aH2yRGnWtciw6SFLC/Dn2JhcpwU/aPKebmul8ar1NzFtHpX1Y5aHUs8JaFIulyW9iF
 HYtv8Tx57NA0OOByTNH6XqxgCupgD7dORltPWeO3wchYa/Td1DiIUCwvaRwXARVmHPD7
 tmZGOoNGjVozuLx/khqtA51lEAKTFQF5hCbrYLdMDLKphNMqfZU7HF65r7P2ETikeY6Z
 qhWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=idg0JHwnigHF3Mw2XPMfh2O4vI0/PwM7HnDqsuQBCgw=;
 b=SSyat6HIdibAd81n5jw5+0jc9y7//3fSdp21goAHm67YG16FTZgJKyvxroSt5zUERm
 Owml4XFXsTAouKCEaGUQmpPBhM3Ua5hneQYRz+elrajNeb1itwgNf3GWQpSdcdhSCfUl
 jsokIarAxzbA481TcnZyNfvorNN9gqZCv1pbFGfJa/Edod3DhwDH6uKtpSlz1Jd/mZXX
 75KTRapsaMwNBPmL6zsWPESqtDFh1L4aQECPnlRpbhr1Qu/cKtNxRVpkhc4Kr1lS2hu3
 lIgePC70q7uzBTTNtHTFJPp1SKkr2mp5qnK1of8PygLFQl3R+D+DIHFe4rllaRrSfT+9
 2mJg==
X-Gm-Message-State: AOAM5304L1p8svLHWF9jrk+B0XmDDQyDgcmb5/Qlk0zSRWZbQSQhkurD
 ouWoeig3GNmeC5V8YF5SVXWnJatL27Ox+cfe0pV3rA==
X-Google-Smtp-Source: ABdhPJzU/75ndt4hZGJHyeVbP8l6BymiGKHBCToM+Tgw4NCrranEMgv3UMc8Pbxz0R8mwp3+6L1fsG8hugClwGUbsdI=
X-Received: by 2002:adf:efd0:: with SMTP id i16mr3770906wrp.86.1639580389962; 
 Wed, 15 Dec 2021 06:59:49 -0800 (PST)
MIME-Version: 1.0
References: <20211211041917.135345-1-anup.patel@wdc.com>
 <20211211041917.135345-17-anup.patel@wdc.com>
 <CABYrWZ95qCu8QiEfpQEy+=1cecLf+ruODAEg-vL8z58aBJffXw@mail.gmail.com>
In-Reply-To: <CABYrWZ95qCu8QiEfpQEy+=1cecLf+ruODAEg-vL8z58aBJffXw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 15 Dec 2021 20:29:38 +0530
Message-ID: <CAAhSdy0KXNAFAxWgoozj73LP7_QO776PC5VEGzeuYzp+0Lk6RQ@mail.gmail.com>
Subject: Re: [PATCH v5 16/23] hw/riscv: virt: Use AIA INTC compatible string
 when available
To: Kip Walker <kip@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::42f;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bmeng.cn@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 15, 2021 at 6:38 AM Kip Walker <kip@rivosinc.com> wrote:
>
> On Fri, Dec 10, 2021 at 8:35 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > We should use the AIA INTC compatible string in the CPU INTC
> > DT nodes when the CPUs support AIA feature. This will allow
> > Linux INTC driver to use AIA local interrupt CSRs.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  hw/riscv/virt.c | 13 +++++++++++--
> >  1 file changed, 11 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> > index 3af074148e..936156554c 100644
> > --- a/hw/riscv/virt.c
> > +++ b/hw/riscv/virt.c
> > @@ -211,8 +211,17 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
> >          qemu_fdt_add_subnode(mc->fdt, intc_name);
> >          qemu_fdt_setprop_cell(mc->fdt, intc_name, "phandle",
> >              intc_phandles[cpu]);
> > -        qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
> > -            "riscv,cpu-intc");
> > +        if (riscv_feature(&s->soc[socket].harts[cpu].env,
> > +                          RISCV_FEATURE_AIA)) {
> > +            static const char * const compat[2] = {
> > +                "riscv,cpu-intc-aia", "riscv,cpu-intc"
> > +            };
> > +            qemu_fdt_setprop_string_array(mc->fdt, name, "compatible",
> > +                                      (char **)&compat, ARRAY_SIZE(compat));
>
> I think this should be intc_name rather than name.

Ahh, good catch. I will fix this typo in the next revision.

Thanks,
Anup

>
> Kip
>
> > +        } else {
> > +            qemu_fdt_setprop_string(mc->fdt, intc_name, "compatible",
> > +                "riscv,cpu-intc");
> > +        }
> >          qemu_fdt_setprop(mc->fdt, intc_name, "interrupt-controller", NULL, 0);
> >          qemu_fdt_setprop_cell(mc->fdt, intc_name, "#interrupt-cells", 1);
> >
> > --
> > 2.25.1
> >
> >

