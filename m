Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1F14A87B6
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 16:33:17 +0100 (CET)
Received: from localhost ([::1]:53084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFe6m-0006JJ-6J
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 10:33:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nFe51-00050s-5z
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 10:31:30 -0500
Received: from [2a00:1450:4864:20::333] (port=36483
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1nFe4w-0000lG-Av
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 10:31:26 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso7439060wma.1
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 07:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JgN2jp35ZNR4gc+KKr72xeVzMlJ25R95340uB+C6mHI=;
 b=HTXZEJzx23+XOO2fL/LKvjgacT3mhvuWksDLwLFa8rfXQSpNXwHMeoK7dIxaO7j/Zl
 Z30zzJScUj7XgUu5yp+kSe7rvBwlGP+U368Mz7YOobIXoRhq9PkrEKc3jzi5mTuiW0lU
 fwCayrafmbJMzsCCZGx7mIFku/Y+pf1cDMaOcAtZdVghlUt1pFPM8Pe1bOSYbpHI/jnt
 WJm5HC0xSXEq3uHzTtGul6PKYUpKqQA5uoIkCbq5ZJzNzEnwH8Oa/wd28BfNRfkYsf2A
 NtVXwnu/LgUWNuzRENk/iEh5WyMfctuXnnRbX1WgHCqW6vM86jlhJi89zdAPEoe1cuc2
 HQUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JgN2jp35ZNR4gc+KKr72xeVzMlJ25R95340uB+C6mHI=;
 b=bUY3oSsdzcxLgk8oVJ+k7FbTgtYTJmxiEQ7tnrfGfLso0G2fkiM/ZBW4uC87xk831r
 Y1vHp9jA8DzsgUQs7it+qfIBW9Q+M/mdKjdjKgF+dBTiR8plWEk2HIIEY2cuxn6LIYfP
 Zygbt9TrquO1Z9gi6Zwyz43bNG3Uc8l36nq7EVP72PkT4Tv8Qj2H3tWBtqyycxXwC7Ro
 NIbxAV7Zo3WXhjS/u7kzB9lA9AGp+bhxuicCGQVh6954PA9OJYSt1vKk4X+vYB0CistF
 Vj3nyvFE6txL+CMrS3FC5Tu8bqIMsK8QqXGPmezD+o6DN7DiOneCBxcoK51aT/9iOigp
 QafA==
X-Gm-Message-State: AOAM533oZov13v04PYBf5THmKJ9bgZHNVFD/iBjTEVu8zkU9OCqZHPj7
 EFo3OO/18EWEfSc54PCSxr88c49bBuMGvOSTJW6L1Q==
X-Google-Smtp-Source: ABdhPJzl5QDcFS/7eHnv/S3gEG39SGr7W3fBAQyNXy9E5mZqS0DcqBcmAtkiO4cPKQtPEtdrHZn5rrlA/Regh5rnDeU=
X-Received: by 2002:a05:600c:1914:: with SMTP id
 j20mr10900031wmq.41.1643902256621; 
 Thu, 03 Feb 2022 07:30:56 -0800 (PST)
MIME-Version: 1.0
References: <20220202005249.3566542-1-philipp.tomsich@vrull.eu>
 <CAKmqyKON_XRd5FUaTkQLkcF6nFHqFv971c=fy21p7UHMAsFUmA@mail.gmail.com>
In-Reply-To: <CAKmqyKON_XRd5FUaTkQLkcF6nFHqFv971c=fy21p7UHMAsFUmA@mail.gmail.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Thu, 3 Feb 2022 16:30:45 +0100
Message-ID: <CAAeLtUA2jFAvOdL31zWoRauhQWGek6sdxfO-QhwttJ14QM15XA@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] target/riscv: Add XVentanaCondOps and supporting
 infrastructure changes
To: Alistair Francis <alistair23@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000000d406005d71ed292"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-wm1-x333.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Greg Favor <gfavor@ventanamicro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000d406005d71ed292
Content-Type: text/plain; charset="UTF-8"

Alistair,

there's a fix for a regression (inverted condition) caused by the changes
to the REQUIRE_ZB[ABCS] heading your way.

Thanks,
Philipp.

On Wed, 2 Feb 2022 at 07:36, Alistair Francis <alistair23@gmail.com> wrote:

> On Wed, Feb 2, 2022 at 2:03 PM Philipp Tomsich <philipp.tomsich@vrull.eu>
> wrote:
> >
> >
> > In adding our first X-extension (i.e., vendor-defined) on RISC-V with
> > XVentanaCondOps, we need to add a few instructure improvements to make
> > it easier to add similar vendor-defined extensions in the future:
> > - refactor access to the cfg->ext_* fields by making a pointer to the
> >   cfg structure (as cfg_ptr) available via DisasContext
> > - add a table-based list of decoders to invoke, each being guarded by
> >   a guard/predicate-function, that can be used to either add vendor
> >   extensions, large extensions or override (by listing the decoder
> >   before the one for standard extensions) patterns to handle errata
> >
> >
> > Changes in v6:
> > - add the 'vt' prefix to gen_condmask, renaming it to gen_vt_condmask
> >
> > Changes in v5:
> > - use the typedef in DisasContext instead of the nakes struct
> >   for RISCVCPUConfig
> > - manually picked up those Reviewed-by tags from Richard that patman
> >   missed
> >
> > Changes in v4:
> > - use a typedef into 'RISCVCPUConfig' (instead of the explicit
> >   'struct RISCVCPUConfig') to comply with the coding standard
> >   (as suggested in Richard's review of v3)
> > - add braces to comply with coding standard (as suggested by Richard)
> > - merge the two if-statements to reduce clutter after (now that the
> >   braces have been added)
> >
> > Changes in v3:
> > - (new patch) refactor 'struct RISCVCPUConfig'
> > - (new patch) copy pointer to element cfg into DisasContext
> > - (new patch) test extension-availability through cfg_ptr in
> >   DisasContext, removing the fields that have been copied into
> >   DisasContext directly
> > - (new patch) change Zb[abcs] implementation to use cfg_ptr (copied
> >   into DisasContext) instead of going throuhg RISCV_CPU
> > - expose only the DisasContext* to predicate functions
> > - mark the table of decoder functions as static
> > - drop the inline from always_true_p, until the need arises (i.e.,
> >   someone finds a use for it and calls it directly)
> > - rewrite to drop the 'handled' temporary in iterating over the
> >   decoder table, removing the assignment in the condition of the if
> > - rename to trans_xventanacondops.c.inc (i.e. with the '.c')
> > - (in MATERIALISE_EXT_PREDICATE) don't annotate the predicate function
> >   for testing the availability of individual extensions as 'inline'
> >   and don't make CPURISCVState* visible to these predicate functions
> > - add a MAINTAINERS entry for XVentanaCondOps
> >
> > Changes in v2:
> > - (new patch) iterate over a table of guarded decoder functions
> > - Split off decode table into XVentanaCondOps.decode
> > - Wire up XVentanaCondOps in the decoder-table
> >
> > Philipp Tomsich (7):
> >   target/riscv: refactor (anonymous struct) RISCVCPU.cfg into 'struct
> >     RISCVCPUConfig'
> >   target/riscv: riscv_tr_init_disas_context: copy pointer-to-cfg into
> >     cfg_ptr
> >   target/riscv: access configuration through cfg_ptr in DisasContext
> >   target/riscv: access cfg structure through DisasContext
> >   target/riscv: iterate over a table of decoders
> >   target/riscv: Add XVentanaCondOps custom extension
> >   target/riscv: add a MAINTAINERS entry for XVentanaCondOps
>
> Thanks!
>
> Applied to riscv-to-apply.next
>
> Alistair
>
> >
> >  MAINTAINERS                                   |   7 ++
> >  target/riscv/XVentanaCondOps.decode           |  25 +++++
> >  target/riscv/cpu.c                            |   3 +
> >  target/riscv/cpu.h                            |  81 +++++++-------
> >  target/riscv/insn_trans/trans_rvb.c.inc       |   8 +-
> >  target/riscv/insn_trans/trans_rvi.c.inc       |   2 +-
> >  target/riscv/insn_trans/trans_rvv.c.inc       | 104 +++++++++---------
> >  target/riscv/insn_trans/trans_rvzfh.c.inc     |   4 +-
> >  .../insn_trans/trans_xventanacondops.c.inc    |  39 +++++++
> >  target/riscv/meson.build                      |   1 +
> >  target/riscv/translate.c                      |  60 ++++++----
> >  11 files changed, 219 insertions(+), 115 deletions(-)
> >  create mode 100644 target/riscv/XVentanaCondOps.decode
> >  create mode 100644 target/riscv/insn_trans/trans_xventanacondops.c.inc
> >
> > --
> > 2.33.1
> >
> >
>

--0000000000000d406005d71ed292
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Alistair,<div><br></div><div>there&#39;s a fix for a regre=
ssion (inverted condition) caused by the changes to the REQUIRE_ZB[ABCS] he=
ading your way.</div><div><br></div><div>Thanks,</div><div>Philipp.</div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Wed, 2 Feb 2022 at 07:36, Alistair Francis &lt;<a href=3D"mailto:alistair2=
3@gmail.com">alistair23@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Wed, Feb 2, 2022 at 2:03 PM Philipp Tom=
sich &lt;<a href=3D"mailto:philipp.tomsich@vrull.eu" target=3D"_blank">phil=
ipp.tomsich@vrull.eu</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt; In adding our first X-extension (i.e., vendor-defined) on RISC-V with<=
br>
&gt; XVentanaCondOps, we need to add a few instructure improvements to make=
<br>
&gt; it easier to add similar vendor-defined extensions in the future:<br>
&gt; - refactor access to the cfg-&gt;ext_* fields by making a pointer to t=
he<br>
&gt;=C2=A0 =C2=A0cfg structure (as cfg_ptr) available via DisasContext<br>
&gt; - add a table-based list of decoders to invoke, each being guarded by<=
br>
&gt;=C2=A0 =C2=A0a guard/predicate-function, that can be used to either add=
 vendor<br>
&gt;=C2=A0 =C2=A0extensions, large extensions or override (by listing the d=
ecoder<br>
&gt;=C2=A0 =C2=A0before the one for standard extensions) patterns to handle=
 errata<br>
&gt;<br>
&gt;<br>
&gt; Changes in v6:<br>
&gt; - add the &#39;vt&#39; prefix to gen_condmask, renaming it to gen_vt_c=
ondmask<br>
&gt;<br>
&gt; Changes in v5:<br>
&gt; - use the typedef in DisasContext instead of the nakes struct<br>
&gt;=C2=A0 =C2=A0for RISCVCPUConfig<br>
&gt; - manually picked up those Reviewed-by tags from Richard that patman<b=
r>
&gt;=C2=A0 =C2=A0missed<br>
&gt;<br>
&gt; Changes in v4:<br>
&gt; - use a typedef into &#39;RISCVCPUConfig&#39; (instead of the explicit=
<br>
&gt;=C2=A0 =C2=A0&#39;struct RISCVCPUConfig&#39;) to comply with the coding=
 standard<br>
&gt;=C2=A0 =C2=A0(as suggested in Richard&#39;s review of v3)<br>
&gt; - add braces to comply with coding standard (as suggested by Richard)<=
br>
&gt; - merge the two if-statements to reduce clutter after (now that the<br=
>
&gt;=C2=A0 =C2=A0braces have been added)<br>
&gt;<br>
&gt; Changes in v3:<br>
&gt; - (new patch) refactor &#39;struct RISCVCPUConfig&#39;<br>
&gt; - (new patch) copy pointer to element cfg into DisasContext<br>
&gt; - (new patch) test extension-availability through cfg_ptr in<br>
&gt;=C2=A0 =C2=A0DisasContext, removing the fields that have been copied in=
to<br>
&gt;=C2=A0 =C2=A0DisasContext directly<br>
&gt; - (new patch) change Zb[abcs] implementation to use cfg_ptr (copied<br=
>
&gt;=C2=A0 =C2=A0into DisasContext) instead of going throuhg RISCV_CPU<br>
&gt; - expose only the DisasContext* to predicate functions<br>
&gt; - mark the table of decoder functions as static<br>
&gt; - drop the inline from always_true_p, until the need arises (i.e.,<br>
&gt;=C2=A0 =C2=A0someone finds a use for it and calls it directly)<br>
&gt; - rewrite to drop the &#39;handled&#39; temporary in iterating over th=
e<br>
&gt;=C2=A0 =C2=A0decoder table, removing the assignment in the condition of=
 the if<br>
&gt; - rename to trans_xventanacondops.c.inc (i.e. with the &#39;.c&#39;)<b=
r>
&gt; - (in MATERIALISE_EXT_PREDICATE) don&#39;t annotate the predicate func=
tion<br>
&gt;=C2=A0 =C2=A0for testing the availability of individual extensions as &=
#39;inline&#39;<br>
&gt;=C2=A0 =C2=A0and don&#39;t make CPURISCVState* visible to these predica=
te functions<br>
&gt; - add a MAINTAINERS entry for XVentanaCondOps<br>
&gt;<br>
&gt; Changes in v2:<br>
&gt; - (new patch) iterate over a table of guarded decoder functions<br>
&gt; - Split off decode table into XVentanaCondOps.decode<br>
&gt; - Wire up XVentanaCondOps in the decoder-table<br>
&gt;<br>
&gt; Philipp Tomsich (7):<br>
&gt;=C2=A0 =C2=A0target/riscv: refactor (anonymous struct) RISCVCPU.cfg int=
o &#39;struct<br>
&gt;=C2=A0 =C2=A0 =C2=A0RISCVCPUConfig&#39;<br>
&gt;=C2=A0 =C2=A0target/riscv: riscv_tr_init_disas_context: copy pointer-to=
-cfg into<br>
&gt;=C2=A0 =C2=A0 =C2=A0cfg_ptr<br>
&gt;=C2=A0 =C2=A0target/riscv: access configuration through cfg_ptr in Disa=
sContext<br>
&gt;=C2=A0 =C2=A0target/riscv: access cfg structure through DisasContext<br=
>
&gt;=C2=A0 =C2=A0target/riscv: iterate over a table of decoders<br>
&gt;=C2=A0 =C2=A0target/riscv: Add XVentanaCondOps custom extension<br>
&gt;=C2=A0 =C2=A0target/riscv: add a MAINTAINERS entry for XVentanaCondOps<=
br>
<br>
Thanks!<br>
<br>
Applied to riscv-to-apply.next<br>
<br>
Alistair<br>
<br>
&gt;<br>
&gt;=C2=A0 MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A07 ++<br>
&gt;=C2=A0 target/riscv/XVentanaCondOps.decode=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 25 +++++<br>
&gt;=C2=A0 target/riscv/cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 target/riscv/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 81 +++++++----=
---<br>
&gt;=C2=A0 target/riscv/insn_trans/trans_rvb.c.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 target/riscv/insn_trans/trans_rvi.c.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 target/riscv/insn_trans/trans_rvv.c.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 104 +++++++++---------<br>
&gt;=C2=A0 target/riscv/insn_trans/trans_rvzfh.c.inc=C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 .../insn_trans/trans_xventanacondops.c.inc=C2=A0 =C2=A0 |=C2=A0 =
39 +++++++<br>
&gt;=C2=A0 target/riscv/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 target/riscv/translate.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 60 ++++++----<br>
&gt;=C2=A0 11 files changed, 219 insertions(+), 115 deletions(-)<br>
&gt;=C2=A0 create mode 100644 target/riscv/XVentanaCondOps.decode<br>
&gt;=C2=A0 create mode 100644 target/riscv/insn_trans/trans_xventanacondops=
.c.inc<br>
&gt;<br>
&gt; --<br>
&gt; 2.33.1<br>
&gt;<br>
&gt;<br>
</blockquote></div>

--0000000000000d406005d71ed292--

