Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43311492450
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 12:08:40 +0100 (CET)
Received: from localhost ([::1]:37924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9mLv-0005nj-9Z
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 06:08:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1n9mHh-0002TR-Iz
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 06:04:19 -0500
Received: from [2607:f8b0:4864:20::536] (port=47049
 helo=mail-pg1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1n9mHf-0004yU-Mr
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 06:04:17 -0500
Received: by mail-pg1-x536.google.com with SMTP id i8so13594154pgt.13
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 03:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eDBqfIwCd44rUFG6mFVIrW17UoarlnAl5n5cRRKuRoM=;
 b=WsLy7TlQhsnpmvQDg1c8UdpkkFWQaoXXJVc4u5CGlm1kGenV6mTj1/+RDZcN6kQIby
 wCGjL/AAUXuXymeqswNqxCz9xoWMtJp8NdrYu50iNn8ddOJ0iB17jv0xWAysCsLm07Js
 mWuwAGVERUjnhXlAOJoJgCodTmC+8iQO85KwHUxl6NPGUuwQgxSl+8w0Gpyhwfh27WaY
 pGQDWnwUK7JHRw1Owak06mW9vSjA4+YHFmkpjR7RZvL9J4YtQB68o7bNqErmBAvOZ/1b
 rxFPo5RD+LkNSlMS2zGGxNY0rFNO8jceXRbaWfC7QDoNbiy/FFJiZkIjiNFkuQULheSw
 riaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eDBqfIwCd44rUFG6mFVIrW17UoarlnAl5n5cRRKuRoM=;
 b=zJff5nBXLVGSzHZVApqV7n5DYtCcAXlgcuiMQgEGQjKkHMFK8KgbMwdJ144FrRsnhv
 3n0QSxdrSnDo49ySVLAuUvVqyMc5qdSeMc2sKwvEWhMhLO1wQgaaQX5+AG+n8USGYHXr
 g0jgRRdvXmYXXaJGY44FqCcEw4lHoFy6gGqbkQV2UicU0ho+4ms4yvs2NzdBXW60mOdi
 FbKbON6HkWKqnPTQ+8E/cT9gG5M0gRbkQSeqhGOBZyfdSzC1pwVlccjjVWsx73Uohtel
 qcNpc2Z2yqaXvthhs29S3AWCm+RppxJVhn1rLghhEqqgZdNvND5eOowqpTNHidnXwrGx
 q0qQ==
X-Gm-Message-State: AOAM531ZBfQTeYLJV0PKXWEzQSKjdE0hW5dJlrQLX59APTSMINO29HBv
 4mUf5hC4Z2O9B6QEpmjPhueOzmQ0pRooaDWYPm2REg==
X-Google-Smtp-Source: ABdhPJzEDaQhQhQx6VfQypdjOKRXdJAyZMT7lpGHrA1DAxNEps+rGNTRfKS1XvLSenTjk1TrRV8fkrC++6mLnvJ9ZKo=
X-Received: by 2002:a05:6a00:2410:b0:4bc:dda9:2e92 with SMTP id
 z16-20020a056a00241000b004bcdda92e92mr25081153pfh.76.1642503854200; Tue, 18
 Jan 2022 03:04:14 -0800 (PST)
MIME-Version: 1.0
References: <20220118011711.7243-1-liweiwei@iscas.ac.cn>
 <20220118011711.7243-6-liweiwei@iscas.ac.cn>
 <CAAhSdy3bMG3htJSCMsT9HjrYXQP5XZk8y_8KN7pXjPoNPzc58w@mail.gmail.com>
 <a7a73309-8112-4590-efa6-bc3f0122a5f0@iscas.ac.cn>
In-Reply-To: <a7a73309-8112-4590-efa6-bc3f0122a5f0@iscas.ac.cn>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 18 Jan 2022 16:34:02 +0530
Message-ID: <CAK9=C2U22weKz6soWWAO9xDMpnY4D40ziBGK631ssQSf_eYpaA@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] target/riscv: add support for svpbmt extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::536
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=apatel@ventanamicro.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, Anup Patel <anup@brainfault.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Bin Meng <bin.meng@windriver.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 18, 2022 at 2:40 PM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
>
> =E5=9C=A8 2022/1/18 =E4=B8=8A=E5=8D=8811:35, Anup Patel =E5=86=99=E9=81=
=93:
> > On Tue, Jan 18, 2022 at 6:47 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
> >> - add PTE_PBMT bits: It uses two PTE bits, but otherwise has no effect=
 on QEMU, since QEMU is sequentially consistent and doesn't model PMAs curr=
ently
> >> - add PTE_PBMT bit check for inner PTE
> >>
> >> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> >> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> >> Cc: Heiko Stuebner <heiko@sntech.de>
> >> Cc: Anup Patel <anup@brainfault.org>
> >> ---
> >>   target/riscv/cpu.c        | 1 +
> >>   target/riscv/cpu.h        | 1 +
> >>   target/riscv/cpu_bits.h   | 2 ++
> >>   target/riscv/cpu_helper.c | 4 +++-
> >>   4 files changed, 7 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> >> index 45ac98e06b..4f82bd00a3 100644
> >> --- a/target/riscv/cpu.c
> >> +++ b/target/riscv/cpu.c
> >> @@ -670,6 +670,7 @@ static Property riscv_cpu_properties[] =3D {
> >>
> >>       DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
> >>       DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
> >> +    DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
> >>
> >>       DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
> >>       DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
> >> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> >> index c3d1845ca1..53f314c752 100644
> >> --- a/target/riscv/cpu.h
> >> +++ b/target/riscv/cpu.h
> >> @@ -329,6 +329,7 @@ struct RISCVCPU {
> >>           bool ext_icsr;
> >>           bool ext_svinval;
> >>           bool ext_svnapot;
> >> +        bool ext_svpbmt;
> >>           bool ext_zfh;
> >>           bool ext_zfhmin;
> >>
> >> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> >> index 5501e9698b..24b7eb2b1f 100644
> >> --- a/target/riscv/cpu_bits.h
> >> +++ b/target/riscv/cpu_bits.h
> >> @@ -486,7 +486,9 @@ typedef enum {
> >>   #define PTE_A               0x040 /* Accessed */
> >>   #define PTE_D               0x080 /* Dirty */
> >>   #define PTE_SOFT            0x300 /* Reserved for Software */
> >> +#define PTE_PBMT            0x6000000000000000 /* Page-based memory t=
ypes */
> >>   #define PTE_N               0x8000000000000000 /* NAPOT translation =
*/
> >> +#define PTE_ATTR            (PTE_N | PTE_PBMT) /* All attributes bits=
 */
> >>
> >>   /* Page table PPN shift amount */
> >>   #define PTE_PPN_SHIFT       10
> >> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> >> index c276760c7f..9fffaccffb 100644
> >> --- a/target/riscv/cpu_helper.c
> >> +++ b/target/riscv/cpu_helper.c
> >> @@ -625,9 +625,11 @@ restart:
> >>           if (!(pte & PTE_V)) {
> >>               /* Invalid PTE */
> >>               return TRANSLATE_FAIL;
> >> +        } else if (!cpu->cfg.ext_svpbmt && (pte & (target_ulong)PTE_P=
BMT)) {
> > Rather than, type-casting defines here you can simply define
> > ULL constants. E.g.
> > #define PTE_PBMT            0x6000000000000000ULL
>
> Sorry, I'm wonder why add ULL can replace the function of type-casting.
>
> The type-casting here is to compatible with RV32 for possible strict
> type check warnings since pte is 32 bits and PTE_PBMT is 64 bits in RV32.

If adding ULL does not help for RV32 target then no need to change.

>
> If I add ULL in PTE_PBMT, it seems have no change to PTE_PBMT. It's
> still 64 bits in RV32.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

>
> Regards,
>
> Weiwei Li
>
> >
> >> +            return TRANSLATE_FAIL;
> >>           } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
> >>               /* Inner PTE, continue walking */
> >> -            if (pte & (target_ulong)(PTE_D | PTE_A | PTE_U | PTE_N)) =
{
> >> +            if (pte & (target_ulong)(PTE_D | PTE_A | PTE_U | PTE_ATTR=
)) {
> >>                   return TRANSLATE_FAIL;
> >>               }
> >>               base =3D ppn << PGSHIFT;
> >> --
> >> 2.17.1
> >>
> > Regards,
> > Anup
>
>

