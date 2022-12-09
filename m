Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF2B6487E9
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 18:45:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3hQQ-0007yl-9p; Fri, 09 Dec 2022 12:44:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3hQO-0007yW-Cu
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 12:44:40 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3hQM-00019K-IS
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 12:44:39 -0500
Received: by mail-wr1-x42a.google.com with SMTP id d1so5907099wrs.12
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 09:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I4EfT92JoZK16JUQr3bVd96vO+U8FXM5T87MyJiYI90=;
 b=rAUMck9RQTBkHOLCD20dnJEH7kpYCz7E4lj0WjgXz/z/d918K2/Ts0DuVYCXgozWN7
 r1lvX6D4eBVUShN9GLZeFLevOcVZhG3IzppA8vdPJCALihSWzAmZLgp/INAyHJELrjEz
 xn5lMgI6z1Q3CVD1C03EKcLV66NK1dCxhRlHwjPWAbIPrz6R4skX9ZMYEEuev4Ru+OTn
 6OSuP3ZYAFwGLj4+2ZWVTf2X9gE44xci0MbMOZ8Lp92TCJG8nojjpOwKibHugvfDsU2G
 mjvgHGWdqGYUYohsvEbMZQVdZ/HlUYDBy79DD4csQ7c8h3qDzoP0/zrYjfJFX1BFuJiS
 yvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I4EfT92JoZK16JUQr3bVd96vO+U8FXM5T87MyJiYI90=;
 b=h1eAt9yX8aTL/HN0o6mRGf2IPTWowDNX2fsdgMrLWmzcpM+eF4aVBshapOSQzylvh7
 O7GKwQBl48uWUtbud9akoPnd4G5W66hKmAzN1EdWXNOkwR/2F8MIwWUIv+MLVEYZbjaj
 FKjg4P8Mx+fgIGQd/71FHyd16E70oGH+JFC8IVriG6Iz1zV8laJHOThOoLYIpyAriMMC
 Vr4rAGxk/ZthKfU6Y2S/yZYc+dvAqPspK8Ls1LnVH9IzplmadYvTDejPLBO5PdlHMn9u
 OLOuszhC6Tk1ZQF7bkhyaZ+s1HDfwIgc1dOwwo0h5uEUVygujwzCJXi5a6eSexRbadEA
 h+zQ==
X-Gm-Message-State: ANoB5pn2DvBFcWx3hHRhxgN5UGtcQA3y0jH9lA25kg8Qqekfx9l03vqm
 5cUiUfX1GxihCJfXwZDNEKZcJQ==
X-Google-Smtp-Source: AA0mqf5iWeJPS3KWD8uJPBDChA56eSboCBF6RtkMZL12MOKj3DofrXQ4UoK+2HMQ+Jtcf8Efm40x2g==
X-Received: by 2002:a5d:45c5:0:b0:242:82a4:2bf4 with SMTP id
 b5-20020a5d45c5000000b0024282a42bf4mr4385146wrs.10.1670607875459; 
 Fri, 09 Dec 2022 09:44:35 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l5-20020a5d6685000000b0024194bba380sm1929260wru.22.2022.12.09.09.44.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 09:44:35 -0800 (PST)
Message-ID: <f56fd611-578f-a17b-7026-c5a4d4455b25@linaro.org>
Date: Fri, 9 Dec 2022 18:44:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH-for-8.0 2/3] hw/intc: Move omap_lcdc.c out of
 target-specific source set
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20221209170042.71169-1-philmd@linaro.org>
 <20221209170042.71169-3-philmd@linaro.org>
 <6548f60f-1b98-f35e-e568-af9b2537fc2c@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <6548f60f-1b98-f35e-e568-af9b2537fc2c@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.288,
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

On 9/12/22 18:21, Thomas Huth wrote:
> On 09/12/2022 18.00, Philippe Mathieu-Daudé wrote:
>> The Goldfish interrupt controller is not target specific.
> 
> It's also only used by m68k which is only built once, so this does help 
> reducing the compile time ... but I agree, it will be more helpful in 
> the future the more code we move to softmmu_ss instead of specific_ss.

And soon MIPS too:
https://lore.kernel.org/qemu-devel/20221124212916.723490-4-jiaxun.yang@flygoat.com/

>> While the Exynos interrupt combiner is only used by the ARM
>> targets, we can build this device once for all.
>> >> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/intc/meson.build | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)


