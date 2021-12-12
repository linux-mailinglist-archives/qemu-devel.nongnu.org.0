Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 294CF471E47
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Dec 2021 23:38:13 +0100 (CET)
Received: from localhost ([::1]:53524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwXTw-0001dR-9c
	for lists+qemu-devel@lfdr.de; Sun, 12 Dec 2021 17:38:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwXSN-0008E8-EJ
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 17:36:35 -0500
Received: from [2607:f8b0:4864:20::1032] (port=39928
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mwXSL-0006yz-RP
 for qemu-devel@nongnu.org; Sun, 12 Dec 2021 17:36:35 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 y14-20020a17090a2b4e00b001a5824f4918so13326529pjc.4
 for <qemu-devel@nongnu.org>; Sun, 12 Dec 2021 14:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eKNaoHD2AK7lxzEuUdpZCfhra2X6IX5F6/WuTD8cYlk=;
 b=rQZFzLCZFAVktAqT5PC+jZKWb1TOeMV/62KE8maHCDRbdGVh9Y1BHCdsGxQt92rHWZ
 sDxjc9ELwrHM9sQYWvmNhjbSZm/rjxrJ/u594gmGFNWdlX4Wcqgp5VYgxWGD/tYv0pnD
 oQwPPV9QJtGUklMZ5Y11chQXL+axc8XtjFTQZ1WWAsgt39Cg32wLSpqn5wpr5FMRkjqF
 oNaLxrjZWXywLQE2BN0TExtbOpam15x7WvZ5BW/Xntp3jSe+xxYyXOixvdCrWyBv+iKK
 lE3qZLleu2xkJCWaemI2yYHJtxEl4brKQ9SrYw7wMSC2PzD7fsyUKefZfWKpAQ8vQOFd
 sVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eKNaoHD2AK7lxzEuUdpZCfhra2X6IX5F6/WuTD8cYlk=;
 b=WlmfhLjNK1QmZb4umUVxLuGv2e37bofmG9Hy2emapOPc/RIjCHSFV8wq1a6FIw9z/O
 tH2IGHM1FSi35ezbbTINsaGDhqs+n7OwWAuJmf5NsCgLtKotYMX7VZc1I9bLh+JrwT2M
 GLKRErcTXDhCRvRoug1IVBmF4tkUO1EEXg3v04BRZOL9yOfpar6b94sb3v/S8SY6/xM0
 /uDcCh2F07nvkY6ZiLeQPrP5Pxd/tSTHfnJoafD66jNzzmIrzhxgyuKha4jjpyZ8SVy5
 I0wFICcbKKMgqOnYHhk0R6sXest9uuICyHCAKyZLKSz2p0OADd8KVh7tFxLN2B/jWgwV
 Nq7Q==
X-Gm-Message-State: AOAM532FobvwTTWQl7JtIXvTHmT9k6wUtArAwt8/+0EkIbF0wvgItW81
 /X6LQElQNKI3ekUwLw2UaV9zTQ==
X-Google-Smtp-Source: ABdhPJwa15xxLm29KD1m7hlHErNKa8W1rF5L6vJLiViZVKOwLTSxcVgkNCCucfIWXjQ5gLPtZuEqjQ==
X-Received: by 2002:a17:902:c7c4:b0:141:deb4:1b2f with SMTP id
 r4-20020a170902c7c400b00141deb41b2fmr91022726pla.44.1639348592549; 
 Sun, 12 Dec 2021 14:36:32 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id t12sm4820300pjo.44.2021.12.12.14.36.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 14:36:32 -0800 (PST)
Subject: Re: [PATCH 23/26] hw/intc/arm_gicv3_its: Fix return codes in
 process_mapti()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
 <20211211191135.1764649-24-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ab056f00-ad46-652f-e82f-8be3fae72879@linaro.org>
Date: Sun, 12 Dec 2021 14:36:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211211191135.1764649-24-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.051,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/11/21 11:11 AM, Peter Maydell wrote:
> Fix process_mapti() to consistently return CMD_STALL for memory
> errors and CMD_CONTINUE for parameter errors, as we claim in the
> comments that we do.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 28 +++++++++++++---------------
>   1 file changed, 13 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

