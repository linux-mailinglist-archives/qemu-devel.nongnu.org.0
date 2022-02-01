Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCE74A6A79
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 04:17:55 +0100 (CET)
Received: from localhost ([::1]:51294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF69Z-0003V8-Sd
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 22:17:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF0lx-0004Bi-IF
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:33:09 -0500
Received: from [2607:f8b0:4864:20::1032] (port=52089
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nF0lw-0003yj-54
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:33:09 -0500
Received: by mail-pj1-x1032.google.com with SMTP id q63so18354083pja.1
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 13:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DVTkrg7mlxAd4tSSV735yNiLvsNg7ebvQYJ0crEVRiw=;
 b=LoqelIcO6w8DSBBICa3t8sa2cHlgdkyQfomA6Oh/Mjd3NFluSU869ktrQ0nbvjFION
 3+/fZK8lbPb9UnGEPYiIFpBThNphSInUSTVsJATR/ghANhSMaSBcPjha1QrcfgY1gbwA
 GYy93baKePOVXsfTRt9YSgB8t0FN5Jux4dCKZgjy4UPjAvPXyID/GDly6sxKorSFBU9N
 p0yKnUXp4CauWUm2Clw/I3EGL1zNfZe7t6gH3wRJ8AyAfzypKPOAE1WjCT2ZSjGuvLJZ
 ISYHGWMospx+BAdrlEDhZuvr/FbAoy19owzy080sFFVUwyNOH7BPc8Wm+0TFmrIFWFyl
 pE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DVTkrg7mlxAd4tSSV735yNiLvsNg7ebvQYJ0crEVRiw=;
 b=2nAvtF8QmVcPmlEzi1I7AFL9lYqwG4MiJ/uwLmQ8dLsk4e5xgp64dKSgQ2gcVRGhk0
 hm9G3odASaXN4VBSGvopdBq/utP5q0eHclVDTH9lvknayQKW3pKVH1Ak16YZJFSgGv3d
 duoOM15EcKqlOzyK1ShGEgJ00X4G0/Wd0QwVkRl4KWigqjOWrkveXI/ZIjBi7Aw2NwMB
 dnObKIG605G0dVulPm/U1rAbkC2ys5vITxpw9ZqmgN0rgxK7HAJdGHn/wclXFUAYdLuW
 JTF9sQ1XTlTI13o/SJUbDoXY50+5L3PlZJGgHxBM792D5gQmybPloVB9Qz+j1EEg6eRu
 Zfyw==
X-Gm-Message-State: AOAM530JbedxpEopc2ObLXqFEBfn6o3P+J8p4raHUBwxEM+zE19zBAS0
 HJJkCtPfjN3Ra8ZZM840RkVV5w==
X-Google-Smtp-Source: ABdhPJzeUhpykhRtQNvrv9x3er3v61sZ1txdJZXPhuAZKzFE9GWXtnCTe3gVTjoAJ7Ar1Met5jEvpQ==
X-Received: by 2002:a17:902:e550:: with SMTP id
 n16mr28172644plf.60.1643751186940; 
 Tue, 01 Feb 2022 13:33:06 -0800 (PST)
Received: from ?IPV6:2001:8003:3a49:fd00:4f14:faaf:dae:66e4?
 ([2001:8003:3a49:fd00:4f14:faaf:dae:66e4])
 by smtp.gmail.com with ESMTPSA id o21sm19294550pfu.100.2022.02.01.13.33.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Feb 2022 13:33:06 -0800 (PST)
Message-ID: <067f9d76-9050-0276-e396-4a204073e41d@linaro.org>
Date: Wed, 2 Feb 2022 08:33:00 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 18/22] bsd-user: Define target_arg64
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-19-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220201111455.52511-19-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stacey Son <sson@FreeBSD.org>,
 arrowd@FreeBSD.org, Kyle Evans <kevans@freebsd.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/1/22 22:14, Warner Losh wrote:
> target_arg64 is a generic way to extract 64-bits from a pair of
> arguments. On 32-bit platforms, it returns them joined together as
> appropriate. On 64-bit platforms, it returns the first arg because it's
> already 64-bits.
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/qemu.h | 13 +++++++++++++
>   1 file changed, 13 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

