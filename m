Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4842A4673A1
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 10:04:31 +0100 (CET)
Received: from localhost ([::1]:53338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt4UY-0005v2-2y
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 04:04:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mt4Se-0005F1-PH
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 04:02:32 -0500
Received: from [2a00:1450:4864:20::32f] (port=45048
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mt4Sd-0008TW-0r
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 04:02:32 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 p27-20020a05600c1d9b00b0033bf8532855so1665225wms.3
 for <qemu-devel@nongnu.org>; Fri, 03 Dec 2021 01:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gwACWvvC6lDYXlEbGdiodBZtwrfR8+95kmrrJS25i9Y=;
 b=kuXUPPQJE0+tQTlFti2yg9Rf7lHwaqJ/N0MdAJXHVSw7bJSLA9KUoZlRRDb4pevvCC
 Ii8jgoKoWXnJSU+ecszbQO5MYpZWZLlbDtlEMKdHznNKh7Ytakl8wZpvY1POqnQG73b6
 iQQbAyEFwbEogclhx0Z4gqnrFNQQ3U8WOo4KdnsxU80Ce5K4Aq/5zozAuIQi8O1eeEje
 kylAza5bBCkebocacrI2bjQJ4mkrsnZwHQxpGack/JDIjkgtT+5s0fjiZ4Zg9hdkaLHo
 PzDTGjkjnVi3vcwW3bfF0dmfPYvj/Ev40gC0qX8IawB1C2sjNKifEk7sOOWH0zOUbL6p
 b02w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gwACWvvC6lDYXlEbGdiodBZtwrfR8+95kmrrJS25i9Y=;
 b=aoGm2SIzfti3wN5k3iWnjf81B+daNGMjl4n7PvG1vPfaxStGBFuJ13SXvreRXCUIQO
 ewqxGwxUpjaa8jYjqt0VeAUg6H4xgpvmoEZ9kzYA85Tl4IJtvBMGZJX3kq4sHhpOT8dR
 wuTKyXjjK8I8eYJzdeGCugY4H+QQMqK+pChp3xFq2rITdT21IMOvwPMtAl0ohYmYKOzZ
 UauShP1F1ahDcl7LM0LK5ttQNz22gj5Q4ObqYXSeXD+60s8KeATZ7WHAXE7QPpgNEJd2
 6FT0tIuy1DzAplTGWgtpIFthenKyp6xfgD5EJe6rpq8cqhFfcZ1vDF/OXI9UV+FvicXv
 pShQ==
X-Gm-Message-State: AOAM530afGjnPmXFikk3H0hV9pV4+Y7C4MU+pPmbOwHAxOxX+0fS8gqJ
 50DGOaDTbCy9avicZZR95hk=
X-Google-Smtp-Source: ABdhPJxoMOnGfgctSEQuFqlcskh8MPZFBRk30mJU0MLyOEWiPwLcUl6p1uhMsNEZ7htJmn8uJE36QA==
X-Received: by 2002:a1c:4d8:: with SMTP id 207mr13293682wme.23.1638522148996; 
 Fri, 03 Dec 2021 01:02:28 -0800 (PST)
Received: from [192.168.1.34] (abayonne-654-1-79-213.w86-222.abo.wanadoo.fr.
 [86.222.222.213])
 by smtp.gmail.com with ESMTPSA id b197sm1989513wmb.24.2021.12.03.01.02.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 01:02:28 -0800 (PST)
Message-ID: <37d0a287-daf4-91f4-e88a-9245ae3b5c6b@amsat.org>
Date: Fri, 3 Dec 2021 10:02:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 02/15] target/m68k: Switch over exception type in
 m68k_interrupt_all
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211202204900.50973-1-richard.henderson@linaro.org>
 <20211202204900.50973-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211202204900.50973-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.938,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/21 21:48, Richard Henderson wrote:
> Replace an if ladder with a switch for clarity.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/m68k/op_helper.c | 45 +++++++++++++++++++++++++----------------
>  1 file changed, 28 insertions(+), 17 deletions(-)

> -    } else if (is_hw && oldsr & SR_M &&
> -               cs->exception_index >= EXCP_SPURIOUS &&
> -               cs->exception_index <= EXCP_INT_LEVEL_7) {
> -        do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
> -        oldsr = sr;
> -        env->aregs[7] = sp;
> -        cpu_m68k_set_sr(env, sr &= ~SR_M);
> -        sp = env->aregs[7] & ~1;
> -        do_stack_frame(env, &sp, 1, oldsr, 0, retaddr);
> -    } else {
> +        break;
> +
> +    case EXCP_SPURIOUS ... EXCP_INT_LEVEL_7:
> +        if (is_hw && oldsr & SR_M) {

This is code movement, but adding parenthesis would produce
clearer code.

> +            do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
> +            oldsr = sr;
> +            env->aregs[7] = sp;
> +            cpu_m68k_set_sr(env, sr &= ~SR_M);

Similarly code movement; this assignation deserves a followup
cleanup patch...

> +            sp = env->aregs[7] & ~1;
> +            do_stack_frame(env, &sp, 1, oldsr, 0, retaddr);
> +            break;
> +        }
> +        /* fall through */
> +
> +    default:
>          do_stack_frame(env, &sp, 0, oldsr, 0, retaddr);
> +        break;
>      }

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

