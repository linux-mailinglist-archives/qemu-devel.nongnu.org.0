Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7247467C09B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 00:09:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKosi-0004Qy-MS; Wed, 25 Jan 2023 18:08:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKosh-0004Qh-Ia
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 18:08:39 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKosf-00044Q-RD
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 18:08:39 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso66845wms.3
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 15:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YcTZbghtFEAk1fN92o7MECJbnyF6JESvOGgHxAOjppY=;
 b=VLIskGI6D5D6IJRgBGnxQhLasV8PqQ4HSPGyt4cmNx9YrGQY4Rh2sW6P1LaseUry3p
 51pcXxdo2SOkTwymqljbGsFISMijmYbUwf3UJRajFiSTveWRV1GfCLNW5if6WjvKCbHE
 SH1oqCu8nvKpvmnjiqratREnkupknlbqVKaNaY1dTCyeKYyXS6w9d/Iz9qYJbtdZuNuU
 d+wWTsovRVr+vfX3LXekdLC+cLYRgS3g0dp8NxL36dFspJ7SRudFBohn3MFIuXG6Bhl1
 lTKTjjLdO8Pr8lKj+BTLU+EuGoJgsgKBmwT0fHakV7LljRphSvm4Hokh/IerYBMgTCny
 gCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YcTZbghtFEAk1fN92o7MECJbnyF6JESvOGgHxAOjppY=;
 b=SK7Ah0tTpFASkYOKTIwvAAcnLDZXMx/ZIxjZoJYKuUSTx7SqYUzHQdvqMSMfC9xIx4
 XaolE4wcmLZ9azp3cz6131iGD2YZUjXZ5SqDsnOU/jy5w0y2gMwZVo0tHzvC9wIL+iJ4
 TXrHSipW3xMRpJ9atFyUYsKDUNYCI8+EYkrhAPdYKJRSVNuDzdyRHe70ee1TlO6P5xC+
 1TXlAqnw46kyNGiW7czXYekj0/n3NWlH0uIiSpA2UGWxB4V+gZ4OuIKH2a9KRulXypxF
 n34dEMV7elKrQUvBjOxpJgR8h6eWWDvldDeTaCw8ghApbREAGIaEs7QdpLedmnm4w1a/
 dvdQ==
X-Gm-Message-State: AFqh2kqnce6fq7EoCBkgpDZJKO6xgvIRhzDcyF8JP9bGcFYzOLrJN8DA
 J+mIJILvNhyx7TgpW0ZkC/A6EA==
X-Google-Smtp-Source: AMrXdXvCxH9UQ+oUgRo1YLOayveyAiSaYPkYvqNStF5kanErvDbzk6WNf8wjWfVi7kBjFzp/+8PeWw==
X-Received: by 2002:a05:600c:3d96:b0:3db:26b7:2fc8 with SMTP id
 bi22-20020a05600c3d9600b003db26b72fc8mr24477273wmb.39.1674688116043; 
 Wed, 25 Jan 2023 15:08:36 -0800 (PST)
Received: from [192.168.0.114] ([196.77.22.181])
 by smtp.gmail.com with ESMTPSA id
 ip6-20020a05600ca68600b003d04e4ed873sm3010884wmb.22.2023.01.25.15.08.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 15:08:35 -0800 (PST)
Message-ID: <be81c4e3-960e-05a4-cdb1-192a9e7f33a4@linaro.org>
Date: Thu, 26 Jan 2023 00:08:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 3/3] util/userfaultfd: Support /dev/userfaultfd
Content-Language: en-US
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
References: <20230125224016.212529-1-peterx@redhat.com>
 <20230125224016.212529-4-peterx@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230125224016.212529-4-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 25/1/23 23:40, Peter Xu wrote:
> Teach QEMU to use /dev/userfaultfd when it existed and fallback to the
> system call if either it's not there or doesn't have enough permission.
> 
> Firstly, as long as the app has permission to access /dev/userfaultfd, it
> always have the ability to trap kernel faults which QEMU mostly wants.
> Meanwhile, in some context (e.g. containers) the userfaultfd syscall can be
> forbidden, so it can be the major way to use postcopy in a restricted
> environment with strict seccomp setup.
> 
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   util/trace-events  |  1 +
>   util/userfaultfd.c | 36 ++++++++++++++++++++++++++++++++++++
>   2 files changed, 37 insertions(+)
> 
> diff --git a/util/trace-events b/util/trace-events
> index c8f53d7d9f..16f78d8fe5 100644
> --- a/util/trace-events
> +++ b/util/trace-events
> @@ -93,6 +93,7 @@ qemu_vfio_region_info(const char *desc, uint64_t region_ofs, uint64_t region_siz
>   qemu_vfio_pci_map_bar(int index, uint64_t region_ofs, uint64_t region_size, int ofs, void *host) "map region bar#%d addr 0x%"PRIx64" size 0x%"PRIx64" ofs 0x%x host %p"
>   
>   #userfaultfd.c
> +uffd_detect_open_mode(int mode) "%d"
>   uffd_query_features_nosys(int err) "errno: %i"
>   uffd_query_features_api_failed(int err) "errno: %i"
>   uffd_create_fd_nosys(int err) "errno: %i"
> diff --git a/util/userfaultfd.c b/util/userfaultfd.c
> index 9845a2ec81..360ecf8084 100644
> --- a/util/userfaultfd.c
> +++ b/util/userfaultfd.c
> @@ -18,10 +18,46 @@
>   #include <poll.h>
>   #include <sys/syscall.h>
>   #include <sys/ioctl.h>
> +#include <fcntl.h>
> +
> +typedef enum {
> +    UFFD_UNINITIALIZED = 0,
> +    UFFD_USE_DEV_PATH,
> +    UFFD_USE_SYSCALL,
> +} uffd_open_mode;
> +
> +static uffd_open_mode open_mode;

'open_mode' could be reduced to uffd_detect_open_mode()'s
scope.

> +static int uffd_dev;
> +
> +static uffd_open_mode uffd_detect_open_mode(void)
> +{
> +    if (open_mode == UFFD_UNINITIALIZED) {
> +        /*
> +         * Make /dev/userfaultfd the default approach because it has better
> +         * permission controls, meanwhile allows kernel faults without any
> +         * privilege requirement (e.g. SYS_CAP_PTRACE).
> +         */
> +        uffd_dev = open("/dev/userfaultfd", O_RDWR | O_CLOEXEC);
> +        if (uffd_dev >= 0) {
> +            open_mode = UFFD_USE_DEV_PATH;
> +        } else {
> +            /* Fallback to the system call */
> +            open_mode = UFFD_USE_SYSCALL;
> +        }
> +        trace_uffd_detect_open_mode(open_mode);
> +    }
> +
> +    return open_mode;

If 'open_mode' isn't relevant, this function could return uffd_dev/-1 
instead. Not really an improvement :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +}
>   
>   int uffd_open(int flags)
>   {
>   #if defined(__linux__) && defined(__NR_userfaultfd)
> +    if (uffd_detect_open_mode() == UFFD_USE_DEV_PATH) {
> +        assert(uffd_dev >= 0);
> +        return ioctl(uffd_dev, USERFAULTFD_IOC_NEW, flags);
> +    }
> +
>       return syscall(__NR_userfaultfd, flags);
>   #else
>       return -EINVAL;


