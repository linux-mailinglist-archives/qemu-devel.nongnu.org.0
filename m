Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E0C475765
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 12:09:46 +0100 (CET)
Received: from localhost ([::1]:38620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxSAL-0007UZ-C4
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 06:09:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxRdm-0001Bm-1f
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:36:07 -0500
Received: from [2a00:1450:4864:20::42b] (port=36556
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxRdj-0007ny-Ty
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:36:05 -0500
Received: by mail-wr1-x42b.google.com with SMTP id u17so37379026wrt.3
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 02:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/L0gEkcuOfxZxHG2dkFeJ1x6Wsa+jJUwg6/DS6AAwcM=;
 b=cifXNxfHX/a8gk+46BdXsTPrvq4gVxNSAbQtMOrz8NhR8UXZvEZk+YaUqt6lqmXe7A
 r9EpQJFvSsfBF0IyXiwk086qBq8HhPI5Yxz8iVNVaaqkirdm6SjBzBJ78haz4QM/10KY
 abTaWGE+vGMWc5HR0UROMeKLhAtetSlM4Efy2cVCAmw9qg4eknWLBuny6Yw0tVmPuV1D
 Btpuao+AX9ihFrcbqrThU4fMTWmmc1Ln0f+3pAoWVqGuJf3vUh1vcW8J7lBWxAfSutHD
 cxqG+AETUJYud+xMd9yBuSJLvGq6rvkl4WLlrdUoPPNyhZDhG2T0Ar97k68Df2JCQm2v
 HveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/L0gEkcuOfxZxHG2dkFeJ1x6Wsa+jJUwg6/DS6AAwcM=;
 b=hGdWQM18eXFDpgQqwK9CnF5JeEiuOQJB5ZrqWuHWJpIYYXOr/g98nAdO9dZK3OBI/e
 rVtm3zeBSzG6L3LtqBnNnddF92YMX2Zuwv8AlNHYNgpxrV4G+cqlezqoEnrbVVRZO8+t
 MotjzcxyoVGUwAwEu5GJ7f3M91nX1geDrejn6nI46ZX1uPEFqNAyxMflzrignFEtJRVd
 xzMQXV4E1WBm6FrcqEE3vRFrazUc46O02bdcuVoW6VY7Nvw2G1rivU494SY/Kf8PWI5U
 w0Ee6OzJ2iSpglQqhVrgEdFyjWG+UKwXqgdnI0jqKmXgEziTYUW0ry8Nc1FtrnyNgf0e
 KlJw==
X-Gm-Message-State: AOAM533JbMAuOhtVG4BWS3UNOnGtgTmhXWJ1FmzeYlJpYTWkWvTSbdUf
 k64vy5prvix4HGXl83iYkcmpN9+7rRg=
X-Google-Smtp-Source: ABdhPJwJbbMrs9NQKZs/PqY07ZlPXOm6q4QkuSb6+wumfLenuNfl4Zwy06KEFh2xiu5H+6zf1zVK2Q==
X-Received: by 2002:a5d:598a:: with SMTP id n10mr3755639wri.406.1639564562529; 
 Wed, 15 Dec 2021 02:36:02 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id n7sm1572373wro.68.2021.12.15.02.36.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 02:36:02 -0800 (PST)
Message-ID: <d5337055-56f4-b1ee-f805-20fa08d46f73@amsat.org>
Date: Wed, 15 Dec 2021 11:36:01 +0100
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
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.64,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Taylor Simpson <tsimpson@quicinc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping.

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

