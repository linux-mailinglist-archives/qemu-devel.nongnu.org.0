Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8364B74D3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 20:49:34 +0100 (CET)
Received: from localhost ([::1]:44922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK3pN-0005ax-At
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 14:49:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nK3fZ-0002VB-65
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:39:25 -0500
Received: from [2607:f8b0:4864:20::b2d] (port=46899
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@atishpatra.org>)
 id 1nK3fW-0007w0-HF
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 14:39:24 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id p5so59157031ybd.13
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 11:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=R95UWmYk35IiX8j8O7o41n93Ztec+98509kSs+tCxcA=;
 b=sjiqJ5lWBEYr11Av3XG5lkq29L1N/40E4iJnEDnIEWatIL3W6yAnIZLp1mc9kUqD3D
 GroHyiu/X7sNwG5iriVRPT+9K3ttD4dvrxNafyMEWnMrjeIuhmQ6QywhucLYN78ac1Od
 Efn73RU27iAg5HhDoD5uowJfBKTUFyUtqXfqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=R95UWmYk35IiX8j8O7o41n93Ztec+98509kSs+tCxcA=;
 b=Hnqi/0l7qOFI7y29MfFV1+1dzGlOdptjXsPTplqXcA98rUwVVYhQGp4AVQSxcQ1XVo
 DRFAmAzsiuZ9oZqsqWYpF6ZXdW9YpVUXi+wsjXbfUT6HRHd4wl1X7X/ApxB0J9Q1GIeM
 cqmHIHkzHWpva9BcdoFmCpfFT/iSLJE6VuKL1qa5udAKPVtzye+qTwsCLByhnSGNhb7l
 22CgORCHpf13nXT3/wRBzGAeoTXTP9Ncrne8sg8SZEg+Gzx4q8YLSxHlcMkx201hY8x1
 K7Ol/y3xGuWs1eOycJIxUdBxD+saynMeRXDuImJo2QBCVuuGA4gq66kKZ+2kylyd3DY1
 KLIQ==
X-Gm-Message-State: AOAM530mX26LRNzxNni7nQ3jC1UJPBrBfgs9plpz4BTp2+qn2TgjUeiY
 sX4hGIEIkfKv4PUX3xHXfBc0KRu4lG9gC81zSeOf
X-Google-Smtp-Source: ABdhPJwCEJK7nDkYaYNMBgVGhCBnKUm3Jgcc77h5wd3GOeveqAk1mnUNa6jVe7efy68WGhQVOrG/Eb6FQm8MBQZ8awM=
X-Received: by 2002:a25:c344:: with SMTP id t65mr506546ybf.10.1644953961058;
 Tue, 15 Feb 2022 11:39:21 -0800 (PST)
MIME-Version: 1.0
References: <20220215090530.911828-1-atishp@rivosinc.com>
 <2828317.Et2jP947se@diego>
In-Reply-To: <2828317.Et2jP947se@diego>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 15 Feb 2022 11:39:10 -0800
Message-ID: <CAOnJCU+K6dKda0gwE_+V8qAp9CUg1RWseuCAOCPKoWs3_p6kUA@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: Add isa extenstion strings to the device
 tree
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=atishp@atishpatra.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, Atish Patra <atishp@rivosinc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 15, 2022 at 8:20 AM Heiko St=C3=BCbner <heiko@sntech.de> wrote:
>
> Am Dienstag, 15. Februar 2022, 10:05:30 CET schrieb Atish Patra:
> > Append the available ISA extensions to the "riscv,isa" string if it
> > is enabled so that kernel can process it.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  target/riscv/cpu.c | 23 ++++++++++++++++++++++-
> >  1 file changed, 22 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index b0a40b83e7a8..c70260d0df15 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -34,6 +34,9 @@
> >
> >  /* RISC-V CPU definitions */
> >
> > +/* This includes the null terminated character '\0' */
> > +#define MAX_ISA_EXT_LEN 256
> > +
> >  static const char riscv_exts[26] =3D "IEMAFDQCLBJTPVNSUHKORWXYZG";
> >
> >  const char * const riscv_int_regnames[] =3D {
> > @@ -881,10 +884,26 @@ static void riscv_cpu_class_init(ObjectClass *c, =
void *data)
> >      device_class_set_props(dc, riscv_cpu_properties);
> >  }
> >
> > +static void riscv_isa_string_ext(RISCVCPU *cpu, char *isa_str, int max=
_str_len)
> > +{
> > +    int offset =3D strnlen(isa_str, max_str_len);
> > +
> > +    if (cpu->cfg.ext_svpbmt) {
> > +        offset +=3D snprintf(isa_str + offset, max_str_len, "_%s", "_s=
vpbmt");
> > +    }
> > +    if ((offset < max_str_len) && cpu->cfg.ext_svinval) {
>
> shouldn't offset + strlen("svinval") +1 be < max_str_len?
> snprintf will write partial strings but this would throw off a
> qemu client completely I guess.
>

We need that check to put out warnings to the user.

>
> > +        offset +=3D snprintf(isa_str + offset, max_str_len, "_%s", "_s=
vinval");
> > +    }
> > +    if ((offset < max_str_len) && (cpu->cfg.ext_svnapot)) {
> > +        offset +=3D snprintf(isa_str + offset, max_str_len, "_%s", "_s=
vnapot");
> > +    }
>
> wouldn't it make more sense to do something like:
>
> +    struct {
> +        const char *value;
> +        bool enabled;
> +    } extensions[] =3D {
> +        { "svpbmt", cpu->cfg.ext_svpbmt },
> +        { "svinval", cpu->cfg.ext_svinval },
> +        { "svnapot", cpu->cfg.ext_svnapot },
> +    };
> +    int i;
> +
> +    for (i =3D 0; i < ARRAY_SIZE(extensions); i++) {
> +        if (!extensions[i].enabled)
> +            continue;
> +
> +        /* check available space */
> +        if (offset + strlen(extensions[i].value) + 1 > max_str_len) {
> +            //do warn about exceeded length
> +            return;
> +        }
> +
> +        offset +=3D snprintf(isa_str + offset, max_str_len, "_%s",
> +                                                          extensions[i].=
value);
> +    }
>
> instead?
>
> Because that list will get longer over time and repeating checks
> and snprintf calls will get harder to keep in sync over time?
>

Yeah. This is much better.

>
> Heiko
>
>
>
>
> > +}
> > +
> >  char *riscv_isa_string(RISCVCPU *cpu)
> >  {
> >      int i;
> > -    const size_t maxlen =3D sizeof("rv128") + sizeof(riscv_exts) + 1;
> > +    const size_t maxlen =3D sizeof("rv128") + sizeof(riscv_exts) +
> > +                          MAX_ISA_EXT_LEN;
> >      char *isa_str =3D g_new(char, maxlen);
> >      char *p =3D isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_LON=
G_BITS);
> >      for (i =3D 0; i < sizeof(riscv_exts); i++) {
> > @@ -893,6 +912,8 @@ char *riscv_isa_string(RISCVCPU *cpu)
> >          }
> >      }
> >      *p =3D '\0';
> > +    riscv_isa_string_ext(cpu, isa_str, maxlen);
> > +
> >      return isa_str;
> >  }
> >
> >
>
>
>
>
>


--=20
Regards,
Atish

