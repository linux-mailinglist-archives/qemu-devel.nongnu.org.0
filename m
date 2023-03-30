Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEBA6D083E
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 16:27:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phtEs-0003Rz-IP; Thu, 30 Mar 2023 10:26:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phtEq-0003RF-9o
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:26:52 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phtEo-0003IF-LJ
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:26:52 -0400
Received: by mail-wr1-x435.google.com with SMTP id r11so19279035wrr.12
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 07:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680186409;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jpX6Ahs5LGAFmi851Os1p8OWN9TI95H6SNCLbbjVyUo=;
 b=M/hCBQv1HtQQTHbfSxmpYtp+MTiIDSj6YDR4wBt9s4evjIJKvxylRwO4kFBHFs1WCA
 6f0GVHuaNGRhhhMK411sxpWIbk94Bz30cX0iAdA34sifNQiFU1TFU8V4+9x95P7ncBVq
 qDne4WYzsw6vWaEDaiWI6u5Nm4mPlgLZAHCOm3RIwHJWJwlZ54AAGyllcNHSKSCYZ1AE
 EyQ1Q0pB2gEn8grGodYmEWYGFbbZkselJrwYTNo0FQh6PMLh6b0m6rmuyc8/lnBHzrQc
 ZaWABS56YmsQHA/5wznzEyjjn33Qf2v2rX76A+A5XxJ2bUauSKy+QN1QCbY9N1fgNBLz
 vchw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680186409;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jpX6Ahs5LGAFmi851Os1p8OWN9TI95H6SNCLbbjVyUo=;
 b=P9sPDT3D+2bTNIDpSV0WnQIqKw/jN0B3m5rm98mL/XGPGegsb8iVibrsI1sVQcbbx3
 IS6pk8MZStgs9cTBAsmDRGK7rc0U3wds1cwjnZ/1fHERSGLRcVs54Mm6cFR/jWglQDuN
 gyBCF3n1bL5sMPTQhZi2EUyzYKkUdPPGncJsnytNUdVKs7dlml8++BHmotthoL0FFwQQ
 klwTTmhIJwhO6KFM1bxhw+zScOPTevmpD2PuYFQO790IcV3EDjwRwM8U6saBKcM2g2nm
 YSbXv26p5jENeqQt1I8sNM37vJrHWntLl1exw17MLzwzVsRdoAtZXz/bJ4Tfp+1Pg4sz
 p6MA==
X-Gm-Message-State: AAQBX9cCOzLjQvYVDQ2C7h08xzzpoCNxywE+lwcRVsvZ6Tb7Ufq07YSq
 J9iJ8Fo/rDhpD/oYio2FW2tiXs3F+3XXs8SxyFQ=
X-Google-Smtp-Source: AKy350YmvaENNA6RXQN5J5YXM2elDl+UuXggAHUvvbX9loaWu3jfyGPzYxg6c8il0TSdbUi1fetqKQ==
X-Received: by 2002:adf:d0c7:0:b0:2ce:991c:5cc4 with SMTP id
 z7-20020adfd0c7000000b002ce991c5cc4mr16648797wrh.41.1680186408879; 
 Thu, 30 Mar 2023 07:26:48 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 d7-20020adffbc7000000b002d5a8d8442asm28673541wrs.37.2023.03.30.07.26.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 07:26:48 -0700 (PDT)
Message-ID: <7856bcf8-fb74-69de-e160-c0bf7af16f6c@linaro.org>
Date: Thu, 30 Mar 2023 16:26:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] tests/avocado: Enable TuxRun/mips64 (big-endian) test
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>
References: <20230223220404.63630-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230223220404.63630-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

On 23/2/23 23:04, Philippe Mathieu-Daudé wrote:
> Now that the previous commit ("hw/mips/gt64xxx_pci: Don't
> endian-swap GT_PCI0_CFGADDR") fixed the issue accessing
> the GT64120 PCI config-address register on big-endian
> targets, we can enable this TuxRun test.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Based-on: <20230223161958.48696-1-jiaxun.yang@flygoat.com>
> https://lore.kernel.org/qemu-devel/20230223161958.48696-1-jiaxun.yang@flygoat.com/
> ---
>   tests/avocado/tuxrun_baselines.py | 1 -
>   1 file changed, 1 deletion(-)

Patch queued.

