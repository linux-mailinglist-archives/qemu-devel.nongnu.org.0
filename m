Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D6D476A0A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 06:58:38 +0100 (CET)
Received: from localhost ([::1]:44336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxjmn-0003yx-He
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 00:58:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mxjhM-0000R2-1p
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 00:53:00 -0500
Received: from [2a00:1450:4864:20::433] (port=45688
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1mxjhG-0000Ld-1Y
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 00:52:59 -0500
Received: by mail-wr1-x433.google.com with SMTP id o13so41954534wrs.12
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 21:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xC95yJ7UUM7RdK60Vqzw9JlQSm9Ehd59F5//i8iBgas=;
 b=UGfy7F5KDCgK7IPvxR1Slc2TMT+9ySP6u1aSHTkoAIH/rS7k5M2T/9sV2oDcw+G+2L
 6Skk6JbNAAMNt7eSqlnXbVFipCI0Wl14TneniQGOtgvao1HEgFvQ8QeH6XisNMeCFJ94
 KZolh3x/bhGw0gGVVVnPFJz3nwhGCDZR7WHblqPqSmXKigVoWaZngtgbh2FGUkdn0r+q
 pQv2l/CKxpFUV/5v8RvNAZBYY7Z4B572gUAML9kDb995YkKdSQNLmGbRKWqO30RG5Dqq
 9wgRc0F6yBnPkmbHGzM7+JjnBTyhj0Vvm1uVh5vLALFpztjlt5w76wKy+J35bAIOyuvK
 ralQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xC95yJ7UUM7RdK60Vqzw9JlQSm9Ehd59F5//i8iBgas=;
 b=GkiLfbGNSGiy42Wx0L1M9WOInwa1pAcv7SCZxxwj0iRbTtv0Ked02Og23q9k6edxRq
 YYFlaDyejtTPOhIYl7adE+rY3H7WNoJwnu1MnYQi04IvdZRYnMYkTjCBNPTkWjDKTHMf
 K22GFcBsGVqIgJxpctHZl4PrBCl+cxb8FtPaEt77imvD098QvlIz5NmqD85Q/0QntsGv
 zuAILmx+b7FUlYKykMJ1SZGO4CZTvmnEAwN9pa7tEbg+3+C9cAdjyMsslYBF4c3hfEw9
 iB7JFE9G6ebcdGBnTt/nCMLkyq10REjfHQ8siqQDFz4sYHxWOmMOMteNtFq8jWXH5DzH
 8pHg==
X-Gm-Message-State: AOAM530XkIbimrzGTyKo8tDZ6U2hKpJ9nj5e66Nhg/MFZ8MYTPp9WNYq
 rYKB5riSmmiRw5Er46NZl1ZKoxTjV/uPB5H5tuGwVw==
X-Google-Smtp-Source: ABdhPJzGX7kMnNe5GijlUUbmtqZKNEm1QO3jkS4ToxAAM0JeDGvN8Wan/zPr7pxZ6T3egVuGHxZQIK3KImhPMWnZOT4=
X-Received: by 2002:adf:f402:: with SMTP id g2mr5327454wro.313.1639633972534; 
 Wed, 15 Dec 2021 21:52:52 -0800 (PST)
MIME-Version: 1.0
References: <20211216045427.757779-1-alistair.francis@opensource.wdc.com>
 <20211216045427.757779-7-alistair.francis@opensource.wdc.com>
In-Reply-To: <20211216045427.757779-7-alistair.francis@opensource.wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 16 Dec 2021 11:22:41 +0530
Message-ID: <CAAhSdy1AR+ZkZ1_TEaC_Haj3Kea0GbEfA2NHgZR3mo2-SEnqKQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] target/riscv: Enable the Hypervisor extension by
 default
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::433;
 envelope-from=anup@brainfault.org; helo=mail-wr1-x433.google.com
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Alistair Francis <alistair23@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 16, 2021 at 10:29 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Let's enable the Hypervisor extension by default. This doesn't affect
> named CPUs (such as lowrisc-ibex or sifive-u54) but does enable the
> Hypervisor extensions by default for the virt machine.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup
> ---
>  target/riscv/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 1edb2771b4..013a8760b5 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -626,7 +626,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
>      DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
>      DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
> -    DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, false),
> +    DEFINE_PROP_BOOL("h", RISCVCPU, cfg.ext_h, true),
>      DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> --
> 2.31.1
>
>

