Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACAB681FAF
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 00:32:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMdbz-000113-9l; Mon, 30 Jan 2023 18:30:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdbu-00010Q-6T
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:30:51 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pMdbs-0008SH-N4
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 18:30:49 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 bg13-20020a05600c3c8d00b003d9712b29d2so11247620wmb.2
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 15:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6EHm7HerTnU7TkRd6C9sK2gFrkRBmHd+Hf1yn3vGWfg=;
 b=hxuYXBag62JDGBQv67rPfXPQunRXBJi7HdMoWmtS+hfD7LaaYQQwCPOKHi+2xVNmZG
 AuCUKfprqCrO90O1j3SW+ouhCg6jmdAr8VXtsYItve6EZx18W4n1Xjsntamn960TeTFZ
 +d184lOqOfao6Ms5aCq90wvyqVzrP4TrXk3ympc/c8eBTA+fUZ0teNdjr0pYwYcVUeJs
 9nO6QcpG6a5bzLE/cBri5nYSyVFdNe5uV19K0E+mKT2tvAApqSeN5miVuMU6stigMIXj
 1D4CWwFsQVmK3X38wKmXZIH3hGNugVj6PARjddwOfUDyMiPjF3zgCG6iePUIfY5PkXsJ
 hOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6EHm7HerTnU7TkRd6C9sK2gFrkRBmHd+Hf1yn3vGWfg=;
 b=MqBvCQWD/oG3zzPtazyLAIkmIw15SMtjeF2BetItFL/F2q7eGCXmlkMpvf10KKbQmu
 k1jaunVCPrkkLb/ho5HFtGZyQgp/zWNb2MzWWYX9MZxdY9jNTsmiQwk801hCM5VJt0Lt
 9FOYAcLnmjt7nVzSTAa/v8RzmZHuCJeg2FeidD5q8oSLBHCXZw7raN4wLATSHN80+aQ2
 c5bk+CK6znskBAs85CoIE9F6jZfOlxrkfM4NqB/BEFM44YB7y+/3pswy2jXeh9OVGFX/
 6wPEynbxiY49/XZo8lHlbaeNA9AhRicEoe9R3wBd0iglw11IdEjDT2YPutCpu4e4ULmS
 wSTQ==
X-Gm-Message-State: AO0yUKVyWdiBP1kTLJ90+Nnpgmm2/nfpUs3hKy/5QhVZ07TpxC17aJmN
 WUfZUs89eyvKBKBvT5OWL5mh9Q==
X-Google-Smtp-Source: AK7set8zibfkAg/MpKA4fLoF4rVKymZ1CA945sOKQ9ynLkczloLKLEe6fQtFJO0dcemE8gkGF/no1w==
X-Received: by 2002:a05:600c:1546:b0:3cf:7197:e68a with SMTP id
 f6-20020a05600c154600b003cf7197e68amr1142691wmg.18.1675121447002; 
 Mon, 30 Jan 2023 15:30:47 -0800 (PST)
Received: from [192.168.1.4] ([41.141.105.34])
 by smtp.gmail.com with ESMTPSA id
 bh6-20020a05600c3d0600b003daffc2ecdesm17584379wmb.13.2023.01.30.15.30.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 15:30:46 -0800 (PST)
Message-ID: <b83338a1-ccca-3c3e-3c2f-ddf4c1457e80@linaro.org>
Date: Tue, 31 Jan 2023 00:30:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 01/27] tcg: Adjust TCGContext.temps_in_use check
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, cota@braap.org
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
 <20230130205935.1157347-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230130205935.1157347-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 30/1/23 21:59, Richard Henderson wrote:
> Change the temps_in_use check to use assert not fprintf.
> Move the assert for double-free before the check for count,
> since that is the more immediate problem.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c | 12 +++++-------
>   1 file changed, 5 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


