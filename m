Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5A3687AEE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 11:56:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNXGY-0001lh-Qg; Thu, 02 Feb 2023 05:56:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNXGV-0001im-IJ
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:56:29 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pNXGT-0003vI-5c
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 05:56:27 -0500
Received: by mail-pl1-x635.google.com with SMTP id h9so1416092plf.9
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 02:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xrrDtTmklWjVDnhzsigsXKk8oLuTmJBtl6hOOJZiJc4=;
 b=O7TnFYgtoGyXnTSYN1fDtj0uF59pCHbjbzz96UdRy81tDHTJNxUjHr7xTxXgxapQaj
 /7NnDBIraK6bleAT0ddlWmussfiwgQ0Rag3FonCfprWCLhG7g3B72IkTK0W5phZw3nv2
 R+BBDmz+YFTiy5SaTjyfLGht4XxAJDNJu7qjtoycrvM/dFY5edf6/WAGlfakOVq31kGR
 WtUwNbuDvz6Uh8oWP9f0Dau6UYYsi1mw5eLS8raCwPoegKpmgjbvLr6Day4iBLyBUqhz
 V0MkS0rV97J8toPM7iOHr2QHBmo1zMiZp2q9uYcOEk/JsZ5bRpdVHTaAvl5WKea/zvbn
 oG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xrrDtTmklWjVDnhzsigsXKk8oLuTmJBtl6hOOJZiJc4=;
 b=HLS3AVK4ZaY/w3QvaGYaGC/zY1xdtNbWZmEmbffL5j6LuQzWbAGGoPVQPBqevesvt2
 tohKOTVxJszcv3xFFDXnNTTaZe/jTcNpWEVu7Xq1DNMfaWHVkTNo7dmAoP/uw3jPf2PP
 B51jCrtT4E00uLC99sGaNWcmVl41psv8CJ+NxnOZEGAUS+k7wiDyUFGPPNypz/nB0vKa
 OqGlt3QJ6XNGGLP0j9EVcbXPmx2K/W458brekzI7pHhlmZBHxLLO47xCkUTa2A+Yl7/y
 pow3c5Y/zLrM9SkvH8mIrLGrVlR0SjW3HZoLxw0Z8mxZtuOTEmx26fJ4l12NU/X6WFdI
 AKSQ==
X-Gm-Message-State: AO0yUKWY3U+3xKeXcvYuUkznc/Mht1K4cpjUxVFebUR8skQwhziqoB2U
 42eqvRXsUN+z3Q/ddgmQNUFWkA==
X-Google-Smtp-Source: AK7set/WjQqIg9rB+ovFhfjiH2dIIPN2DVS/mDdgThktrULWyuXfpM14DlO6MqhioFYttSVz/LCVVA==
X-Received: by 2002:a17:903:120b:b0:196:89bc:7100 with SMTP id
 l11-20020a170903120b00b0019689bc7100mr7521782plh.16.1675335383296; 
 Thu, 02 Feb 2023 02:56:23 -0800 (PST)
Received: from [192.168.50.194] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 g8-20020a1709026b4800b0017fe9b038fdsm13383998plt.14.2023.02.02.02.56.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 02:56:22 -0800 (PST)
Message-ID: <2e85fdea-9ffc-9a20-1c61-45ddd17a7fd6@linaro.org>
Date: Thu, 2 Feb 2023 00:56:18 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: An issue with x86 tcg and MMIO
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: =?UTF-8?Q?J=c3=b8rgen_Hansen?= <Jorgen.Hansen@wdc.com>,
 Ajay Joshi <Ajay.Joshi@wdc.com>, qemu-devel <qemu-devel@nongnu.org>,
 Sid Manning <sidneym@quicinc.com>
References: <78bc53e3-bad3-a5c3-9e53-7a89054aa37a@wdc.com>
 <ff3f25ee-1c98-242b-905e-0b01d9f0948d@linaro.org>
 <20230202093911.000053cb@Huawei.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230202093911.000053cb@Huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/1/23 23:39, Jonathan Cameron wrote:
> Not sure - if we can do the handling above then sure we could make that change.
> I can see there is a path to register the callbacks but I'd kind of assumed
> ROM meant read only...

I think "romd" means "read mostly".

In the case of flash, I believe that a write changes modes (block erase something 
something) and the region changes state into MMIO.  But normal state is read mode where 
read+execute go through unchallenged.

It has been a long time since I studied how all that works, so I may well have forgotten 
something.


r~

