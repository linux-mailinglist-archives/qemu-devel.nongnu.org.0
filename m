Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 397706923F6
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 18:05:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQWpF-0004RZ-1p; Fri, 10 Feb 2023 12:04:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWp8-0004Oy-Ep
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 12:04:34 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pQWp6-0005To-S7
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 12:04:34 -0500
Received: by mail-wm1-x32c.google.com with SMTP id bg26so4332905wmb.0
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 09:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ptA/vLYU7bWhA6ewsDK4bcDTBQczDvbgRAwm4IkN5Mc=;
 b=m+1z210xHroIjXghN/1rJgN0JFTTS/r9kdCLEYL/in2RVLuJQIFGXH4YrYArPDzDel
 YRTqAT2Q52iqRAtME34VpSpd1YqHw5Tkkz/qNx140Ud5cXZHaA+SJupRegwBeWFELdO/
 +1jxDjpigdja2zGEA6zShqBFghYyxUzjEOX9sTpvk+NkHeATe6qN4PJY5z6fetAp3uFl
 RvcyE6UdQUpqgXM5dwVhCntwuwUHJhZb8/+6gb2msZhIJMYTLHoJ6IVtSH6GpES4io36
 2t5VdNQozpIqCHJzYFnZvEGJqevOB+rAmvGvx9UzJw6vUNm5eyn0OW2TiyXLHhIgPmKe
 /khA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ptA/vLYU7bWhA6ewsDK4bcDTBQczDvbgRAwm4IkN5Mc=;
 b=dOYEHgJnaUPbyKYmJm3q8JxGR7kdwbnqQxwhMSBgFCn3u2fbkw6+yfHNV4VqLEO6Qf
 Ia5ouTm9nYVDRwpqEZCNmsw/bZjSuJa6lkgnLGWpYoWKvEJlXekOAWkBDpqrsqBrLHn+
 o/ZIokVlWJp3Z7kBuKDgKjIK+IdQkhQVTSf0W42JcYaZTJzpLyqlTomjQ0KToE0lVJe6
 aMTK5HqOCuubPRvnKsz8JM7pyAL295uFJlSK3bWjv/so9nSS+27f39TQrpbk6A2iDwJ+
 6YbAuIzBW9P6y2o6LAj3cRHUZEly6BP8zevsi7w5YrhjwTkdkXwML8G3a3DSBiKyywBS
 FM8g==
X-Gm-Message-State: AO0yUKUHDRhTScKDSfp3q6AVNSSIHBBIFRUmFFz8wjCjDUErJvrq0O0X
 ijul3KKTzhyT9MOyyd07sNgSdQ==
X-Google-Smtp-Source: AK7set+71adLq6wAVml/K6PV1lbcAAcFwSJ0YtIXRfVnMUIUB+WUz2uCRRH5vNJ93Stmt+p88QOQ6g==
X-Received: by 2002:a05:600c:3197:b0:3dc:5240:53b6 with SMTP id
 s23-20020a05600c319700b003dc524053b6mr13545499wmp.6.1676048671075; 
 Fri, 10 Feb 2023 09:04:31 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o19-20020a05600c379300b003b47b80cec3sm8537117wmr.42.2023.02.10.09.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 09:04:30 -0800 (PST)
Message-ID: <dd55481f-e871-c412-bf81-36632d20ba7f@linaro.org>
Date: Fri, 10 Feb 2023 18:04:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v3 0/3] Add gdbstub support to HVF
Content-Language: en-US
To: francesco.cagnin@gmail.com, qemu-devel@nongnu.org, alex.bennee@linaro.org
Cc: mads@ynddal.dk, dirty@apple.com, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, agraf@csgraf.de, pbonzini@redhat.com,
 Francesco Cagnin <fcagnin@quarkslab.com>
References: <20230114161302.94595-1-fcagnin@quarkslab.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230114161302.94595-1-fcagnin@quarkslab.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

Hi Francesco,

On 14/1/23 17:12, francesco.cagnin@gmail.com wrote:
> From: Francesco Cagnin <fcagnin@quarkslab.com>
> 
> This patch series aims to add gdbstub support to HVF (the 'QEMU
> accelerator on macOS that employs Hypervisor.framework') on Apple
> Silicon hosts.

> The patch has been most recently tested working on macOS Ventura 13.1
> hosts and Linux kernel 5.19 guests with the test script
> 'tests/guest-debug/test-gdbstub.py' (slightly updated to make it work
> with Linux kernels compiled on macOS).

Could you share the test-gdbstub.py changes?

Thanks,

Phil.

