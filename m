Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FDB4A6849
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 23:57:52 +0100 (CET)
Received: from localhost ([::1]:35766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF25v-00041N-Gx
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 17:57:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF0MQ-0000Op-Rc
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:06:47 -0500
Received: from [2607:f8b0:4864:20::1034] (port=34443
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF0MP-0008OM-6T
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:06:46 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 l24-20020a17090aec1800b001b55738f633so2496454pjy.1
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 13:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GncSM3UTT8yCWufXlSwnVqqpIcQX4tfctubHHLWxHTU=;
 b=PLce8Wnk2KB6Ku+LLF7Ia577pEgjLAvWTPoyeT9xXAM0Nfxi9rZWOtJVFSyVWNEKkk
 3r3NcnHvrLfej04vl6ecQmDW9J7j5WTaSEY1N87eN76jNUygufPxMNx3tDA8k3t7Uu1i
 g0mIVCT3olOwsLK7VEUvXD0K1J8CTAYQ2DeWkalBYoiPDRVZoMOL+A5m+MfBbggPYqxA
 /QSs7FfHmBIOnPgb6ee+EF2evz3AAlA9SDE8DDGlFbJB+6KGRZeLkO9gxipdBqcelQ3O
 9aeH1ybq/w6ayvAIBKoH846hx4dAUxLaOXYgx8fVoFWaPPnB6ZjXao/PYwtyiyQ24d6x
 rowg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GncSM3UTT8yCWufXlSwnVqqpIcQX4tfctubHHLWxHTU=;
 b=3d5f7UfpJkkSR0XlRuqLS0tQ7uOWnsoqcD0ouQwD1hpEs8KGFTQyA8zv0+EfFo0dIo
 ApBbHUA2K+PJ9lS3AVPb2dIogENwANI8poCLWFZ89BQzoh62mvwAl3kEQG2BgSNIy+nm
 Y6XEKM3aE2yTXf64wNr+zQBC8idoK/6GQSohp7eMnr66aVycOvg8Vy0Yug5lHQLwwHCn
 Lb7sLIJ0H5txgeEjYpQ9iauy05PSXaPMZmqcM6Ak7Mfvk/XBycFlo8ftmNxC9We32CJP
 BRb091z/+MBKw8TM56EyOYuSk8redvJy9wBQbjcxTnTgM0wvEW3vv+zhPeWOZkFNYMry
 ovtw==
X-Gm-Message-State: AOAM532LWLyf2A/xVUXUHqyH2l2r4IBVGYWADaG78FEn8KMG2dW++sYO
 O4i0VXra1NVEahXo9Ud5AHXmKQ==
X-Google-Smtp-Source: ABdhPJwv8TT4cOHcIUbOgo3nrwsGpT7YJYRPPiJi3X0jfA879A0gqXujdqYIQQU7WLVlC6/pgFofog==
X-Received: by 2002:a17:90b:4ad2:: with SMTP id
 mh18mr4480877pjb.51.1643749603400; 
 Tue, 01 Feb 2022 13:06:43 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:4f14:faaf:dae:66e4?
 ([2001:8003:3a49:fd00:4f14:faaf:dae:66e4])
 by smtp.gmail.com with ESMTPSA id x1sm23151281pfh.167.2022.02.01.13.06.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 13:06:42 -0800 (PST)
Message-ID: <a56162d7-bb87-f86c-cb48-8ef26ace0ad4@linaro.org>
Date: Wed, 2 Feb 2022 08:06:37 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] bsd-user/signal.c: Only copy the _capsicum for
 FreeBSD_version > 1400026
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220201205251.57691-1-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201205251.57691-1-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Kyle Evans <kevans@freebsd.org>, alex.bennee@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/22 07:52, Warner Losh wrote:
> The capsicum signal stuff is new with FreeBSD 14, rev 1400026, so only
> copy them on a new enough system.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/signal.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/bsd-user/signal.c b/bsd-user/signal.c
> index ad22ba9d90d..b43266e6e06 100644
> --- a/bsd-user/signal.c
> +++ b/bsd-user/signal.c
> @@ -242,8 +242,10 @@ static inline void host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
>            * one, then we know what to save.
>            */
>           if (sig == TARGET_SIGTRAP) {
> +#if defined(__FreeBSD_version) && __FreeBSD_version >= 1400026
>               tinfo->_reason._capsicum._syscall =
>                   info->_reason._capsicum._syscall;
> +#endif
>               si_type = QEMU_SI_CAPSICUM;
>           }

Do you really want the entire IF inside the ifdef?
Setting QEMU_SI_CAPSICUM doesn't make sense for earlier versions...


r~

>           break;
> @@ -296,8 +298,10 @@ static void tswap_siginfo(target_siginfo_t *tinfo, const target_siginfo_t *info)
>           __put_user(info->_reason._poll._band, &tinfo->_reason._poll._band);
>           break;
>       case QEMU_SI_CAPSICUM:
> +#if defined(__FreeBSD_version) && __FreeBSD_version >= 1400026
>           __put_user(info->_reason._capsicum._syscall,
>                      &tinfo->_reason._capsicum._syscall);
> +#endif
>           break;
>       default:
>           g_assert_not_reached();


