Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CACDC2D3658
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 23:38:06 +0100 (CET)
Received: from localhost ([::1]:58772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmlcT-0002IJ-Kq
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 17:38:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kml1X-0004UD-76
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 16:59:55 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:46731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kml1U-0001Tw-IY
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 16:59:53 -0500
Received: by mail-ot1-x344.google.com with SMTP id w3so192627otp.13
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 13:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0P4LgLAwd23RvZRpXo4n9bDoeMvsbtK2X5N+B4o2WS8=;
 b=QKk+zgC0v/TuRgR0tH8ShBc9XymN0M/NYnr3xrXjOvokyOJO9wsHjkcg20MNSEoqoR
 sOGDIN6uGqD2XMo2/QYk0xeQeTaubkROAB7UuFPkMPZB8b9sWyPX38Zaofmtfi050idT
 nFQeDqVyO3t3pcijnADFuRdlCCsIEQuVIYk7y78Wn67dXA43tb3wxxZKE/VKhIzO/M0T
 r4bQNSIyTVAMjTqG6gkq/zqs8c+i7RQ81DK1lx37hlJwpHSIQgc69YVBTElJSXZG828P
 3UtKbNGz1ssgx09csY470X8PARUPJAT8Bl46UbXof7K7H9APlGm3bPjqu6l3iWImV1t6
 tdsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0P4LgLAwd23RvZRpXo4n9bDoeMvsbtK2X5N+B4o2WS8=;
 b=BdifM47+dgEasUA+RTm79qHsICXLXovBV0IWBk09w2CcS/GdwbkVz3q13PtxfsjquF
 CWFtn1IcgQMua8/VwtGXiKo2iId79ukv/NHJY2GOsR0kAhK9Uhl5vgKEO8Za7sXStQz0
 55IZlGcAZhpZa3hsR0ebrT7MZffGW/0Bo8ngsSgPMj3hOAiU6aUeJUSTXdu64lekJL/e
 YLBjUEqfg87SNOcvx/LstB+xYramOb8StirABoZ0+0SVR+nTom06ukJyxZLiMtfMkHQN
 DK+Bu0A0U6Mo/Wjw0Hf1hOjfxQA5GYimr/d9e138n2WFMKDsdoZlMbAm1vBAYX4KNyxX
 mwfg==
X-Gm-Message-State: AOAM530GuQqHoOMY18gT4l9sKRdA0OcaKshCMFul0J2bxGzOeBso+egT
 PRQFzhPt6hjbpH41uEtKkpFf6g==
X-Google-Smtp-Source: ABdhPJx+Y9zpLRfi6TECmsaeVWuPFjVtd8A+zbPdCw3e4gsvOOeW5QBDnedsiZDc+ccxdvkZGtyekw==
X-Received: by 2002:a9d:5909:: with SMTP id t9mr88508oth.263.1607464791245;
 Tue, 08 Dec 2020 13:59:51 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id j204sm18833oih.15.2020.12.08.13.59.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 13:59:50 -0800 (PST)
Subject: Re: [PATCH 10/19] target/mips: Add !CONFIG_USER_ONLY comment after
 #endif
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201206233949.3783184-1-f4bug@amsat.org>
 <20201206233949.3783184-11-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b31cd1bd-fd5f-f05b-e0a6-0df83035d5f8@linaro.org>
Date: Tue, 8 Dec 2020 15:59:48 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201206233949.3783184-11-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/20 5:39 PM, Philippe Mathieu-Daudé wrote:
> To help understand ifdef'ry, add comment after #endif.

This does more than that.

> @@ -550,9 +552,7 @@ hwaddr mips_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>      }
>      return phys_addr;
>  }
> -#endif
>  
> -#if !defined(CONFIG_USER_ONLY)


r~

