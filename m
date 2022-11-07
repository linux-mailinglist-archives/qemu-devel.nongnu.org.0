Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF0762025A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 23:36:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAio-0003MF-Py; Mon, 07 Nov 2022 17:36:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osAil-0003KV-2n
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:35:59 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osAij-0003LX-9R
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:35:58 -0500
Received: by mail-wr1-x42e.google.com with SMTP id bk15so18267051wrb.13
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:35:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vyLVMJzlEcJuqcCq7WI5+MGVf9cjxrFOkhkmR7EICV0=;
 b=UN6eg6fw8PMrwyIS2CF31GLFA1BHomurqH5G+pquuCWT301Xr2IdCev3PaokeYJRL1
 jvyBzur7hcfuP4z8BSTXpVWV/WfT+gXHoZZyqNbnXmBdUN1sOu4hY/N7I6wp4XZ4SOrn
 33lMh87Wz/yfyS/1jY6axpMI5loMk1eXLSa2mZjDeLVMGxVXSis/FGDVanhR7+EqceqV
 w28sfF6AXWv1Ty3Z5YVNLHZb7Iq3heSCfd3U0EJbGCmK7KuKUlsaOKJNdLBeKtD2B9jW
 KiEgn4iUMmKe6phlrUCkzyMNhw+sQjNiqB6wWaHjd6lqKCcA3HNlxnzzhvZtfrfpn65+
 KsDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vyLVMJzlEcJuqcCq7WI5+MGVf9cjxrFOkhkmR7EICV0=;
 b=KI7YjXQy2SXeoplAmcneF7Ez6P6mlf6ENDeRn/SL5nyWemcYUkhK5NTcFGbMeYqlrF
 nOTPm5K4Ar8xaKWPmb3Q6gDuBScWrhzxwqdZlUfjz8/zq4uagIe4NHvMdtFc9ZAsljAd
 X8v2UjLG24dVY93D1theuCMaz5UBls6Qf+tcT90Kr5NCDdlrsO0GuAfEhZS1aaNWYBeo
 sEOYWV0qs95ZCjAe0APvXJOT6au9fgQuYMSy3biy1vXqsiHIOpDHHCqyTNV0fJgLoW6F
 xqQIYJKsCmytNEB0uFJ6ZB94MK/Wartry0QJ/lWCny1AP/tglyB8ZDo4d8OFg3xsakA0
 Jc3w==
X-Gm-Message-State: ACrzQf1bZv1J6paaK24tBKyuV/JFlQonFmBuTfrYUuUpHLwjrPRhNiQn
 vxof6pc6o2GEfqg0PWef5wrFTw==
X-Google-Smtp-Source: AMsMyM5XZ0zj0iEPX13mUsq9NtyWYSagcj9t9uI5mYFrNdlopvkbapCDiUMXyv2A7Qsh52/iSMwE2w==
X-Received: by 2002:adf:de8e:0:b0:236:ea40:47ef with SMTP id
 w14-20020adfde8e000000b00236ea4047efmr22608845wrl.519.1667860555491; 
 Mon, 07 Nov 2022 14:35:55 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a5d48c7000000b0022cce7689d3sm10076660wrs.36.2022.11.07.14.35.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Nov 2022 14:35:55 -0800 (PST)
Message-ID: <51a88376-98df-c328-f1ec-4dda482e9bb6@linaro.org>
Date: Mon, 7 Nov 2022 23:35:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 2/2] target/mips: Correct check for CABS instructions
Content-Language: en-US
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
References: <20221102165719.190378-1-jiaxun.yang@flygoat.com>
 <20221102165719.190378-2-jiaxun.yang@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221102165719.190378-2-jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 2/11/22 17:57, Jiaxun Yang wrote:
> Accroading to "MIPS Architecture for Programmers Volume IV-c:
> The MIPS-3D Application-Specific Extension to the MIPS64 Architecture"
> (MD00099). CABS.cond.fmt belongs to MIPS-3D ASE, and it has nothing to do
> with COP1X opcode.
> 
> Remove all unnecessary COP1X checks and check for MIPS3D availability
> in decoding code path.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   target/mips/tcg/translate.c | 9 +--------
>   1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
> index e49d2a25a8..23e575ad95 100644
> --- a/target/mips/tcg/translate.c
> +++ b/target/mips/tcg/translate.c
> @@ -1788,16 +1788,8 @@ static inline void gen_cmp ## type ## _ ## fmt(DisasContext *ctx, int n,      \
>           check_ps(ctx);                                                        \
>           break;                                                                \
>       case FMT_D:                                                               \
> -        if (abs) {                                                            \
> -            check_cop1x(ctx);                                                 \
> -        }                                                                     \
>           check_cp1_registers(ctx, fs | ft);                                    \
>           break;                                                                \
> -    case FMT_S:                                                               \
> -        if (abs) {                                                            \
> -            check_cop1x(ctx);                                                 \
> -        }                                                                     \
> -        break;                                                                \

I'm not sure we want to remove this check on all opcodes handled by
the FOP_CONDS() macro, and for all architecture variants. Maybe we
need to special-case CABS.cond.fmt?

>       }                                                                         \
>       gen_ldcmp_fpr##bits(ctx, fp0, fs);                                        \
>       gen_ldcmp_fpr##bits(ctx, fp1, ft);                                        \
> @@ -10424,6 +10416,7 @@ static void gen_farith(DisasContext *ctx, enum fopcode op1,
>       case OPC_CMP_NGT_S:
>           check_insn_opc_removed(ctx, ISA_MIPS_R6);
>           if (ctx->opcode & (1 << 6)) {
> +            check_insn(ctx, ASE_MIPS3D);

You somehow revert commit b8aa4598e2 ("MIPS COP1X (and related)
instructions") which is in use since 15 years.

>               gen_cmpabs_s(ctx, func - 48, ft, fs, cc);
>           } else {
>               gen_cmp_s(ctx, func - 48, ft, fs, cc);


