Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6795838720B
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 08:42:18 +0200 (CEST)
Received: from localhost ([::1]:49454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1litQn-0001Wy-Cn
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 02:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1litPI-0000br-PM; Tue, 18 May 2021 02:40:46 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:43939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <thatlemon@gmail.com>)
 id 1litPE-0005TF-N2; Tue, 18 May 2021 02:40:44 -0400
Received: by mail-ej1-x62e.google.com with SMTP id l4so12758091ejc.10;
 Mon, 17 May 2021 23:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BvirYAwlnw2lO01fKu0buo86RjrRU+kCWbZG68H9iLo=;
 b=Or35b9OJz/xvbfa8CY0Cd7vIVCw7/Fdho9jxi1eU/Qt4B6C1Zpf0CUAvvYrUnJklsm
 q6EWA4oW+eKa2d1m58ggr9fZG+/dcnqDHKbITtsfD8SXTakkb4iMerlajBzoKGT8rZL6
 buQL9J2VNWcSeLitclP6qTb7c4DXLIgtlpXVzsM/R5widNn0T8UFwynET1MYVb7qLgGP
 /zvLM4LEsm074P7KcmwK8aw3LISKCocYNsTOoKMbHT8VEYnvF3IlJZxJH11mJpW6ypxk
 JYqkejvDERUi143qCoPPicdSEApMsy5AOXnJ75ak5clOvue6oaZbAJrjZJHB/Nayas2z
 qfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BvirYAwlnw2lO01fKu0buo86RjrRU+kCWbZG68H9iLo=;
 b=Q8euY92pU2yCYhLfFruCiN0TTRyAxte+/mbX07V0WB+qXjN5XRE0DbJyb5wZOqeFPZ
 wB6QHVUyyxpcU53Yv5ngAAt+wXNCb+qTzsqm5lXqAr5ntywYWSC8j804xHIBtWHXSgE+
 V80/83tGNyQy8kyCCE7UHwGBtIzG9Ft41yRTiR0Z9v0kAVnp9Gu33YoTz6Zyy1SdDKXT
 8sR9gty1R/ps13ZTjYgZRZD18Hkr9hzyhYV+S4A3QQImL+KE5KaoGBg2PpEXAQ51nci0
 ITVNhjVSJgiWtk3ahwh11s4/hw+/ll0GTN6RBf3VMFoCiVT6jf6iW3Za00XW9OXVrSlZ
 ufAw==
X-Gm-Message-State: AOAM530Ewj9YK8i2l0HxR96NhLPBnK4cU3ghFxHSgLUrTIMvVp9Tggtb
 0533No8ZXJl9Lm1ga/e1Jj4=
X-Google-Smtp-Source: ABdhPJzY0w5qClWwcT1RXLyYpouINISmdYt6z83AhSrl8t7A9aGioHiT2BBDHsQO6gJaxTJWJ8dfkA==
X-Received: by 2002:a17:906:2bc5:: with SMTP id
 n5mr4496673ejg.531.1621320038025; 
 Mon, 17 May 2021 23:40:38 -0700 (PDT)
Received: from [192.168.1.124] ([151.60.43.39])
 by smtp.gmail.com with ESMTPSA id yr15sm7869074ejb.16.2021.05.17.23.40.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 23:40:37 -0700 (PDT)
Subject: Re: [PATCH] Fix `lxvdsx` (issue #212)
To: David Gibson <david@gibson.dropbear.id.au>, "Paul A. Clarke"
 <pc@us.ibm.com>
References: <20210517214032.156187-1-pc@us.ibm.com> <YKMZwVmfec0IocfV@yekko>
From: Giuseppe Musacchio <thatlemon@gmail.com>
Message-ID: <91759ae2-f1f0-f839-6938-1271165e0a10@gmail.com>
Date: Tue, 18 May 2021 08:40:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YKMZwVmfec0IocfV@yekko>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=thatlemon@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The ISA [1] specifies the load order to be the target one, hence
the use of MO_TEQ in my patch (in both lxvwsx and lxvdsx).

I believe the error is hidden in some of the .mak files: I could not
reproduce this problem with Qemu's user-mode emulation in either
BE nor LE mode, this lead me to discover that ppc64-softmmu.mak is
always defining TARGET_WORDS_BIGENDIAN=y. The user-mode targets are
correctly split into ppc64 and ppc64le, where only the former is
declared as BE.

The presence of that define is unconditionally making MO_TE an alias
for MO_BE, that's why Paul's patch seems to fix the problem.

I didn't catch this problem earlier as pretty much of our testing is
done using the Linux user-mode emulation.

Cheers,
G.M.

[1] https://ibm.ent.box.com/s/1hzcwkwf8rbju5h9iyf44wm94amnlcrv

On 18/05/21 03:34, David Gibson wrote:
> 
> On Mon, May 17, 2021 at 04:40:32PM -0500, Paul A. Clarke wrote:
>> `lxvdsx` is byte-swapping the data it loads, which it should not
>> do.  Fix it.
>>
>> Fixes #212.
>>
>> Fixes: bcb0b7b1a1c05707304f80ca6f523d557816f85c
>> Signed-off-by:  Paul A. Clarke <pc@us.ibm.com
>                            nit, missing '>' ...^
> 
> I'm having a hard time convincing myself this is correct in all cases.
> Have you tested it with all combinations of BE/LE host and BE/LE guest
> code?
> 
> The description in the ISA is pretty inscrutable, since it's in terms
> of the confusing numbering if different element types in BE vs LE
> mode.
> 
> It looks to me like before bcb0b7b1a1c0 this originally resolved to
> MO_Q modified by ctx->default_tcg_memop_mask, which appears to depend
> on the current guest endian mode.  That's pretty hard to trace through
> the various layers of macros, but for reference, before bcb0b7b1a1c0
> this used gen_qemu_ld64_i64(), which appears to be constructed by the
> line GEN_QEMU_LOAD_64(ld64,  DEF_MEMOP(MO_Q)) in translate.c.
> 
> Richard or Giuseppe, care to weigh in?
> 
>> ---
>>  target/ppc/translate/vsx-impl.c.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
>> index b817d31260bb..46f97c029ca8 100644
>> --- a/target/ppc/translate/vsx-impl.c.inc
>> +++ b/target/ppc/translate/vsx-impl.c.inc
>> @@ -162,7 +162,7 @@ static void gen_lxvdsx(DisasContext *ctx)
>>      gen_addr_reg_index(ctx, EA);
>>  
>>      data = tcg_temp_new_i64();
>> -    tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, MO_TEQ);
>> +    tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, MO_LEQ);
>>      tcg_gen_gvec_dup_i64(MO_Q, vsr_full_offset(xT(ctx->opcode)), 16, 16, data);
>>  
>>      tcg_temp_free(EA);
> 

