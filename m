Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC162F143A
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 14:22:56 +0100 (CET)
Received: from localhost ([::1]:57422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyx9r-0001CI-Jx
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 08:22:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.machado@linaro.org>)
 id 1kyx88-00089C-Q3
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:21:09 -0500
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:38054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luis.machado@linaro.org>)
 id 1kyx7x-00057Y-Tb
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 08:21:07 -0500
Received: by mail-qk1-x72a.google.com with SMTP id w79so14501082qkb.5
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 05:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vDQkcZI0wWmNt8h50euO1l/PLOOvX4eDx8P1AuC31Sw=;
 b=hN1BLfbMipyFtSETZB+dZ+AyD3OTI3oLT6JrpMb5LfVL1y7h+W8QmJjLrVG82TgZdz
 kBMCLxx4GqjCZdHkGZAV8BzgrsRoguiMP3EQEh2ZdDP5g3lfLaYb/iVprnTunWp2cMZn
 GjPWAhTc6I0ZPxZX4gnr+IMJrhiRLFo8ln8GzyTbyrubTvSeuWDReNrYwhhekUyDGEMN
 tJV279RYajk4MDr2oL/4bbnAy8yy/T6d+pvmJ+ChMcWxoxC6A7iq6zAQA9GeibF4i/nS
 R1d7mDcZiBNMuZRkXSrQxSSqwt1GaYS3u1fu9qmMFb6xzQIHJ4Teii0ArHZMvuLV6iDO
 LHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vDQkcZI0wWmNt8h50euO1l/PLOOvX4eDx8P1AuC31Sw=;
 b=EvfqzQzLvauFCgOu+acChRJ0DGFdhxolHX9PNt9VkmCHCGdqsYgKn7yYbTuIRswo6F
 NNjiDv7H0MN/AxTWuc8tkawwr0UefLYUFoAscQGAEAXHP3EzyC1pDThU7tuLEe0sAbHA
 BRspTc+R4Pa9T7GB2mZMhsZvjQ+LnWmGvIzoEfeY/rJ2lJyk+L3604P7KMjK5A8tpUHg
 6iDy66RL0bbuXBGXnHWJPQ+xmct+qCD2HnlnWvL2ZMeEmxyEOmR2JspZQxjxuLfUbGrM
 OjNwH0D9QgWPIVayDFeu2Pp0Ia0jtO0g23UIL0aRF+KUhd5DP3J+NclUrmV90e/xnvBF
 9g6A==
X-Gm-Message-State: AOAM530fRfEKsK/VduW/OEoy8Y9I1CAycJiOa0lr/7lgcxSNVNxPO9Mx
 DhZMFbbbxLOmA2NL+tY4K67pkQ==
X-Google-Smtp-Source: ABdhPJxx1t9yuVPNExmTzuvmlsy5uoNzwHIY26vJjppVr+/0oSV28eBl0Ox85eb9vJQe0JWB5tDInw==
X-Received: by 2002:a37:744:: with SMTP id 65mr15363384qkh.71.1610371252956;
 Mon, 11 Jan 2021 05:20:52 -0800 (PST)
Received: from ?IPv6:2804:7f0:8284:874d:20e9:a3d4:1db5:c30a?
 ([2804:7f0:8284:874d:20e9:a3d4:1db5:c30a])
 by smtp.gmail.com with ESMTPSA id c139sm8439799qke.24.2021.01.11.05.20.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 05:20:51 -0800 (PST)
Subject: Re: [PATCH v1 10/20] target/arm: use official org.gnu.gdb.aarch64.sve
 layout for registers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210108224256.2321-1-alex.bennee@linaro.org>
 <20210108224256.2321-11-alex.bennee@linaro.org>
From: Luis Machado <luis.machado@linaro.org>
Message-ID: <9ee1443e-821d-9cec-c29a-6111385937ad@linaro.org>
Date: Mon, 11 Jan 2021 10:20:48 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210108224256.2321-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=luis.machado@linaro.org; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For the record, the layout looks OK to me.

Just a reminder that GDB will soon support bfloat16 types. A patch may 
be pushed this month.

