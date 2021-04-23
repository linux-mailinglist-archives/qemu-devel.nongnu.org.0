Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2223F369D3D
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 01:21:01 +0200 (CEST)
Received: from localhost ([::1]:50448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la56a-0005We-8C
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 19:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la55O-0004j6-DB
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:19:46 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:33473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la55M-0005YQ-NB
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:19:46 -0400
Received: by mail-pl1-x634.google.com with SMTP id n10so14808676plc.0
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 16:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B3FuJ+L7cN7afDCZQ0/267NEhsRXz7914j3+LHfZJ34=;
 b=Fyn7LQTrp3+Fmq+umfloLjEyjXLi8JdaONfqNv6rzbuCtRgaCOwk5kWqdW+4QpLjcI
 QQy+WAfAQKpb516sY/0gJJzAWxiHOuCFjPnGM2jqnhD8HLt7KvONdDLvMH/Yg+2XWId4
 8k1W8mG35cKR16EafqtgGE50OWHBZaBqSHeGGi7q3OSly7tzCqjz/pN8WUzMmiqqWi+i
 cGNVmLZ9U+gPwP6nc9H/fESY5HIy0qMDU3Qq4WM5mJY111sVxGAJgaUARxkY+/MdaZi3
 uEkIGYm9w90KYPdtrWx+GafnSB15fO2JOmeeFTE/YCHS4JA44Wv5EhKz7VeoFpVJNOws
 vxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B3FuJ+L7cN7afDCZQ0/267NEhsRXz7914j3+LHfZJ34=;
 b=q2pkGKEqoINoGgqUqJ70tvCgdoyfecGmNgSUacgYNGKVVRh2UjubIWQ/7QXUstnFdP
 h5igduSMae6jssigyqU0hWugbkuZXWB4KOxEEuLE3UgSV/GPSFpZRCtVZq6NdSOIhmzX
 OsMzDCdgyFfAvse5Dd//N9G2FJpn02NoYvONbD24XpAuWX2ZLb1AcVoOfGcQmA9SjU2H
 QfGVbbBc4bnUWt45fARImvV5mszlUtUxsXHadVK9VEYVZKWSH2YzpqAmrU3QsmAbfv4H
 m4e/Kj7EeJcmTkamcNuNctOtrFtbzQgd18yJKhxTfp2yagOY5BTO8nFTX8wvvB6LqDLm
 KC8A==
X-Gm-Message-State: AOAM530T2dy97tXmwBMhA78CJIM2VJ+3trj4ZQSP1uUNgXGIow0Ep3nT
 XnmRLIYdXFlQbhmZrl0AmTvpqg==
X-Google-Smtp-Source: ABdhPJzbolc5WjaeWaQDbaa+B3YtUCY7QmEYrAuFc/noAgRzGVcYpXlAL8w2Es1C0vu4iG3Cu/rEXg==
X-Received: by 2002:a17:90a:6583:: with SMTP id
 k3mr7217795pjj.227.1619219983402; 
 Fri, 23 Apr 2021 16:19:43 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id b2sm5682531pjn.56.2021.04.23.16.19.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 16:19:43 -0700 (PDT)
Subject: Re: [PULL 21/24] bsd-user: add arm target_signal.h
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210423203959.78275-1-imp@bsdimp.com>
 <20210423203959.78275-12-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e36d6f1a-895d-edeb-4194-00d2694e7e78@linaro.org>
Date: Fri, 23 Apr 2021 16:19:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210423203959.78275-12-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 1:39 PM, imp@bsdimp.com wrote:
> +static inline abi_ulong get_sp_from_cpustate(CPUARMState *state)
> +{
> +    return state->regs[R_ESP];
> +}

Shall we just wait until arm actually compiles?
This won't, being a copy from x86...


r~

