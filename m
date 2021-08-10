Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA56F3E7C07
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 17:21:21 +0200 (CEST)
Received: from localhost ([::1]:58570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDTZA-0003zL-RT
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 11:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDTWx-0001jJ-8N
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 11:19:03 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:53181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDTWv-0001jK-R1
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 11:19:03 -0400
Received: by mail-pj1-x102c.google.com with SMTP id nt11so10430884pjb.2
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 08:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jbhnIq9SY45PhrsdqsgBoTMd3ION6wjUplvPxyT9FmM=;
 b=UnQfRD1Lr66a+tFFINRIxm1nceUQSK+DTi8lC4cOTT2jn/KbfqCCrXvQaD/YnnUKBu
 a4DXngHLW9oQ2B3Gj0NeLBlUmWz1zkIX5AqS7Z0NSzZRlD8sXGl3qOtKHaQ2gDJNKZJE
 48aVKXOZduq7s9pCUpDuy5nHSNWlSvVGsDs1n5IZ+cZAWMNGBfaori04RnL0jAJzgP1R
 0AL6w59PGjeEl5U71f2CJPk/MIPnCNvduraitzQZosFnEixBt/FsmHrYW4l9Qhj0CccR
 LvQ7Dwna8PQWccwlv+tW4cRf6XQz4NzjKceOgk/OJxlkNfdObgEW/lFtSdkPxiinAxfq
 VLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jbhnIq9SY45PhrsdqsgBoTMd3ION6wjUplvPxyT9FmM=;
 b=oAMgWMuVdehCG4lAqqMCj8eO4Not61LEZCzIjJIJjAmyGvKu4Jvldz1XYeRT3RDwwx
 VNFtQ2KO8IKt8p6NWBjJrNDvhOD4cWNnTzf2DA8f0XYbZit7rd30PFlmShyDErrlYyRu
 V2+NTur+Ywe8HdbHNEngPMddX+3aJlL0hOQiEkEmSonf+/zBTnd59Z5sbaOzYM7OTGPu
 UPZLjrCp2SYEC8IRFe4sZ1OaLS5fbbc73EYS/fmvb4pQTvPK6elaV0jWnyE6EecLe1VV
 PTY/sGcKzONTdeu/bvhaW2emxPC/WXN8hd2z5Z0I9vhHBoPpgzRMTSPUYN6E0ie8Vx1A
 lbEA==
X-Gm-Message-State: AOAM531aQrAn01Ri3J4JZt/ofghrw1SJlJ2lWQ2YAcMzgQwipJrdG15C
 M7nV/jbZ7YJkt/Go6ICzkkC/UA==
X-Google-Smtp-Source: ABdhPJwbRjOLSEQAUBCYqwTVEO1iiZ4PhnrQRBSRhtGybOuNnJfz+5pvzEfo422cV7P51RBZeN8tOg==
X-Received: by 2002:a17:90a:d686:: with SMTP id
 x6mr4416293pju.227.1628608740306; 
 Tue, 10 Aug 2021 08:19:00 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id j18sm14163303pfc.98.2021.08.10.08.18.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 08:18:58 -0700 (PDT)
Subject: Re: [PATCH for 6.2 33/49] bsd-user: Rewrite target system call
 definintion glue
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-34-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b5af5252-c0d8-8bc6-0fa0-4fc1c4aebaf8@linaro.org>
Date: Tue, 10 Aug 2021 05:18:38 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-34-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: kevans@freebsd.org, Warner Losh <imp@FreeBSD.org>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> From: Warner Losh <imp@FreeBSD.org>
> 
> Rewrite target definnitions to interface with the FreeBSD system calls.
> This covers basic types (time_t, iovec, umtx_time, timespec, timeval,
> rusage, rwusage) and basic defines (mmap, rusage). Also included are
> FreeBSD version-specific variations.
> 
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/bsd-mman.h     | 121 --------------------
>   bsd-user/mmap.c         |   2 -
>   bsd-user/syscall_defs.h | 247 ++++++++++++++++++++++++++--------------
>   3 files changed, 162 insertions(+), 208 deletions(-)
>   delete mode 100644 bsd-user/bsd-mman.h

Oof.  Well, I guess it's progress, but it's hard to read.

> +struct target_freebsd_timeval {
> +    target_freebsd_time_t       tv_sec; /* seconds */
> +    target_freebsd_suseconds_t  tv_usec;/* and microseconds */
> +#if !defined(TARGET_I386) && TARGET_ABI_BITS == 32
> +    abi_long _pad;
> +#endif
> +} __packed;

I question the use of packed here.  You do realize that removes all alignment 
requirements?  This is probably not what you want.  It's certainly not present in the real 
freebsd _timeval.h.

Similarly with _timespec.h.

r~

