Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FF94698E3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 15:29:01 +0100 (CET)
Received: from localhost ([::1]:54396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muEzE-0001aZ-Dh
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 09:29:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muEsN-0008R1-QG
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 09:21:55 -0500
Received: from [2a00:1450:4864:20::331] (port=53241
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muEsL-0001vH-7P
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 09:21:55 -0500
Received: by mail-wm1-x331.google.com with SMTP id o29so8293469wms.2
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 06:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oGzcPubaqkvqMo5L0tRTwNkPPwLtS/7sxS8VHb0vHaY=;
 b=S12rPBV2S1HF40hLwvCG1uOu4H06ZvhaBMnDyVmGwASaUpxxaCy2Ax/RKEMDrhMNLR
 3+zTlCuSAGUPq6nUAEyrGniqAudPqrmk/wA64S6FinWwOHkDTQgvW1OhjRCT9idNuost
 Ruz+kx7GHGxnXHXSuz6ZhMazjpO3PuXK/X1ZTnPkQafMvtup9aC/0zqsyCEMH4/NuUQq
 9KLp1ZL8thMoHZzTe8jeUiFxtTgwRasUuEwH/YfM3sgjviAL5he/gyyqmizpxnA/+5a+
 HYPqW9kDdikgF9c3ckallMaiXi0eMb/ATP1YiqX2jYTpY90k4+2TuUp0aGKR1YILoUEV
 beFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oGzcPubaqkvqMo5L0tRTwNkPPwLtS/7sxS8VHb0vHaY=;
 b=VbSuF6OdVf4vXKQfzHdI8LGhDxXPr8gL4nedxcS2I9H9Sx1eoIEPgbzt86VcSP+nse
 F5SMrbstgv5hMQ52m/4A5T8cOZu154VpI1OD01d0y2oELVDJAYACS8i9jfqxWoSRPE8R
 xKnHaHbOyaV9QZc9P4XIKcHnn3DSIcBQFjWW7JJXygnWcwxcuqoo4MVKdal8TrazCBzV
 hxJeLXaCAaQqqEQshR2GysILhlfuOsTkcXjTzoqT7oW7mMai+xNs1aN+CLI+FKdEPiO7
 9w+5Qh9gp36mKmuG0HVfCyO1bO6QhII0gghGsfLGyd3gof/1I6XWDXBm6pNyOchzBLb8
 Ym7g==
X-Gm-Message-State: AOAM531TbZjdUhGYBLFid8cbkVjHShYBwlkib+Kb1iX+3Met5EIIV3RW
 ITdRKAGp7/NmO8uR2C3X1+Lr83EWwJk=
X-Google-Smtp-Source: ABdhPJzUZce9qOHJXd+w8G4p5Zmr7leNSIEDklzHFAKf1q0333QvwdNFV2H4l7SRVpvCqOApoicJ5w==
X-Received: by 2002:a05:600c:1d91:: with SMTP id
 p17mr39886156wms.193.1638800511611; 
 Mon, 06 Dec 2021 06:21:51 -0800 (PST)
Received: from [192.168.1.36] (82.red-83-50-95.dynamicip.rima-tde.net.
 [83.50.95.82])
 by smtp.gmail.com with ESMTPSA id m1sm11219427wme.39.2021.12.06.06.21.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 06:21:51 -0800 (PST)
Message-ID: <82134adb-acec-4638-821a-932f413b3ec3@amsat.org>
Date: Mon, 6 Dec 2021 15:21:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] linux-user/hexagon: Use generic target_stat64 structure
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20211116210919.2823206-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211116210919.2823206-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.076,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laurent,

What is your plan for this patch? Technically this is a bugfix.

On 11/16/21 22:09, Philippe Mathieu-Daudé wrote:
> Linux Hexagon port doesn't define a specific 'struct stat'
> but uses the generic one (see Linux commit 6103ec56c65c [*]
> "asm-generic: add generic ABI headers" which predates the
> introduction of the Hexagon port).
> 
> Remove the target specific target_stat (which in fact is the
> target_stat64 structure but uses incorrect target_long and
> ABI unsafe long long types) and use the generic target_stat64
> instead.
> 
> [*] https://github.com/torvalds/linux/commit/6103ec56c65c3#diff-5f59b07b38273b7d6a74193bc81a8cd18928c688276eae20cb10c569de3253ee
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/syscall_defs.h | 28 ++--------------------------
>  1 file changed, 2 insertions(+), 26 deletions(-)
> 
> diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
> index a5ce487dcc3..7ab612d163b 100644
> --- a/linux-user/syscall_defs.h
> +++ b/linux-user/syscall_defs.h
> @@ -2129,7 +2129,8 @@ struct target_stat64  {
>      abi_ulong __unused5;
>  };
>  
> -#elif defined(TARGET_OPENRISC) || defined(TARGET_NIOS2) || defined(TARGET_RISCV)
> +#elif defined(TARGET_OPENRISC) || defined(TARGET_NIOS2) \
> +        || defined(TARGET_RISCV) || defined(TARGET_HEXAGON)
>  
>  /* These are the asm-generic versions of the stat and stat64 structures */
>  
> @@ -2240,31 +2241,6 @@ struct target_stat64 {
>      uint64_t   st_ino;
>  };
>  
> -#elif defined(TARGET_HEXAGON)
> -
> -struct target_stat {
> -    unsigned long long st_dev;
> -    unsigned long long st_ino;
> -    unsigned int st_mode;
> -    unsigned int st_nlink;
> -    unsigned int st_uid;
> -    unsigned int st_gid;
> -    unsigned long long st_rdev;
> -    target_ulong __pad1;
> -    long long st_size;
> -    target_long st_blksize;
> -    int __pad2;
> -    long long st_blocks;
> -
> -    target_long target_st_atime;
> -    target_long target_st_atime_nsec;
> -    target_long target_st_mtime;
> -    target_long target_st_mtime_nsec;
> -    target_long target_st_ctime;
> -    target_long target_st_ctime_nsec;
> -    int __unused[2];
> -};
> -
>  #else
>  #error unsupported CPU
>  #endif
> 

