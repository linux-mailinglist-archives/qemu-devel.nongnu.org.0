Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE7B69863B
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 21:48:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSOgl-0005MA-90; Wed, 15 Feb 2023 15:47:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pSOgf-0005Lv-Ja
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:47:33 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pSOgd-00018w-1j
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:47:32 -0500
Received: by mail-ed1-x52f.google.com with SMTP id cq19so32917edb.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 12:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ngRZcV04Hjr93houMjBfj908igwE3DQvINQXBEjsS9c=;
 b=JOwTp6l9M5pMDXujnAtNHGq0OAKJrgW6tpi5/TZ83DKlBaxW176xi1KL3wdELCWhbc
 azShCbP/q+DBnxTyxmcvLpQ/4vv3SYkOorVwboT4eW+eAPvCHaHNMrOfH2K5W9/WgKKb
 A0TyqkR3+JbDaHM4UyR3yYIWIqZsg7+vqEqiE227mHjbqH52QgKY1FM4ub9h5Hqt1QUN
 C13YUhx+fS+z/egFI9by3SGUQcjtug8q8K/yQmCmryP/Zq9IFpgJY4QQyiosWfyCzGHc
 e59XLraq/KmzL93+PbJnFz+66Y8OOihtfL7nzsgR1G7PZXw92gYbeCJpOm3A1rfw7bB8
 O8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ngRZcV04Hjr93houMjBfj908igwE3DQvINQXBEjsS9c=;
 b=juTTnnOEE/yxgANUnBzTJuqNIacN+NroLiyPSrxMQyBjUSzf52n91K7bFNY0SdaazU
 rW2pMPq8wlqaxFwXZO0VWyZOGWp2MGrpyWm/hqiUXwIqIXZ671VXnpApMhExw52LwH8T
 LSn6pDJKYNQ8xGhgcZ1Vs2IAQ85sYNvVb6DDAQ7Hj1gPUBc21lboSQOALSA5l2w5iZ6M
 u5O0065vaAjiWNqM6/RB+AFlY+Yd+4wUSbup2kpp96wP3Ymse4Z1yVk+ghGe6FzeJ3Bu
 UDFGfVr2nqf7a5iA27VLsZjpWd6wM4c1jFVg6UoOsNKK+vE9MSMcFlA2ymsLjS6g4/kO
 gBhw==
X-Gm-Message-State: AO0yUKWtDPBQM0mQAV65DrRY1ldBgunCWIbz4usoWXej2g8HKzBxrUth
 TG0URdCM73vDGbPJ5R99DRDkk+In4jYga6EK6zvT/A==
X-Google-Smtp-Source: AK7set//ZFkZ9UxI0utukmGuu8wYVVHMYUE6qEjqnpNEI6qn14BEsuOAYmjRxXAqxSWM+Lr4sJOcaCCSMHSuL2roPTM=
X-Received: by 2002:a50:d741:0:b0:4aa:a4df:23fc with SMTP id
 i1-20020a50d741000000b004aaa4df23fcmr1862175edj.1.1676494049549; Wed, 15 Feb
 2023 12:47:29 -0800 (PST)
MIME-Version: 1.0
References: <20230209062404.3582018-1-debug@rivosinc.com>
 <20230209062404.3582018-2-debug@rivosinc.com>
 <64a76da4-62d3-61f3-e8a8-347e3aa7eaca@linux.alibaba.com>
In-Reply-To: <64a76da4-62d3-61f3-e8a8-347e3aa7eaca@linux.alibaba.com>
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 15 Feb 2023 12:47:11 -0800
Message-ID: <CAKC1njQEcuEO=TSkK8qzywADYGh6cFLLUKLJ4fTfULHvKPOa=w@mail.gmail.com>
Subject: Re: [PATCH v1 RFC Zisslpcfi 1/9] target/riscv: adding zimops and
 zisslpcfi extension to RISCV cpu config
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, liweiwei@iscas.ac.cn,
 dbarboza@ventanamicro.com, 
 Kip Walker <kip@rivosinc.com>, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=debug@rivosinc.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Tue, Feb 14, 2023 at 6:52 PM LIU Zhiwei <zhiwei_liu@linux.alibaba.com> wrote:
