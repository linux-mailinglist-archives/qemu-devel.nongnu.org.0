Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C39BE36A25D
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 19:25:43 +0200 (CEST)
Received: from localhost ([::1]:37858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laM2I-00035J-S3
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 13:25:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laM0N-0001q5-7T
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:23:43 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:34786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laM0L-0002XR-5W
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:23:43 -0400
Received: by mail-pf1-x42c.google.com with SMTP id 10so726189pfl.1
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 10:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XmT03drL7KikfuDFe24b9lBbatR5wfke4uNmDMlnBWs=;
 b=LcchqrW8Zd4SWvTCMvKlxIjFTdymQC8mrxVD3Q7MeHU0au9kc7B36WWAWFtsJo/6KI
 ErFvIPGoV6ui7vrf8glbcHN1Vn4WoXEDasayBXYZ8kCLWIoSGNYmYOKcuqNsn7w1Uoe9
 jD6ctuTzn8B8p7p7YoNEaYQzeBMpKouy9JhlqeF1Bwula23ZeHE8MEKX/nRkeNuo89J4
 jpAj8L5Yf/tTvpsgW3m/fmQgwNVtmHTpyk6issvYt/0xUt3UVAV1DwzUBdUDL0KMwmja
 4jhgDmkYGcmB+CDMD/Mp5D/gFrs5wS/z598XjEuW58Ueev8bXX8Fc76h4+OvawZQ56jy
 /pyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XmT03drL7KikfuDFe24b9lBbatR5wfke4uNmDMlnBWs=;
 b=Ea6bnnlFGlORDRM+tcS3GchcTedsRoOOUjWXo7wq5BAn7V26PKpKiakNTpwTtJvI3n
 /1ESRaVnAIae48IpVEEH+++o0oBfKTtRgBxXFccYPGGAfhKeUcPBMZEm1SaGysUbWP63
 /ioBNxttn4cPhtlchJ9z7JLuBmj+wTAU9RDI1xpOpvE30oo9AfvIBoadtr4Nsj/sB18A
 E3PHYGkYNC2shrZN0PsTJ8qM6ohHa/S0kcxmszuuXV07iEv3SIxBsbEfZIXxcDM3AfAj
 5fnGle4r0aGiyY/0yav8CxsIPW83hqiDO4GH9p1ylHamasWSQCkUQHOn6+4IHJRMOYSz
 +VAA==
X-Gm-Message-State: AOAM531a8RYyR862JwE1W+B6tZh0nrPngZDEEV0ld1UryL/EuZJ/k+aQ
 Lg9i+epVW6xC/YI/7kerNC+Rgw==
X-Google-Smtp-Source: ABdhPJzr9KC4Fuh7P15W8C72xKVSEiRRtdNs3s1JbJzVMjSM1K3RQXQigtx99lAbew8mzC7PGj6kxA==
X-Received: by 2002:a63:5b07:: with SMTP id p7mr9363693pgb.208.1619285019739; 
 Sat, 24 Apr 2021 10:23:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 20sm7357651pfw.40.2021.04.24.10.23.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 10:23:39 -0700 (PDT)
Subject: Re: [PATCH v2 13/48] bsd-user: style tweak: Remove #if 0'd code
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-14-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <feb31e2d-cdda-b6c0-e88b-3ad6351e95fd@linaro.org>
Date: Sat, 24 Apr 2021 10:23:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-14-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/21 8:59 AM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/strace.c | 8 --------
>   1 file changed, 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


