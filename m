Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E7C50B7FB
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 15:12:01 +0200 (CEST)
Received: from localhost ([::1]:54808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nht4q-0006gY-4F
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 09:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhsHT-0001Ie-Be
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 08:21:06 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:34809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhsHQ-00026H-Ap
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 08:20:58 -0400
Received: by mail-pl1-x630.google.com with SMTP id n8so10505687plh.1
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 05:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DWcaeb2c/q6ywWr1X+M0eZJfnflSe0JoNlAumWCP6+c=;
 b=fKc1YNU9pEmpoPN8O8+kDGz1PIuljpD1jiI9y3j5Gz+nS1Iq8VMJqptMnSnEE2QKbr
 OnO+VcsCS7/1ZWVOdNCMD5UrIdrbhJF4X2y5WbyFVJfbhScc3zwwBn7XXyvDK05069rH
 6ZK9mi6bC7WV+oebrctOSlFjeM2xTWTjrMaw53JvLSmHqRup7Ymi+1eYlzy8jtLoWDG6
 M82cctw7nihnMS+mQ4WUva6WE6NLoERNAUVuCcQW/tzjObSWgKsQNpfvFr70eyUiRuwO
 /ckvuCNAAynb/WTD1/khhqG3sVuR83FaqPqxoDAQNzQ/CPslZHK6Whi8VJs6HIHjCFgU
 k3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DWcaeb2c/q6ywWr1X+M0eZJfnflSe0JoNlAumWCP6+c=;
 b=422EKs0KdRCbao+WGO5o9fvBNVKqa4u882s1BBZpI8ZnzKWnAz4w5dCNzxeQpLfQj2
 +lUY2CKxrnOIB4+KHlnnN3zNz/QduaVeiyCInxfrVE/oP7Bd4VrHJ9ARaTsMUtXB9mnw
 Ab5c+fvVx/CGlcC5hNBAN/0UWZSFga+MVFZQEIZoVwVnaHL/vB0pjaMmJBPMvhF80msN
 demhv0QLXY55kYGF8BX3gTNkIfgd89p6WQB/4qJymIuiXkBU3/bdoQNNOPd9jSqs2WyR
 QkUXVfR9ck+BeK/kWXg73S6LHedRJRoT3BrStuANBoXETW1Ptgcri2rkaiWFg8adLiJO
 qQrg==
X-Gm-Message-State: AOAM533Lze4YXbSuUPMXc/qKIZiZXJaK+QZxgKpcgwCwQS7dXhqyoU2v
 2gsXle2zv7oVBtOi/wri21B8Lw==
X-Google-Smtp-Source: ABdhPJwekJFu1VdI3gabuYkEJaMp7Oow2/jbcsBOMz+NuzWUxcR79rfVqtYTvg+1+xqxef1QP5Y2GA==
X-Received: by 2002:a17:902:b597:b0:158:1aee:1b59 with SMTP id
 a23-20020a170902b59700b001581aee1b59mr4200604pls.33.1650630048307; 
 Fri, 22 Apr 2022 05:20:48 -0700 (PDT)
Received: from ?IPV6:2607:fb90:27d0:b0f2:1f9b:37fb:18e0:1dd4?
 ([2607:fb90:27d0:b0f2:1f9b:37fb:18e0:1dd4])
 by smtp.gmail.com with ESMTPSA id
 a21-20020a62bd15000000b00505b8bad895sm2458504pff.106.2022.04.22.05.20.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 05:20:47 -0700 (PDT)
Message-ID: <0f4c56d3-dfe7-bae6-925c-8b605d4e669d@linaro.org>
Date: Fri, 22 Apr 2022 05:20:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 09/10] block: move fcntl_setfl()
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220422083639.3156978-1-marcandre.lureau@redhat.com>
 <20220422083639.3156978-10-marcandre.lureau@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220422083639.3156978-10-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, "open list:raw" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/22 01:36, marcandre.lureau@redhat.com wrote:
> +/* Sets a specific flag */
> +static int fcntl_setfl(int fd, int flag)
> +{
> +    int flags;
> +
> +    flags = fcntl(fd, F_GETFL);
> +    if (flags == -1)
> +        return -errno;
> +
> +    if (fcntl(fd, F_SETFL, flags | flag) == -1)
> +        return -errno;
> +
> +    return 0;
> +}
> +
>   static int raw_reconfigure_getfd(BlockDriverState *bs, int flags,
>                                    int *open_flags, uint64_t perm, bool force_dup,
>                                    Error **errp)
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index 543c9944b083..1c231087408f 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -794,21 +794,6 @@ size_t qemu_get_host_physmem(void)
>       return 0;
>   }
>   
> -/* Sets a specific flag */
> -int fcntl_setfl(int fd, int flag)
> -{
> -    int flags;
> -
> -    flags = fcntl(fd, F_GETFL);
> -    if (flags == -1) {
> -        return -errno;
> -    }
> -    if (fcntl(fd, F_SETFL, flags | flag) == -1) {
> -        return -errno;
> -    }
> -    return 0;
> -}

Lost braces in the move.

r~

