Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7992A488E07
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 02:27:49 +0100 (CET)
Received: from localhost ([::1]:48362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6jTQ-0007O6-0e
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 20:27:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1n6jPC-0006U2-C1
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 20:23:26 -0500
Received: from [2607:f8b0:4864:20::b2f] (port=40792
 helo=mail-yb1-xb2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1n6jPA-00053C-Ov
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 20:23:26 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id e198so11294746ybf.7
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 17:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vCC4LKdtFJNqoBe2c7A/+XIWeLpl4yuoNYNFadgHeLw=;
 b=VENsPYETpNZxWhq3aUOhjinqmDTa3CTBVRWIvDWr2Dt7ZIZVdKu9vPLRqZczHrItHV
 txcCssTfMbIzPH9+LzQhNmIPbXD3sNMGGpofyInCCZipT0equtZ98S8IYBjGeEx1QbKi
 a1WGa0Wv8/V1247ZK1R7UUdH8oYzMfGsAeGPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vCC4LKdtFJNqoBe2c7A/+XIWeLpl4yuoNYNFadgHeLw=;
 b=XZmwCk8YPy3NRb1DNuAtuWSCkoz+gzuBsIFqhmO6RLfK5qkCo8CvEfGgPn4R62Bgkt
 eVgLChtwDBpWD6WJLBnNDY6t+aWXoD8HUXEGjYZtRQv7O0B2omhF1GAYWbyxwcaHusbQ
 Y7mdrLk58/K3oreYGpHAkEY+VAzF4kHBDCCxak0a+60bsF2JK0Q6tcWNl1y5lypF8Ojg
 hElzNZpWGcrm1TMhR/RJArlEKzw2F8hXUUKwR4y6Ub2r4Mm1dg+/WusT3TOnptcI8L5x
 3pUhFApjjH73kRnK/i+et9HYwFCw8uq32PQCz/ZAak1v7+6eLHsZHb1aVxIoHZmo07Vj
 VHkQ==
X-Gm-Message-State: AOAM533RDWoSTVZUFzreB0gTTbTNF1IhXOYo4pLvla8M3lS8Cpxcq0/E
 rzL2ONxGlWU1SR+KZGMiBxjLMKry/vL0ojA9UgCb
X-Google-Smtp-Source: ABdhPJy9GbrgN0gIbS/Pwan4u6Qaqck0itWJf/HKh9RTWJM0vb0OnRznVfJvWeYuY5FpXagCDwSbthMNAWn9RlheT9s=
X-Received: by 2002:a25:b852:: with SMTP id b18mr37485757ybm.651.1641777802429; 
 Sun, 09 Jan 2022 17:23:22 -0800 (PST)
MIME-Version: 1.0
References: <20220107004846.378859-1-atishp@rivosinc.com>
 <20220107004846.378859-12-atishp@rivosinc.com>
 <9c8adbbf-e80a-894f-48e5-cf8f35093d4f@amsat.org>
In-Reply-To: <9c8adbbf-e80a-894f-48e5-cf8f35093d4f@amsat.org>
From: Atish Patra <atishp@atishpatra.org>
Date: Sun, 9 Jan 2022 17:23:09 -0800
Message-ID: <CAOnJCULJhhn47yegFG-8qC44vN2kRrw6KAUOPGmac=NV-fyx-g@mail.gmail.com>
Subject: Re: [PATCH v4 11/11] hw/riscv: virt: Add PMU DT node to the device
 tree
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=atishp@atishpatra.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atishp@rivosinc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 7, 2022 at 6:46 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> On 7/1/22 01:48, Atish Patra wrote:
> > Qemu virt machine can support few cache events and cycle/instret counte=
rs.
> > It also supports counter overflow for these events.
> >
> > Add a DT node so that OpenSBI/Linux kernel is aware of the virt machine
> > capabilities. There are some dummy nodes added for testing as well.
> >
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >   hw/riscv/virt.c    | 38 ++++++++++++++++++++++++++++++++++++++
> >   target/riscv/pmu.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
> >   target/riscv/pmu.h |  1 +
> >   3 files changed, 84 insertions(+)
>
> > +static void create_fdt_socket_pmu(RISCVVirtState *s,
> > +                                  int socket, uint32_t *phandle,
> > +                                  uint32_t *intc_phandles)
> > +{
> > +    int cpu;
> > +    char *pmu_name;
> > +    uint32_t *pmu_cells;
> > +    MachineState *mc =3D MACHINE(s);
> > +    RISCVCPU hart =3D s->soc[socket].harts[0];
> > +
> > +    pmu_cells =3D g_new0(uint32_t, s->soc[socket].num_harts * 2);
> > +
> > +    for (cpu =3D 0; cpu < s->soc[socket].num_harts; cpu++) {
> > +        pmu_cells[cpu * 2 + 0] =3D cpu_to_be32(intc_phandles[cpu]);
> > +        pmu_cells[cpu * 2 + 1] =3D cpu_to_be32(IRQ_PMU_OVF);
> > +    }
> > +
> > +    pmu_name =3D g_strdup_printf("/soc/pmu");
> > +    qemu_fdt_add_subnode(mc->fdt, pmu_name);
> > +    qemu_fdt_setprop_string(mc->fdt, pmu_name, "compatible", "riscv,pm=
u");
> > +    riscv_pmu_generate_fdt_node(mc->fdt, hart.cfg.pmu_num, pmu_name);
>
> pmu_cells[] is not consumed...
>

Oops. I removed the DT requirement in the kernel. Forgot to remove this sni=
ppet.
Thanks!

I will fix it in the next version.

> > +
> > +    g_free(pmu_name);
> > +    g_free(pmu_cells);
> > +}
>
>


--=20
Regards,
Atish

