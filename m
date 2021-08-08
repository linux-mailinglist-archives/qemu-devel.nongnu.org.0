Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 122C13E3900
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 07:22:11 +0200 (CEST)
Received: from localhost ([::1]:56618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCbGE-0005ud-3r
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 01:22:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCbEU-0002bI-3H
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 01:20:22 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:40480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCbES-0004lB-Nb
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 01:20:21 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 t7-20020a17090a5d87b029017807007f23so25905013pji.5
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 22:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=c9vf4NB0tVwoK9li+A8vGpzgRhfL2Ekg+37hfV0aeAM=;
 b=dfDVvNVSLnl1NynfP8FeTlSpiMoFiTJd3pIjs0IO3aFlWA+z0haK+cYv18x7nPrA19
 YMSOCTfHNrm/UH5M6a2Tvkmyms6V3A0MY/CiJoRjiPO/dXVC2ty9CCht8CPD2SOqgMWD
 Z0o/myv4sH8KBg9MDBellVkiqwidZOOwMHRpM1lcc6Jt8YLCMwfUt4q4USJXNAsceRE8
 5EAvPGeoNs8ZgAD2+39PnuAOc+gdnJZQbuQmjkvNY8v5G5c7pyJSAGqxrgKMQCGDUHz7
 5J5dWK2lu98Jj/sSaemZlEtQTaQ4H56vhnvjDXmIbWMpdLCN+smki+meUK1V5RUysZR7
 4rcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c9vf4NB0tVwoK9li+A8vGpzgRhfL2Ekg+37hfV0aeAM=;
 b=MOWQuwPRJLF0mI3QnugvH/ea+HDPUhc+HfZK8IQfoeEtV6jfmP8J/dqZ/7/Yg162Ia
 kKL4ywTL7RYwDwUltEuc5ZOaTXrVCV5QWmR5h0smyn9TrZ+JpLwhwk/rplTmkBUxzkQt
 HmVp/eQWTur6/DR80c4itEC27Bl2iJsAwkMAqSkyxFiQnDXv9a6CRRliK9QW7c1C7oEa
 Y4tvwRlnVfFI9+EFPRFL5Uz/Iu6bD7d30qKlHZAxE5pxr76Zn6RJQGdzs4lF3hHKRCnN
 onH0FsKON1jrHahNV8wAWtpduWPdHWwz+2dGPw/XYmnOTPYXgG5jSwKrBPOQNuikU9/h
 yNpg==
X-Gm-Message-State: AOAM531JfyVYghIOdXgudiIahRTvy1IzdUZoI8rate0vxWvM3WvB4X/u
 WiXPcUimBUptPQLiDPVH7DzlyQ==
X-Google-Smtp-Source: ABdhPJynR9+F42aRtxU4hTYM9v6EKhMrfB+zAhxsv5xQkKp2tDOk/47z1UO697MYcTAyM88il6yjcQ==
X-Received: by 2002:a63:950a:: with SMTP id p10mr157958pgd.362.1628400019181; 
 Sat, 07 Aug 2021 22:20:19 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id fs21sm11221662pjb.42.2021.08.07.22.20.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 22:20:18 -0700 (PDT)
Subject: Re: [PATCH for 6.2 19/49] bsd-user: Include host-os.h from main
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-20-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7832f221-31d3-84e3-f50a-366c1d54e12c@linaro.org>
Date: Sat, 7 Aug 2021 19:20:16 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-20-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: kevans@freebsd.org, Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> Include host-os.h from main.c to pick up the default OS to emulate.  Set
> that default in main().
> 
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/freebsd/host-os.h | 2 ++
>   bsd-user/main.c            | 4 +++-
>   bsd-user/netbsd/host-os.h  | 2 ++
>   bsd-user/openbsd/host-os.h | 2 ++
>   4 files changed, 9 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

