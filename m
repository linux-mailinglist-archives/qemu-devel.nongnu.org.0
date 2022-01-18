Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A99EE491D7F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 04:38:06 +0100 (CET)
Received: from localhost ([::1]:55692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9fJt-0003dj-Qy
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 22:38:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9fHZ-0002GU-SD
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 22:35:42 -0500
Received: from [2a00:1450:4864:20::32c] (port=52968
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1n9fHX-0005yp-5Z
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 22:35:41 -0500
Received: by mail-wm1-x32c.google.com with SMTP id v123so24681864wme.2
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 19:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pbDD03Y7Qsc6UwYMr1HiaRz68uU4srZHqUHsMKsrisc=;
 b=lT7f4g6oAgl7Sbfl65sF79JSqHfejF7fl7GkCUs7njCnVih6l+eoEkgMSVolACBA2I
 1coouJtJCfT0CluXR9ji5UZx1dInP0ACE/II7U2QGVYOmMfoxAJdMsA7fcl356HbYqg+
 fJz8yL36GVCtSKjb3uWQ53ur/hLyXWaB8XtUiwJK4Bb3ix7OL+ACLy3xuF5ArDCQWqD9
 /MgGkjT5mTDZhd9NvlgZgWjqXzIKwZo/AVk4KKJW6gEuF77uyJl4ok6fz4fv+H0NPEUS
 xhL+dT3+8jzNgWmRm2J2RP/izuQeYC0uat8juFXzcW4VckfXlwUeMzsENJ1Ol47MyIlK
 gMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pbDD03Y7Qsc6UwYMr1HiaRz68uU4srZHqUHsMKsrisc=;
 b=HUXWY5GEF6brZGf7hdFjfNdEgCHL96JA4OTd9793mraEjIO6Qebkbo+wwiGkAiXkuE
 TYzwxxNL0LjO75Mob98q7cxK60+XALESnudQlwGxvlpbWDrAy5ZhXxX0IEoqYWl7vugC
 gQ58E182KJ6aLc+q71iUSgvMA8etLtrmmJfOiSDXl18cW/uxVGcTQZttitDHfaNZ+SCs
 cgdOE4q8jzsnjoEq16OGAQ4E9Quu58oDtFgIlSgTEwHUHxQrgETB+FWeWjiKjShH4h8o
 /m9cE9rTCMM7u+tKHqJFC2IrI44DWjVImrh5muUm/vgD8Dm1rhIMrasQo1vqLsSEru2G
 RQlg==
X-Gm-Message-State: AOAM530JrYZy8VHAi4Xr+KT0/2bJ7w5dUWe9TC5qCOa9+6BNNDGGIw7a
 w+qDw6bWr9XCbrQCL3yh0nxYS50Vs1a0CJbzM64QaA==
X-Google-Smtp-Source: ABdhPJz2wGPYG5rNWB08K0mhtNcStKtipm1LcTTDRUw/cXUW9QLBDtAVsWgpBpfgNJfxDjqjpx9EwOSmVEuIR/ZnrCw=
X-Received: by 2002:a05:6000:1286:: with SMTP id
 f6mr21970456wrx.346.1642476933221; 
 Mon, 17 Jan 2022 19:35:33 -0800 (PST)
MIME-Version: 1.0
References: <20220118011711.7243-1-liweiwei@iscas.ac.cn>
 <20220118011711.7243-6-liweiwei@iscas.ac.cn>
In-Reply-To: <20220118011711.7243-6-liweiwei@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 18 Jan 2022 09:05:21 +0530
Message-ID: <CAAhSdy3bMG3htJSCMsT9HjrYXQP5XZk8y_8KN7pXjPoNPzc58w@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] target/riscv: add support for svpbmt extension
To: Weiwei Li <liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::32c;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
 "open list:RISC-V" <qemu-riscv@nongnu.org>, Heiko Stuebner <heiko@sntech.de>,
 wangjunqiang@iscas.ac.cn, Bin Meng <bin.meng@windriver.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 18, 2022 at 6:47 AM Weiwei Li <liweiwei@iscas.ac.cn> wrote:
>
> - add PTE_PBMT bits: It uses two PTE bits, but otherwise has no effect on QEMU, since QEMU is sequentially consistent and doesn't model PMAs currently
> - add PTE_PBMT bit check for inner PTE
>
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Anup Patel <anup@brainfault.org>
> ---
>  target/riscv/cpu.c        | 1 +
>  target/riscv/cpu.h        | 1 +
>  target/riscv/cpu_bits.h   | 2 ++
>  target/riscv/cpu_helper.c | 4 +++-
>  4 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 45ac98e06b..4f82bd00a3 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -670,6 +670,7 @@ static Property riscv_cpu_properties[] = {
>
>      DEFINE_PROP_BOOL("svinval", RISCVCPU, cfg.ext_svinval, false),
>      DEFINE_PROP_BOOL("svnapot", RISCVCPU, cfg.ext_svnapot, false),
> +    DEFINE_PROP_BOOL("svpbmt", RISCVCPU, cfg.ext_svpbmt, false),
>
>      DEFINE_PROP_BOOL("zba", RISCVCPU, cfg.ext_zba, true),
>      DEFINE_PROP_BOOL("zbb", RISCVCPU, cfg.ext_zbb, true),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index c3d1845ca1..53f314c752 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -329,6 +329,7 @@ struct RISCVCPU {
>          bool ext_icsr;
>          bool ext_svinval;
>          bool ext_svnapot;
> +        bool ext_svpbmt;
>          bool ext_zfh;
>          bool ext_zfhmin;
>
> diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
> index 5501e9698b..24b7eb2b1f 100644
> --- a/target/riscv/cpu_bits.h
> +++ b/target/riscv/cpu_bits.h
> @@ -486,7 +486,9 @@ typedef enum {
>  #define PTE_A               0x040 /* Accessed */
>  #define PTE_D               0x080 /* Dirty */
>  #define PTE_SOFT            0x300 /* Reserved for Software */
> +#define PTE_PBMT            0x6000000000000000 /* Page-based memory types */
>  #define PTE_N               0x8000000000000000 /* NAPOT translation */
> +#define PTE_ATTR            (PTE_N | PTE_PBMT) /* All attributes bits */
>
>  /* Page table PPN shift amount */
>  #define PTE_PPN_SHIFT       10
> diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> index c276760c7f..9fffaccffb 100644
> --- a/target/riscv/cpu_helper.c
> +++ b/target/riscv/cpu_helper.c
> @@ -625,9 +625,11 @@ restart:
>          if (!(pte & PTE_V)) {
>              /* Invalid PTE */
>              return TRANSLATE_FAIL;
> +        } else if (!cpu->cfg.ext_svpbmt && (pte & (target_ulong)PTE_PBMT)) {

Rather than, type-casting defines here you can simply define
ULL constants. E.g.
#define PTE_PBMT            0x6000000000000000ULL

> +            return TRANSLATE_FAIL;
>          } else if (!(pte & (PTE_R | PTE_W | PTE_X))) {
>              /* Inner PTE, continue walking */
> -            if (pte & (target_ulong)(PTE_D | PTE_A | PTE_U | PTE_N)) {
> +            if (pte & (target_ulong)(PTE_D | PTE_A | PTE_U | PTE_ATTR)) {
>                  return TRANSLATE_FAIL;
>              }
>              base = ppn << PGSHIFT;
> --
> 2.17.1
>

Regards,
Anup

