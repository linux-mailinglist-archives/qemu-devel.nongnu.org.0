Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9154A9A83
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 14:59:52 +0100 (CET)
Received: from localhost ([::1]:42408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFz7v-0003B4-00
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 08:59:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFz46-0001Tf-Gy; Fri, 04 Feb 2022 08:55:54 -0500
Received: from [2607:f8b0:4864:20::102d] (port=39872
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFz43-0003jv-Vn; Fri, 04 Feb 2022 08:55:54 -0500
Received: by mail-pj1-x102d.google.com with SMTP id
 x15-20020a17090a6b4f00b001b8778c9183so207047pjl.4; 
 Fri, 04 Feb 2022 05:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qHtIov9zuqKKSV/A3xGqrclUdi5d01b+AAVZVixCJpE=;
 b=UuC7my6wIrHC6n02IPZgMWNcIHGy0tdAZ8IK7ssvEeB2NgBWKt/fFvC/xQ31RdGogp
 LpAlPp/CEtZxS3/C2JhKrrFkUVC9D7nGNYlrWFaoE5FnWSzSaadsAj1vpdqfyH95vZtF
 IKZmsSzL0ILYLdq+b1b/lJHl+14hAei0l+rexugSTfoOB7iYdfLapGEx7d8mlGxGpOO0
 3VWMCF5gp9GeYBvESXUrFwGUbdMTg/9MAh1iH26VJRBYrXYWcBDb0hw6nt4hL2v06Jnv
 OOmdM8cnEXjDJLeKT4+QoNsp6Bh9AmlFJTnjdOuN5f1qiAZ+cp/2OUh0ORp0YhYbpk9h
 fhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qHtIov9zuqKKSV/A3xGqrclUdi5d01b+AAVZVixCJpE=;
 b=23+LpvpDhZp2ghqj/ZeXt7botAPuPxdq5NYr1wV8dn6do1M/tU+vbNZV//ci/Smp3j
 pRXyCAKFbwPIpeJ+GiResvRYOm73U6tc1X1DdOY72n/PIrWfYn24ftsHni0lwT1U+EGu
 hqGY1dyuNPkhk39uqhO7njgJ8ozvuTKyGe85x3NpvNkWPMNNe9BNmcLFK6/JyuMI5I2t
 8rHdF71p/QNeJaPM4BBIZs06CRFFULhkF8VxBy/y3uIG+4JrGC4mVq8L4VGp/bWz+6d8
 byS+vE8lqg0bz17L1LfTww+7ElGM+xEf9ROiGA6c1T9sME/XT4EaduM2V5fet6qo/3dE
 IWvA==
X-Gm-Message-State: AOAM53303klgqOc/vFG9m7iADUzvlklXcRHsn27m/K7UNtXuB5JzsyWh
 RX9ehJicQR8I38tPNtDREGY=
X-Google-Smtp-Source: ABdhPJxj2Q63vJFHzaqOWedhNq8xDa6j3OpYHMv36hPs57wV7w8Y98EkgHrsnDV1CZTp7POSQZJn7g==
X-Received: by 2002:a17:903:404b:: with SMTP id
 n11mr3285421pla.42.1643982949909; 
 Fri, 04 Feb 2022 05:55:49 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id pg2sm15386244pjb.54.2022.02.04.05.55.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 05:55:49 -0800 (PST)
Message-ID: <449c9c55-06e8-66ef-8755-3ab2e785851c@amsat.org>
Date: Fri, 4 Feb 2022 14:55:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v3] 9pfs: Fix segfault in do_readdir_many caused by struct
 dirent overread
Content-Language: en-US
To: Vitaly Chikunov <vt@altlinux.org>, Greg Kurz <groug@kaod.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, ldv@altlinux.org
References: <20220204050609.15510-1-vt@altlinux.org>
In-Reply-To: <20220204050609.15510-1-vt@altlinux.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 4/2/22 06:06, Vitaly Chikunov wrote:
> `struct dirent' returned from readdir(3) could be shorter (or longer)
> than `sizeof(struct dirent)', thus memcpy of sizeof length will overread
> into unallocated page causing SIGSEGV. Example stack trace:
> 
>   #0  0x00005555559ebeed v9fs_co_readdir_many (/usr/bin/qemu-system-x86_64 + 0x497eed)
>   #1  0x00005555559ec2e9 v9fs_readdir (/usr/bin/qemu-system-x86_64 + 0x4982e9)
>   #2  0x0000555555eb7983 coroutine_trampoline (/usr/bin/qemu-system-x86_64 + 0x963983)
>   #3  0x00007ffff73e0be0 n/a (n/a + 0x0)
> 
> While fixing, provide a helper for any future `struct dirent' cloning.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/841
> Cc: qemu-stable@nongnu.org
> Co-authored-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Signed-off-by: Vitaly Chikunov <vt@altlinux.org>
> ---
> Tested on x86-64 Linux again.
> 
> Changes from v2:
> - Make it work with a simulated dirent where d_reclen is 0, which was
>    caused abort in readdir qos-test, by using fallback at runtime.
> 
>   hw/9pfs/codir.c      |  3 +--
>   include/qemu/osdep.h | 13 +++++++++++++
>   util/osdep.c         | 18 ++++++++++++++++++
>   3 files changed, 32 insertions(+), 2 deletions(-)

> +struct dirent *
> +qemu_dirent_dup(struct dirent *dent)
> +{
> +    size_t sz = 0;
> +#if defined _DIRENT_HAVE_D_RECLEN
> +    /* Avoid use of strlen() if there's d_reclen. */
> +    sz = dent->d_reclen;
> +#endif
> +    if (sz == 0) {

If _DIRENT_HAVE_D_RECLEN is defined, this case is unlikely...

> +        /* Fallback to the most portable way. */
> +        sz = offsetof(struct dirent, d_name) +
> +                      strlen(dent->d_name) + 1;
> +    }
> +    struct dirent *dst = g_malloc(sz);
> +    return memcpy(dst, dent, sz);
> +}

What about this?

struct dirent *
qemu_dirent_dup(struct dirent *dent)
{
     size_t sz;

#if defined _DIRENT_HAVE_D_RECLEN
     /* Avoid use of strlen() if there's d_reclen. */
     sz = dent->d_reclen;
#else
     /* Fallback to the most portable way. */
     sz = offsetof(struct dirent, d_name) +
                   strlen(dent->d_name) + 1;
#endif

     return g_memdup(dent, sz);
}

