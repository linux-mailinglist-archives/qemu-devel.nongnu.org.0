Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE4C4E5B1B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 23:13:03 +0100 (CET)
Received: from localhost ([::1]:47768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX9Dw-0007lN-M1
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 18:13:00 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX9CV-00075t-QM
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 18:11:31 -0400
Received: from [2607:f8b0:4864:20::102b] (port=40646
 helo=mail-pj1-x102b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nX9CU-0001dh-7x
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 18:11:31 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 mp6-20020a17090b190600b001c6841b8a52so7700429pjb.5
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 15:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=esFUJWf7ldAEhfJTBezNz/hjbVE2fKtiiGEis1U1jUA=;
 b=wiC+oQ7qthUpbLAA43HnaBjqu3Zxrb7QaY6AUeXCowUUTk71BFRogU74N9j3Kh1I07
 L8ilmu5Q620k6L+lC6bVob9VBdnrjhdz9GWLSpfT45/jWMQIbAS35GxbbhGhGPq1A4br
 avCqD78IC2krCQR75ek2tqV7ubomk5h6KmG2wlFmL+j6fXZ1Gl1J6qBVPgnGwmJWzgXo
 boVMDqdbfSAmMyZa+/W5hfEbm4IfkueafV1UatlD0MzvA5dTtC4hKgTEcJCZmuI5BNGu
 JxkfUzaY94bpj0LDvhjAupGoP89aGMCX0kEVEyV1MZv1k8iN8w33uoeTzthX1YR/gdpn
 5+qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=esFUJWf7ldAEhfJTBezNz/hjbVE2fKtiiGEis1U1jUA=;
 b=Gd6tey4LM9tPRO//yPWrM7C9/nkJbg+rArnJg9/lewlREKRay30WXsPjUA8yNN1xfZ
 ePd2eHjDpaharpYwusKfbDCvzsAG7xd4ZzoTJ07Lmw4ToSxSTgbmUY78uhilQYrA0QJV
 LiRPMo6nKS7GzA4D5eKmmQnOaiBWeXXPBbxQWj+NrX/2tKyvhSeSUZfZe/dtFiuFlPjW
 AYq+ALYAGSmj/c3GupjNGQCBeuK/UtXNlBBlsV1HW/XijLz0CVwL3DfxGCgTwwvazWH5
 ZxO+o4aR8DVi5T5DVIsILBNmEH5VHhKOPpU2D97GnzkWYIbG7HuxrJn+85+y+eQ5Gbk0
 T24g==
X-Gm-Message-State: AOAM533pm9Wr6IRtU458iLVDJMmXUxrL3x32WL1jNQ/eN+bt8GrAAg+w
 34Dag6kmOpLCN8lQY0joCoIgMV4m3N5Rsg==
X-Google-Smtp-Source: ABdhPJy900RqKCIIb/ualeVyoRgK2HZRYv2WBgUNobfy8YA7SFpxOD13lvLm6GH88L2QHHx2jXXuyg==
X-Received: by 2002:a17:902:b614:b0:153:82b2:2c8a with SMTP id
 b20-20020a170902b61400b0015382b22c8amr2312135pls.17.1648073488802; 
 Wed, 23 Mar 2022 15:11:28 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a17090adac100b001c67cedd84esm590515pjx.42.2022.03.23.15.11.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 15:11:27 -0700 (PDT)
Message-ID: <63f0eec4-d9fe-65d1-b8d2-a2c188905485@linaro.org>
Date: Wed, 23 Mar 2022 15:11:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 09/13] accel/all: Extract common_vcpu_thread_create()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20220323171751.78612-1-philippe.mathieu.daude@gmail.com>
 <20220323171751.78612-10-philippe.mathieu.daude@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220323171751.78612-10-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> All accelerators implement a very similar create_vcpu_thread()
> handler. Extract the common part as common_vcpu_thread_create(),
> which only requires the AccelOpsClass::vcpu_thread_fn() routine
> and the accelerator AccelOpsClass::thread_name for debugging
> purpose.
> 
> The single exception is TCG/RR which re-use a single vCPU. Have
> it use the same logic by using the .precheck/.postcheck handlers.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Too much all at once.
But I see now why you moved code in the direction you did in patch 5.

> @@ -279,28 +279,13 @@ bool rr_create_vcpu_thread_precheck(CPUState *cpu)
>       return !single_tcg_cpu_thread;
>   }
>   
> -void rr_start_vcpu_thread(CPUState *cpu)
> +void rr_create_vcpu_thread_postcheck(CPUState *cpu)
>   {
> -    char thread_name[VCPU_THREAD_NAME_SIZE];
>       static QemuCond *single_tcg_halt_cond;
> -    static QemuThread *single_tcg_cpu_thread;

Patch 8 is not really standalone, since you didn't move this variable.
I think it's probably a mistake to split out precheck and postcheck separately.

> -
> -    if (!single_tcg_cpu_thread) {
> +    if (! single_tcg_cpu_thread) {

Extraneous whitespace.

> @@ -30,7 +30,8 @@ struct AccelOpsClass {
>   
>       bool (*cpus_are_resettable)(void);
>   
> -    void (*create_vcpu_thread)(CPUState *cpu); /* MANDATORY NON-NULL */
> +    const char *thread_name;

Why don't we just get this name from the AccelClass?

> +static void common_vcpu_thread_create(CPUState *cpu)
> +{
> +    char thread_name[VCPU_THREAD_NAME_SIZE];
> +
> +    cpu->thread = g_new0(QemuThread, 1);
> +    cpu->halt_cond = g_new0(QemuCond, 1);
> +    qemu_cond_init(cpu->halt_cond);
> +    snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/%s",
> +             cpu->cpu_index, cpus_accel->thread_name ?: "DUMMY");

Surely g_strdup_printf is better than the static size buffer.


r~

