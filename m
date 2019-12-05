Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A1511483F
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Dec 2019 21:41:45 +0100 (CET)
Received: from localhost ([::1]:60754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icxwW-0000to-Pi
	for lists+qemu-devel@lfdr.de; Thu, 05 Dec 2019 15:41:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43239)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1icxtr-00088R-If
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 15:39:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1icxtq-0002gM-7I
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 15:38:59 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:34999)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1icxtp-0002bj-TF
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 15:38:58 -0500
Received: by mail-pj1-x102d.google.com with SMTP id w23so1761594pjd.2
 for <qemu-devel@nongnu.org>; Thu, 05 Dec 2019 12:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6Xwn3stanzQTThUZS9/BzgifLfh83RoGNDbrcf7/gRc=;
 b=kr+5LIob2jzAWyaa0HalfctGAJWBItl4LullfZ6A9aE5bTzNFSVJnNNuTQE3RjTlPz
 GfrwGDrPNq91rjb5G2hTAZMXLMgq/7LHQGp4Y2B9gb6mJmSasS1urQ3Ufh6gmiK+Iq9J
 VFrDQ6Zb3Xa2d+SVU+VtDQaq4ZwQVoZOH+EpIcQljMGSW5EdmbWV4y5Oo/bhPykmQ/KM
 yDQk8YqlC44gSLtE6pKs4ULOGMbUTEFrzjtD5ux2VDVLdY+B6esc2qGDDVcFfLXCZQvf
 Ol0LFB5o4kTRpL03lLcBm5n/tXE1OIT371zSrQ6ShteNxN3bD2h5ivS+b8KtF6GqHI3X
 DaNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6Xwn3stanzQTThUZS9/BzgifLfh83RoGNDbrcf7/gRc=;
 b=LUkTGDB6GlWJB6YeJ1KyqN95lw4o0H3ufg5VI/CLtjXKWJ2naxpbaen5bC2XRpEAee
 3rl3M9YcOVMhluKQlEcwqjH0rbSwzNllAwsoh0dKzRRuiVz8rrFEJc7NhlXvRVK0E4Kl
 ZiT2DsrFX2FJ2IESnCcIAN35l/tKdBCDMpMuRqY+Cvtc6iO+Pxf/pEhLWQN3ZchxpYG5
 dQmJt4Jr2VlPZf2c8oNvu+9k3Qn4piaSSx/7yWuncVdbPwIiIBvuu74n4VIja3Pa+lFm
 19r2AIkHum40CIRDdA8xxa+hKg1C6u9aQnFp+TCxk6VqV7OFyOufDatIGl0AB7eSd80Z
 wvzQ==
X-Gm-Message-State: APjAAAUW6viMNXJzxyHvB9mlJs+sncSS40GDfutUnasAWvZLkff/uZtO
 ARwned6L1DvkphEeEtgISB+GpA==
X-Google-Smtp-Source: APXvYqzdOk40HpgwFI0k647i4q3nVDVLiUesZp31T6644fYOPdvaU7jOCC55rsU8qkn0qr3gRx14dw==
X-Received: by 2002:a17:90a:1aa3:: with SMTP id
 p32mr11694736pjp.8.1575578336432; 
 Thu, 05 Dec 2019 12:38:56 -0800 (PST)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id k9sm568547pje.26.2019.12.05.12.38.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2019 12:38:55 -0800 (PST)
Subject: Re: [PATCH-for-5.0] hw/alpha/dp264: Use the DECchip Tulip network
 interface
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191204233918.6073-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fccf1e01-c198-fb4e-0063-1418fd64c744@linaro.org>
Date: Thu, 5 Dec 2019 12:38:53 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191204233918.6073-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::102d
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
Cc: "Emilio G . Cota" <cota@braap.org>, Sven Schnelle <svens@stackframe.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/19 3:39 PM, Philippe Mathieu-Daudé wrote:
> Commit 34ea023d4b9 introduced the Tulip PCI NIC.
> Since this better models the DP264 hardware, use it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/alpha/dp264.c | 4 ++--
>  hw/alpha/Kconfig | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I've tested that a 5.4 kernel built for alpha is able to communicate via this
driver model.


r~

