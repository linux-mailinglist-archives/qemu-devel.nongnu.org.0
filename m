Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 885044AB252
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 22:23:16 +0100 (CET)
Received: from localhost ([::1]:53940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGp07-0000SS-ME
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 16:23:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGoxz-0007lV-Pr
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 16:21:04 -0500
Received: from [2a00:1450:4864:20::431] (port=34338
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGoxx-0003L7-R9
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 16:21:03 -0500
Received: by mail-wr1-x431.google.com with SMTP id f17so21563482wrx.1
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 13:21:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UQ5dECpoRmAEqQIrhcZiQ4KNQyWvE/Ktu/Nh9JtmEEI=;
 b=JlVJU9yVPhB9lD25/g/Qu0FOtutHDtng5pht0V4heqBmQHRpTytybsEFOd2XqNlvQ0
 S1Wi1zBBjnO35ySY/BFd3XidVW+y2JDKJ/eqzFeZeadelfe0LfTKwhVRH52vaHxLnOC7
 eLbbfFfym6/g2wNL1wmpNPX3ZSXA29u/l1Zd57iVHPrQ7t3aUtiBcecmhX4XiDmXeFj7
 HfT2RKCje8UTaAd5wDs/iT8iHMcUhw5BC5tpA2vv526e9bTMvp3yDYn8THePydqrqDXY
 I34yqLCxyL3dspuzd8U5gzei36ekGJOrwEfryck/OGZiOTHX27cBU4ytkiS+rCi0f3dS
 6Zug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UQ5dECpoRmAEqQIrhcZiQ4KNQyWvE/Ktu/Nh9JtmEEI=;
 b=LpOe3N2v9WyGJ5kqMilteHXmmuFrQG717r0nNMAY+FkMgTkxQp4r75i0zwyLhzTD6l
 JDZ+JE0MJ9oGwtTfzninTBbMkms6K3s5sXhRSHKQP5JyWzYFHoR56EKkdLA0yBZqwzZi
 sz00FCn0frWvdgtGAQSlDwLkMZ6ySIQ6sfarAgW4tPmOjx7aK8X8KjZ5hq1jZqQB8biC
 x8XvVntH6zZM/cPmhcc/YTTNzOnLq7zYav/cjE1r8qf+dsmKQtaybzpctfNUoWKPCq6a
 B5J+1Zh7pGZFvzs8bzVE90q6iZ/J69QpyI3fDdrm3FrkejSkHFMfM8IqE6C7pyWunAWk
 v3wg==
X-Gm-Message-State: AOAM53011/i22XfDUZuAgLYKgVDdcTnrDQ4MRBgykyARlMKvJLncWqN+
 fOSGqDAvA1dlMPcuylaOqMo=
X-Google-Smtp-Source: ABdhPJwZmsNzH0hmx5SmLv1icOVP9yHifdWRHyTdeiofoK/iBaSUYoyk+3vlKBOQFHTLGKf6xAhw7A==
X-Received: by 2002:a5d:6d04:: with SMTP id e4mr7702241wrq.279.1644182459687; 
 Sun, 06 Feb 2022 13:20:59 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id n8sm7252304wmk.18.2022.02.06.13.20.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Feb 2022 13:20:59 -0800 (PST)
Message-ID: <b32f0267-c8b1-2e50-b81f-65289c89e802@amsat.org>
Date: Sun, 6 Feb 2022 22:20:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v4 09/11] 9p: darwin: Implement compatibility for mknodat
Content-Language: en-US
To: Will Cohen <wwcohen@gmail.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
References: <20220206200719.74464-1-wwcohen@gmail.com>
 <20220206200719.74464-10-wwcohen@gmail.com>
In-Reply-To: <20220206200719.74464-10-wwcohen@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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

On 6/2/22 21:07, Will Cohen wrote:
> From: Keno Fischer <keno@juliacomputing.com>
> 
> Darwin does not support mknodat. However, to avoid race conditions
> with later setting the permissions, we must avoid using mknod on
> the full path instead. We could try to fchdir, but that would cause
> problems if multiple threads try to call mknodat at the same time.
> However, luckily there is a solution: Darwin includes a function
> that sets the cwd for the current thread only.
> This should suffice to use mknod safely.
> 
> This function (pthread_fchdir_np) is protected by a check in
> meson in a patch later in tihs series.
> 
> Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> [Will Cohen: - Adjust coding style
>               - Replace clang references with gcc
>               - Note radar filed with Apple for missing syscall
>               - Replace direct syscall with pthread_fchdir_np and
>                 adjust patch notes accordingly]
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> ---
>   hw/9pfs/9p-local.c       |  5 +++--
>   hw/9pfs/9p-util-darwin.c | 27 +++++++++++++++++++++++++++
>   hw/9pfs/9p-util-linux.c  |  5 +++++
>   hw/9pfs/9p-util.h        |  2 ++
>   4 files changed, 37 insertions(+), 2 deletions(-)

> diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> index 8e610ad224..f6fed963bf 100644
> --- a/hw/9pfs/9p-util.h
> +++ b/hw/9pfs/9p-util.h
> @@ -97,6 +97,8 @@ ssize_t flistxattrat_nofollow(int dirfd, const char *filename,
>   ssize_t fremovexattrat_nofollow(int dirfd, const char *filename,
>                                   const char *name);
>   
> +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev);

I think this belong to "osdep.h" & os-posix.c.

