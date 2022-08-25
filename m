Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E66095A1D44
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 01:42:01 +0200 (CEST)
Received: from localhost ([::1]:48660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRMU4-0001TY-S3
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 19:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRMR9-0008LM-0m
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 19:38:59 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:40637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oRMR7-0007OV-BU
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 19:38:58 -0400
Received: by mail-pl1-x62d.google.com with SMTP id x23so148359pll.7
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 16:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=b5QG2NkIJfSlijRER5yK30Ht49wc5R5KWPkQjvJx8lM=;
 b=YxhLun0g6PP0s42B+RSpSEMkiBmKxTIy+kwLa2XeagMMDm7fCrzkO3Un+mX37ea67R
 7DVtegF+DIUMshqaw8M010vft0cdgIP6rkYi6n+pt31QEnGfBYGlIj/P6uK5KGGvh+fz
 ys7zcl6APhQgai4ahm8bowrRXuF8h0JFdgGs1ma12tjG3XHh94tEZXHRR4b3bAHW1yhE
 RN6/oWOnuj9SEOQDN1RtDYEWuUr/pvVRojD5TiFPLEFUF/mZ8ELLl8U1XOCR9lf2COsV
 Ks+eEUrxhLLxDysEhR57Hr09RDEYdGZA2tPsG56sQYY63NTZPuFoh/CP7Swq+WnoN5pU
 l0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=b5QG2NkIJfSlijRER5yK30Ht49wc5R5KWPkQjvJx8lM=;
 b=iRkPPieo5ohyXPQ6SI32T9IGL97br2mQMGWonP2YCOk9HAFIN3JS4EmlE2oC1N3ZF7
 v9cfCiC7Ls9ly3pz/vcE059jOQLElSJ6JUOB2TxTzVf9VFkUuJ4T7NnjW7OJT3sWrNFs
 XWDFRlCd+YBguWtr8xfETEiWwNtsEJ4DtWF7xD2cOtvi7Gni1HeQx4vlIp4s4x/iO39c
 XyqI1Hb0JKv571od/tgbUCM2efFzAx+642+ZEgl45+kkJfFU+Nr30mENIayAW4Ha0c+2
 wPPmRG3xeOcpofTpjVCdIgbvW5E45BSCIsOyCIhMgVETMX0WxUnOVLRNVZ6JdTM638Bd
 MtUQ==
X-Gm-Message-State: ACgBeo2k/hId+enH5RIkIPuDm9nyXxQMyuYNBYv8aPVgaRMteXfLPivb
 kvDLB2EfUHhrxBajMwMX3Fe2CQ==
X-Google-Smtp-Source: AA6agR4MCi92VJvNNDyihnrw1LVYnHsshgcXH51Tz9qjSTGXgOzZfDJVY5Pv6Skk8sPlmVfKvl0N6w==
X-Received: by 2002:a17:902:cf43:b0:172:86f3:586a with SMTP id
 e3-20020a170902cf4300b0017286f3586amr1210250plg.71.1661470735426; 
 Thu, 25 Aug 2022 16:38:55 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:345c:4a6c:31b:1fca?
 ([2602:47:d49d:ec01:345c:4a6c:31b:1fca])
 by smtp.gmail.com with ESMTPSA id
 m15-20020a17090a2c0f00b001ef81574355sm290406pjd.12.2022.08.25.16.38.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 16:38:54 -0700 (PDT)
Message-ID: <9973a638-35f6-85b3-0511-021a3fb051c3@linaro.org>
Date: Thu, 25 Aug 2022 16:38:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 01/18] i386: Rework sse_op_table1
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220825221411.35122-1-pbonzini@redhat.com>
 <20220825221411.35122-2-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220825221411.35122-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/25/22 15:13, Paolo Bonzini wrote:
> @@ -3112,6 +3165,7 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
>   {
>       int b1, op1_offset, op2_offset, is_xmm, val;
>       int modrm, mod, rm, reg;
> +    struct SSEOpHelper_table1 sse_op;
>       SSEFunc_0_epp sse_fn_epp;
>       SSEFunc_0_eppi sse_fn_eppi;
>       SSEFunc_0_ppi sse_fn_ppi;
> @@ -3127,8 +3181,10 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
>           b1 = 3;
>       else
>           b1 = 0;
> -    sse_fn_epp = sse_op_table1[b][b1];
> -    if (!sse_fn_epp) {
> +    sse_op = sse_op_table1[b];
> +    sse_fn_epp = sse_op.op[b1];
> +    if ((sse_op.flags & (SSE_OPF_SPECIAL | SSE_OPF_3DNOW)) == 0
> +            && !sse_fn_epp) {

Do we really want a 5 word structure copy into the local stack frame here?
Surely better as

     const struct SSEOpHelper_table1 *sse_op;
     ...
     sse_op = &sse_op_table1[b];

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

