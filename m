Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B799B4E1D98
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 20:22:18 +0100 (CET)
Received: from localhost ([::1]:56462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nW185-0006o1-AG
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 15:22:17 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nW16z-00067F-4i
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 15:21:09 -0400
Received: from [2607:f8b0:4864:20::42b] (port=34713
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nW16x-0005S8-5x
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 15:21:08 -0400
Received: by mail-pf1-x42b.google.com with SMTP id l8so13843881pfu.1
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 12:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EbYq3wsjGOqAlcp1mmH2slgjfzSF/HB9LUrHfoJjYlM=;
 b=QdSX+yRa8ny11XVNyyhEXn77qJDNmKhDaM7fTqUeDKlc5d+SBDkhSoxXMQbouTBo7H
 j+7Z9qHWAB5EUZnMImp89SPS3C9C1u4VgHZKfkZQfsrDeNsROKVIXa7dP4Lb52M8oKlR
 TC+QUhnIZSrcSjAoYADEYVqwHvtMT3bjhgScKgxd5gK08T9wTdSC5I0gMnLYaqq+Hoq0
 icw3jHe5L31ikOOvCZCiUkXsij7uirfpQyBywIX9QHVSn0g0ZPsDu8Y36OIx+B7RJd8W
 qeEGbr0tIW1vQwDeNk8VWcG30gpTkxYxfTp+Zxm45+2vw7WiR2iT8Hdk1rFrt4nf/Oad
 lYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EbYq3wsjGOqAlcp1mmH2slgjfzSF/HB9LUrHfoJjYlM=;
 b=NNd7ECQ6y9qngGDmh9autAFopx91Z+PXiQ4g48QPJqO77gTydonlrzaVK9AKhqbaPm
 /P9VGY26noWSiDYh+vhNNazHKu+NY08ENzi9CEDTIxrWUUlUCkfGgieoRV24uvlKg34i
 SdGF6QOSVjQSHjIhHNxFwpl2iiRvC9QkHWEYNCt3jGt4CXbwjOwKzrw0tOqKYeKAQbEc
 PqdpSW02Bz1mMKFwDyDvOZz/TOJWcZEOUSwT4I8Myn14g0CIZj+j7QlhtPX+/EI47G8U
 L+eSAOvsy+Rpb45slE1+13PJLhXegMx69595S25Mpe5Zw8CmQJMZLB/SDbL2NKa9eQ+Q
 6OiQ==
X-Gm-Message-State: AOAM532GIouz/3zes04MzZAlqAdgPQLhxrACksKf062BTVcHeQHDPmzS
 aEwBeGuSVGBn2soEKzaXtse6vA==
X-Google-Smtp-Source: ABdhPJyRpvbgo5TlfLCru9t3WyOgQeUri8c7H2b2pocDVJI5IJk6a5aNDgGBex/cOHRBmleLPXRo+g==
X-Received: by 2002:a05:6a00:890:b0:4f6:686e:a8a9 with SMTP id
 q16-20020a056a00089000b004f6686ea8a9mr20611754pfj.83.1647804065727; 
 Sun, 20 Mar 2022 12:21:05 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 s135-20020a63778d000000b0038259e54389sm3427900pgc.19.2022.03.20.12.21.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Mar 2022 12:21:05 -0700 (PDT)
Message-ID: <413ffde7-9e24-8047-7d77-f14769808d73@linaro.org>
Date: Sun, 20 Mar 2022 12:21:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] fix lock cmpxchg instruction
Content-Language: en-US
To: Wei Li <lw945lw945@yahoo.com>, pbonzini@redhat.com, eduardo@habkost.net
References: <20220319160658.336882-1-lw945lw945@yahoo.com>
 <20220319160658.336882-3-lw945lw945@yahoo.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220319160658.336882-3-lw945lw945@yahoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/19/22 09:06, Wei Li wrote:
> For lock cmpxchg, the situation is more complex. After the instruction
> is completed by tcg_gen_atomic_cmpxchg_tl, it needs a branch to judge
> if oldv == cmpv or not. The instruction only touches accumulator when
> oldv != cmpv.
> 
> Signed-off-by: Wei Li <lw945lw945@yahoo.com>
> ---
>   target/i386/tcg/translate.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 05be8d08e6..4fd9c03cb7 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -5360,7 +5360,12 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
>                   gen_lea_modrm(env, s, modrm);
>                   tcg_gen_atomic_cmpxchg_tl(oldv, s->A0, cmpv, newv,
>                                             s->mem_index, ot | MO_LE);
> +                label1 = gen_new_label();
> +                gen_extu(ot, oldv);
> +                gen_extu(ot, cmpv);
> +                tcg_gen_brcond_tl(TCG_COND_EQ, oldv, cmpv, label1);
>                   gen_op_mov_reg_v(s, ot, R_EAX, oldv);

This is better addressed with a movcond:

     TCGv temp = tcg_temp_new();
     tcg_gen_mov_tl(temp, cpu_regs[R_EAX]);
     /* Perform the merge into %al or %ax as required by ot. */
     gen_op_mov_reg_v(s, ot, R_EAX, oldv);
     /* Undo the entire modification to %rax if comparison equal. */
     tcg_gen_movcond_tl(TCG_COND_EQ, cpu_regs[R_EAX], oldv, cmpv,
                        cpu_regs[R_EAX], temp);
     tcg_temp_free(temp);


r~

