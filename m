Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A5D6D9713
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 14:35:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkOof-0001Cb-Ou; Thu, 06 Apr 2023 08:34:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pkOod-0001Bo-Br
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 08:34:11 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pkOob-0006xR-JO
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 08:34:11 -0400
Received: by mail-wr1-x436.google.com with SMTP id r11so39343888wrr.12
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 05:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680784447;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ds/F9OlROTEKxLkVyHV0gRUJPwdvQ4uY5VLl4wwZEws=;
 b=wBmHhLYbOjnELI1Sd88BPhPrCCIRMRLQ8OAyksMWNdBTQ1owNkZ0vxhpJT+j97Y2BA
 4bGH84SqPBTzBWHnyyUDblLoEQQ6zFH1wEcEOVyzM+GPzHf5wvVSmSZpTyJxFn7a/uWJ
 xra9FLSBjPXkIJpx3Wo2+9tGPtE2hIdqfpOcGIi4TT1yHe/kKJKzMgN+NlX/N+WUOFgQ
 RbqaOO3QkuK2Dm0WV460TxCiYMcukEqfVC+vsYg3UvKs9xhBIqIf2cFWGQTGQHqrBaLR
 Fq4/IQXdb97O3Zn0uKVutaBmPBTZsgRYWzGXEd28PZNnIYbiBBl/U64adwpGUk7H1THe
 hKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680784447;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ds/F9OlROTEKxLkVyHV0gRUJPwdvQ4uY5VLl4wwZEws=;
 b=yUwxxNOC61h0W8optvxRkO1dPkqh833SoRfU9zdrWYjqTfrbTyL6PpSfBAafE4OaLd
 XpCGmlQ498UVKNpukY71/UvvaUB7L4/1BV9ZXow9Il6Qts7SYdn34e1Yo0irlgzyeSgZ
 efcjqHgHASjQ2bAq2f41hHDaev1f79FA0rYVTvM54zN9/ztUz5moWD+UicvRxC3K/Jlf
 21EnibcVPcEsecHKUJLayyRru6ywU/LftIQOUC+afs/NvfbEutpHhA1MYLcNv90DegG0
 By20lEVFPjSDF/SnTkNRUCGxf1bawtLNfYRatDx61a1nN6lZvMEKNrhZGN3J3XkxD53P
 p77g==
X-Gm-Message-State: AAQBX9ezRmuau88//i/XNxva9F1oQY1Mp/yx0ULHgkEQ1ii+mreBd0uY
 oZ4wDoj/hrXM2DwIUtzlvfiTHw==
X-Google-Smtp-Source: AKy350ZxJC+l3qt9cG+0WN7HV5u8NyC3NVD5rvgqxVEmNvlnppyVmO55/1DzDwOSF6kDgQdbFuNLew==
X-Received: by 2002:adf:e7ce:0:b0:2ef:1088:1100 with SMTP id
 e14-20020adfe7ce000000b002ef10881100mr1382313wrn.52.1680784447430; 
 Thu, 06 Apr 2023 05:34:07 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f4-20020adff8c4000000b002cff06039d7sm1690826wrq.39.2023.04.06.05.34.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Apr 2023 05:34:07 -0700 (PDT)
Message-ID: <8e935a0b-583b-ed14-fded-b0af760ae99d@linaro.org>
Date: Thu, 6 Apr 2023 14:34:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH] net: tap: Drop the close of fds for child process
Content-Language: en-US
To: Bin Meng <bmeng@tinylab.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org
Cc: Zhangjin Wu <falcon@tinylab.org>
References: <20230406112041.798585-1-bmeng@tinylab.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230406112041.798585-1-bmeng@tinylab.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.224,
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

On 6/4/23 13:20, Bin Meng wrote:
> Current codes using a brute-force traversal of all file descriptors
> do not scale on a system where the maximum number of file descriptors
> are set to a very large value (e.g.: in a Docker container of Manjaro
> distribution it is set to 1073741816). QEMU just looks freezed during
> start-up.
> 
> The close-on-exec flag was introduced since a faily old Linux kernel
> (2.6.23). With recent newer kernels that QEMU supports, we don't need
> to manually close the fds for child process as the proper O_CLOEXEC
> flag should have been set properly on files that we don't want child
> process to see.

But this file is common to all POSIX implementations, not only Linux.

> Reported-by: Zhangjin Wu <falcon@tinylab.org>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> ---
> 
>   net/tap.c | 14 --------------
>   1 file changed, 14 deletions(-)
> 
> diff --git a/net/tap.c b/net/tap.c
> index 1bf085d422..49e1915484 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -446,13 +446,6 @@ static void launch_script(const char *setup_script, const char *ifname,
>           return;
>       }
>       if (pid == 0) {

Maybe guard with #ifndef O_CLOEXEC

> -        int open_max = sysconf(_SC_OPEN_MAX), i;
> -
> -        for (i = 3; i < open_max; i++) {
> -            if (i != fd) {
> -                close(i);
> -            }
> -        }

or add qemu_close_cloexec() in util/osdep.c similar to qemu_open_cloexec()?

>           parg = args;
>           *parg++ = (char *)setup_script;
>           *parg++ = (char *)ifname;
> @@ -536,17 +529,10 @@ static int net_bridge_run_helper(const char *helper, const char *bridge,
>           return -1;
>       }
>       if (pid == 0) {
> -        int open_max = sysconf(_SC_OPEN_MAX), i;
>           char *fd_buf = NULL;
>           char *br_buf = NULL;
>           char *helper_cmd = NULL;
>   
> -        for (i = 3; i < open_max; i++) {
> -            if (i != sv[1]) {
> -                close(i);
> -            }
> -        }
> -
>           fd_buf = g_strdup_printf("%s%d", "--fd=", sv[1]);
>   
>           if (strrchr(helper, ' ') || strrchr(helper, '\t')) {


