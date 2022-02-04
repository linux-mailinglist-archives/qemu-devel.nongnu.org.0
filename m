Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF9C4A93F9
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 07:28:30 +0100 (CET)
Received: from localhost ([::1]:47476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFs54-0001fO-As
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 01:28:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFs1v-0000rt-7Q
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 01:25:11 -0500
Received: from [2607:f8b0:4864:20::1029] (port=42701
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFs1t-0008DG-AM
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 01:25:10 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 my12-20020a17090b4c8c00b001b528ba1cd7so5296087pjb.1
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 22:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y0aK7Sxi2nnHDSeX0CQMASOUkk11wlR3YHBeezdyWgw=;
 b=Tc2qC859pSvWj/HlGCJlWg/DChtqtqhjB17bz19b1ScTDopewU1pa5HzgPrSB4FCyl
 hwJs0sR4U/7tzKK0H7IX1Imp6ZZc+xlZJWmp3krmTDjz8K2wwXBgq9y1zaBXYbWcFbjp
 9gvmzlq5Wivgrw/dyyKpoJyVGfD5X1LwwePeAOWsAtsfngH2qU2HD+i6PFoSCPBzJL1p
 Eu1eomnJUvs2gkDEy8mbQb9c9v1KXzyc6gxPHIvHQwtdlpfkwvxJD1AVXera4E5zmYL6
 5U2QP3/p922ogIzgyPonWX/ThGlq2ao2l4/l8629uhR9ydBprCFkaiNqQ8PT9uSV6Ypp
 wxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y0aK7Sxi2nnHDSeX0CQMASOUkk11wlR3YHBeezdyWgw=;
 b=Ob9O1lMuWgtStcmPwFNRYySQnv+BN2Lf0Rsj7n0Ki23W8xbUi7ARTRA4gkLTrMJsMx
 5Dmne5EnoJT2D61viXdHlnljV2p6IIO0xtCt7etxrMrdy6TP4JI4CgsZ6kMvl5kn9Cqz
 iyhxix0U8D8WGk5HxngpKJOdRlxnnIde5mrDWEW9mFUMjB4RZx9SRsu3jHTZwj3v/BqJ
 WMBEE63xhC/FAFJOkCWJ8NmIfaYi3rt/HGxweMk2oSiNb3umcGPazirj4QCFaBc9/UXi
 TsS5hN/FviUh/Mj9NHJJT3EEMZdk+K5U4n+/NpLcmHqRX9vi1jdajhoK3qKuRm8ym9Ec
 lWYw==
X-Gm-Message-State: AOAM533rOMJPtyPHV7MSZPQn9iwvfA5nsOyd2MB/mZJyqIcfX5eI1Ihi
 AhzZCZkMR/II7JZwif1+mEg=
X-Google-Smtp-Source: ABdhPJzitNhXwzsDktG+bkju/TXUdxUtGmNlzeAD7cbnr0jugel0k/6Z/vaxjnxNhc3tzIhWWz01tw==
X-Received: by 2002:a17:90a:6407:: with SMTP id
 g7mr1512249pjj.22.1643955896818; 
 Thu, 03 Feb 2022 22:24:56 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id d9sm1054877pfl.69.2022.02.03.22.24.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 22:24:56 -0800 (PST)
Message-ID: <64c8a1f3-94be-5200-8d7c-3645f5e512b3@amsat.org>
Date: Fri, 4 Feb 2022 07:24:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v5 2/2] tcg/mips: Support unaligned access for softmmu
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <20220201234107.316487-1-richard.henderson@linaro.org>
 <20220201234107.316487-3-richard.henderson@linaro.org>
In-Reply-To: <20220201234107.316487-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 2/2/22 00:41, Richard Henderson wrote:
> We can use the routines just added for user-only to emit
> unaligned accesses in softmmu mode too.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/mips/tcg-target.c.inc | 91 ++++++++++++++++++++++-----------------
>   1 file changed, 51 insertions(+), 40 deletions(-)

>       /* Load the (low-half) tlb comparator.  */
>       if (TCG_TARGET_REG_BITS < TARGET_LONG_BITS) {
> -        tcg_out_ld(s, TCG_TYPE_I32, TCG_TMP0, TCG_TMP3, cmp_off + LO_OFF);
> -        tcg_out_movi(s, TCG_TYPE_I32, TCG_TMP1, mask);
> +        tcg_out_ldst(s, OPC_LW, TCG_TMP0, TCG_TMP3, cmp_off + LO_OFF);
>       } else {
>           tcg_out_ldst(s, (TARGET_LONG_BITS == 64 ? OPC_LD
>                            : TCG_TARGET_REG_BITS == 64 ? OPC_LWU : OPC_LW),
>                        TCG_TMP0, TCG_TMP3, cmp_off);
> -        tcg_out_movi(s, TCG_TYPE_TL, TCG_TMP1, mask);
> -        /* No second compare is required here;
> -           load the tlb addend for the fast path.  */
> -        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP2, TCG_TMP3, add_off);
>       }
>   
>       /* Zero extend a 32-bit guest address for a 64-bit host. */
> @@ -1185,7 +1173,25 @@ static void tcg_out_tlb_load(TCGContext *s, TCGReg base, TCGReg addrl,
>           tcg_out_ext32u(s, base, addrl);
>           addrl = base;
>       }
> -    tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, addrl);
> +
> +    /*
> +     * Mask the page bits, keeping the alignment bits to compare against.
> +     * For unaligned accesses, compare against the end of the access to
> +     * verify that it does not cross a page boundary.
> +     */
> +    tlb_mask = (target_ulong)TARGET_PAGE_MASK | a_mask;
> +    tcg_out_movi(s, TCG_TYPE_I32, TCG_TMP1, tlb_mask);
> +    if (a_mask >= s_mask) {
> +        tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, addrl);
> +    } else {
> +        tcg_out_opc_imm(s, ALIAS_PADDI, TCG_TMP2, addrl, s_mask - a_mask);
> +        tcg_out_opc_reg(s, OPC_AND, TCG_TMP1, TCG_TMP1, TCG_TMP2);
> +    }
> +
> +    if (TCG_TARGET_REG_BITS >= TARGET_LONG_BITS) {
> +        /* Load the tlb addend for the fast path.  */
> +        tcg_out_ld(s, TCG_TYPE_PTR, TCG_TMP2, TCG_TMP3, add_off);
> +    }

Out of my confort zone but looks sane:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> -static void __attribute__((unused))
> -tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,
> +static void tcg_out_qemu_ld_unalign(TCGContext *s, TCGReg lo, TCGReg hi,

Oh now I see why it was unaligned in the previous patch :)

>                                       TCGReg base, MemOp opc, bool is_64)
>   {

