Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4C66A243D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 23:25:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVgT6-0004FH-9O; Fri, 24 Feb 2023 17:23:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVgT4-0004DW-Gu
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 17:23:06 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVgT3-0004Ou-32
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 17:23:06 -0500
Received: by mail-wr1-x42a.google.com with SMTP id t15so639798wrz.7
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 14:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/OGhX04bm3n/OF7eQLQqMBAZjPMUQ1JzfCAv2X/SsAc=;
 b=iYrtMVD2Qy/U/pvzf4zNOCP+y2JoMMLIcsfquq4pmRdWV0Zpqned9LH6mI7AIBVNZt
 IEMTpYiDkG6Fhb8+EWi9UNjR+EtAf3Xcy3FWYsAYr3L4aVvEcAHars2W1OteTv/LNC5o
 VxGvUQ0Ho6nhE76MBkcBnUZXlxqcvwuGoZ/+OtJr6SplZIo/qym34ZESxyQQgl5gJ3Fs
 DcqtrPnOUpcpZ3KaKiV1WTl/MIcUqJjDYLe3PeAR/WpHdGc3roZzbomyMnCYhcZq7Ig/
 EToQ48IlyP7iE8LjNDGImSybMX3LgqH1mr7prU1K0vBQuX/HW1pJ3UyZM8XBgHUpZURD
 e2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/OGhX04bm3n/OF7eQLQqMBAZjPMUQ1JzfCAv2X/SsAc=;
 b=4YbPalsm3o/Zcf1pUcHkzVmZA9dh7QWckeSt5SrNe1og9R2dGLSoa1SYS39lpY7OEU
 nYlpsQeoMDhUiazA/iu8IRmlZZs26z+xuFUwi2qWol5C3k96DyQnR3fwcUzIZXd0G6Ca
 /ojsbIbcOcbyS+HGXnmJp3jXS5nQigI6aElBS4ok5ey8zeRUp+4rE3LvjxJuXu9jHvYf
 XckMiA5owXa5y7wEGKXJjXyWSG7M3FQWnh5zHOrw+uey3joVNz2cNN4mpho9zjnbCpW9
 hV5/6iNSvVM1rDt5s7KMwQbFvTPQGkpf7LCX6weLT0Z9CIiwiKUZByC8osdq2Z/AwslX
 gRyA==
X-Gm-Message-State: AO0yUKWhkTIO+YBWnlb2dpEGr9zVw4oLwXc8Jb+YCSPzU0TJkN1mDwjn
 oCDEO1exdK4qjlnI0qg4iJxF368SeoSNLs7+
X-Google-Smtp-Source: AK7set/ElgTvkAaqlyj0Kp7wckfenmxQDIUaUM4PHlEZt7FO7oF+YcBiQKF6a2xnLpApFeYUhj2A1Q==
X-Received: by 2002:adf:f5d2:0:b0:2c7:bbe:456e with SMTP id
 k18-20020adff5d2000000b002c70bbe456emr8289169wrp.56.1677277383502; 
 Fri, 24 Feb 2023 14:23:03 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a5d464e000000b002c558869934sm20859wrs.81.2023.02.24.14.23.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 14:23:02 -0800 (PST)
Message-ID: <b5fa57d6-cab4-3f81-d941-0de38783bec3@linaro.org>
Date: Fri, 24 Feb 2023 23:23:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 00/24] hw/ide: QOM/QDev housekeeping
Content-Language: en-US
To: qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>
Cc: qemu-ppc@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org
References: <20230220091358.17038-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
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

ping for 3 patches :)

On 20/2/23 10:13, Philippe Mathieu-Daudé wrote:
> Missing review: 2, 17, 20
> 
> Since v1:
> - addressed review comments
> 
> John, can I get your formal Ack?
> 
> Thanks,
> 
> Phil.


