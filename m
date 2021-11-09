Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF8A44B1ED
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 18:22:11 +0100 (CET)
Received: from localhost ([::1]:39104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkUp0-00039y-7F
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 12:22:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkUo3-00027f-IL
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 12:21:11 -0500
Received: from [2a00:1450:4864:20::42e] (port=33370
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkUo1-0000w8-2n
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 12:21:11 -0500
Received: by mail-wr1-x42e.google.com with SMTP id d24so34288811wra.0
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 09:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=lqMR6SLocR2JSoRIpr1pTrl/Z8xMtshfc/7O+w5VK14=;
 b=Haucdk12fF+S6yi9yx8rAVqgyir/ZIs2ovV2Mv9tJ8zV52dNmmfSLHdOeJdJq2AGrU
 +syT7Vam+Hueqjgp59sAS47LDjAuHa4rXMaEn4X25x2XwPBwzqEytWklPoi2IlXMUmJj
 LN+XEZpfdKirIPWVwN1P4FmzRuSbPus5oA5ZS9SL1W261nETHIV82mkNuxQc7aQmfeDr
 XkVz2Sm7hPmY3HAnau2vSg/OfzFJLoZ53PNgF2pqtsuDQ8S0mWEQOM4d81yz8uMd/ahB
 h0gI7nZ5zbD/ovqMeCCkPILwALZ05ojeMFXOe69IWcVmpM5AAm5PcovvWCVu8l4ripJC
 A5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lqMR6SLocR2JSoRIpr1pTrl/Z8xMtshfc/7O+w5VK14=;
 b=srBBVqR6xar01ojLHz2W1fWUhX1O61dw5FQu+tzacm9nqYiGYsUdzoEmxs757MVW08
 NTs5cVThelJI1eC0Qp5H/bGUSGR/+8gGxc/uCaBC8MeOf5i6MRudRteVCG0A2CLYVkGk
 jrhdz/ara0jnAOIZLkJgGG199j5/DKx+ZrE6LSM7DrpuHAgP8hOYMbsLFE1EsVCCOzUQ
 4tQW3+7B64CpofSJm00F0LX7oVrw72fhez/H6kk/mTzQC653l1oa8tVhjNoBCuCRBBOo
 4NGo2Qv8fi1BxSJerMkVdtwWrhFPKkZW0MW0FA3eeCuuHfD4quPWmmxa2Olu0CBCxCfk
 Wtdw==
X-Gm-Message-State: AOAM533soblEig2LajhpuFva/NAVy4LfnIa8S4+Qb7uJo0ArXR7NGNl2
 FrdkLL8dRcTf8UOpmKMiL0ktiH880fOvgmgA
X-Google-Smtp-Source: ABdhPJyANKaLprlXBKnWi5Vje8yV7cKtIXRML2dcI5rYq0CDFIB/yMqr7CMkL1m+LdN0a95zDq8GAw==
X-Received: by 2002:a5d:4a0a:: with SMTP id m10mr12037599wrq.221.1636478467297; 
 Tue, 09 Nov 2021 09:21:07 -0800 (PST)
Received: from [192.168.8.106] (169.red-37-158-143.dynamicip.rima-tde.net.
 [37.158.143.169])
 by smtp.gmail.com with ESMTPSA id d15sm19951895wri.50.2021.11.09.09.21.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 09:21:06 -0800 (PST)
Subject: Re: [PULL 0/1] Q800 for 6.2 patches
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20211109154658.1058842-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <530f28ca-783e-e893-5b48-8a02f629d8ee@linaro.org>
Date: Tue, 9 Nov 2021 18:21:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211109154658.1058842-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.364,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/9/21 4:46 PM, Laurent Vivier wrote:
> The following changes since commit 2b22e7540d6ab4efe82d442363e3fc900cea6584:
> 
>    Merge tag 'm68k-for-6.2-pull-request' of git://github.com/vivier/qemu-m68k into staging (2021-11-09 13:16:56 +0100)
> 
> are available in the Git repository at:
> 
>    git://github.com/vivier/qemu-m68k.git tags/q800-for-6.2-pull-request
> 
> for you to fetch changes up to 5db83c7e90ec6c0b28995b537bb03942edcd4164:
> 
>    macfb: fix a memory leak (CID 1465231) (2021-11-09 16:42:49 +0100)
> 
> ----------------------------------------------------------------
> Fix CID 1465231
> 
> ----------------------------------------------------------------
> 
> Laurent Vivier (1):
>    macfb: fix a memory leak (CID 1465231)
> 
>   hw/display/macfb.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)

Applied, thanks.

r~


