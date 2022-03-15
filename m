Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC81B4DA269
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 19:28:50 +0100 (CET)
Received: from localhost ([::1]:48608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUBub-0002pf-Sh
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 14:28:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nUBna-0007Gt-7r
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 14:21:34 -0400
Received: from [2a00:1450:4864:20::631] (port=36834
 helo=mail-ej1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1nUBnX-0002Ei-Pr
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 14:21:33 -0400
Received: by mail-ej1-x631.google.com with SMTP id bi12so43394544ejb.3
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 11:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PCGx1NjBWrDVJQEbyV1ZyQVYTrM0sT4a3BVfRXKJXf0=;
 b=IJCykTU5Ihl37KTcHwd1GPxjhTlhJNCrg9EDUSPdyXKX7MNVVZXxryf7vYtOqnbdJw
 ezmzsN/hOQnihI0yrvycdve7rhPQACE6w6xZdzzUAijqM/PIo4UOVdkILHGVybcfSCPK
 6vmVTDmRcOwWAd36gB1uwatwcBI8oBPezNo2yC0Hqe8Gj2tBUDbR/orOk7CjJffJ/Yfs
 6Ma1wEWlqM+i4i15idDfTCJHxkqtoGal0LkcGCYoAkJv+vHvhFoJt8pB9V/LMmgsvVN9
 38airilK+W72ocuM18l8b7CjU7+5pyNIZsl4TSlBebBbtmV0KYCxTtxNqCPhNx0UVQxs
 5i5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PCGx1NjBWrDVJQEbyV1ZyQVYTrM0sT4a3BVfRXKJXf0=;
 b=Vatrt9DVg/dvCz4q/vWRSdb5r1BIGUWSOA8/DaadIwD7H8lDdcRUYTS2ZCUho3TqkE
 KNWSJ35Tb75QrCqp5Ssuw+0+7aVAUBPtr0stDvUEwI5hg+C2NDubEYcBXJPwc2LbREly
 glYDESEo9KuSKcV8OQDK/PTi0PvypPTORzbEPid/Dnka0UIU1ZMb9djf8oDMyK1/MQnF
 MZG5QbeDcSnukvuVCPFPu425vts+daMtOjPkGgnOCJdcw1mquabolWVRlvFDb75ARGMn
 2H+1yq0tM1/MggBMXLWhGlfchZuHLu/tpJcfXjL1ok571LsvyX4aWwpXnNSl8qPwA/nE
 ambA==
X-Gm-Message-State: AOAM5339ZpDevfUv9PndOIBEJLz6AW/HQdQ9N1L+DStif/hTGg2MEq9W
 Awnd9yRyxTuhmhXUYVYtJJzasWWmHIL32U8Qifz9xA==
X-Google-Smtp-Source: ABdhPJxS/ODCWzid+JOCiHyX1uvOWtMV6L43UN5pYP215nJ27UynZ+bK0429bNrpdkRGQkZo4Trk92uBOCQU5M4zp8g=
X-Received: by 2002:a17:907:3dab:b0:6d6:a9a8:be4b with SMTP id
 he43-20020a1709073dab00b006d6a9a8be4bmr23894335ejc.34.1647368489861; Tue, 15
 Mar 2022 11:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220314234250.846613-1-atishp@rivosinc.com>
 <CAEUhbmUt2=RCQTLPA-G65Gs_D42ExncXcO2JJ1WCnov69kdQ+A@mail.gmail.com>
In-Reply-To: <CAEUhbmUt2=RCQTLPA-G65Gs_D42ExncXcO2JJ1WCnov69kdQ+A@mail.gmail.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 15 Mar 2022 11:21:18 -0700
Message-ID: <CAHBxVyGf4OSCGhp3R8ptyo2khqVSb7_d9qC0RnA0PptOnc=0yA@mail.gmail.com>
Subject: Re: [PATCH v5] target/riscv: Add isa extenstion strings to the device
 tree
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::631
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=atishp@rivosinc.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 Anup Patel <anup@brainfault.org>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 15, 2022 at 2:17 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Tue, Mar 15, 2022 at 7:43 AM Atish Patra <atishp@rivosinc.com> wrote:
> >
> > The Linux kernel parses the ISA extensions from "riscv,isa" DT
> > property. It used to parse only the single letter base extensions
> > until now. A generic ISA extension parsing framework was proposed[1]
> > recently that can parse multi-letter ISA extensions as well.
> >
> > Generate the extended ISA string by appending  the available ISA extensions
>
> nits: remove one space after "appending"
>

Will fix it.

> > to the "riscv,isa" string if it is enabled so that kernel can process it.
> >
> > [1] https://lkml.org/lkml/2022/2/15/263
>
> Could you please post a link to the "riscv,isa" DT bindings spec or
> discussion thread? It seems not mentioned in the above LKML thread.
>

Latest discussion on the discussion:
https://lkml.org/lkml/2022/3/10/1416

riscv,isa DT binding:
https://elixir.bootlin.com/linux/v5.17-rc8/source/Documentation/devicetree/bindings/riscv/cpus.yaml#L66

> >
> > Reviewed-by: Anup Patel <anup@brainfault.org>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> > Suggested-by: Heiko Stubner <heiko@sntech.de>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> > Changes from v4->v5:
> > 1. Fixed the order of Zxx extensions.
> > 2. Added a comment clearly describing the rules of extension order.
> >
> > Changes from v3->v4:
> > 1. Fixed the order of the extension names.
> > 2. Added all the available ISA extensions in Qemu.
> >
> > Changes from v2->v3:
> > 1. Used g_strconcat to replace snprintf & a max isa string length as
> > suggested by Anup.
> > 2. I have not included the Tested-by Tag from Heiko because the
> > implementation changed from v2 to v3.
> >
> > Changes from v1->v2:
> > 1. Improved the code redability by using arrays instead of individual check
> > ---
> >  target/riscv/cpu.c | 61 ++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 61 insertions(+)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index ddda4906ffb7..097c42f5c50f 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -34,6 +34,12 @@
> >
> >  /* RISC-V CPU definitions */
> >
> > +/* This includes the null terminated character '\0' */
> > +struct isa_ext_data {
> > +        const char *name;
> > +        bool enabled;
> > +};
> > +
> >  static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
> >
> >  const char * const riscv_int_regnames[] = {
> > @@ -898,6 +904,60 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
> >      device_class_set_props(dc, riscv_cpu_properties);
> >  }
> >
> > +#define ISA_EDATA_ENTRY(name, prop) {#name, cpu->cfg.prop}
> > +
> > +static void riscv_isa_string_ext(RISCVCPU *cpu, char **isa_str, int max_str_len)
> > +{
> > +    char *old = *isa_str;
> > +    char *new = *isa_str;
> > +    int i;
> > +
> > +    /**
> > +     * Here are the ordering rules of extension naming defined by RISC-V
> > +     * specification :
> > +     * 1. All extensions should be separated from other multi-letter extensions
> > +     *    from other multi-letter extensions by an underscore.
>
> redundant "from other multi-letter extensions"
>

Oops. Will fix it.

> > +     * 2. The first letter following the 'Z' conventionally indicates the most
>
> Should this be lower case "z"?

Nope. I am just iterating the rules defined by the spec. The device
tree has lower case 'z'
as per the device binding which mandates all lower case.

>
> > +     *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
> > +     *    If multiple 'Z' extensions are named, they should be ordered first
> > +     *    by category, then alphabetically within a category.
> > +     * 3. Standard supervisor-level extensions (starts with 'S') should be
>
> lower case "s"?

Same reasoning as above.

>
> > +     *    listed after standard unprivileged extensions.  If multiple
> > +     *    supervisor-level extensions are listed, they should be ordered
> > +     *    alphabetically.
> > +     * 4. Non-standard extensions (starts with 'X') must be listed after all
> > +     *    standard extensions. They must be separated from other multi-letter
> > +     *    extensions by an underscore.
> > +     */
> > +    struct isa_ext_data isa_edata_arr[] = {
> > +        ISA_EDATA_ENTRY(zfh, ext_zfhmin),
>
> This should be (zfh, ext_zfh)

Yeah. It's a typo. Thanks for catching it.

>
> > +        ISA_EDATA_ENTRY(zfhmin, ext_zfhmin),
> > +        ISA_EDATA_ENTRY(zfinx, ext_zfinx),
> > +        ISA_EDATA_ENTRY(zdinx, ext_zdinx),
>
> Should "zdinx" come before "zfinx" *alphabetically* ?

As per the ISA naming rules,

"The first letter following the 'Z' conventionally indicates the most
closely related alphabetical extension category, IMAFDQLCBKJTPVH.
If multiple 'Z' extensions are named, they should be ordered first
by category, then alphabetically within a category."

That's why, zfinx comes before zdinx.
>
> > +        ISA_EDATA_ENTRY(zba, ext_zba),
> > +        ISA_EDATA_ENTRY(zbb, ext_zbb),
> > +        ISA_EDATA_ENTRY(zbc, ext_zbc),
> > +        ISA_EDATA_ENTRY(zbs, ext_zbs),
>
> I don't understand why "zb*" come after "zf*". Alphabetically they
> should come before.
>

Same reasoning as above. But for one category, they are ordered alphabetically.
That's why you see ext_zba, ext_zbb, ext_zbc, ext_zbs in alphabetical order.

> > +        ISA_EDATA_ENTRY(zve32f, ext_zve32f),
> > +        ISA_EDATA_ENTRY(zve64f, ext_zve64f),
> > +        ISA_EDATA_ENTRY(zhinx, ext_zhinx),
> > +        ISA_EDATA_ENTRY(zhinxmin, ext_zhinxmin),
> > +        ISA_EDATA_ENTRY(svinval, ext_svinval),
> > +        ISA_EDATA_ENTRY(svnapot, ext_svnapot),
> > +        ISA_EDATA_ENTRY(svpbmt, ext_svpbmt),
> > +    };
> > +
> > +    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> > +        if (isa_edata_arr[i].enabled) {
> > +            new = g_strconcat(old, "_", isa_edata_arr[i].name, NULL);
> > +            g_free(old);
> > +            old = new;
> > +        }
> > +    }
> > +
> > +    *isa_str = new;
> > +}
> > +
> >  char *riscv_isa_string(RISCVCPU *cpu)
> >  {
> >      int i;
> > @@ -910,6 +970,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
> >          }
> >      }
> >      *p = '\0';
> > +    riscv_isa_string_ext(cpu, &isa_str, maxlen);
> >      return isa_str;
> >  }
> >
>
> Regards,
> Bin

