Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 326E043D865
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 03:09:06 +0200 (CEST)
Received: from localhost ([::1]:36498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mftuj-0001Yh-Bz
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 21:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfttR-0000DR-MJ
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 21:07:45 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:43895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfttO-0002BP-TM
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 21:07:45 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 k2-20020a17090ac50200b001a218b956aaso3402625pjt.2
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 18:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9qOzf9DHUtcIggYHLgTv8GplGXg1XS7r9Ilkf1GgcHE=;
 b=U37i+tm8ghNFaTqvu2S6uZjZpocXsonyWRezDtdFP2ATUQZ0AoWgUkwsa9715xr8xq
 zCHgZl8XCdlP1TaCCuQLT6rYw2EQAFubcNeZo5znJDM9YW6sHUR6eqCyzL+l2vHlhdMZ
 xVlBFqG41FNLsek/8P9UXw36r+4+zuNto5KGw5aAntxuPCyTbGGgbF9pj8pMtns2BrC5
 MlONe7j0xKdl3/azLFGo+/NxtEZyXFbu6jk+LdjPwoLejcWRsLO8fC8PKuEEGQOYqNmc
 Vx8Laj8bUKx2+pF4pqFcp81P+3Ps7CVlL8hfww3mwJsK2ncuYqMZxy+1TXJEdD1nNF5h
 Nvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9qOzf9DHUtcIggYHLgTv8GplGXg1XS7r9Ilkf1GgcHE=;
 b=jT7A+4NDV/mrWLA+Od2Pb0NKDB9nxQ5DqSOT5warc/KWmdf8kiqXBIMcUnVp5AeVEQ
 Jp6C6+0LU1lKjPHL60z5lDtxibQTn43rF2gu2bFw3sofGmY37vrrkFSw8VoHJJ4PTgBF
 VWTmCodl/M8UFPNOL5z/FbLrxB8wvVTmZ3weY5YbXN0sIaaj8mIVn6IWQRPPSfDFS9fD
 hNxb1R3EVKPnktqCb0YqRIs4YlOdhO5gjbRWKKEUDVEEFkm9kXdTPgD9E0eWS/jnn9Q+
 PenWn1Vg74pcnH91qIya8WrguM3TjjeX2x+k/5gDj5/x8Oxq3hQB9Yt3F8cx+EAqxuYR
 JRlw==
X-Gm-Message-State: AOAM531HXXMzqjaM9LmhJBhsvY1P+t3Stt56zgJIoQzqpMqUY8Q/Bm3z
 9qQ9Yj7FUlPXLLagtpiFjFppFw==
X-Google-Smtp-Source: ABdhPJwmeDLSergYXhzaY/abJtozTNhtpZZivKG8yAvMyIUhB0tz0kEZ+U8/I20DWKq6ngVV/Q8a7A==
X-Received: by 2002:a17:90a:ac0c:: with SMTP id
 o12mr9443029pjq.37.1635383261509; 
 Wed, 27 Oct 2021 18:07:41 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id h24sm1116838pfn.180.2021.10.27.18.07.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 18:07:41 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] MAINTAINERS: Add entries to cover MIPS CPS / GIC
 hardware
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211027041416.1237433-1-f4bug@amsat.org>
 <20211027041416.1237433-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6c3b3c9d-5cb1-0537-a772-89a571a38973@linaro.org>
Date: Wed, 27 Oct 2021 18:07:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211027041416.1237433-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: libvir-list@redhat.com, Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/26/21 9:14 PM, Philippe Mathieu-Daudé wrote:
> MIPS CPS and GIC models are unrelated to the TCG frontend.
> Move them as new sections under the 'Devices' group.
> 
> Cc: Paul Burton<paulburton@kernel.org>
> Reviewed-by: Jiaxun Yang<jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   MAINTAINERS | 20 ++++++++++++++------
>   1 file changed, 14 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