On 1/8/21 7:42 PM, Alex Bennée wrote:
> While GDB can work with any XML description given to it there is
> special handling for SVE registers on the GDB side which makes the
> users life a little better. The changes aren't that major and all the
> registers save the $vg reported the same. All that changes is:
> 
>    - report org.gnu.gdb.aarch64.sve
>    - use gdb nomenclature for names and types
>    - minor re-ordering of the types to match reference
>    - re-enable ieee_half (as we know gdb supports it now)
>    - $vg is now a 64 bit int
>    - check $vN and $zN aliasing in test
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Luis Machado <luis.machado@linaro.org>
> Message-Id: <20201218112707.28348-10-alex.bennee@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/arm/gdbstub.c                        | 75 ++++++++-------------
>   target/arm/helper.c                         |  2 +-
>   tests/tcg/aarch64/gdbstub/test-sve-ioctl.py | 11 +++
>   3 files changed, 41 insertions(+), 47 deletions(-)
> 
> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
> index 866595b4f1..a8fff2a3d0 100644
> --- a/target/arm/gdbstub.c
> +++ b/target/arm/gdbstub.c
> @@ -195,22 +195,17 @@ static const struct TypeSize vec_lanes[] = {
>       { "uint128", 128, 'q', 'u' },
>       { "int128", 128, 'q', 's' },
>       /* 64 bit */
> +    { "ieee_double", 64, 'd', 'f' },
>       { "uint64", 64, 'd', 'u' },
>       { "int64", 64, 'd', 's' },
> -    { "ieee_double", 64, 'd', 'f' },
>       /* 32 bit */
> +    { "ieee_single", 32, 's', 'f' },
>       { "uint32", 32, 's', 'u' },
>       { "int32", 32, 's', 's' },
> -    { "ieee_single", 32, 's', 'f' },
>       /* 16 bit */
> +    { "ieee_half", 16, 'h', 'f' },
>       { "uint16", 16, 'h', 'u' },
>       { "int16", 16, 'h', 's' },
> -    /*
> -     * TODO: currently there is no reliable way of telling
> -     * if the remote gdb actually understands ieee_half so
> -     * we don't expose it in the target description for now.
> -     * { "ieee_half", 16, 'h', 'f' },
> -     */
>       /* bytes */
>       { "uint8", 8, 'b', 'u' },
>       { "int8", 8, 'b', 's' },
> @@ -223,17 +218,16 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
>       GString *s = g_string_new(NULL);
>       DynamicGDBXMLInfo *info = &cpu->dyn_svereg_xml;
>       g_autoptr(GString) ts = g_string_new("");
> -    int i, bits, reg_width = (cpu->sve_max_vq * 128);
> +    int i, j, bits, reg_width = (cpu->sve_max_vq * 128);
>       info->num = 0;
>       g_string_printf(s, "<?xml version=\"1.0\"?>");
>       g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
> -    g_string_append_printf(s, "<feature name=\"org.qemu.gdb.aarch64.sve\">");
> +    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.aarch64.sve\">");
>   
>       /* First define types and totals in a whole VL */
>       for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
>           int count = reg_width / vec_lanes[i].size;
> -        g_string_printf(ts, "vq%d%c%c", count,
> -                        vec_lanes[i].sz, vec_lanes[i].suffix);
> +        g_string_printf(ts, "svev%c%c", vec_lanes[i].sz, vec_lanes[i].suffix);
>           g_string_append_printf(s,
>                                  "<vector id=\"%s\" type=\"%s\" count=\"%d\"/>",
>                                  ts->str, vec_lanes[i].gdb_type, count);
> @@ -243,39 +237,37 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
>        * signed and potentially float versions of each size from 128 to
>        * 8 bits.
>        */
> -    for (bits = 128; bits >= 8; bits /= 2) {
> -        int count = reg_width / bits;
> -        g_string_append_printf(s, "<union id=\"vq%dn\">", count);
> -        for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
> -            if (vec_lanes[i].size == bits) {
> -                g_string_append_printf(s, "<field name=\"%c\" type=\"vq%d%c%c\"/>",
> -                                       vec_lanes[i].suffix,
> -                                       count,
> -                                       vec_lanes[i].sz, vec_lanes[i].suffix);
> +    for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
> +        const char suf[] = { 'q', 'd', 's', 'h', 'b' };
> +        g_string_append_printf(s, "<union id=\"svevn%c\">", suf[i]);
> +        for (j = 0; j < ARRAY_SIZE(vec_lanes); j++) {
> +            if (vec_lanes[j].size == bits) {
> +                g_string_append_printf(s, "<field name=\"%c\" type=\"svev%c%c\"/>",
> +                                       vec_lanes[j].suffix,
> +                                       vec_lanes[j].sz, vec_lanes[j].suffix);
>               }
>           }
>           g_string_append(s, "</union>");
>       }
>       /* And now the final union of unions */
> -    g_string_append(s, "<union id=\"vq\">");
> -    for (bits = 128; bits >= 8; bits /= 2) {
> -        int count = reg_width / bits;
> -        for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
> -            if (vec_lanes[i].size == bits) {
> -                g_string_append_printf(s, "<field name=\"%c\" type=\"vq%dn\"/>",
> -                                       vec_lanes[i].sz, count);
> -                break;
> -            }
> -        }
> +    g_string_append(s, "<union id=\"svev\">");
> +    for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
> +        const char suf[] = { 'q', 'd', 's', 'h', 'b' };
> +        g_string_append_printf(s, "<field name=\"%c\" type=\"svevn%c\"/>",
> +                               suf[i], suf[i]);
>       }
>       g_string_append(s, "</union>");
>   
> +    /* Finally the sve prefix type */
> +    g_string_append_printf(s,
> +                           "<vector id=\"svep\" type=\"uint8\" count=\"%d\"/>",
> +                           reg_width / 8);
> +
>       /* Then define each register in parts for each vq */
>       for (i = 0; i < 32; i++) {
>           g_string_append_printf(s,
>                                  "<reg name=\"z%d\" bitsize=\"%d\""
> -                               " regnum=\"%d\" group=\"vector\""
> -                               " type=\"vq\"/>",
> +                               " regnum=\"%d\" type=\"svev\"/>",
>                                  i, reg_width, base_reg++);
>           info->num++;
>       }
> @@ -287,31 +279,22 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int base_reg)
>                              " regnum=\"%d\" group=\"float\""
>                              " type=\"int\"/>", base_reg++);
>       info->num += 2;
> -    /*
> -     * Predicate registers aren't so big they are worth splitting up
> -     * but we do need to define a type to hold the array of quad
> -     * references.
> -     */
> -    g_string_append_printf(s,
> -                           "<vector id=\"vqp\" type=\"uint16\" count=\"%d\"/>",
> -                           cpu->sve_max_vq);
> +
>       for (i = 0; i < 16; i++) {
>           g_string_append_printf(s,
>                                  "<reg name=\"p%d\" bitsize=\"%d\""
> -                               " regnum=\"%d\" group=\"vector\""
> -                               " type=\"vqp\"/>",
> +                               " regnum=\"%d\" type=\"svep\"/>",
>                                  i, cpu->sve_max_vq * 16, base_reg++);
>           info->num++;
>       }
>       g_string_append_printf(s,
>                              "<reg name=\"ffr\" bitsize=\"%d\""
>                              " regnum=\"%d\" group=\"vector\""
> -                           " type=\"vqp\"/>",
> +                           " type=\"svep\"/>",
>                              cpu->sve_max_vq * 16, base_reg++);
>       g_string_append_printf(s,
>                              "<reg name=\"vg\" bitsize=\"64\""
> -                           " regnum=\"%d\" group=\"vector\""
> -                           " type=\"uint32\"/>",
> +                           " regnum=\"%d\" type=\"int\"/>",
>                              base_reg++);
>       info->num += 2;
>       g_string_append_printf(s, "</feature>");
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index d077dd9ef5..d434044f07 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -276,7 +276,7 @@ static int arm_gdb_get_svereg(CPUARMState *env, GByteArray *buf, int reg)
>            * while the ZCR works in Vector Quads (VQ) which is 128bit chunks.
>            */
>           int vq = sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
> -        return gdb_get_reg32(buf, vq * 2);
> +        return gdb_get_reg64(buf, vq * 2);
>       }
>       default:
>           /* gdbstub asked for something out our range */
> diff --git a/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py b/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
> index 972cf73c31..b9ef169c1a 100644
> --- a/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
> +++ b/tests/tcg/aarch64/gdbstub/test-sve-ioctl.py
> @@ -40,6 +40,17 @@ class TestBreakpoint(gdb.Breakpoint):
>           except gdb.error:
>               report(False, "checking zregs (out of range)")
>   
> +        # Check the aliased V registers are set and GDB has correctly
> +        # created them for us having recognised and handled SVE.
> +        try:
> +            for i in range(0, 16):
> +                val_z = gdb.parse_and_eval("$z0.b.u[%d]" % i)
> +                val_v = gdb.parse_and_eval("$v0.b.u[%d]" % i)
> +                report(int(val_z) == int(val_v),
> +                       "v0.b.u[%d] == z0.b.u[%d]" % (i, i))
> +        except gdb.error:
> +            report(False, "checking vregs (out of range)")
> +
>   
>   def run_test():
>       "Run through the tests one by one"
> 

