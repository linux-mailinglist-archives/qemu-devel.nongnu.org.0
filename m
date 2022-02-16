Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A334B7E73
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 04:20:33 +0100 (CET)
Received: from localhost ([::1]:35930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKAro-0004gp-It
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 22:20:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nKAqL-0003zc-EK
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 22:19:01 -0500
Received: from [2a00:1450:4864:20::329] (port=51138
 helo=mail-wm1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anup@brainfault.org>)
 id 1nKAqJ-0008Li-L6
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 22:19:01 -0500
Received: by mail-wm1-x329.google.com with SMTP id k41so423192wms.0
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 19:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VIpqwX3pb/x9MGHuVA4MujkpwJHnFZnNxJJJm2Jrt1Y=;
 b=K4mVQtabp/AAYc1cCGouoE0Ox+jVkejwA62SIU4/VpAdKJnIWENYj9AWEq0KV1kptk
 WqIeGBeux+z50bxaolnNXRrEueKGe3UhOPAvdBKEowKOyzNQWgpDUrevHo20dc7uJVwE
 4So13UksCcTxb5hDQdAnJys8zt2qOogimch1hGjxW/TlYbeid0JROcdqzA6UtEeABT4/
 y1UDhw0CmkyNPeLf1Re6uHFM+mpjRIqlSGluw62eZF4Qe89NoiCsLUAnceefK/jYaWnx
 thcpUQyfgWLYh5ZcPvcSbqx8NCKuJMyBpDZpAbUUoaflxJdGnBE89Mx5cMyMl4HcIvfE
 RCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VIpqwX3pb/x9MGHuVA4MujkpwJHnFZnNxJJJm2Jrt1Y=;
 b=FVINFJDq3+4L7ELbm8vbMiMC3D/E8a486yy6jOy6Lw0ZdMf0PmCTqxICZRJ1g+VASq
 6spezuq6ldcC/5Y4r4Cgsvb+cU2EOn0bcrRi6Bh06RNXAfTIfXXG9f+eutDmuKdUYcOB
 CmbFvuDAl1nmI9D1SGUbPtDKSLs9qVOdPYNrzqVpUUTv615og2BqFR0npVM2p4WRijea
 9dl0tiiKKud5tTakCP4kWIyla5zCqFr8yQA09C1iivBekTY1/BhUk+y+p7JMeU0QYVH/
 O05KntekhV057Ku/jXvduPjfC+Eu83OUusQAqQDpgjdpKOmf8qf0sDj2HDkK0MmjMy/h
 KmSg==
X-Gm-Message-State: AOAM531xzAkbO84FaQ48tfv/EEip1sn0TBYTuaqY+V5soE9W+aOzncDc
 wCbkp5sEh349fi+XMyFF95AIKKOhTDo9UkShS79Bcw==
X-Google-Smtp-Source: ABdhPJzpA+0kFc0SwKCa1ZZA76q/AEVeR4Grl2kytpEZXbrJkDktvSjL6aNTEPIOlbS754SBQRkKQ0PMdE+SOuzk/iU=
X-Received: by 2002:a1c:7715:0:b0:37b:dc94:9eb4 with SMTP id
 t21-20020a1c7715000000b0037bdc949eb4mr659145wmi.61.1644981537165; Tue, 15 Feb
 2022 19:18:57 -0800 (PST)
MIME-Version: 1.0
References: <20220216000904.1217872-1-atishp@rivosinc.com>
In-Reply-To: <20220216000904.1217872-1-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 16 Feb 2022 08:48:43 +0530
Message-ID: <CAAhSdy0zv2Cj-h503EVmwDXpa=SE3W9Bk8P3-baiYZaw750ZUw@mail.gmail.com>
Subject: Re: [PATCH v2] target/riscv: Add isa extenstion strings to the device
 tree
To: Atish Patra <atishp@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::329
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::329;
 envelope-from=anup@brainfault.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

On Wed, Feb 16, 2022 at 5:39 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> The Linux kernel parses the ISA extensions from "riscv,isa" DT
> property. It used to parse only the single letter base extensions
> until now. A generic ISA extension parsing framework was proposed[1]
> recently that can parse multi-letter ISA extensions as well.
>
> Generate the extended ISA string by appending  the available ISA extensions
> to the "riscv,isa" string if it is enabled so that kernel can process it.
>
> [1] https://lkml.org/lkml/2022/2/15/263
>
> Suggested-by: Heiko Stubner <heiko@sntech.de>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
> Changes from v1->v2:
> 1. Improved the code redability by using arrays instead of individual check
> ---
>  target/riscv/cpu.c | 35 ++++++++++++++++++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index b0a40b83e7a8..9bf8923f164b 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -34,6 +34,13 @@
>
>  /* RISC-V CPU definitions */
>
> +/* This includes the null terminated character '\0' */
> +#define MAX_ISA_EXT_LEN 256
> +struct isa_ext_data {
> +        const char *name;
> +        bool enabled;
> +};
> +
>  static const char riscv_exts[26] = "IEMAFDQCLBJTPVNSUHKORWXYZG";
>
>  const char * const riscv_int_regnames[] = {
> @@ -881,10 +888,35 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
>      device_class_set_props(dc, riscv_cpu_properties);
>  }
>
> +static void riscv_isa_string_ext(RISCVCPU *cpu, char *isa_str, int max_str_len)
> +{
> +    int offset = strnlen(isa_str, max_str_len);
> +    int i;
> +    struct isa_ext_data isa_edata_arr[] = {
> +        { "svpbmt", cpu->cfg.ext_svpbmt   },
> +        { "svinval", cpu->cfg.ext_svinval },
> +        { "svnapot", cpu->cfg.ext_svnapot },
> +    };
> +
> +    for (i = 0; i < ARRAY_SIZE(isa_edata_arr); i++) {
> +        if (!isa_edata_arr[i].enabled) {
> +            continue;
> +        }
> +        /* check available space */
> +        if ((offset + strlen(isa_edata_arr[i].name) + 1) > max_str_len) {
> +            qemu_log("No space left to append isa extension");
> +            return;
> +        }
> +        offset += snprintf(isa_str + offset, max_str_len, "_%s",
> +                           isa_edata_arr[i].name);

You don't need to use snprintf() and MAX_ISA_EXT_LEN if you
use g_strconcat() for creating new concat strings and freeing
original string using g_free().

Regards,
Anup

> +    }
> +}
> +
>  char *riscv_isa_string(RISCVCPU *cpu)
>  {
>      int i;
> -    const size_t maxlen = sizeof("rv128") + sizeof(riscv_exts) + 1;
> +    const size_t maxlen = sizeof("rv128") + sizeof(riscv_exts) +
> +                          MAX_ISA_EXT_LEN;
>      char *isa_str = g_new(char, maxlen);
>      char *p = isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_LONG_BITS);
>      for (i = 0; i < sizeof(riscv_exts); i++) {
> @@ -893,6 +925,7 @@ char *riscv_isa_string(RISCVCPU *cpu)
>          }
>      }
>      *p = '\0';
> +    riscv_isa_string_ext(cpu, isa_str, maxlen);
>      return isa_str;
>  }
>
> --
> 2.30.2
>
>

