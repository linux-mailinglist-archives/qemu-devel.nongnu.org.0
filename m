Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E356643DB3
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 08:38:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2SVn-0003X0-CW; Tue, 06 Dec 2022 02:37:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2SVV-0003OT-Ml
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 02:36:53 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2SVJ-00062D-4M
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 02:36:49 -0500
Received: by mail-wm1-x332.google.com with SMTP id m19so10519149wms.5
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 23:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2cuEk5ZRM/xfRRtHZobYoo7GKTjHRHsiOh+lMhx1laQ=;
 b=uH1SdgcBq4aqEUDgmaMMdtZJYr5Grj9kNJ8EEMTZUuzfnBFEpC46CQJMEDpsLO8sVa
 ZIH3OMbfzzU3veDGOBS2RqgNJQXf2Kjjk6UrMRjvC51IKs/gXNtroYOENhU2aDcGlPDg
 0GHDLAsH6A1xnx0ILx1tchVwNdhgz8X66QgoKv/X5FWWg/Yl8JU4nhq7ribHRjYF9GQC
 C+c9z9TTJUQ8pC8Qocls012dAv095O0ZpkRvNdtwuNXcqyL7mb+LjK1YBA3D2XgUyGfD
 ASICAaAHvy62zepspkVaJJtBsLiJgAPY0qE0jS+EeD4His6Zp9X/LRNGb5zqqs89eIIP
 5oQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2cuEk5ZRM/xfRRtHZobYoo7GKTjHRHsiOh+lMhx1laQ=;
 b=DWsx9NhuhJRNeMM5C0DbMLuWLi1Qa5u9cNNo4aKARzsFuC1CQiD9uuKXIrtBYlfL6C
 M9493DSwnzTAtjKlMjGZohTdTskt24pp8vw8ZUE/jKlQiuoh7NhQ3OIpuDSROOA0YqC6
 RsshCZ4N2hUQx3+S5aotRp/F1Msb0Jkhp+Cww52V57Nqt0Bz/5dKWsVzOMr4rjoDwK1e
 X0uvE6n64JnCJ/Ql0ZOhsQH5wWCD9YgTae7h4InKHmQuFaP+1W21FJQ6/FKWdiBjSIGZ
 M5KrCidvPKf/bHNhU2ClmHQbMJ3q7uDNzoz1QmLfhQ9VKPSjUgTqEQ/YgYfzEbtb5MrL
 uM2w==
X-Gm-Message-State: ANoB5plwWOGoYOqLVsaCtKNYdALhe/qRD/WE9Gsoeglh38734VgSWzWi
 GbeHZRIlhA55iy8nNMI3Uzoggw==
X-Google-Smtp-Source: AA0mqf41V19VWmYA3G9QBdMDAVS1Qki4/i6XN1NPTnZMWqtHbEDrlRVxv9sKOU5xxlQ/qVprdcF0aw==
X-Received: by 2002:a05:600c:1d93:b0:3cf:d0ba:e5ff with SMTP id
 p19-20020a05600c1d9300b003cfd0bae5ffmr61391988wms.36.1670312195488; 
 Mon, 05 Dec 2022 23:36:35 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 az39-20020a05600c602700b003cf78aafdd7sm20724265wmb.39.2022.12.05.23.36.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 23:36:35 -0800 (PST)
Message-ID: <a009ee86-4263-fe3e-3903-5d3b59cc49ae@linaro.org>
Date: Tue, 6 Dec 2022 08:36:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 09/22] tcg: Rename TB_JMP_RESET_OFFSET_INVALID to
 TB_JMP_OFFSET_INVALID
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: r@hev.cc
References: <20221206041715.314209-1-richard.henderson@linaro.org>
 <20221206041715.314209-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221206041715.314209-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 6/12/22 05:17, Richard Henderson wrote:
> This will shortly be used for more than reset.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/exec-all.h   | 2 +-
>   accel/tcg/translate-all.c | 8 ++++----
>   tcg/tcg.c                 | 4 ++--
>   3 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


