Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EC24C04A5
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 23:32:41 +0100 (CET)
Received: from localhost ([::1]:52476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMdi3-0007Ay-GM
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 17:32:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nMdeY-00051F-60
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:29:02 -0500
Received: from [2607:f8b0:4864:20::b31] (port=34556
 helo=mail-yb1-xb31.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nMdeW-00009Q-3D
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 17:29:01 -0500
Received: by mail-yb1-xb31.google.com with SMTP id v186so44310853ybg.1
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 14:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bsc55VRk8Lv6a/4+tnEqvi9VUlYITCP0nu4RXH6P5To=;
 b=tboQ7nyAwPfsPcxccmqikD8/7uFqdZPNRP+NAXIsTcTrzewgW8GescgpxvoqNiCHO1
 ojtH4WDmkljfgKmfScE9rEeQLEU7eXCyWX1N6Bd7gLqGFPWd2YvTUA+opaIFdOJBq6nm
 +6HSDeaBlwh200q95AiBaEG8zVIe8Du88OQrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bsc55VRk8Lv6a/4+tnEqvi9VUlYITCP0nu4RXH6P5To=;
 b=u6bJXKsEPL75lmOqdKj1Cvrkw8N4Y2V/jM3clWlX8mTHRtR3TxH6krhakj/qEo9skR
 l1h9NFA/qzH5mZ+WF4VUhIPhSIhqY8dLhvYNUpFU/DOGJi5x5LlZVsCpsbnNsXulcpNj
 i2wt5MjcTvZXtzsqaiOW91qgppMa3ieby41Ha/eSjRs+ofejvrgRL64V482BSu0O/vN8
 336n9GVsPCtnUyR85+Tsr9MX7BdHq/gS/uSd3Ukw0aNfF+Bv6wCgSW9cMurzYL4B/pqm
 ABDl+Ync9RH2JkWp5NbGk0xUuuXq7PxZjhNRiljzoMF+rtGmb92vrgi4Va3e6eFIbBqO
 xGlQ==
X-Gm-Message-State: AOAM53043EYdv0qzGMeLJP/HSVUN5h3Buxpgik9+r69+FOfRlQPRAHVH
 3Ky/+/YVIll7/4+T8Z1Sr02sQls4d1Be7usEGQet
X-Google-Smtp-Source: ABdhPJxJ67sPo4NL9rnC08yMlYAliTDaDLQlFdp9PKu85XUXgROkMw6idVFq+IwS+/4y7J8/UNbIO6Yt4/tOT/js1sY=
X-Received: by 2002:a25:d858:0:b0:623:f93c:7e97 with SMTP id
 p85-20020a25d858000000b00623f93c7e97mr25029366ybg.53.1645568938705; Tue, 22
 Feb 2022 14:28:58 -0800 (PST)
MIME-Version: 1.0
References: <20220216000904.1217872-1-atishp@rivosinc.com>
 <CAAhSdy0zv2Cj-h503EVmwDXpa=SE3W9Bk8P3-baiYZaw750ZUw@mail.gmail.com>
In-Reply-To: <CAAhSdy0zv2Cj-h503EVmwDXpa=SE3W9Bk8P3-baiYZaw750ZUw@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 22 Feb 2022 14:28:48 -0800
Message-ID: <CAOnJCUJs_TQk8dgijUrxvdBQi6Unoh59BtnDcyJ5LhCArFrzVg@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Add isa extenstion strings to the device
 tree
To: Anup Patel <anup@brainfault.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b31
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=atishp@atishpatra.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>, Heiko Stubner <heiko@sntech.de>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 7:19 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Wed, Feb 16, 2022 at 5:39 AM Atish Patra <atishp@rivosinc.com> wrote:
> >
> > The Linux kernel parses the ISA extensions from "riscv,isa" DT
> > property. It used to parse only the single letter base extensions
> > until now. A generic ISA extension parsing framework was proposed[1]
> > recently that can parse multi-letter ISA extensions as well.
> >
> > Generate the extended ISA string by appending  the available ISA extensions
> > to the "riscv,isa" string if it is enabled so that kernel can process it.
> >
> > [1] https://lkml.org/lkml/2022/2/15/263
> >
> > Suggested-by: Heiko Stubner <heiko@sntech.de>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> > Changes from v1->v2:
> > 1. Improved the code redability by using arrays instead of individual check
> > ---
> >  target/riscv/cpu.c | 35 ++++++++++++++++++++++++++++++++++-
> >  1 file changed, 34 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index b0a40b83e7a8..9bf8923f164b 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -34,6 +34,13 @@
> >
> >  /* RISC-V CPU definitions */
> >
> > +/* This includes the null terminated character '\0' */
> > +#define MAX_ISA_EXT_LEN 256
> > +struct isa_ext_data {
> > +        const char *name;
> > +        bool enabled;
> > +};
> > +
> >  static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
> >
> >  const char * const riscv_int_regnames[] = {
> > @@ -881,10 +888,35 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
> >      device_class_set_props(dc, riscv_cpu_properties);
> >  }
> >
> > +static void riscv_isa_string_ext(RISCVCPU *cpu, char *isa_str, int max_str_len)
> > +{
> > +    int offset = strnlen(isa_str, max_str_len);
> > +    int i;
> > +    struct isa_ext_data isa_edata_arr[] = {
> > +        { "svpbmt", cpu->cfg.ext_svpbmt   },
> > +        { "svinval", cpu->cfg.ext_svinval },
> > +        { "svnapot", cpu->cfg.ext_svnapot },
> > +    };
> > +
> > +    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> > +        if (!isa_edata_arr[i].enabled) {
> > +            continue;
> > +        }
> > +        /* check available space */
> > +        if ((offset + strlen(isa_edata_arr[i].name) + 1) > max_str_len) {
> > +            qemu_log("No space left to append isa extension");
> > +            return;
> > +        }
> > +        offset += snprintf(isa_str + offset, max_str_len, "_%s",
> > +                           isa_edata_arr[i].name);
>
> You don't need to use snprintf() and MAX_ISA_EXT_LEN if you
> use g_strconcat() for creating new concat strings and freeing
> original string using g_free().
>

Yeah. That is better. I have reimplemented this part in v3.

> Regards,
> Anup
>
> > +    }
> > +}
> > +
> >  char *riscv_isa_string(RISCVCPU *cpu)
> >  {
> >      int i;
> > -    const size_t maxlen = sizeof("rv128") + sizeof(riscv_exts) + 1;
> > +    const size_t maxlen = sizeof("rv128") + sizeof(riscv_exts) +
> > +                          MAX_ISA_EXT_LEN;
> >      char *isa_str = g_new(char, maxlen);
> >      char *p = isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_BITS);
> >      for (i = 0; i < sizeof(riscv_exts); i++) {
> > @@ -893,6 +925,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
> >          }
> >      }
> >      *p = '\0';
> > +    riscv_isa_string_ext(cpu, isa_str, maxlen);
> >      return isa_str;
> >  }
> >
> > --
> > 2.30.2
> >
> >
>


-- 
Regards,
Atish

