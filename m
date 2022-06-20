Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B6E552477
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 21:17:59 +0200 (CEST)
Received: from localhost ([::1]:51148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3MuM-0006Rm-GA
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 15:17:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3MqC-0003ra-VK
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 15:13:42 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:51941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3MqB-0005uu-7r
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 15:13:40 -0400
Received: by mail-pj1-x1030.google.com with SMTP id f16so9632222pjj.1
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 12:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+dmaT4R+NQXvoacNlaSECDIagb/kfWPz5lAa6OoI4R4=;
 b=ss//aluffGcZ9hTsseEtT/tnVUoSPE2u5kMW5bsw2Qy5Oc9JRcnYW+0EoVCD9mnlXf
 7Ts0+4BuyEv5FZmkLWmmJ+40t7DBF8Fs3WfyS0J0JiEAsqSe9rSNmy7vemH9AhT7yKeu
 4ywEU9HKydZmkqSF8f4x4Yw6SNro+15fpK27A2dTe5DJbNHeY/DzeZX6QZ6X8RgpOqW+
 ZZVtzHRoRQQboCZnD4J7cCF2eHgC2YQPpqVfZ4QDgL2KYX3RjxB+xV52FcOLy1ZvXrMl
 pbKnKeiciH0DpekzlIR+kXu75kIuNGimMU76ybxqARz8j81l2o2XefkIp6UehUlzVGJn
 itIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+dmaT4R+NQXvoacNlaSECDIagb/kfWPz5lAa6OoI4R4=;
 b=DXdQp2bL/jSmydpA8skoj753I7wZPZu8CJuHkGS620+al7xRd+9T+BgKQhwky/xJgu
 1rbcdAvnnJObC3c2BIZV5AAsbYQ7DUaJ4g0Mtb+mqYEGHf2Z8zATafoEpIRiPKw94JdZ
 +kXt0tjUztJMMe++sUcapdvUVyd0wwOS6oQz96VZaOnlRk9RV58D7j8hz6huxaRY3Ozo
 xU+YpjErKM4jxldEZ1GDMNYHaTTKgAAVxzjv6fkV7KSAzdrNK4WphH0b6saD7Tqkufri
 MalKi0Z5wlbdjEHuKtdwecd7KvnlLhRijq9jjPK8CgaPBm+Ok0uqrluPXm6z7nx48CuF
 IdCQ==
X-Gm-Message-State: AJIora/k+n6X8MbKJbao/O+fzXw3599cPgwknnaS7q+pNrLfHNlYkVSK
 XVOjFejFCjOK/HzgqnF+pYoXLQ==
X-Google-Smtp-Source: AGRyM1uIdRqtuEJ6B7qQ928FRhvXKarSSTh4WW6gzq5/OOZb4nqx+duwehPHuMM2jLKjKNSHMUtPWw==
X-Received: by 2002:a17:902:e84c:b0:167:6ef7:b09b with SMTP id
 t12-20020a170902e84c00b001676ef7b09bmr24608397plg.43.1655752417392; 
 Mon, 20 Jun 2022 12:13:37 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:a3e0:8a80:7b85:aea6?
 ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 y21-20020a056a00191500b005252867671esm39832pfi.66.2022.06.20.12.13.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 12:13:36 -0700 (PDT)
Message-ID: <76249ff6-cd3c-5b1c-f480-8c10c5b04429@linaro.org>
Date: Mon, 20 Jun 2022 12:13:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 04/10] bsd-user: Implement freebsd11_mknod,
 freebsd11_mknodat and mknodat
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 Michal Meloun <mmel@FreeBSD.org>
References: <20220620174220.22179-1-imp@bsdimp.com>
 <20220620174220.22179-5-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220620174220.22179-5-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/20/22 10:42, Warner Losh wrote:
> These implement both the old-pre INO64 mknod variations, as well as the
> now current INO64 variant. To implement the old stuff, we use some
> linker magic to bind to the old versions of these functions.
> 
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Michal Meloun <mmel@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/bsd-file.h           | 59 +++++++++++++++++++++++++++++++++++
>   bsd-user/freebsd/os-syscall.c | 15 +++++++++
>   2 files changed, 74 insertions(+)
> 
> diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
> index 0585f6a2a40..3be832b2a74 100644
> --- a/bsd-user/bsd-file.h
> +++ b/bsd-user/bsd-file.h
> @@ -51,6 +51,16 @@ do {                                        \
>       unlock_user(p1, arg1, 0);               \
>   } while (0)
>   
> +#ifndef BSD_HAVE_INO64
> +#define freebsd11_mknod         mknod
> +#define freebsd11_mknodat       mknodat
> +#else
> +int freebsd11_mknod(char *path, mode_t mode, uint32_t dev);
> +__sym_compat(mknod, freebsd11_mknod, FBSD_1.0);
> +int freebsd11_mknodat(int fd, char *path, mode_t mode, uint32_t dev);
> +__sym_compat(mknodat, freebsd11_mknodat, FBSD_1.1);
> +#endif

Where does BSD_HAVE_INO64 come from?  I can't find it defined in freebsd git.

You should probably avoid the linker tricks and use direct syscalls of 
SYS_freebsd11_mknodat etc.


r~

