Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E626B53A0
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 22:59:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakkx-0000i9-Eh; Fri, 10 Mar 2023 16:58:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pakkv-0000hl-GM
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 16:58:29 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pakku-0000as-25
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 16:58:29 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so4359915wmi.3
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 13:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678485506;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OH6mYKPt9GYT+C/CdHbxApqn9kia0AklviTs37HM6zo=;
 b=uVKok2BmSs9wydJBUhTZcMWNF8B4OlS0tMVsuGYHozrdtJNEAJpPLm1AZrEomoSm6I
 61LIUymHtm94RcGyWoHMvzbpMxGV4gkGnzmQx2GDxA1fSCnW2HI9A3sCGwyatvF5/3Ba
 NjYjjEMfpUwWm0cqKKk7ZGY/xN9zuSJj8d4f1yOs1RAHRASERhMhtZfwHlvGvn7tANQs
 nWju06jAAmq2TvGPuU+2UAnb6zu6shsXUV+H7OFM/k2SIL/WL3SF9i8UmKWBTLEVLQG+
 D0H9z+TUerttzKaRKLZqXp2LITDuABF47W45FEA8GoypU+Lf/3HvJMFveSaF1ZQuZDbK
 l/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678485506;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OH6mYKPt9GYT+C/CdHbxApqn9kia0AklviTs37HM6zo=;
 b=7FtbjorB17oAh+ulH7aZ6+5QS69YHfyB8HriqK862ekfNrcNT/p+q0f2q5sWKSvQ3Q
 88VMKu1bZNvhmFp+QZLRny9B2H5S/ZTpRaM3abQnoIMYnIjxYG/sQrhOYjVWPCYKI0yb
 oGt7v1k+4+4eiS033mPaTNRImjD06gGovrY/YGt6ksNzkULFr+7OmM5bcDoKTRGjWN3g
 W1hjzj8nwSJW6S8pJmPbvpqK8hv0P7kq1o/T+8kmtZVGM4UZ2QDzokLbNU+xWgkT4ZgI
 ryXsmGyyICCV4rbSNpF5WNw8VvLvUCigtwzkOey3mP0LDsXVZUMvaDnU7xmr2PYtTInr
 Sp/g==
X-Gm-Message-State: AO0yUKV1XEwtLzuKiW5RbNZye+bt2Cq+t8dTvsJusfw+PXMXsbDdGGMc
 0fcK3Fg4/zr6/ROs4X8oa6fCyQ==
X-Google-Smtp-Source: AK7set8Hhl1nPJ387ORQ3vMXz3hkt94PgETS7UsOfsUNJTlnba1AuqTy8ZT1r9fcBDhWGesE3gI2dg==
X-Received: by 2002:a05:600c:540a:b0:3ea:e582:48dd with SMTP id
 he10-20020a05600c540a00b003eae58248ddmr4282149wmb.34.1678485506416; 
 Fri, 10 Mar 2023 13:58:26 -0800 (PST)
Received: from [192.168.1.115] (116.red-88-29-161.dynamicip.rima-tde.net.
 [88.29.161.116]) by smtp.gmail.com with ESMTPSA id
 p3-20020a7bcc83000000b003eafc47eb09sm1084118wma.43.2023.03.10.13.58.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 13:58:25 -0800 (PST)
Message-ID: <71e8a6ab-9b56-fe0b-af6c-64a347e94a78@linaro.org>
Date: Fri, 10 Mar 2023 22:58:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 05/10] contrib/gitdm: Add SYRMIA to the domain map
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Milica Lazarevic <milica.lazarevic@syrmia.com>
References: <20230310180332.2274827-1-alex.bennee@linaro.org>
 <20230310180332.2274827-6-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230310180332.2274827-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 10/3/23 19:03, Alex Bennée wrote:
> The company website lists QEMU amongst the things they work on so I
> assume these are corporate contributions.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Milica Lazarevic <milica.lazarevic@syrmia.com>
> ---
>   contrib/gitdm/domain-map | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


