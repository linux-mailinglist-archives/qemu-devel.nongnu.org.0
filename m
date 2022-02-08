Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4334AD610
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 12:19:00 +0100 (CET)
Received: from localhost ([::1]:48742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHOWR-0004rt-9S
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 06:18:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHOAE-000141-DM
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:56:02 -0500
Received: from [2607:f8b0:4864:20::42c] (port=44883
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHOAB-00031H-JW
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:56:00 -0500
Received: by mail-pf1-x42c.google.com with SMTP id n32so18188072pfv.11
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 02:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ph/AhMwqbx2ANb9wBrM0oeygA88Z7nVuQKxDdhAD5mM=;
 b=V9XrDTT8sKOy5r0ITqMu0MZOIELc9NzbI3c+z7wXanc8g4JmnQubxPMUruipSzB5AG
 35PoGVeavbhK0nH3YMV3DIOVgIylzIRH8KdK/SiUedRTihAckofE1yMaFEx82L/wjLk0
 KyXeFJ3mk0iCHBVr1tYrWlLTLeb9Jt+T7qL51LGUze8NiiRBlJcLIQK5BKEMQKaM7gnA
 GoTJGvPV1Aj27AF/4S75spxbifrgXTO8zzhieOuahpUUqzfPAkqV1cpo4wLvhXBvRELD
 UDHdi5DAIlix0DACD6t5wvSH9AOAEonKJQNXjsKKY/BPv1lFHh+iX4b9ZCxDzI3qzO9E
 MJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ph/AhMwqbx2ANb9wBrM0oeygA88Z7nVuQKxDdhAD5mM=;
 b=waArS20ldvUziFSnWD00FkCmBnV4rfCI1MmeLtBPK7bZMcu5qSp0+S3TJq6b0z2eYF
 17pN5FAXAL8213yWjt/b6Y1/U/cdRVTKeeDQq6hwRVoaJUXhJ5qC6HrIPM630g4J6qZd
 s4bh+DPT32oGB5ouMAoB+uxulD5tvDsBt2/tarvaLNwN6qYBvo+6MTpJRy0UZiXWFEuU
 pfCsLBppdWkugyV+5WbKpYx8D4XcWpwZsQ5vdmQ9PenUfEsDiq5RybX+f8wf5mHoad/T
 M44BOfJBpbkLONVfYWA+ccZyr3UQVa6xsqHqccklYWMuJNTXL37vJklMpKYaZCGQqFzD
 kfTA==
X-Gm-Message-State: AOAM533O4t0fRDbFUwAagRjCeYY81nJrVIdDWegBxKovV++gixVKu7+0
 bJ9UkVwEz31styNDNa5Tx6E=
X-Google-Smtp-Source: ABdhPJyFULlHt1ROe07v/DMEaK2i/UY0sy2A0KUykekkRVxwMTEUx0a5xIgG4rhQFt3IYPRYEOARPw==
X-Received: by 2002:a63:485f:: with SMTP id x31mr3066133pgk.358.1644317758199; 
 Tue, 08 Feb 2022 02:55:58 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id gx10sm2362647pjb.7.2022.02.08.02.55.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 02:55:57 -0800 (PST)
Message-ID: <61d9987c-9b9d-972d-0be1-835a1d063534@amsat.org>
Date: Tue, 8 Feb 2022 11:55:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v5 09/11] 9p: darwin: Implement compatibility for mknodat
Content-Language: en-US
To: Will Cohen <wwcohen@gmail.com>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>
References: <20220207224024.87745-1-wwcohen@gmail.com>
 <20220207224024.87745-10-wwcohen@gmail.com>
In-Reply-To: <20220207224024.87745-10-wwcohen@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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

On 7/2/22 23:40, Will Cohen wrote:
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
>                 adjust patch notes accordingly
>               - Move qemu_mknodat from 9p-util to osdep and os-posix]
> Signed-off-by: Will Cohen <wwcohen@gmail.com>
> ---
>   hw/9pfs/9p-local.c   |  4 ++--
>   include/qemu/osdep.h | 10 ++++++++++
>   os-posix.c           | 34 ++++++++++++++++++++++++++++++++++
>   3 files changed, 46 insertions(+), 2 deletions(-)

> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index d1660d67fa..f3a8367ece 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -810,3 +810,13 @@ static inline int platform_does_not_support_system(const char *command)
>   #endif
>   
>   #endif
> +
> +/*
> + * As long as mknodat is not available on macOS, this workaround
> + * using pthread_fchdir_np is needed. qemu_mknodat is defined in
> + * os-posix.c
> + */
> +#ifdef CONFIG_DARWIN
> +int pthread_fchdir_np(int fd);
> +#endif
> +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev);

Misplaced. You want the declaration before the __cplusplus guard.

