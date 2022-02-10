Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA004B0C40
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 12:22:30 +0100 (CET)
Received: from localhost ([::1]:47552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nI7Wv-0004CJ-9D
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 06:22:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nI7UH-00029u-5W; Thu, 10 Feb 2022 06:19:45 -0500
Received: from [2607:f8b0:4864:20::633] (port=40849
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nI7UF-0000G1-Aq; Thu, 10 Feb 2022 06:19:44 -0500
Received: by mail-pl1-x633.google.com with SMTP id y17so1538722plg.7;
 Thu, 10 Feb 2022 03:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3OBTDh3vWlqPwn7p6kiDt3hHRWZFLjw2UFZP5XM5Mqk=;
 b=BFhN92Cs6TgdtLXfLTzN1aW586wRxoKYISyMrOHErfjUCAuHHD+rZCAG4GP7MayEpj
 A+cmAeoKM08gPKVCFM0y/HMyNteDl2TNsaVJ/XaUJ7k3gO1w6k6yMjMfkCmHbqbImhg7
 UPZNJV82kRhtoB6nhsqiTKvcae6PLnYmbDjKmHFQaoKk3Ec5HuEhidKcnfa+4mJuz1yJ
 UWhfOIs/VwZmX6iC9ntA7xJXBMFq7g4RnLMllmWk6Jqj+J6ZHNdZYEBo+C+86bDZpeHT
 UirXYtTS44KgFeO7vGOkzN0jK7WS+dM4gEr/r7LRoBVOq/XF0BD0HMW1OzfAxpDs1+aI
 mecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3OBTDh3vWlqPwn7p6kiDt3hHRWZFLjw2UFZP5XM5Mqk=;
 b=Xg4QV5kRV8nVplph8TPgWoCmfyqMOrNLcs8ddBfdVj64vg7ohPQ1OxF+aLI/z7AVWD
 WKcYreiFL7yNktdDB5/OWrCjwIVasKe01v0l/qxaX7Ws4wJ9zLFQEqWOLqYR4r2U6vZy
 lZLfFXU5Krz+ILetpRYdnixuIMtkbvmzNqP+H5FF2iqoe9qIYLLAbjClXh/7YbbAhCWr
 PWwLXvQvrPDSwLHBZavOnjjgdSutMpgxZkDegaCZhFws9LXnV5Oi2aEW6kxeg5blBxA0
 7ptkuNEVTC0cb0AfFh11eX/igxNC8zfImlR+Qrjfzrc+8guU02ZzFNUzE0PZZHj6StaU
 AceQ==
X-Gm-Message-State: AOAM531ybslNqvAIoxFJEK8yIPHtk/2WBIrOYhVVBFJGreJRv40YIRaV
 yLzJnozV98AmpBpIsCMvke4=
X-Google-Smtp-Source: ABdhPJxpQbDxBJg6LW2wDZAEAOEpPXF2aBS0cqgNI8tfTWy5QLP9wRVv8sTtxGwYTayLc8nOPxpgOA==
X-Received: by 2002:a17:90b:3802:: with SMTP id
 mq2mr2243298pjb.236.1644491981728; 
 Thu, 10 Feb 2022 03:19:41 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id b85sm2464527pfb.136.2022.02.10.03.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 03:19:41 -0800 (PST)
Message-ID: <2c0a236e-cb5b-5373-4f15-5b2f5b539905@amsat.org>
Date: Thu, 10 Feb 2022 12:19:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 0/2] Kconfig: Add an I2C_DEVICES device group
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Townsend <kevin.townsend@linaro.org>
References: <20220208155911.3408455-1-peter.maydell@linaro.org>
In-Reply-To: <20220208155911.3408455-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 8/2/22 16:59, Peter Maydell wrote:

> Peter Maydell (2):
>    Kconfig: Add I2C_DEVICES device group
>    Kconfig: Add 'imply I2C_DEVICES' on boards with available i2c bus
> 
>   docs/devel/kconfig.rst |  8 ++++++--
>   hw/arm/Kconfig         | 10 ++++++++++
>   hw/i2c/Kconfig         |  5 +++++
>   hw/rtc/Kconfig         |  2 ++
>   hw/sensor/Kconfig      |  5 +++++
>   5 files changed, 28 insertions(+), 2 deletions(-)

Series:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>



