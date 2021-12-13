Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2812747375D
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 23:20:34 +0100 (CET)
Received: from localhost ([::1]:44180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwtgO-0000kQ-9W
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 17:20:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwtfO-0008Kj-KI; Mon, 13 Dec 2021 17:19:30 -0500
Received: from [2a00:1450:4864:20::434] (port=38834
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwtfM-0007lQ-Vs; Mon, 13 Dec 2021 17:19:30 -0500
Received: by mail-wr1-x434.google.com with SMTP id q3so29440989wru.5;
 Mon, 13 Dec 2021 14:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vymn4wCJByAnVWsuR96QesJ7KcMEb5O52MV1GAs0rO8=;
 b=qSD4tavdrqnHny/bIGVu/9cqyPNlTUACYhlx6DU/hGZMpdXp/kY5I1q187IPDRqhuu
 2E5gLLCIUrnFlMAhdJX5qVYkfgH8gt0meiHHD+MHQ0XfQkiIKiqeGGEFLDDrl9UsjrGv
 F4Qqhl7QpawzifNZk+nINCCL3jcgTyOral9PSmvANxJ57QGBKafaLXQQWyU/wBFzbuGC
 IbOx6A7eYUdCrqXnZiD+DEUrhsShR/MEs9pgYIJqfIsxiHL5Xc8WbOt9xbert2LadaAd
 G5lPSwx2Tf/99+pBALaMVQrk6dKpxziXukH1Y9OWzCjRKTor2kac7D0C+Y3QHMsf1DmJ
 3Krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vymn4wCJByAnVWsuR96QesJ7KcMEb5O52MV1GAs0rO8=;
 b=a4hBRA+wnhVR8w9l2ie2p5pX4ruOBxzSjqe3BGKkU38JGUziQarfx0UJ8KjW41vxru
 o6a3VadQLc3KveG9Gq0spR4+e96YPs4oOcUKdnKsr4E6KjwAyvqRXgbQMiPOUXadnhvz
 Um1CEMDJ6Sy9H5q4j/b7btxC7tDFvzloKCE081OyPVQwmwd5suH3MKC3KhQx8Hbg0uSF
 QqIg/8PXWShGdTjmXXKnT7QvV97RGUz/0zy1fbtjgbLCViOTaclZzliEJEakGW4VE/NY
 dEkkF90PqpS5B15xTZslYXsoT7G+2W6Mgh8Hz6jFk93szAihELDiYUzNhmjVpwPBmqlX
 L/Og==
X-Gm-Message-State: AOAM532xB9xrdB7GfWNUZ76iCFYOWlrh8wx36hyGlefKMO6zQlw/0V6i
 XNvGazdOkGoLYBim5mCmWy4=
X-Google-Smtp-Source: ABdhPJxI96K5Zthe3J1O5Ww0H/bPAeFLRY7ICS+Eb9Q1Oa4rRLW6QyCAQSCU7NNphqw462kXYt0L5Q==
X-Received: by 2002:adf:9d82:: with SMTP id p2mr1429405wre.414.1639433966744; 
 Mon, 13 Dec 2021 14:19:26 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id g16sm272970wmq.20.2021.12.13.14.19.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 14:19:26 -0800 (PST)
Message-ID: <02d2318e-f857-60d2-27f8-da7992193008@amsat.org>
Date: Mon, 13 Dec 2021 23:19:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC PATCH] target/ppc: do not silence snan in xscvspdpn
Content-Language: en-US
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20211213121320.947362-1-matheus.ferst@eldorado.org.br>
 <e5c3273a-8438-e7cc-6856-796fa1639786@amsat.org>
 <32d0bb0d-3ad0-6f9e-eec5-97fce795ee24@eldorado.org.br>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <32d0bb0d-3ad0-6f9e-eec5-97fce795ee24@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, danielhb413@gmail.com, groug@kaod.org,
 clg@kaod.org, alex.bennee@linaro.org, aurelien@aurel32.net,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/13/21 21:15, Matheus K. Ferst wrote:
> On 13/12/2021 09:36, Philippe Mathieu-Daudé wrote:
>> On 12/13/21 13:13, matheus.ferst@eldorado.org.br wrote:
>>> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>>
>>> The non-signalling versions of VSX scalar convert to shorter/longer
>>> precision insns doesn't silence SNaNs in the hardware. We are currently
>>> honoring this behavior in xscvdpspn, since helper_xscvdpspn handles the
>>> conversion with extracts/deposits/etc. OTOH, xscvspdpn uses
>>> float32_to_float64 that calls parts_float_to_float, which uses
>>> parts_return_nan that finally calls parts_silence_nan if the input is an
>>> SNaN.
>>>
>>> To address this problem, this patch adds a new float_status flag
>>> (return_snan) to avoid the call to parts_silence_nan in the
>>> float_class_snan case of parts_return_nan.
>>>
>>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>> ---
>>> This behavior was observed in a Power9 and can be reproduced with the
>>> following code:
>>>
>>> int main(void)
>>> {
>>>      __uint128_t t, b = 0x7f80000200000000;
>>>
>>>      asm("xscvspdpn %x0, %x1\n\t"
>>>          : "=wa" (t)
>>>          : "wa" (b << 64));
>>>      printf("0x%016" PRIx64 "%016" PRIx64 "\n",
>>>             (uint64_t)(t >> 64), (uint64_t)t);
>>>
>>>      b = 0x7ff0000000000002;
>>>      asm("xscvdpspn %x0, %x1\n\t"
>>>          : "=wa" (t)
>>>          : "wa" (b << 64));
>>>      printf("0x%016" PRIx64 "%016" PRIx64 "\n",
>>>             (uint64_t)(t >> 64), (uint64_t)t);
>>>
>>>      return 0;
>>> }
>>
>> Why not add this test in tests/tcg/ppc64le/ ?
> 
> I'll add it in v2. Is it ok to use __uint128_t in tests?

What about:

  int main(void)
  {
  #ifndef __SIZEOF_INT128__
      printf("uint128_t not available, skipping...\n");
  #else
      ...
  #endif
      return 0;
  }