>
>
> On 2023/2/9 14:23, Deepak Gupta wrote:
> > Introducing riscv `zisslpcfi` extension to riscv target. `zisslpcfi`
> > extension provides hardware assistance to riscv hart to enable control
> > flow integrity (CFI) for software.
> >
> > `zisslpcfi` extension expects hart to implement `zimops`. `zimops` stands
> > for "unprivileged integer maybe operations". `zimops` carve out certain
> > reserved opcodes encodings from integer spec to "may be operations"
> > encodings. `zimops` opcode encodings simply move 0 to rd.
> > `zisslpcfi` claims some of the `zimops` encodings and use them for shadow
> > stack management or indirect branch tracking. Any future extension can
> > also claim `zimops` encodings.
>
> Does  the zimops has a independent specification? If so, you should give
> a link to this
> specification.

Actual formal documentation is still a work in progress.
I am hoping to provide a reference to it in my next iteration.

>
> >
> > This patch also adds a dependency check for `zimops` to be enabled if
> > `zisslpcfi` is enabled on the hart.
>
> You should don't add two extensions in one patch. I think you should add
> them one by one.
> And add the zimop first.  In my opinion, you should implement the whole
> zimop extension before
> adding any patch for zisslpcfi, including the implementation of mop.rr
> and mop.r.

Noted will make sure of that and will send two different patch series then.

>
> >
> > Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> > Signed-off-by: Kip Walker  <kip@rivosinc.com>
> > ---
> >   target/riscv/cpu.c | 13 +++++++++++++
> >   target/riscv/cpu.h |  2 ++
> >   2 files changed, 15 insertions(+)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index cc75ca7667..6b4e90eb91 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -110,6 +110,8 @@ static const struct isa_ext_data isa_edata_arr[] = {
> >       ISA_EXT_DATA_ENTRY(svnapot, true, PRIV_VERSION_1_12_0, ext_svnapot),
> >       ISA_EXT_DATA_ENTRY(svpbmt, true, PRIV_VERSION_1_12_0, ext_svpbmt),
> >       ISA_EXT_DATA_ENTRY(xventanacondops, true, PRIV_VERSION_1_12_0, ext_XVentanaCondOps),
> > +    ISA_EXT_DATA_ENTRY(zimops, true, PRIV_VERSION_1_12_0, ext_zimops),
> > +    ISA_EXT_DATA_ENTRY(zisslpcfi, true, PRIV_VERSION_1_12_0, ext_cfi),
> Add them one by one.
> >   };
> >
> >   static bool isa_ext_is_enabled(RISCVCPU *cpu,
> > @@ -792,6 +794,11 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> >               return;
> >           }
> >
> > +        if (cpu->cfg.ext_cfi && !cpu->cfg.ext_zimops) {
> > +            error_setg(errp, "Zisslpcfi extension requires Zimops extension");
> > +            return;
> > +        }
> > +
> Seems reasonable for me.
> >           /* Set the ISA extensions, checks should have happened above */
> >           if (cpu->cfg.ext_zdinx || cpu->cfg.ext_zhinx ||
> >               cpu->cfg.ext_zhinxmin) {
> > @@ -1102,6 +1109,12 @@ static Property riscv_cpu_properties[] = {
> >   #ifndef CONFIG_USER_ONLY
> >       DEFINE_PROP_UINT64("resetvec", RISCVCPU, env.resetvec, DEFAULT_RSTVEC),
> >   #endif
> > +    /*
> > +     * Zisslpcfi CFI extension, Zisslpcfi implicitly means Zimops is
> > +     * implemented
> > +     */
> > +    DEFINE_PROP_BOOL("zisslpcfi", RISCVCPU, cfg.ext_cfi, true),
> > +    DEFINE_PROP_BOOL("zimops", RISCVCPU, cfg.ext_zimops, true),
>
> Default value should be false.

Yes, I have to fix this.

>
> Zhiwei
>
> >
> >       DEFINE_PROP_BOOL("short-isa-string", RISCVCPU, cfg.short_isa_string, false),
> >
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index f5609b62a2..9a923760b2 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -471,6 +471,8 @@ struct RISCVCPUConfig {
> >       uint32_t mvendorid;
> >       uint64_t marchid;
> >       uint64_t mimpid;
> > +    bool ext_zimops;
> > +    bool ext_cfi;
> >
> >       /* Vendor-specific custom extensions */
> >       bool ext_XVentanaCondOps;

