Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7006A3EAB0E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 21:33:24 +0200 (CEST)
Received: from localhost ([::1]:47454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEGSB-0001nN-2C
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 15:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mEGQY-000119-3b
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 15:31:42 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:51866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mEGQU-0001Z1-Jr
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 15:31:41 -0400
Received: by mail-pj1-x102c.google.com with SMTP id oa17so11529979pjb.1
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 12:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CAk+2aqnO5n/FQTk2vaRQqII/VeLwJsyp2OBv5DJjnE=;
 b=kApie2+eyCCUsVvfmSawbBhfhRCmAmS70aZJ2WLy3UQXI86hpIaLBhyhdw9LuMfAqa
 5DYLsLnUZ4NYIumlNbmYNEO074oj7338LLHcUWU6z8a6G9F/9XKpBGcn+FaepoJPBtS0
 EiS/xZv8d8iYi7f+n4FQflR7sbhSWY4Lxi4ys5rU7v80B5b3kGKm3pVDQIzgMWPwnT1r
 P+srbmY1Y5q2tuafKgr3yqVGBWiqLyoZRfPyIE/fBN3ZB/unAs78BXv6klexABb1/PTb
 Iqdqo+7ba5rhUhkqRgVu60IbKopSEiXD7L+acup1X41aBQiTwNxgLEbBNzvCVya2tQ4d
 lvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CAk+2aqnO5n/FQTk2vaRQqII/VeLwJsyp2OBv5DJjnE=;
 b=eTXl7D3eaLbvwnXvJAazdUOlwSBnbRVTk13vJIQe4mrlMQ6jeEVT7iLz9uGgoPJr2y
 xgJWEP0MRWljRRYTC1yxCoLMm9flOe3zB6ollLLQOW7vY/cMsXZ7IIQL5exZ9DE/Alol
 Utj/DVgb376YziodL4zR69qGBgUlpORcrnG04Mvb5fUWV0Fmfb9rV4q/5FLWBDIP/5jg
 Ef1eB1DsAhVTUyUuPVV55b5wDd53sjO+bqBqm3KNgLYv9LXjwfgDjbr2BXPOpzPEf5LC
 ensl74qJIpdp6DcsrT/xqSMEL/DVSMOCIZNUfDmIaGs2SKDyU9MKQM4ExkHUmwj6NHuI
 m0LQ==
X-Gm-Message-State: AOAM530d8apsNhojeDKJneIcxMW8MG1ant0vnD2Q0/cfeFrkymkPLIUV
 1jp5B8asRbROUS0WmInSbY9IhA==
X-Google-Smtp-Source: ABdhPJyoN9noeYHj9VkdnK56U+jYvzyV55D/L0t2renQZ9mbCDhmBOkAkA9ID2wm8rXXx+qPA304ig==
X-Received: by 2002:a62:d44e:0:b029:3b6:e627:7562 with SMTP id
 u14-20020a62d44e0000b02903b6e6277562mr5711648pfl.32.1628796696346; 
 Thu, 12 Aug 2021 12:31:36 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id z1sm4534730pfg.18.2021.08.12.12.31.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Aug 2021 12:31:35 -0700 (PDT)
Subject: Re: [PATCH v2 16/22] target/loongarch: Add floating point move
 instruction translation
To: Song Gao <gaosong@loongson.cn>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-17-git-send-email-gaosong@loongson.cn>
 <643a7954-cf1c-78dd-2d08-f0969ea6127e@linaro.org>
 <c5c30589-9373-03b7-2a53-8f91117aefd6@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1621420e-521d-f12d-230f-6177e3a7cd95@linaro.org>
Date: Thu, 12 Aug 2021 09:31:31 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c5c30589-9373-03b7-2a53-8f91117aefd6@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, yangxiaojuan@loongson.cn, qemu-devel@nongnu.org,
 maobibo@loongson.cn, laurent@vivier.eu, alistair.francis@wdc.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/11/21 11:20 PM, Song Gao wrote:
>> This is easily implemented inline, followed by a single helper call to re-load the rounding mode (if required by the mask).
> 
> Hi, Richard,
>
> Sorry to bother you， When I was revising this patch, I found that I didn't seem to
> understand your opinion. Could you explain it in detail?  thank you very much.
---%<

static const uint32_t fcsr_mask[4] = {
     UINT32_MAX, FCSR0_M1, FCSR0_M2, FCSR0_M3
};

bool trans_movgr2fcsr(DisasContext *s, arg_movgr2fcsr *a)
{
     uint32_t mask = fcsr_mask[a->fcsr];

     if (mask == UINT32_MAX) {
         tcg_gen_extrl_i64_i32(fpu_fscr0, get_gpr(a->rj));
     } else {
         TCGv_i32 tmp = tcg_temp_new_i32();

         tcg_gen_extrl_i64_i32(tmp, get_gpr(a->rj));
         tcg_gen_andi_i32(tmp, tmp, mask);
         tcg_gen_andi_i32(fpu_fcsr0, cpu_fcsr0, ~mask);
         tcg_gen_or_i32(fpu_fcsr0, fpu_fcsr0, tmp);
         tcg_temp_free_i32(tmp);

         /*
          * Install the new rounding mode to fpu_status, if changed.
          * Note that FCSR3 is exactly the rounding mode field.
          */
         if (mask != FCSR0_M3) {
             return true;
         }
     }
     gen_helper_set_rounding_mode(cpu_env, fpu_fcsr0);
     return true;
}

void trans_movfcsr2gr(DisasContext *s, arg_movfcsr2gr *a)
{
     TCGv_i32 tmp = tcg_temp_new_i32();

     tcg_gen_andi_i32(tmp, fpu_fcsr0, fcsr_mask[a->fcsr]);
     tcg_gen_ext_i32_i64(dest_gpr(a->rd), tmp);
     tcg_temp_free_i32(tmp);
     return true;
}

---%<

DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_RWG, void, env, i32)

---%<

void HELPER(set_rounding_mode)(CPULoongArchState *env, uint32_t fcsr)
{
     set_float_rounding_mode(ieee_rm[(fcsr0 >> FCSR0_RM) & 0x3],
                             &env->fp_status);
}


r~

