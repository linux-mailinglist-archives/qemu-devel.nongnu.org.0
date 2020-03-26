Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45362194603
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Mar 2020 19:06:50 +0100 (CET)
Received: from localhost ([::1]:57334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHWu0-0003s1-Qq
	for lists+qemu-devel@lfdr.de; Thu, 26 Mar 2020 14:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46656)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jHWt3-00036W-1I
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 14:05:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1jHWt1-0007Hi-4j
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 14:05:48 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:30032)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1jHWt0-0007GY-So
 for qemu-devel@nongnu.org; Thu, 26 Mar 2020 14:05:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585245945;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yHzZinL72dpz7J+NvdLNP5/b7y0BsFw4TNyQyyIx+40=;
 b=GBhc5GHk5MMedwdazNREYmBUaQRPYPLuh34NyZRLSR7HFqtre3giQ2Ju9V/Rxm8sPzFVOP
 aRdh6wMH8g6aqPtoJsOl4AwOl4Oj70x8ume/3KumIIHq6xeHNpKXtrWHeaEWl1+qE76ovV
 akdYQJwK8Vvfyij4smbbDg7s0iLO+hk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-oUW6zjB_NiS0Iwl7Uqhz4w-1; Thu, 26 Mar 2020 14:05:43 -0400
X-MC-Unique: oUW6zjB_NiS0Iwl7Uqhz4w-1
Received: by mail-wm1-f69.google.com with SMTP id f207so2853814wme.6
 for <qemu-devel@nongnu.org>; Thu, 26 Mar 2020 11:05:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yHzZinL72dpz7J+NvdLNP5/b7y0BsFw4TNyQyyIx+40=;
 b=uM9pftBabUg7ALcXILCXOz1wZHzZ+PmXcYQ8Na2gQGYm1TXM2uLZ0xM3VgYIgc1Ede
 4+gUxVCA4AMg4MKmHa9ExE4XuxTCJCGPPE0ySKu7MzG0D6+NfnlQSzznkEyGFOcYW1dx
 SEoPAamTeFNFXwuh8SlmpWUWiYgkYsaeQw1MPNvdBBzjtbNVne8cfOwhcEXHvlidy7d4
 0EmN5ZAom+uikcBhyjFl1si/QwXU87bYjBsHfg+0KI6vYT8WlhFLJ93ikRKc2yJPDTB7
 wY/rG0dS1XkjzoHp0aN7jrPWbfWhuuBrCYy40jCbOv5rYA6brYlhhTuIyo5Y1fjgoEW0
 ksYQ==
X-Gm-Message-State: ANhLgQ2tpwEyFtpShfFIm6Wvo75nAvrVaB+6tAiS4jW0OdeZO1zWd629
 DknXPrEQKBxLAGMMxQtnEgGi6W6/OB+24kJpm9ldg3okd2f5vKURAgeQwcFC8YcGktCCAQLzYXC
 BsrqmV0TbzwZ273E=
X-Received: by 2002:a5d:630b:: with SMTP id i11mr10129720wru.94.1585245942079; 
 Thu, 26 Mar 2020 11:05:42 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuYVfB1B/SFyKf7hWzIFxJ7M+9OkVt/+UdepBV+lyHfR+OQ8WxWAyGr1oO6JzMFsCXU2ZeDrw==
X-Received: by 2002:a5d:630b:: with SMTP id i11mr10129693wru.94.1585245941798; 
 Thu, 26 Mar 2020 11:05:41 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:ac:65bc:cc13:a014?
 ([2001:b07:6468:f312:ac:65bc:cc13:a014])
 by smtp.gmail.com with ESMTPSA id b187sm4782881wmc.14.2020.03.26.11.05.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Mar 2020 11:05:41 -0700 (PDT)
Subject: Re: [PATCH] qemu/atomic.h: add #ifdef guards for stdatomic.h
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200326170121.13045-1-alex.bennee@linaro.org>
 <CAFEAcA8Lo84gNk2tFCKsgM_O50bXTCs6Z9jH6aCvfDA56TDCmA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ba33454a-6e57-960a-7114-fc71a9f09442@redhat.com>
Date: Thu, 26 Mar 2020 19:05:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8Lo84gNk2tFCKsgM_O50bXTCs6Z9jH6aCvfDA56TDCmA@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/03/20 18:14, Peter Maydell wrote:
>> +#ifndef atomic_fetch_add
>>  #define atomic_fetch_add(ptr, n) __atomic_fetch_add(ptr, n, __ATOMIC_SEQ_CST)
>>  #define atomic_fetch_sub(ptr, n) __atomic_fetch_sub(ptr, n, __ATOMIC_SEQ_CST)
>>  #define atomic_fetch_and(ptr, n) __atomic_fetch_and(ptr, n, __ATOMIC_SEQ_CST)
>>  #define atomic_fetch_or(ptr, n)  __atomic_fetch_or(ptr, n, __ATOMIC_SEQ_CST)
>>  #define atomic_fetch_xor(ptr, n) __atomic_fetch_xor(ptr, n, __ATOMIC_SEQ_CST)
>> +#endif
>
> This will work around FreeBSD's current implementation in particular,
> but I don't think there's anything in the C11 spec that mandates that
> atomic_fetch_add() and friends have to be macros and not simply
> functions...

That's not a problem as long as they are all functions, the macros would
simply override the function-based implementation.

Paolo


