Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 210F75B58A1
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Sep 2022 12:43:50 +0200 (CEST)
Received: from localhost ([::1]:35134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXguq-0006OI-ND
	for lists+qemu-devel@lfdr.de; Mon, 12 Sep 2022 06:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXgqw-0001Ab-7V
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 06:39:46 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oXgqu-0001KD-Es
 for qemu-devel@nongnu.org; Mon, 12 Sep 2022 06:39:45 -0400
Received: by mail-wr1-x432.google.com with SMTP id h8so7658879wrf.3
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 03:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=DQdPyQAhUbXiYLMPc0RWc6DjN52xZf6o+rqWl/CEagY=;
 b=JU5GjeUHpHXMCsGp3V8LtKwS+iB9owc3uNxxsgNsiryudyRq3yqGBpPMY/Ci0zqBPY
 OvA4kmJpnCggOC+oM6tMQxN5O4M0e/UtL/nXsIdfjwxQanwdNS5zPgOVmUzttSa93Fo4
 1r/axk1TxO9motCYyv0sNPhozQmWaOIYSyrMT52uiBjUceOaPSo7R+SaJuZpMFDbdiw9
 9F3ErX+dgjFfjjpuWdKQzoluT4wXPfkZD2lbmmBZ+3+y/9KF35TeCWes5B3WAZK/HTdo
 jnhlhNXSD7aXyL2KgtQ/KUZURIddaHvoIW5zooDB1u6ahSZfEe3j8FB9Smv+ccgYnx4o
 b4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=DQdPyQAhUbXiYLMPc0RWc6DjN52xZf6o+rqWl/CEagY=;
 b=id/tZuCt3R4SZe8AUFmr+CN8kvn5ekLYGq5FblyVplxQ9V6luiw8mpqvRPszrNjFwu
 YrgVEf5DVwjfJzI0H2qS+ZqwVEtCBhoP4j/gHVuoD+29yrQMvAP5pd47p8kyM+6fXH9I
 FLKbbPuUBfuio+1Z1fZ2RHpjjksDbraWl746ZkcktenRbR3KGVpSz8kUjtL1Rpl6cEbx
 MVamvf3XEn5oE2qF3F0l/hp8hqjSP3171fSyNOgxWPrgyHhCVdO90v0XB3uRre9smoSI
 nyuWkQhNSzMCt+gFbPCSsBEhPtorvN6t+amxOf4yMVKKCtB5FTgkyVc1fUTYNvtbvUYX
 aWdg==
X-Gm-Message-State: ACgBeo3aowz+wa2Ey/SEztv0KbS1L+HRnA7I0sifgpndXtKMu/Y1tCMP
 OxjQ9TSQyaIjIIO4KNb+9j6Jgg==
X-Google-Smtp-Source: AA6agR6o984PvyRZL1SoI8DxVa4OlzG5J2K0wjj81wACWF/knbS258i1iVQeULfAvNth6OX7ve4SUg==
X-Received: by 2002:a05:6000:54d:b0:225:4d5c:4615 with SMTP id
 b13-20020a056000054d00b002254d5c4615mr13769085wrf.107.1662979182734; 
 Mon, 12 Sep 2022 03:39:42 -0700 (PDT)
Received: from [192.168.44.231] ([89.101.193.70])
 by smtp.gmail.com with ESMTPSA id
 n27-20020a05600c3b9b00b003b4764442f0sm6605845wms.11.2022.09.12.03.39.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 03:39:42 -0700 (PDT)
Message-ID: <12cc17bb-abf7-a29c-d644-0ee14bae6358@linaro.org>
Date: Mon, 12 Sep 2022 11:39:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 10/37] target/i386: validate VEX prefixes via the
 instructions' exception classes
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20220911230418.340941-1-pbonzini@redhat.com>
 <20220911230418.340941-11-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220911230418.340941-11-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.101,
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

On 9/12/22 00:03, Paolo Bonzini wrote:
> @@ -102,6 +107,25 @@ static void gen_load_sse(DisasContext *s, TCGv temp, MemOp ot, int dest_ofs)
> +static inline bool sse_needs_alignment(DisasContext *s, X86DecodedInsn *decode, X86DecodedOp *op)
> +{

Drop inline.  You may require adding G_GNUC_UNUSED temporarily, because it isn't used in 
this patch...

> @@ -175,7 +199,13 @@ static void gen_writeback(DisasContext *s, X86DecodedOp *op)
>           }
>           break;
>       case X86_OP_MMX:
> +        break;
>       case X86_OP_SSE:
> +        if ((s->prefix & PREFIX_VEX) && op->ot == MO_128) {
> +            tcg_gen_gvec_dup_imm(MO_64,
> +                                 offsetof(CPUX86State, xmm_regs[op->n].ZMM_X(1)),
> +                                 16, 16, 0);
> +        }

So... gvec supports doing this zeroing within the operation.  E.g.

static void gen_PADDB(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode)
{
     tcg_gen_gvec_add(MO_8, decode->op[0].offset,
                      decode->op[1].offset, decode->op[2].offset,
                      sse_vec_len(s, decode), sse_vec_len_max(s, decode));
}

The only catch is that gvec expects the zeroing to be at the end of the range, so this 
requires reorganizing ZMM for big-endian. Instead of reversing the entire ZMM register, we 
would keep only each 16-byte lane in host-endian order.  Like so:

   #if HOST_BIG_ENDIAN

- #define ZMM_B(n) _b_ZMMReg[63 - (n)]

+ #define ZMM_B(n) _b_ZMMReg[(n) ^ 15]

etc.

Ideally this zeroing above would move into each operation.  For our current set of 
helpers, it should be easy enough to do in gen_binary_int_sse and friends.


r~

