Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F4B547658
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 18:10:14 +0200 (CEST)
Received: from localhost ([::1]:41070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o03gj-0001Sb-4y
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 12:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o03dO-0006SG-6k
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 12:06:46 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:39551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o03dL-0007nh-Mh
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 12:06:45 -0400
Received: by mail-pg1-x52c.google.com with SMTP id q140so1849909pgq.6
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 09:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XkblLnDv5Pw5zJdVC4VrJ7Lc5ql5bLxNzoJOwi7jlHw=;
 b=dw5fMmtv3LAki7mk94CLUPMJyK46OcNlL6Vyg5EnYLyA90BH9+D0GZmxbIjBuv64E3
 lPdOJ6EBwFNC99g9H8orD9N0zuDATWrCmQJtmW3VoXsrGtCzYObtZ804fLdJqkZvI9YW
 WxnARSQRoe/8z6OXcWf1N+0Qzl/xxIflhbhhfdLs72FNZKwtuvKXkp9uHSkwwNHYXV+t
 bzo9dFuO547X85oSBooyLvxJLNwbVbFs0yKgukC/6lKMyflX5aSe9doY1IWNw/QkCef3
 nC8oScHpn3padTdvjykXz1FHthAc1z8HXeWcXxWrEy2LDLw9TSUWcts6nhyUBIFI/F2l
 vmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XkblLnDv5Pw5zJdVC4VrJ7Lc5ql5bLxNzoJOwi7jlHw=;
 b=n/DDeHu1BIC+EU+UEoJo6Za4AINwT81c0uTDHEm027/4hzXBpm4Da5046rFPBJ3Y8F
 ulDrbi6JM4npbbcS/5tTz5q6xtoR2k+EJ4rue7Z9bPij9GKkJDY3hsaWedvYTB1FgZ5T
 /ILGEpzRLfCB5e0OjvkwENTcgZBra53uwbbKC7uUsPX4Z6+TzHfQDFDoikPO1sF8QHeK
 bk0MXNcVJP29pMb+rSPxWj2/IF4RYYldkGiNia+qKzsqTzD5MmZkXWCa5adSUE7Pp7b2
 7/SCb332ebvyLWlc9V1fp/CHgTnWpYXKb0oscxKzT3NDRYFdAZiOVpFyxCVx7cBiNl/m
 5ZHg==
X-Gm-Message-State: AOAM530923xkq/LM4Yubi12NqsgdolrwOT+3IVgpHIQEnPmLel0vJR93
 l+Ej5uWt3qAiAQVnZzPQB3Fspg==
X-Google-Smtp-Source: ABdhPJy69lSLs3d3CD6lda49xpANEgiJgJ89AAVjlJk0GqsQHzSJG+E5ROUsZMQhKGDT4ZY+y+mVFg==
X-Received: by 2002:a05:6a00:4211:b0:51c:45e:532b with SMTP id
 cd17-20020a056a00421100b0051c045e532bmr35937727pfb.10.1654963601905; 
 Sat, 11 Jun 2022 09:06:41 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a056a000b9100b0051b4e53c487sm1769284pfj.45.2022.06.11.09.06.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Jun 2022 09:06:41 -0700 (PDT)
Message-ID: <5476bca7-eadd-0880-8625-b01579f257f5@linaro.org>
Date: Sat, 11 Jun 2022 09:06:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v15 8/9] target/loongarch: Adjust functions and structure
 to support user-mode
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20220609024209.2406188-1-gaosong@loongson.cn>
 <20220609024209.2406188-9-gaosong@loongson.cn>
 <4c0fd198-922e-d94f-fec4-05c53c5d6858@linaro.org>
 <e6e9c111-ca44-0126-b7a5-dcffe33385a5@loongson.cn>
 <20b38d22-0c59-ec11-88e1-af0f1f604984@linaro.org>
 <a6306006-d1df-e5eb-4f2c-5e1bf6adfe07@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <a6306006-d1df-e5eb-4f2c-5e1bf6adfe07@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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

On 6/10/22 20:10, gaosong wrote:
> pc             0x120000638         0x120000638 <main+32>
> badvaddr       0x120000638         0x120000638 <main+32>
...
> So badvaddr is the PC,

Yes.

> void helper_asrtle_d(CPULoongArchState *env,  target_ulong rj, target_ulong  rk)
> {
>       if (rj > rk) {
>          env->badvaddr = env->pc;
>          do_raise_exception(env, EXCCODE_BCE,  env->badvaddr);
>       }
> }

Well, not quite.  The value of env->pc is not current; it is too expensive to update all 
of the time.  We need to recover that value by using TCG unwinding, e.g.:

     if (rj > rk) {
         cpu_restore_state(env_cpu(env), GETPC(), true);
         env->badvaddr = env->pc;

However,

         do_raise_exception(env, EXCCODE_ADEM, GETPC());

expects to do it's own cpu_restore_state via cpu_loop_exit_restore(), and we should not do 
that twice.

Therefore, since the value of badvaddr is something that we can more easily recover later 
than earlier, we should move the setting of badvaddr for ADEM to loongarch_cpu_do_interrupt():

     case EXCCODE_ADEM:

         env->badvaddr = env->pc;
         cause = cs->exception_index;
         break;

It is probably worthwhile to check how many other exceptions should be having the same effect.


r~

