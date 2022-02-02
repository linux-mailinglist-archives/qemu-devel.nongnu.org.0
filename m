Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 962414A6C08
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 08:03:56 +0100 (CET)
Received: from localhost ([::1]:47136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF9gI-0004co-WE
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 02:03:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nF9Fp-0001xi-Hw
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 01:36:33 -0500
Received: from [2607:f8b0:4864:20::d36] (port=41972
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nF9Fn-0007s1-Lp
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 01:36:33 -0500
Received: by mail-io1-xd36.google.com with SMTP id q204so24177336iod.8
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 22:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=To/E8m1Op6Oju6L6Ojq5CAndJ23zl9KIqFyyGopVGbM=;
 b=DxQkkzAUmQj25XP67k3kXYRkoFJxZuJRRSjDUXSd4vke7UGep4OwfoGBKwVTmt7CL9
 dFll+3WKy6wgubdch/1dGc19svcouhuLpSunQ9XXs/WO5uTGL/wUpuBtNIdLCY+exCfZ
 deLK4Mh2qDS/Y0U2IJ4q3ITs2JGtuwWy/vJuRQxA3j8Apcu0mbqRztrH26rPJf+IOWmU
 XoIZq2qNxj8HX/T51w9Sh1+heE8ecUwsjITedlpsor24zA04btwrgIAqL0tEvUewlaCP
 B92roUbeo97LAGGyn51FZGxJzaW2hIXKhidaLOwLp+M+lvuFP9Ic5lWYbopFdKeKtCJy
 tMmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=To/E8m1Op6Oju6L6Ojq5CAndJ23zl9KIqFyyGopVGbM=;
 b=AHsqH6DAagKtElzFYbOXYjERf2Q0Ze1MVTUdzF8FVRbJFH1iNsnIuFQMlKqtgKmZTw
 XTipBYDrovOTopbZg0yS8iDr8nnaORkRI1U/05vHntDVrq/05IaOEE4j5jEf1GQYkTDb
 5clafxxQNcmJlO9hQ9Ov/RYlWAFdjr3rggOmqs4RlyEY3oPBRvHpscBA1HBxCF9oVQ43
 JJ/HtpkV3f/NozFvK34vdejw+lews0ZEpBHBcb68D0VoWOw+HzTotX9Iw4cg71fgaTsu
 elM1kBwpdIf8+0ctL00MTXEuFYoyYDRz+EcUn6JeO0ZRGJ/kQzxNf77ehFzr9AWbAMEm
 V/bw==
X-Gm-Message-State: AOAM5325grY8XjCCXFntAmaeRd/H//Mgcq8vVeDYnvsASAgQXhYIHbdt
 0BaAIxJhCFohvCzeAeWMEvmky8J3QMFsrvf2Mto=
X-Google-Smtp-Source: ABdhPJzgAXmENdY05PJn/K72Vs5YtHQtRp9N/08c7t9ZO2aOAUKiU2IDfP+6Et8rIM3FgABgqZVuZgNN0Jpi/Y4quII=
X-Received: by 2002:a05:6602:727:: with SMTP id
 g7mr16096679iox.90.1643783789857; 
 Tue, 01 Feb 2022 22:36:29 -0800 (PST)
MIME-Version: 1.0
References: <20220202005249.3566542-1-philipp.tomsich@vrull.eu>
In-Reply-To: <20220202005249.3566542-1-philipp.tomsich@vrull.eu>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 2 Feb 2022 16:36:03 +1000
Message-ID: <CAKmqyKON_XRd5FUaTkQLkcF6nFHqFv971c=fy21p7UHMAsFUmA@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] target/riscv: Add XVentanaCondOps and supporting
 infrastructure changes
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d36
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d36;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Greg Favor <gfavor@ventanamicro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 2, 2022 at 2:03 PM Philipp Tomsich <philipp.tomsich@vrull.eu> wrote:
>
>
> In adding our first X-extension (i.e., vendor-defined) on RISC-V with
> XVentanaCondOps, we need to add a few instructure improvements to make
> it easier to add similar vendor-defined extensions in the future:
> - refactor access to the cfg->ext_* fields by making a pointer to the
>   cfg structure (as cfg_ptr) available via DisasContext
> - add a table-based list of decoders to invoke, each being guarded by
>   a guard/predicate-function, that can be used to either add vendor
>   extensions, large extensions or override (by listing the decoder
>   before the one for standard extensions) patterns to handle errata
>
>
> Changes in v6:
> - add the 'vt' prefix to gen_condmask, renaming it to gen_vt_condmask
>
> Changes in v5:
> - use the typedef in DisasContext instead of the nakes struct
>   for RISCVCPUConfig
> - manually picked up those Reviewed-by tags from Richard that patman
>   missed
>
> Changes in v4:
> - use a typedef into 'RISCVCPUConfig' (instead of the explicit
>   'struct RISCVCPUConfig') to comply with the coding standard
>   (as suggested in Richard's review of v3)
> - add braces to comply with coding standard (as suggested by Richard)
> - merge the two if-statements to reduce clutter after (now that the
>   braces have been added)
>
> Changes in v3:
> - (new patch) refactor 'struct RISCVCPUConfig'
> - (new patch) copy pointer to element cfg into DisasContext
> - (new patch) test extension-availability through cfg_ptr in
>   DisasContext, removing the fields that have been copied into
>   DisasContext directly
> - (new patch) change Zb[abcs] implementation to use cfg_ptr (copied
>   into DisasContext) instead of going throuhg RISCV_CPU
> - expose only the DisasContext* to predicate functions
> - mark the table of decoder functions as static
> - drop the inline from always_true_p, until the need arises (i.e.,
>   someone finds a use for it and calls it directly)
> - rewrite to drop the 'handled' temporary in iterating over the
>   decoder table, removing the assignment in the condition of the if
> - rename to trans_xventanacondops.c.inc (i.e. with the '.c')
> - (in MATERIALISE_EXT_PREDICATE) don't annotate the predicate function
>   for testing the availability of individual extensions as 'inline'
>   and don't make CPURISCVState* visible to these predicate functions
> - add a MAINTAINERS entry for XVentanaCondOps
>
> Changes in v2:
> - (new patch) iterate over a table of guarded decoder functions
> - Split off decode table into XVentanaCondOps.decode
> - Wire up XVentanaCondOps in the decoder-table
>
> Philipp Tomsich (7):
>   target/riscv: refactor (anonymous struct) RISCVCPU.cfg into 'struct
>     RISCVCPUConfig'
>   target/riscv: riscv_tr_init_disas_context: copy pointer-to-cfg into
>     cfg_ptr
>   target/riscv: access configuration through cfg_ptr in DisasContext
>   target/riscv: access cfg structure through DisasContext
>   target/riscv: iterate over a table of decoders
>   target/riscv: Add XVentanaCondOps custom extension
>   target/riscv: add a MAINTAINERS entry for XVentanaCondOps

Thanks!

Applied to riscv-to-apply.next

Alistair

>
>  MAINTAINERS                                   |   7 ++
>  target/riscv/XVentanaCondOps.decode           |  25 +++++
>  target/riscv/cpu.c                            |   3 +
>  target/riscv/cpu.h                            |  81 +++++++-------
>  target/riscv/insn_trans/trans_rvb.c.inc       |   8 +-
>  target/riscv/insn_trans/trans_rvi.c.inc       |   2 +-
>  target/riscv/insn_trans/trans_rvv.c.inc       | 104 +++++++++---------
>  target/riscv/insn_trans/trans_rvzfh.c.inc     |   4 +-
>  .../insn_trans/trans_xventanacondops.c.inc    |  39 +++++++
>  target/riscv/meson.build                      |   1 +
>  target/riscv/translate.c                      |  60 ++++++----
>  11 files changed, 219 insertions(+), 115 deletions(-)
>  create mode 100644 target/riscv/XVentanaCondOps.decode
>  create mode 100644 target/riscv/insn_trans/trans_xventanacondops.c.inc
>
> --
> 2.33.1
>
>

