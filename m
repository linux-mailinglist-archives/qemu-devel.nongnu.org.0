Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E4B187266
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 19:33:30 +0100 (CET)
Received: from localhost ([::1]:46002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDuYL-0000bi-FJ
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 14:33:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39638)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jDuVB-000592-7l
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 14:30:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jDuV9-0000yR-Rs
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 14:30:12 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:52641)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jDuV9-0000qU-4K
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 14:30:11 -0400
Received: by mail-pj1-x1042.google.com with SMTP id ng8so1801560pjb.2
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 11:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FR4CXDT/MV4TMIIhDFkq2Uq7oFrT2COtOJERED7a8oU=;
 b=fPi+AOhz3gSBzyg2Gmynd8mLVV77M3Izw7TvaJfk3SO5KLyipfWcFb4usBlStToOkq
 E3yZ0SlemOxmD/cymAHzMHYFpEMdpTqRkT+No0vsNIK5bAL/V7wYGzLHV8t3bc0GE2Hp
 3zkoF6yCX9Xh6l7EwQ6prO0Kt+1nd9r3+ar6Sooxy9pAaGkj0VHH0P+lMa0DEsCC5DCz
 h3UHaLFDdDnKVLW8OAvZSD1Ve8yDgcLIA3O+RKJtz2u6YEngGGw7QtqjnX0e7Sff2XC0
 5QMDLyRTUcnxSUC0uLYURQwFZFRJp/DmSSNU1bafk8qYR3WwXWcmYvF1xPHNCpvJM2He
 SZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FR4CXDT/MV4TMIIhDFkq2Uq7oFrT2COtOJERED7a8oU=;
 b=bWbryyKWiSzikP5SfmJ2XWkUSC2rAyI2iDRpWZvImMZZT15Js8kP0g3k5fjzhBZdWX
 Ra419u1WFVFeKUK4jXJXWCbXA6YV6/eks/xkjjwREnNwU4lBc585O1LDi7/a8uRs0m7j
 GEmZS+fXiD2IJUillmOvqEdUsyzvWdgugfTIy9rzPvqOP8kwrDf7EIGyvzp7kgUbyGtV
 iELpD3s55fdJYuILYct9d9Gl+X5612Qj3v/AfMRUXWCGCYchZTtsFXM0loCqhkMsgPwr
 YZ0LKXkUiugH38GwOcxjeiI9FZmby7O4XRxmNzHpXOoiqgVLtugu3TPNlYxaQgl6IjwX
 MzGA==
X-Gm-Message-State: ANhLgQ06gMI7QQEg5meY43gXRJl6xnbeSE6oPm7/1MRA3keiqmI3w28C
 dAIQefuG2WxN1v0lljB4sZexuQ==
X-Google-Smtp-Source: ADFU+vtucBa9dzR3uy9gZphrvh99CcMGmONtQ8V5959dEJNsshsxRBhx2EMtxEW1f8E/dpyvZvQEuQ==
X-Received: by 2002:a17:90b:d8d:: with SMTP id
 bg13mr875439pjb.29.1584383409394; 
 Mon, 16 Mar 2020 11:30:09 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 z16sm577714pfr.138.2020.03.16.11.30.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Mar 2020 11:30:08 -0700 (PDT)
Subject: Re: [PATCH 01/11] MAINTAINERS: Fix KVM path expansion glob
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200316120049.11225-1-philmd@redhat.com>
 <20200316120049.11225-2-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e2537c54-f65d-1b9b-43ba-9657cc2b3146@linaro.org>
Date: Mon, 16 Mar 2020 11:30:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200316120049.11225-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1042
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
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/20 5:00 AM, Philippe Mathieu-Daudé wrote:
> The KVM files has been moved from target-ARCH to the target/ARCH/
> folder in commit fcf5ef2a. Fix the pathname expansion.
> 
> Fixes: fcf5ef2a ("Move target-* CPU file into a target/ folder")
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

