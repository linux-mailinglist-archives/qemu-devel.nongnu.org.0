Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C94BB6296ED
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 12:14:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1outst-0000yA-Dy; Tue, 15 Nov 2022 06:13:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1outsq-0000xy-Tk
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 06:13:40 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1outsm-0001yt-8e
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 06:13:40 -0500
Received: by mail-ej1-x634.google.com with SMTP id ud5so35223626ejc.4
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 03:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uSAeOXOBQqvCmGzwruIa9vg/uorhgIM7zq2WUJrTCwU=;
 b=ePC4Uw+e2x8gwIuxPzNicUOCZG8lkOEp07mN7ydyj7VFRUzZ6hvv/D+/sb839cA5YY
 8ZC3Xnp8QQuuL3nb8ptauI7Jm8Ai3i3MqAp/pmEKW135AKLFGxYvhwJglkfHBe8s0rCM
 IHuX5DdPS/+nP+jRUhgU+aaqXCg1ZL7xWeZGwmDZ2jXrmjW5nOzcqhiqS7+0EdM9P+VP
 Fp3tULL+5dPZku/fWkQeunvxhapepOz7xvraIWh8KGkQR4dPnpjtHhLTio6KVuaSCZRf
 dbVrx83F6j7w/wJjDjO1B8uSSlu7hraNGoAI2mXkqq2bb3XYGnJRHgbqXkbkn1P2Q9Tw
 4pBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uSAeOXOBQqvCmGzwruIa9vg/uorhgIM7zq2WUJrTCwU=;
 b=PR1658yX7iI+0ZPbeKLGIjs1lBq/d1J8kSLVNg0jsOpbb+MwUkPZMS7BzZj2vRtLl6
 VG1isj0SKDszDO7AHjp8dDscHWHNfRZ/SaafjxvbW1IZ1FL06glunxn0RrdcfPuEyy7p
 xzf6ve48bYycSlfCZT024Ji9y0fyXtkAOePqNmIRgPopK3nErFSko6EbBrVWakLRtLdF
 R11IXGYZYP/tHMP2Xll5xdJvp1jQHHLJdp30uuqj1+MajUYTeqkNUtb1H2dAcSe4EDwu
 n9Ra8412WpOdyZWlljzBGfDcVKgijSVil073t1NM54N7xsaE5LLntn9KxDPVsLV+QleH
 DVaA==
X-Gm-Message-State: ANoB5pnCEpCzoicjYkQ7+ksIGUjOZx8IHHt0iOAEJOFbPuxE5RL5hQkz
 rufXLIRRMC8932JvToDOU8rdhg==
X-Google-Smtp-Source: AA0mqf6FvlsxuH/XqaQCK/txyBUKecAaTgonP4hODYNMgEv5RegCp+5kObQeoscF7r4VcHn4NZdzEQ==
X-Received: by 2002:a17:906:d8d:b0:7af:883:ec72 with SMTP id
 m13-20020a1709060d8d00b007af0883ec72mr5215519eji.727.1668510813899; 
 Tue, 15 Nov 2022 03:13:33 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u9-20020aa7d549000000b0044dbecdcd29sm5984065edr.12.2022.11.15.03.13.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 03:13:32 -0800 (PST)
Message-ID: <d984ce52-4fc3-8c22-83bb-93e901a67ce6@linaro.org>
Date: Tue, 15 Nov 2022 12:13:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: tests/avocado/machine_s390_ccw_virtio: Fedora test failing
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>
References: <0245aa92-e9a0-5c1f-cd62-65002ba2ef81@linaro.org>
 <3b848b0f-4040-c281-58ad-2d6c8dff1998@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <3b848b0f-4040-c281-58ad-2d6c8dff1998@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 15/11/22 12:05, Thomas Huth wrote:
> On 15/11/2022 12.03, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> As of v7.2.0-rc0 I am getting:
>>
>>   (101/198) 
>> tests/avocado/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_fedora: FAIL (23.51 s)
> 
> Is it 100% reproducible? ... the test is known to be a little bit shaky, 
> that's also why it is disabled in the gitlab CI.

I am running it on my workstation, not GitLab.

  (1/2) 
tests/avocado/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_devices: 
PASS (7.69 s)
  (2/2) 
tests/avocado/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_fedora: 
FAIL (23.07 s)

  (1/2) 
tests/avocado/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_devices: 
PASS (6.63 s)
  (2/2) 
tests/avocado/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_fedora: 
FAIL (24.27 s)

  (1/2) 
tests/avocado/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_devices: 
PASS (5.39 s)
  (2/2) 
tests/avocado/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_fedora: 
FAIL (24.23 s)

  (1/2) 
tests/avocado/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_devices: 
PASS (6.65 s)
  (2/2) 
tests/avocado/machine_s390_ccw_virtio.py:S390CCWVirtioMachine.test_s390x_fedora: 
FAIL (23.55 s)

5/5 failures. I'll skip it locally (no need to send a patch) and we can
have a look after the release.

Regards,

Phil.


