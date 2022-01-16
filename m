Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C95E48FF0F
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Jan 2022 22:19:02 +0100 (CET)
Received: from localhost ([::1]:47186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9CvV-0005QS-5v
	for lists+qemu-devel@lfdr.de; Sun, 16 Jan 2022 16:19:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9CtP-0003uV-SM
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 16:16:51 -0500
Received: from [2a00:1450:4864:20::532] (port=46934
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9CtO-0002Ax-D3
 for qemu-devel@nongnu.org; Sun, 16 Jan 2022 16:16:51 -0500
Received: by mail-ed1-x532.google.com with SMTP id k15so57212135edk.13
 for <qemu-devel@nongnu.org>; Sun, 16 Jan 2022 13:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yoWimvA0Ds4AjdE7ZXYhAtk3yUS97KL8ETfpPX7AopQ=;
 b=jbGOJW8Kpa88z7NzOMqqPuXSTFiPilvIYGBJCQgEpWnKhNdjQIAH9dYYa6nT1/Gobr
 iU9OkA30JvrIuQMt+S/Ok3IjlC7Rxj/Y+nvb8qHb1WcZME5cg8dyjzuvB+NYA8e5gs2t
 huOrGPkRMK6Sa2e98IK3kigKkmwkbsqFHstjfU5bu4RIF4Sv5t1R9IQNMNwN3a3gy1GF
 7P9+BzedFo2IMkeYTZWzCx2xD+RWbfleclOIMa6zzDwNO5QijdZMvvImEwTv17s7yAc/
 0gKfYt9K0F3skAFQDBHLzRfPPmoGQAc3c+IZFUhUFrE1f2wouqOADi9ggmtW2t5th8oG
 HwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yoWimvA0Ds4AjdE7ZXYhAtk3yUS97KL8ETfpPX7AopQ=;
 b=Ly+sSFLWjPUUKBzaa1TUNgiyZ+2jBrXoSRuXo0VQLMRf4D7+EX8Dz18lS5x1B7JO4T
 aToJ0AsAlUNFxn0RZ8cmsxMy3nzxHtGGEwTfk0WG+gvvcddzBLhokFBsot+BCr9zeU8e
 3PW6oOLKIEefi33Mig2YCxGeorinAylPKmyFNMermzAHCGSvvsSUFkZN+QeXkNO944L5
 UWRSi6akEF2YscFMpDugKRWCoLvnyI1iLRCnc+Gnc/YE/Kfy9GqdwColz4mhraJnrGsS
 iSnSWCMfDNtFT1FYDWuRvWyxRo7kVsRpR1wq+m433NVUTy3Ld9GU0cRePFWK48LCtlPv
 mrnw==
X-Gm-Message-State: AOAM530y7vWD1Pr0u6o9Ed+2z8xUZ82NPj1YkkVwBiWDEJKBllVH5m45
 kv7iQa2Od3EX4GADIXh1Twr9YatloILjNwYu
X-Google-Smtp-Source: ABdhPJyStzy5+uU7E/TPKgQGPKQFxUDj0h5/YloqmEhN0lkhvT7cLbyH+22sM1310kZKnt0rSltXbw==
X-Received: by 2002:a05:6402:35c2:: with SMTP id
 z2mr18414186edc.136.1642367808821; 
 Sun, 16 Jan 2022 13:16:48 -0800 (PST)
Received: from [10.101.1.234] ([185.224.57.167])
 by smtp.gmail.com with ESMTPSA id i16sm4959533edu.29.2022.01.16.13.16.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Jan 2022 13:16:48 -0800 (PST)
Message-ID: <1b5d5c3a-d03b-900e-23a8-74c497e742c3@amsat.org>
Date: Sun, 16 Jan 2022 22:16:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] linx-user: Remove MAX_SIGQUEUE_SIZE
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
References: <20220116204423.16133-1-imp@bsdimp.com>
 <20220116204423.16133-2-imp@bsdimp.com>
In-Reply-To: <20220116204423.16133-2-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: 26
X-Spam_score: 2.6
X-Spam_bar: ++
X-Spam_report: (2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 16/1/22 21:44, Warner Losh wrote:
> It's been unused for 7 years since 907f5fddaa67 when linux-user stopped
> queueing any signals.
> 
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   linux-user/qemu.h | 2 --
>   1 file changed, 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

