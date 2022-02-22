Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D93BD4C003A
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 18:36:02 +0100 (CET)
Received: from localhost ([::1]:38670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMZ4z-0006UK-EY
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 12:36:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMZ2o-0005QH-EJ; Tue, 22 Feb 2022 12:33:46 -0500
Received: from [2a00:1450:4864:20::336] (port=55965
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMZ2n-0001Pj-0M; Tue, 22 Feb 2022 12:33:46 -0500
Received: by mail-wm1-x336.google.com with SMTP id i19so12037754wmq.5;
 Tue, 22 Feb 2022 09:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=qZLmnfjrVWGUsUh3atQSO7JD7Pzw6Vtie5hI2woz6dI=;
 b=acT60s1lSiIGzhyqvZorD1b69R4aBJSZ+QAnwADjvGVMECGa50/CE3Sq70tclgN6+D
 eY0Ene6yPWxAFVxUAY4tfAig5R1VSoZ2x4YItuj7j3zyFlgZeasANCGGvbNq+0oQzuYl
 RtZFrPF7nvAQOYrFIumyTnhNmIxgj5yhMcNHtYhpEsY3jeXwVk5sRhdH/CQ3tfvRgirT
 UnEEsudpNRvwX6/I/iHJDugXLkcmJjYdjouB7J61wIEVSE5PLL60CXGK9LSdRzglGOkd
 ANaBhOgFqhBn1hrPXXG7FXKSaMUBa9LzEbiNLHp6WVYqPrUtFhVPq8ZiioWsS1jiFVy2
 Zp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qZLmnfjrVWGUsUh3atQSO7JD7Pzw6Vtie5hI2woz6dI=;
 b=kdrltltDHVY93EVCuG9HiuGB3inR65mRkmfMdGsiDrfk+TZ1Uz2/tH/B99B1ra4RAm
 5/ZkA4gO1ZEuq9j9rA0oAgP9bKiXzMjdSsDkEsfnvABHvJ2YxPRIOEDVmR2fWGFAyO45
 Uh7JDcxEGuV7XFT1Lxx5ydrbRa0YJ/tEqm4Shnep7zEvlZNSpgy2Fg/X6DmhESy0nPHY
 V7g1AHq4I5v+hx7y1kT7un9+hy4crd4xYeqVUlvOr/ngzazR9CkfeOSf0zwv59txsLPv
 GPYaxLslPjXEtRm2vUdksBYYH+YwBpOKC/t+zCKB5O/Klny09lkLYwMJnxzz34s9boCF
 6RPg==
X-Gm-Message-State: AOAM532pd476amxRVDnCERP6SVD177RC01oQUUpvpck/5yaBLthAL3xZ
 UHdRZUh3t3p8bSudpsMpBi4=
X-Google-Smtp-Source: ABdhPJx2QZMXe6tpcpZ30/gE56mY+F/lIGiBc9njhTNS7xX2No62I1ck7SjkOaA33z3q/mLtUYLz/w==
X-Received: by 2002:a05:600c:240a:b0:34d:c8ad:dc07 with SMTP id
 10-20020a05600c240a00b0034dc8addc07mr4214655wmp.145.1645551222836; 
 Tue, 22 Feb 2022 09:33:42 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id i9sm33308870wrf.79.2022.02.22.09.33.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 09:33:42 -0800 (PST)
Message-ID: <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
Date: Tue, 22 Feb 2022 18:33:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <874k4xbqvp.fsf@linaro.org> <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <YhURfqMvRT4xbiz6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Oleg Vasilev <me@svin.in>, Idan Horowitz <idan.horowitz@gmail.com>,
 Cleber Rosa <cleber@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Emilio Cota <cota@braap.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Igor/MST for UEFI tests.

On 22/2/22 17:38, Daniel P. Berrangé wrote:
> On Tue, Feb 22, 2022 at 04:17:23PM +0000, Alex Bennée wrote:
>>
>> Alex Bennée <alex.bennee@linaro.org> writes:
>>
>>> Hi,
>>>
>>> TL;DR:
>>>
>>>    - pc-bios/edk2-aarch64-code.fd should be rebuilt without debug
>>
>> Laszlo,
>>
>> Would it be possible to do a less debug enabled version of EDK2 on the
>> next update to pc-bios/edk2-*?
> 
> NB, Laszlo is no longer  maintaining EDK2 in QEMU, it was handed
> over to Philippe.  I'm CC'ing Gerd too since he's a reviewer and
> an EDK2 contributor taking over from Lazslo in EDK2 community

We need the DEBUG profile to ensure the bios-tables-tests work.

If you want to boot a guest using EDK2, you should use the images
build by your distribution (/usr/share/qemu/edk2-aarch64-code.fd),
not these images.

Regards,

Phil.

