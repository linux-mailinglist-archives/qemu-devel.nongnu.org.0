Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9935400ED2
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 11:26:25 +0200 (CEST)
Received: from localhost ([::1]:53812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMoPw-0004PE-Tk
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 05:26:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMoOM-0003Hy-PL
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 05:24:46 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:36852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMoOJ-0004qt-IJ
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 05:24:46 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 79-20020a1c0452000000b002e6cf79e572so2689560wme.1
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 02:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WDleLl2piJ/tHdRQbx+AgtG8pyAH/ltQj1w55WYzkXM=;
 b=B72mzxszhm6ai1RkhHgOBapFgzsbQSTKsCMSB7oS8VJ15fh77j4tyU3iQ5s/P1tYiU
 wVvjo9ONwcymRDlrPA/N+4kExps6Qic02hjYE6lYXktXJ5ylsCKZsyxYWyKWyFzX5RMt
 aCiFHqglNznMS390n/DbFjuCP1vuLC//FL8+JoSPY2k32pcUpLCtIEIkq+i/T+U/n2ue
 QrTcfVn/Hn0zO8Dkp/4Uj1Q7nsQYTXkwhf+riiL4oo1VKyJM5BLTWBFmTASJOfo5IQVZ
 QIEwf8Bhmsso5w3hiSq7eltN2mzSmqL1Ny2TRI2HI1WZ9Zf4tpvdzU4Z34lvansH7l+2
 vK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WDleLl2piJ/tHdRQbx+AgtG8pyAH/ltQj1w55WYzkXM=;
 b=L+9xSedzdiny1QDNS0MY3Z5KIrP8FmXv4k0/kn0sI5id5jOHV2OMNd6LZnD7yCZPYh
 OTs1QRo9LhCHVz2nEWWy+NsX0lPh7lC5VoEuJ9W/eCC5zaq3iAflGmUz9mI3lwZMkTyE
 yMcWUQfYMTTkQ+5raSMVIKPC5fi31H5QQpB0yDUMlskVLsYG1CLgifvpnYR8ktA074nt
 kdKqXyjS1adMU03SCe7wlVERB87d0rMfNeU4gsbOnl2C6T1FIopImC2m81MdjoEvrCF8
 JJlBVS0gdtsoPGeSEJrMmpQpQLDBvpbqgzJNN6RzhjNJWE0yQqNznNGsj8y1OTO9TtEf
 0aTQ==
X-Gm-Message-State: AOAM530cotB7pAVGwMC1KM1/QyfLPv5NvE55mQd2Vi1MAzsL64o7XLMF
 MTcFKze2LFz7z1ZW2xlY7EB99w==
X-Google-Smtp-Source: ABdhPJwpQqSCWDYVOLCAd9+7tT4OpWNOXxiSRWSs+Yl7NBVL0C0HkHqFH1M1K3h64EZkFmEurqDqkw==
X-Received: by 2002:a05:600c:1990:: with SMTP id
 t16mr6345158wmq.45.1630833881618; 
 Sun, 05 Sep 2021 02:24:41 -0700 (PDT)
Received: from [192.168.8.105] (206.red-2-143-78.dynamicip.rima-tde.net.
 [2.143.78.206])
 by smtp.gmail.com with ESMTPSA id s7sm4563636wra.75.2021.09.05.02.24.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Sep 2021 02:24:41 -0700 (PDT)
Subject: Re: [PATCH v4 11/21] target/loongarch: Add floating point comparison
 instruction translation
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
 <1630586467-22463-12-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9481b350-9718-d8fc-11c5-69ff6f409220@linaro.org>
Date: Sun, 5 Sep 2021 11:24:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1630586467-22463-12-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.832,
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
Cc: peter.maydell@linaro.org, yangxiaojuan@loongson.cn, david@redhat.com,
 bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 aleksandar.rikalo@syrmia.com, jcmvbkbc@gmail.com, tsimpson@quicinc.com,
 alistair.francis@wdc.com, edgar.iglesias@gmail.com, chenhuacai@gmail.com,
 philmd@redhat.com, atar4qemu@gmail.com, thuth@redhat.com, ehabkost@redhat.com,
 groug@kaod.org, maobibo@loongson.cn, mrolnik@gmail.com, shorne@gmail.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au,
 kbastian@mail.uni-paderborn.de, crwulff@gmail.com, laurent@vivier.eu,
 palmer@dabbelt.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 2:40 PM, Song Gao wrote:
> +/* fcmp_cXXX_s */
> +uint64_t helper_fcmp_c_s(CPULoongArchState *env, uint64_t fj,
> +                         uint64_t fk, uint32_t flags)
> +{
> +    uint32_t t0, t1;
> +    uint64_t cmp = 0;
> +    t0 = (uint32_t)fj;
> +    t1 = (uint32_t)fk;
> +
> +    if (flags) {
> +        if (flags & FCMP_LT) {
> +            cmp |= float32_lt_quiet(t0, t1, &env->fp_status);
> +        }
> +        if (flags & FCMP_EQ) {
> +            cmp |= float32_eq_quiet(t0, t1, &env->fp_status);
> +        }
> +        if (flags & FCMP_GT) {
> +            cmp |= float32_lt_quiet(t1, t0, &env->fp_status);
> +        }
> +        if (flags & FCMP_UN) {
> +            cmp |= float32_unordered_quiet(t1, t0, &env->fp_status);
> +        }
> +    } else {
> +        cmp = (float32_unordered_quiet(t1, t0, &env->fp_status), 0);
> +    }

This is silly, especially the form of the last.  You want

     FloatRelation cmp = float32_unordered_quiet(t1, t0, &env->fp_status);
     bool ret;

     switch (cmp) {
     case float_relation_less:
         ret = (flags & FCMP_LT);
         break;
     case float_relation_equal:
         ret = (flags & FCMP_EQ);
         break;
     case float_relation_greater:
         ret = (flags & FCMP_GT);
         break;
     case float_relation_unordered:
         ret = (flags & FCMP_UN);
         break;
     default:
         g_assert_not_reached();
     }
     return ret;

And of course the switch can be split out to a common subroutine for use with the other 3 
comparison helpers.

> +static bool trans_fcmp_cond_s(DisasContext *ctx, arg_fcmp_cond_s *a)
> +{
> +    TCGv var = tcg_temp_new();
> +    TCGv_i32 flags = NULL;
> +
> +    switch (a->fcond) {
> +    /* caf */
> +    case  0:
> +        flags = tcg_constant_i32(0);
> +        gen_helper_fcmp_c_s(var, cpu_env, cpu_fpr[a->fj],
> +                            cpu_fpr[a->fk], flags);
> +        break;
> +    /* saf */
> +    case 1:
> +        flags = tcg_constant_i32(0);
> +        gen_helper_fcmp_s_s(var, cpu_env, cpu_fpr[a->fj],
> +                            cpu_fpr[a->fk], flags);
> +        break;

Hmm.  Perhaps put the integer flags into a table?

     fn = (a->fcond & 1 ? gen_helper_fcmp_s_s : gen_helper_fcmp_c_s);
     flags = fcond_table[a->fcond >> 1];

     fn(var, cpu_env, cpu_fpr[a->fj], cpu_fpr[a->fk],
        tcg_constant_i32(flags));

> +static bool trans_fcmp_cond_d(DisasContext *ctx, arg_fcmp_cond_d *a)

You'd get to share the table with this function.

> --- a/target/loongarch/translate.h
> +++ b/target/loongarch/translate.h
> @@ -11,6 +11,11 @@
>   
>   #include "exec/translator.h"
>   
> +#define FCMP_LT   0x0001  /* fp0 < fp1 */
> +#define FCMP_EQ   0x0010  /* fp0 = fp1 */
> +#define FCMP_GT   0x0100  /* fp1 < fp0 */
> +#define FCMP_UN   0x1000  /* unordered */

Hmm.  Better in internals.h?  I don't think you want to include translate.h into fpu_helper.c.


r~

