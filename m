Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE8318726D
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 19:35:20 +0100 (CET)
Received: from localhost ([::1]:46090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDua7-00041h-8G
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 14:35:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39917)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDuVL-0005OQ-Pu
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 14:30:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDuVK-00021j-Pq
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 14:30:23 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:38055)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDuVK-0001tP-HP
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 14:30:22 -0400
Received: by mail-pf1-x444.google.com with SMTP id z5so10425173pfn.5
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 11:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zXG9MxOmcDsstPy5OkZWHn3ZDPt5p7/aZJhzNKblZx4=;
 b=CliIPe9J/5WCWJsEcJB7QbsdEn7A5uDyXuq3n64dbwunJ0nWPQ7G5EYLRXa+Mv9xvK
 aXX1Sjw0hNPxZovuOo26QwgTgS2F+jV2wjleLl4WVGCQHsqZe82+VrSpcj37nkvw7UX+
 NaNaWqlWcdbtvQeoo00LHwy2c4680LSe0u84ZrjzhUEoklklJwhcA7l3KR2kghQ3s8Bz
 bmtUiGOyM/FsNVCVmQenjhJNA5c72KjcHQXhpFVnb+wy7rxSiOi3+fJY9d7JQ1azL8Y6
 3fLPdPDWINaYlgYQw0qRN+I/iTXp3QBRyQgW7DNQBYwub2AXNbDUzuWEXUdUuL1PPK8S
 NFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zXG9MxOmcDsstPy5OkZWHn3ZDPt5p7/aZJhzNKblZx4=;
 b=D3FTcVuNQXS2PnOn6rx8FvnuY6MczItsWP5AT6BxvUCsagcdP3hIpy4ACV5CXiq+G5
 AYsHVv74c/+kD7x0C0PVOb5r1Bng2h+H/mOHlxOCIWumhKx7lbgYf4u5wHGRwPbbxAm6
 JsAu9KhjGefw5+nE6u7IMV6ooNu6s2Ky/c/AzdL7P/wMiSJ+FdkRmcSKBVp+CCb/7ph7
 EohEyI17iTlJLS6x/VV4ReOIfSQdRwOpl0yMSO6Lf1i+eGGB3HeEyYYAAreg2xOd1dQB
 jaoOK32e/iqOOFZTC7AtFi4mUnrjyXTsLbT+y50Fip8uGEJQfpRykAGJh7zQrMd0+RIh
 m18Q==
X-Gm-Message-State: ANhLgQ07AjeVDDiuPvtL3B/aI7EV5osmXYmc/EtMYPNEhYSvF6AWjicN
 mwNPSPkff1MNv1cYOTyqrUNGEA==
X-Google-Smtp-Source: ADFU+vuWDoaRNy6pwfZ6+90MJ0YGEXMBaLvEQE3acvd+5M9wYG3cAQj0Uxdd+iG1dLEeK3QevVs6gA==
X-Received: by 2002:aa7:8195:: with SMTP id g21mr880931pfi.153.1584383421533; 
 Mon, 16 Mar 2020 11:30:21 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 10sm585563pfh.13.2020.03.16.11.30.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Mar 2020 11:30:20 -0700 (PDT)
Subject: Re: [PATCH 02/11] MAINTAINERS: Add an 'overall' entry for accelerators
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200316120049.11225-1-philmd@redhat.com>
 <20200316120049.11225-3-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <972ca187-efac-7e51-3a48-9c2033b528bf@linaro.org>
Date: Mon, 16 Mar 2020 11:30:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200316120049.11225-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/20 5:00 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

