Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA666BC97D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 09:42:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcjAw-0006SU-HW; Thu, 16 Mar 2023 04:41:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcjAu-0006Rf-5O
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 04:41:28 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcjAs-0008Uf-Fd
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 04:41:27 -0400
Received: by mail-wr1-x431.google.com with SMTP id t15so745001wrz.7
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 01:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678956084;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+aup2UabP03Sxwyk+pHXxZDibg5vS+8imcLViNFKHUk=;
 b=BkajPLqt4iNgPvWJiz2eaOSDvkxIk4879/8rxkZt3BSRUuI+wZ3t43BIQ99w3ntolW
 P6ppChhPVwAIWuKWGOxcejePNcw3m65O3tI4GvV7DmiZjJmSphCw1IkOyEjOGJWS/xbj
 JWC9m7UXyfdeYpVxUultLh8H9Nks14qr+v2/oIb/M4E0OkZ7LAv7U/fC+361CwoG0yxN
 Gat1FDVRZoCJBUtcQWrIvXdq780Z3kLo3604KHyoK/ywUrlwWitr5K7yazIiDiT7mNhl
 0Dg8WDn7IwcfYIGdLzNuDvxJYJpivqQbS2LO25cpz1LRwozDXK7kDGOSvDC5kaVAsYZX
 mt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678956084;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+aup2UabP03Sxwyk+pHXxZDibg5vS+8imcLViNFKHUk=;
 b=h1GidnDqgz3LcuuV8r85gfgqTdWJ9VGZHUG/pajo1NIuR6It6UibVv+UZQgiPA8Bne
 VXj2xIyWuXXbYIoRfHgJFPOQPQaF4wR64tBwNT59hXJ50cnTr8DPRDoNKecQnswFmNPg
 krJjIl5uY19FmgIj4tmZwC0iam6PyfFP4MoR4sRTinBuVm9DXPnzZo785Geb9hhAzGCv
 8F4LanSEdpvjfBedVZ5sI4wAqWYv0huK9p+FkozuldOHMOe2x+45K6neKbpSXoy7vnzc
 /ST3dJT5MUxx5T0PrrQJGE404eM3HdL8AK3iaa3rqhbDfl2Fe7BHpR+zKCDkG3R7YNlp
 Ngig==
X-Gm-Message-State: AO0yUKUGsh+MDm0Z+p98buJP+kMsmyUjxZpQv+KqqOqUAz2lbwZtWXoU
 lmIJPAo/4eTkz6I2j2TEOcVtQA==
X-Google-Smtp-Source: AK7set8gGuwviGLq24vM15dPunAchg6Zpy9vhU34heriyFIjmKpEyRSJ/Qr4tqfMWA9k/SVxRgWIuw==
X-Received: by 2002:a5d:6042:0:b0:2c7:e909:5fcf with SMTP id
 j2-20020a5d6042000000b002c7e9095fcfmr4609656wrt.3.1678956084302; 
 Thu, 16 Mar 2023 01:41:24 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m1-20020adffa01000000b002c5526234d2sm6850668wrr.8.2023.03.16.01.41.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Mar 2023 01:41:23 -0700 (PDT)
Message-ID: <9b5c4389-a9e3-00e1-11fa-b1a0c10cd312@linaro.org>
Date: Thu, 16 Mar 2023 09:41:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/2] target/s390x: Fix R[NOX]SBG with T=1
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20230315235642.118002-1-iii@linux.ibm.com>
 <20230315235642.118002-2-iii@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230315235642.118002-2-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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

On 16/3/23 00:56, Ilya Leoshkevich wrote:
> RXSBG usage in the "filetests" test from the wasmtime testsuite makes
> tcg_reg_alloc_op() attempt to temp_load() a TEMP_VAL_DEAD temporary,
> causing an assertion failure:
> 
>      0x01000a70:  ec14 b040 3057  rxsbg    %r1, %r4, 0xb0, 0x40, 0x30
> 
>      OP after optimization and liveness analysis:
>       ---- 0000000001000a70 0000000000000004 0000000000000006
>       rotl_i64 tmp2,r4,$0x30                   dead: 1 2  pref=0xffff
>       and_i64 tmp2,tmp2,$0x800000000000ffff    dead: 1  pref=0xffff
>      [xor_i64 tmp3,tmp3,tmp2                   dead: 1 2  pref=0xffff]
>       and_i64 cc_dst,tmp3,$0x800000000000ffff  sync: 0  dead: 0 1 2  pref=0xffff
>       mov_i64 psw_addr,$0x1000a76              sync: 0  dead: 0 1  pref=0xffff
>       mov_i32 cc_op,$0x6                       sync: 0  dead: 0 1  pref=0xffff
>       call lookup_tb_ptr,$0x6,$1,tmp8,env      dead: 1  pref=none
>       goto_ptr tmp8                            dead: 0
>       set_label $L0
>       exit_tb $0x7fffe809d183
> 
>      ../tcg/tcg.c:3865: tcg fatal error
> 
> The reason is that tmp3 does not have an initial value, which confuses
> the register allocator. This also affects the correctness of the
> results.
> 
> Fix by assigning R1 to it.
> 
> Fixes: d6c6372e186e ("target-s390: Implement R[NOX]SBG")

Exposed by 3ac6f91bca..dd161de75f?

3ac6f91bca target/s390x: Drop tcg_temp_free from translate.c
dd161de75f target/s390x: Remove g_out, g_out2, g_in1, g_in2

> Reviewed-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   target/s390x/tcg/translate.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
> index 14c3896d529..6dd2f41ad08 100644
> --- a/target/s390x/tcg/translate.c
> +++ b/target/s390x/tcg/translate.c
> @@ -3696,10 +3696,13 @@ static DisasJumpType op_rosbg(DisasContext *s, DisasOps *o)
>       int i4 = get_field(s, i4);
>       int i5 = get_field(s, i5);
>       uint64_t mask;
> +    TCGv_i64 tmp;
>   
>       /* If this is a test-only form, arrange to discard the result.  */
>       if (i3 & 0x80) {

           tcg_debug_assert(o->out != NULL); ?

> +        tmp = o->out;
>           o->out = tcg_temp_new_i64();
> +        tcg_gen_mov_i64(o->out, tmp);

Something bugs me with this pattern but I can't say why yet :(

>       }
>   
>       i3 &= 63;


