Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE6860F5CC
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 12:57:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo0Yp-00063i-B4; Thu, 27 Oct 2022 06:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oo0YS-0004Bs-Ge
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:56:15 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oo0YO-0004df-MJ
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:56:06 -0400
Received: by mail-wr1-x42c.google.com with SMTP id h9so1558816wrt.0
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 03:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MpXRgFo462lVMXFDx2pzXyPJn3ym+EHrop8WkCdXzh0=;
 b=Kh7/up2RJu9CCHz4V4rZ4Na82UI4RZTKoxNe40F4YjnMCyDKYkoFvkwsxsCwLu7/tY
 xCx9kAlbZF52VLA3GPuNSnBVbgHjhAZsOF2ezDulRA23U+pXdq7kT82CrQ8FNEEwlAXs
 OgD2bSth2Q9o4nbOxRZAuEO/zR3UALzgIDBfUgJNLKhqRcjjaP8by1kL7T1hTSa2kJ+A
 3DSALQb2j1fc2hyFALb1UU+Cr048aPpQioYmKtOWaJPm6b8fpikclNaieM9inQo9Lm/U
 MTi1vEyEycu6uw2w8U5KyG2oraos+7VXSYbmPMMn7UiEQ9JgVbGpa0Q1ixCHeZ68mtDz
 2xTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MpXRgFo462lVMXFDx2pzXyPJn3ym+EHrop8WkCdXzh0=;
 b=17zUGhz4QvCYItN39qDm9Aq7SN2Z6SQoj4H4/+CU5S1X33ZcNg/SaOKdSqM0sgjulc
 2lz+8d1dPzPIqeDneWAonV28b6lEaeBSKw0oaLPrltQtiBTHlEwHk/zdb0slB6CBYW1e
 uXa7GYaw1/QEGv3qXbuKTdSNxaA9GzajxBu7Q9CrK1n1qFjfK7yYM5c5y4ouQ6XLZdA+
 K2sWXyYBKnHCItsBokSMo5bH8XsqdoDlark2ZqO26wGFpRxKCePf0u8n+r60PnOuG0Em
 0X/a4NORiixkefD3XFHAp2hP1EqHV81nj6pSlciBRmD1ausHHELtDY4WJBLJVbFiFHhf
 meew==
X-Gm-Message-State: ACrzQf0PIGCMo9kl/Dwp78SJRttfPU2BjNgLcBQktM6wopwrTPeMgdqz
 R2jXt1NH6CZqizwkd6P6/nNo5w==
X-Google-Smtp-Source: AMsMyM69ok3B4kKnGeXtEE6b0bLe0YCyRgSFrgz9/BgjQj8DO7U83cC/qzKWccT9+bkC8y+Ne63Rpw==
X-Received: by 2002:a5d:64a8:0:b0:22e:409f:a3cb with SMTP id
 m8-20020a5d64a8000000b0022e409fa3cbmr31180629wrp.168.1666868162983; 
 Thu, 27 Oct 2022 03:56:02 -0700 (PDT)
Received: from [192.168.242.175] (186.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.186]) by smtp.gmail.com with ESMTPSA id
 bg33-20020a05600c3ca100b003b49bd61b19sm4674152wmb.15.2022.10.27.03.56.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 03:56:02 -0700 (PDT)
Message-ID: <4e465613-5de1-6671-d1b6-ffc7c3e5eb98@linaro.org>
Date: Thu, 27 Oct 2022 12:55:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v3 0/24] Convert nanoMIPS disassembler from C++ to C
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Stefan Pejic <stefan.pejic@syrmia.com>
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com, Milica Lazarevic
 <milica.lazarevic@syrmia.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
 <153a2c4f-6300-8570-f60e-c54503914726@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <153a2c4f-6300-8570-f60e-c54503914726@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 27/10/22 09:25, Thomas Huth wrote:
> On 12/09/2022 14.26, Milica Lazarevic wrote:
>> Hi,
>>
>> This patchset converts the nanomips disassembler to plain C. C++ features
>> like class, std::string type, exception handling, and function 
>> overloading
>> have been removed and replaced with the equivalent C code.
> 
>   Hi Philippe, hi Stefan,
> 
> as far as I can see, this patch set has been completely reviewed, and 
> IMHO it would be nice to get this into QEMU 7.2 to finally get rid of 
> the C++ dependency in the QEMU code ... could one of you pick this up 
> and send a pull request with the patches? Or is there still anything 
> left to do here?

Sorry I lost track of this series. I'm preparing a pull request and will
look at it later today. Thanks for the reminder!

Phil.

