Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D32358D68
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 21:19:49 +0200 (CEST)
Received: from localhost ([::1]:44284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUaBw-0007IH-6M
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 15:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUaAv-0006Oz-HX
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 15:18:45 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:33765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUaAt-0002CA-UQ
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 15:18:45 -0400
Received: by mail-pf1-x436.google.com with SMTP id a85so2126544pfa.0
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 12:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=f3QCBZHMRVFsvW/v4/UWZ5PLRyeXrymVvTpZXoQa6MQ=;
 b=Ljm/LuTZcGK59gaMuPbIBYGUnGdD4urKd21t9PRqd52exfow2VERv4pC6CofzQCEr6
 FUMNDpvvq8szn6vdkxE3g0pMCgI2CgWKjiqG3dpCcUEEBkWt7w052n9cpXKUfdMuDcjY
 H30mL8Qr+8E8CC/oW4Y2LlJotBSjeMghGzCmX6H+OX6E8oERaI/2umkLyiAJI2Dh0C57
 QBmaUGJKoj42RgIRDqA/x+2A6MB37vl7sHe/UWAukwo88+WngLSJ6tVt54qc7RogWaJf
 1hFR2hGDcKVuovbZVBDNIHy/dqPSo2Z2YaNySFaiwYlitDcHimak9ACFgjL6gy0AKgXd
 lIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=f3QCBZHMRVFsvW/v4/UWZ5PLRyeXrymVvTpZXoQa6MQ=;
 b=cSoII3sKTOGtiS0XLYCwu3gg1YjLBiZwzb6ZuzbZmiVTiSVvV2+Rc7g11Pd41zVbT3
 Z+2AcS0PHBKZ7sukTGxcQKnVH+wcTbHGEbEuQGnTNsC5PtAyVz1a7skTrqKws43g2Hpu
 bCo/sY/BW2cvzXNcvQK5alYE3HPYfxarVvbMbVNxCKAvCX9UurlPeTBy01STL7CWiMTh
 NMpUX2EJfoUcKteAFydKGSZytCqeRBMuuov2L9jj5MJ23ziIOWtrE7al66e8m8WsmNMc
 gSY/KfoRLu4t0iV7FKcqPaxHNQ7darj+157TCriGfcny7gIo7/JD5lnVHuVfErdnczn8
 aEJA==
X-Gm-Message-State: AOAM531GhLvqoNk76sFt+2YCbyMCOeAqs4Y9t5brqLHZ4vTV3/JJbsB8
 k/+lUMDuoQXzQXFYaVvt8KNpqw==
X-Google-Smtp-Source: ABdhPJzaxOoe9ICULvua9OmiF41BjEPOO+sxIDoYur8vAD+8LYh1zRwhgt6aeLiVmAGwp12S+mVW2w==
X-Received: by 2002:a62:9253:0:b029:242:2150:f98a with SMTP id
 o80-20020a6292530000b02902422150f98amr8465873pfd.24.1617909522422; 
 Thu, 08 Apr 2021 12:18:42 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id a13sm187523pjd.6.2021.04.08.12.18.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 12:18:42 -0700 (PDT)
Subject: Re: [PATCH v3 14/26] Hexagon (target/hexagon) cleanup reg_field_info
 definition
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1617847067-9867-1-git-send-email-tsimpson@quicinc.com>
 <1617847067-9867-15-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <705bab8b-208d-3f70-9878-8f0a71757e88@linaro.org>
Date: Thu, 8 Apr 2021 12:18:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1617847067-9867-15-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/7/21 6:57 PM, Taylor Simpson wrote:
> Include size in declaration
> Remove {0, 0} entry
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/reg_fields.c | 3 +--
>   target/hexagon/reg_fields.h | 4 ++--
>   2 files changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

