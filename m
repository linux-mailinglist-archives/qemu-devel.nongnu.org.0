Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F40CD3E3872
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Aug 2021 06:32:00 +0200 (CEST)
Received: from localhost ([::1]:34652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCaTg-0003zW-2b
	for lists+qemu-devel@lfdr.de; Sun, 08 Aug 2021 00:32:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCaSZ-0002XO-23
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 00:30:51 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:33729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mCaSX-0005Pp-Ih
 for qemu-devel@nongnu.org; Sun, 08 Aug 2021 00:30:50 -0400
Received: by mail-pl1-x631.google.com with SMTP id a20so12855639plm.0
 for <qemu-devel@nongnu.org>; Sat, 07 Aug 2021 21:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MF5gba+pTu+Y1qbj6yVSLA/oY+ZwD5vr/xTN9VFVte0=;
 b=oalnD+e1rFvFSNOdRiioABHaW59+mnzx0wzL0/jx3xPePd7AfGURi7ewqE9gZ9mNao
 eWWGO4ZB5PqwhF8TlWiymWKJxSpSFH99HXjaLAreJSIvCiTRmthmx+Wt0Z16NdN/Hn7p
 5YQs7yxQklWRNTiMImZkCd+Xuz51+3w4k5PDmxRACvvqSOMVdZtzN8kg9Xwvd5p1dvHR
 QkkompIk3r1t1dhrtyMxmknR+CU4kOOiwd6BHk4VE0C/+O34ehtwfvjb7HKb9Yu76kj1
 sPBgdBjqcFdMaCPldBHKdH7vb8bhw6af57KUs02XQYMrb3CgorzwI9mqLcgZeT92BMfj
 gBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MF5gba+pTu+Y1qbj6yVSLA/oY+ZwD5vr/xTN9VFVte0=;
 b=L2bOpGaGfzKGCWEcwvUlkM8hrwOZj7dkdUZKiNobcfRh+OdGe0fWf1Ru5X6YTYj870
 3TLsS/ORxL7xsXeNKO69f1TMc6ST9OBJYzTpHGECXEqzvFiGC2RrBMPbg4WyoI46aJJ2
 cTp/hGgP8Poo9fmkWHgACg7MJQe1L6uADcny1RUjLO27vhbGMpsyGdll5+NCW7O6uqkP
 WIFEHfht5fPw9qYsWnI5qZAWoB8OyJ++eGb2cDg+JRHVQmO/0tPwIGIwtf7N6nTiVJoy
 y0Br2AvHxFGAE6/o8umxlLgfMfJZmLbtGdV01aRfJbQrCdSH+1xUO894qql+fMuErsTk
 utSA==
X-Gm-Message-State: AOAM533zI3HwONKky+7f4kFuG+maR1YL+p1buyDet1F3AKW2+/J7TjS7
 QqE0PI1UlKgp1N6WYZN2hvJs+XJ/LMEEeg==
X-Google-Smtp-Source: ABdhPJwM2e6ScXFPlvFD2oGA4Tlmw4qYwR2VEWIE64lhHd56Ke4lNAOrzWeL9sVbdpSOfXrDtvYfmA==
X-Received: by 2002:a63:dd51:: with SMTP id g17mr968621pgj.47.1628397048224;
 Sat, 07 Aug 2021 21:30:48 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id l6sm15348731pff.74.2021.08.07.21.30.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 Aug 2021 21:30:47 -0700 (PDT)
Subject: Re: [PATCH for 6.2 04/49] bsd-user: Remove all non-x86 code from
 elfload.c
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-5-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dd1af0d6-ed1a-d4ff-1632-bdb4190a3aee@linaro.org>
Date: Sat, 7 Aug 2021 18:30:45 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-5-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: kevans@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:41 AM, Warner Losh wrote:
> bsd-user only builds x86 at the moment. Remove all non x86 code from
> elfload.c. We'll move the x86 code to {i386,x86_64}/target_arch_elf.h
> and bring it that support code from the forked bsd-user when the time
> comes.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/elfload.c | 347 +--------------------------------------------
>   1 file changed, 2 insertions(+), 345 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

