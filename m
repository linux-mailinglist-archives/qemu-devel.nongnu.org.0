Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B654E5A93
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 22:21:17 +0100 (CET)
Received: from localhost ([::1]:42956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX8Ps-0006To-K1
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 17:21:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX8OB-0005gn-MF
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 17:19:32 -0400
Received: from [2607:f8b0:4864:20::529] (port=40471
 helo=mail-pg1-x529.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX8OA-0004nd-AF
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 17:19:31 -0400
Received: by mail-pg1-x529.google.com with SMTP id w21so2210530pgm.7
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 14:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=MirhHiU0O80p7NOHaLHK6VwhI6Ps9FZwHNE6ahhsNss=;
 b=ob4MeKdncCsWLoewXvXPK/uuVmCLFKDYHAMOrM51H6UoYhLXpPjhPODiWbiyUeaTSR
 AsULaKsgDEa1V8xTsdMcHQsrvVkSV/x+/uEUBzKzFCm6lhYrnuMMQYcE3bz5MJrwupfS
 jMR7xdRz544uxTOCALDa4PRaDWhuieGgDvhIngPR+RUcFBdPhU2B6/HOW17XK/MiSBhJ
 meOF5KodCDAhhYECUkRj6j94pdjyfvrsPjg2Q8A6WooQhby96Qafm/BAV3EAkug+P4IM
 1Tw7e6DKrFVF3xQgSpjGTndCSQuXOXJjnkmS2w4HSgGKs1JRDw9N3oT5EKVTPbv29wTB
 kVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MirhHiU0O80p7NOHaLHK6VwhI6Ps9FZwHNE6ahhsNss=;
 b=Ev7ueJGc34y4SpaVXtChyMgSFTsm6csoyXp11bgiS7aYVpZSLlyZb0GaCX8Dhu6GcY
 Ilv4UGaRVi0iIahaOzp6FvkYF31spA8VCWjrGJ2B7eumEyjdHHiBeFOFzLelslcCfGEQ
 cG3KgG41PuV0vUgPgXsskQIZJuArJQwjahJfjsoQyHrl/vp7JpQSQpS5bTD6FQddkVKa
 dIRjICqnSk//vgT7lqyALuCggSn7SL0ak/SCabgETEsCn2d6pMu4aCkgB++1/BmmtY6G
 j04+os5dn5KLSj1XtBLjnTqhstmT2O1O/e1WhGp7rh6fGe62gtSL1vXzvR9y2BRALwNx
 3Wzw==
X-Gm-Message-State: AOAM530lBfW1MehyBuqP7quKW/0XFuPLOkohh8QwdDgdt5jGrZajspPW
 xG8PLxSzCXwKQsw7KgWJiVBirg==
X-Google-Smtp-Source: ABdhPJx6MESVsxrxexeg3NECnWk9eBNF0XyGoqMHpZIZesouCke8xGRlx2+62W0n1sNQLmGoRC8wmA==
X-Received: by 2002:a62:1407:0:b0:4fa:6d31:1056 with SMTP id
 7-20020a621407000000b004fa6d311056mr1660077pfu.7.1648070368576; 
 Wed, 23 Mar 2022 14:19:28 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 e19-20020a637453000000b003821bdb8103sm622017pgn.83.2022.03.23.14.19.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 14:19:28 -0700 (PDT)
Message-ID: <ba794b2f-a915-1e48-e944-fb17cac9f0d3@linaro.org>
Date: Wed, 23 Mar 2022 14:19:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 03/13] target/i386/hvf: Free resources when vCPU is
 destroyed
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
 <20220323171751.78612-4-philippe.mathieu.daude@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220323171751.78612-4-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::529
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/22 10:17, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé<f4bug@amsat.org>
> 
> Both xsave_buf and hvf_caps are allocated in hvf_arch_init_vcpu(),
> free them in hvf_arch_vcpu_destroy().
> 
> Reported-by: Mark Kanda<mark.kanda@oracle.com>
> Suggested-by: Igor Mammedov<imammedo@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/i386/hvf/hvf.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

