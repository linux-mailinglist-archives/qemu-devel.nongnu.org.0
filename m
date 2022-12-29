Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28ED0658A1A
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 08:52:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAnh2-00023s-Sh; Thu, 29 Dec 2022 02:51:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAnh1-00023k-8v
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 02:51:11 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAngx-0007IM-NE
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 02:51:11 -0500
Received: by mail-wm1-x333.google.com with SMTP id ja17so12625685wmb.3
 for <qemu-devel@nongnu.org>; Wed, 28 Dec 2022 23:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3I1o10VOmj/fnIZD4vbqfDHra2+BGaCRwk0fsDjddCM=;
 b=PE+EDFtfUxnSXd0Kgcsy8PpivbDWq8+feomK5pdb73P2PDC4XJ2RRNWHilJEqDbt12
 AT6maF4kd1U7Snq3bd1wFvjUXnWckekWKAoEfiDcVBw/ZikzgR1bmEvKHE6jBivuj1rW
 cofApHlAmpmT8dWJUjYh9fPXsmrzCDM/AinxgOt7K0I3MwTJnGykw55uL2nMifv4Og3q
 sd/JrJ0uaQAS0jua3w1lrpL9T5LZPmkjKH1odTR7Ha5VB6DvrFAnEIQ9P2EAQeoMzaWM
 Nlw/Vn/tlFqfirzsHAoiJ/gmLrJjZ72qAQx/i64sCMejzgxnUvQeSlcq+wLY3sM++4Ej
 2UIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3I1o10VOmj/fnIZD4vbqfDHra2+BGaCRwk0fsDjddCM=;
 b=QOlZH/7/kUzYYLA4qZjf5C4jJOLBt8mHdXTywEjxVtTvz0adRthH91lgjj7fHVlc6C
 FsbHy8imc0TPuPRVL8VWivnEqUePHemplldYTzNHp2lGLi5N80wxs5M2ESLMgiYwPAEy
 p0dDZ/xLLYHxH8QLu0oOettag+pBugjtoXn9Feb9g5z3hQmz6/4K1kBniLMqJeFWnNVS
 Gp1oEpHtqvBguvamU1ns+mfithYieLrdsy4XawcgYMgb4yZYYwl6gW64RX65V6sMHFBk
 zz/eXFn57c8LpHtqZWKCC9J2giIERhGPCetDU5mtOX3RrQrcMMcDkpHcdto8dMQah9W5
 f0wA==
X-Gm-Message-State: AFqh2kqMFDx4/ctlQt7/LR96xfMz6xs+9etWNyC2k3aa6StfYGdegYMS
 HhLe+NM4y94/0A0tsVu+RdhjMQ==
X-Google-Smtp-Source: AMrXdXtW6plmKw95CGY+58N9tzctL1yZi0XKPlw9v4NLsQJvnYTPeUwnV+r/fKrZPrBMY5n6cfacAg==
X-Received: by 2002:a05:600c:4e07:b0:3d3:5319:b6d3 with SMTP id
 b7-20020a05600c4e0700b003d35319b6d3mr19644595wmq.38.1672300266114; 
 Wed, 28 Dec 2022 23:51:06 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 y22-20020a1c4b16000000b003d01b84e9b2sm23441380wma.27.2022.12.28.23.51.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Dec 2022 23:51:05 -0800 (PST)
Message-ID: <54a4141c-85ab-6d1e-7f52-a4320b0c6556@linaro.org>
Date: Thu, 29 Dec 2022 08:51:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3] linux-user: Fix /proc/cpuinfo output for sparc and hppa
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <Y6ywbxuxqQ/cGPJW@p100>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y6ywbxuxqQ/cGPJW@p100>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.147,
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

On 28/12/22 22:09, Helge Deller wrote:
> The sparc and hppa architectures provide an own output for the emulated
> /proc/cpuinfo file.
> 
> Some userspace applications count (even if that's not the recommended
> way) the number of lines which start with "processor:" and assume that
> this number then reflects the number of online CPUs. Since those 3
> architectures don't provide any such line, applications may assume "0"
> CPUs.  One such issue can be seen in debian bug report:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1024653
> 
> Avoid such issues by adding a "processor:" line for each of the online
> CPUs.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> 
> ---
> v3:
> - add trailing newline at end of /proc/cpuinfo file (needed by procps)
> 
> v2:
> - drop m68k part (based on feedback from Laurent Vivier <laurent@vivier.eu>)
> - change commit message
> 
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index afb24fd0b9..5ec11a3683 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -8310,7 +8310,13 @@ static int open_net_route(CPUArchState *cpu_env, int fd)
>   #if defined(TARGET_SPARC)
>   static int open_cpuinfo(CPUArchState *cpu_env, int fd)
>   {
> -    dprintf(fd, "type\t\t: sun4u\n");
> +    int i, num_cpus;
> +
> +    num_cpus = sysconf(_SC_NPROCESSORS_ONLN);
> +    for (i = 0; i < num_cpus; i++) {
> +        dprintf(fd, "processor\t: %d\n", i);
> +        dprintf(fd, "type\t\t: sun4u\n\n");
> +    }
>       return 0;
>   }
>   #endif
> @@ -8318,11 +8324,17 @@ static int open_cpuinfo(CPUArchState *cpu_env, int fd)
>   #if defined(TARGET_HPPA)
>   static int open_cpuinfo(CPUArchState *cpu_env, int fd)
>   {
> -    dprintf(fd, "cpu family\t: PA-RISC 1.1e\n");
> -    dprintf(fd, "cpu\t\t: PA7300LC (PCX-L2)\n");
> -    dprintf(fd, "capabilities\t: os32\n");
> -    dprintf(fd, "model\t\t: 9000/778/B160L\n");
> -    dprintf(fd, "model name\t: Merlin L2 160 QEMU (9000/778/B160L)\n");
> +    int i, num_cpus;
> +
> +    num_cpus = sysconf(_SC_NPROCESSORS_ONLN);
> +    for (i = 0; i < num_cpus; i++) {
> +        dprintf(fd, "processor\t: %d\n", i);
> +        dprintf(fd, "cpu family\t: PA-RISC 1.1e\n");
> +        dprintf(fd, "cpu\t\t: PA7300LC (PCX-L2)\n");
> +        dprintf(fd, "capabilities\t: os32\n");
> +        dprintf(fd, "model\t\t: 9000/778/B160L - "
> +                    "Merlin L2 160 QEMU (9000/778/B160L)\n\n");
> +    }
>       return 0;
>   }
>   #endif

I'd rather have common code in a single open_cpuinfo() and
a per-arch dprintf_cpuinfo():

   static void dprintf_cpuinfo(CPUArchState *cpu_env, int fd,
                               unsigned cpuid)
   {
       dprintf(fd, "cpu family\t: PA-RISC 1.1e\n");
       dprintf(fd, "cpu\t\t: PA7300LC (PCX-L2)\n");
       dprintf(fd, "capabilities\t: os32\n");
       dprintf(fd, "model\t\t: 9000/778/B160L - "
                   "Merlin L2 160 QEMU (9000/778/B160L)\n");
   }

   static int open_cpuinfo(CPUArchState *cpu_env, int fd)
   {
       int i, num_cpus;

       num_cpus = sysconf(_SC_NPROCESSORS_ONLN);
       for (i = 0; i < num_cpus; i++) {
           dprintf(fd, "processor\t: %d\n", i);
           dprintf_cpuinfo(cpu_env, fd, i);
           dprintf(fd, "\n");
       }
       return 0;
   }

Anyhow,
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


