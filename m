Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9066CDBD3
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 16:16:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phWag-0005TK-AE; Wed, 29 Mar 2023 10:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phWaY-0005Sj-1t
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 10:15:48 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phWaV-0003ba-VF
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 10:15:45 -0400
Received: by mail-wm1-x333.google.com with SMTP id s13so9011204wmr.4
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 07:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680099342;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eWpRz6gOe4hJGWqEzQt0Ul31TyoaFV40MpKnTLCSEHM=;
 b=wwoUHcBN/zpK58oVMxmMH4MDK7GEqHQ/plvO5JRFVmLaRKbl4lcVnF3bILnmXjcHMc
 FVhj2ipg1jct20tDUMB96u4NZtSTDdwr2qXy7l1ph08sxqgMO1Dl3j7L0PoYgjbNGYEa
 pxOHRaL5XFIX2bL7up6kSYtB7UIOJlnmDCk43BrBPwp0fpk+LmhzSNn/YGpEUJ3XClu4
 1RlCAT143IQJGvwgxclkGS756n2Sf7XERRRVClkzQngpUGiTh7H/g7Ijj9c9gPCEGmBj
 p7d8UQc7JEFVD+q0CdnGoQTxGpiPgSXIOCS23qYO31SaBqe+Tw0VPBA7w3pygpLUyLx6
 yNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680099342;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eWpRz6gOe4hJGWqEzQt0Ul31TyoaFV40MpKnTLCSEHM=;
 b=56Q32W77W9FCVpWH9790jbJM08lGGqhjSa4xKLGzepW4cPh2by8zkIKS6vB/eZ4DR0
 hvJGumzCWpj6HAIrq6EN9ibE4gohrYXweu9BJaQWGN3FCoEtEEfVi5FdM9N+mgT6g1Fh
 8MAwIZhPMgtwiiT1qFguYpfhSrScy4Cb9jSUcxP/TWamzN1Xk+ZgwxO+pzI76vL+rhmY
 mryxqXJxbFhSFh1xco/Y6jWM9Z1H7HjY5RanQfvyOMo8aDcxGHIy5AzKLbpkXZBHlB7v
 Lr3PizcmBI+MyKDaerR2RxpkrvtqaYuf7qa0u/SpexUdYLhkZLbGYlR6cOzg72McFWdv
 lmOw==
X-Gm-Message-State: AO0yUKV7+UlrtZ91FMm+pbWSKkAbbw721R9OHTu8yDm/3p6Y8288lnSQ
 eLdAZ7SHdA9HAl409xdShjbpTw==
X-Google-Smtp-Source: AK7set+F/YL0jCem8qMRsEd9jc4TUqVyKzsn/schT5E8+Nk3lilS9Vc5v//f1YyOBSzFl77M5P3XxA==
X-Received: by 2002:a05:600c:204d:b0:3ed:e6c8:f11d with SMTP id
 p13-20020a05600c204d00b003ede6c8f11dmr15195807wmg.7.1680099342147; 
 Wed, 29 Mar 2023 07:15:42 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k4-20020a05600c1c8400b003ee610d1ce9sm2708420wms.34.2023.03.29.07.15.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Mar 2023 07:15:41 -0700 (PDT)
Message-ID: <85eca121-d447-7861-c73b-b68adb517d53@linaro.org>
Date: Wed, 29 Mar 2023 16:15:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 4/5] hw/i2c: pmbus: block uninitialised string reads
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Patrick Venture <venture@google.com>
References: <20230322175513.1550412-1-titusr@google.com>
 <20230322175513.1550412-5-titusr@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230322175513.1550412-5-titusr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 22/3/23 18:55, Titus Rwantare wrote:
> Devices models calling pmbus_send_string can't be relied upon to
> send a non-zero pointer. This logs an error and doesn't segfault.
> 
> Reviewed-by: Patrick Venture <venture@google.com>
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>   hw/i2c/pmbus_device.c | 7 +++++++
>   1 file changed, 7 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


