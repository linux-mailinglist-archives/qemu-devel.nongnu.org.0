Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B40650AD0
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 12:40:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7EVG-0003VU-Pj; Mon, 19 Dec 2022 06:40:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7EV5-0003Ti-Q1
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 06:40:12 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7EV4-0004Tl-1C
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 06:40:07 -0500
Received: by mail-wr1-x42d.google.com with SMTP id w15so8309085wrl.9
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 03:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EeeS2joYxR7oCy2i2HMbvDrZgaaYyx5ayu5sBpXvaTU=;
 b=ntkujnGojIXU02w/1lozEYYgQ6On7ndnGRIEXTFDSutELS7WmEe8ADttRTZwvuVj4p
 zILKp3uojo7IhjUB2qxoknWg4N0R4rneQuHFJ1e1cd6DNq7uOOEOuhfcYXTApGQyUVDq
 nypkSGKhG/mUhP/rjxFfo4lLKvjiDxDHEShfOnU7OYp5nDq008u73F65XOodZOP6C1zz
 xexqYRb7ScSXIPgtHc8mE/7aubBpYdlU/CbKGqwaezGaJBj6WBvNWwbtBSD63p8/Bbud
 /lVq8quOOWImTexa3kg696ldedhXq+czZeflgdksjd/E1Ck1VtY3TtJUpZjPg8uIJhT0
 La3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EeeS2joYxR7oCy2i2HMbvDrZgaaYyx5ayu5sBpXvaTU=;
 b=NYCSFZgGbXc4wP2+b4alxQd6JScdHIMQEJFGYqo2kOznGYqsCvhv6fca+uUZQx+enG
 PxolLhamPIOZa51iBhxAsRKwrqTxslBnwsPYSBmbxnKqdmHp31cr19E+1cke9YoLSMsT
 nNS1de61GV9AJd3fyt1MdquDE6D4/bnhUPyXP6FDHi2GQjaBvKpO9WHCORGULdXcfu4V
 bO9WKO1d9ISb4TwO4kC8dgdg2YGoWoe+p1BiAR926ZHf5GbjxxxhRImJHgS2h9yRqWPH
 8vKxjgfYQxZttFE3dLXfVCTl5xuJa5srQTsPpcb3PVUDS9L3RecQyEqLYTo1RpjpvmyU
 7BzQ==
X-Gm-Message-State: ANoB5pnPDyG2JfjIYZ7TN6QUVz08U5b5vlJutg1PoJ4KiNAgc1RcMUfu
 1q586gb4M5eRMUmc7F19WzaKMQ==
X-Google-Smtp-Source: AA0mqf4oAJRAoFFpXTDr+OxSNQopTAFT7kafnCHpeheyBcILozVQHNHDdmmrSwGgv6I7UWVTmhUTlg==
X-Received: by 2002:a5d:414d:0:b0:242:864e:c71c with SMTP id
 c13-20020a5d414d000000b00242864ec71cmr27377525wrq.24.1671450003997; 
 Mon, 19 Dec 2022 03:40:03 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f2-20020a5d50c2000000b002362f6fcaf5sm9673105wrt.48.2022.12.19.03.40.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 03:40:03 -0800 (PST)
Message-ID: <02766634-1ec0-436d-d641-c0c61997138e@linaro.org>
Date: Mon, 19 Dec 2022 12:40:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] meson: Clean up some dependencies regarding qemu-system
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Helge Deller <deller@gmx.de>,
 Michael Tokarev <mjt@tls.msk.ru>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org
References: <Y5zB+5t5K0AEj6Rn@p100>
 <31003f9a-5392-67ee-9ef2-01794c09510c@redhat.com>
 <75b841f6-1eab-9d5f-2ad7-89440931ac18@gmx.de>
 <CAFEAcA8q8aqWvd7dwuH79yzq6Kyg-EVo9YzsWJ_mav4bLLH7eQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8q8aqWvd7dwuH79yzq6Kyg-EVo9YzsWJ_mav4bLLH7eQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 19/12/22 12:31, Peter Maydell wrote:
> On Mon, 19 Dec 2022 at 11:22, Helge Deller <deller@gmx.de> wrote:
>>
>> Hi Paolo,
>>
>> On 12/17/22 14:28, Paolo Bonzini wrote:
>>> These are wrong.  qemu-bridge-helper, virtiofsd, qemu-storage-daemon
>>> and qemu-keymap *are* tools; if they fail to build due to any
>>> dependencies, or due to other compilation issues, you need to add
>>> tests to meson.build and check for the cause of the issues.
>>
>> No doubt, those are *tools*.
>> But aren't those only required when you run system- and/or user-emulation?
>>
>> Looking at the packaging of qemu in debian:
>>
>> qemu-system-common debian package consists of thse *tools*:
>>     qemu-bridge-helper, vhost-user-gpu, virtfs-proxy-helper, virtiofsd
>>
>> qemu-utils debian package consists of the *utilities*:
>>     qemu-img, qemu-io, qemu-nbd
>>
>> IMHO this categorization makes sense.
> 
> Possibly, but it's not the categorization we use upstream,
> which splits our binaries into three groups:
>   * system-emulation binaries (qemu-system-arm, etc)

Subcategory:

        * helpers (required to use system-emulation binaries),
          apparently provided by 'qemu-system-common' on Debian
          -- except virtiofsd which is not a helper --

>   * usermode-emulation binaries (qemu-arm, etc)
>   * tools (everything else)

       apparently provided by 'qemu-utils' on Debian (without
       virtiofsd).

@Debian: Maybe virtiofsd deserves its own qemu-virtiofsd package?

> 
> (I think the guest-agent may be a fourth group.)

(or part of tools?)


