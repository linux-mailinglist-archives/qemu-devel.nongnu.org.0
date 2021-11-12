Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1387944E248
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 08:16:08 +0100 (CET)
Received: from localhost ([::1]:34468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlQn9-00078k-76
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 02:16:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlQlM-0005im-1P
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 02:14:18 -0500
Received: from [2a00:1450:4864:20::435] (port=45046
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlQlK-0001sD-Jj
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 02:14:15 -0500
Received: by mail-wr1-x435.google.com with SMTP id n29so13857221wra.11
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 23:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8oMzq9xtuA+Mva9yi0wpA3o9ClRLIrnmOhkLoHwnO9M=;
 b=xA22sG3Vxa8j5q+hqcQN2QBFdZhH7J+/6T4xOv4Zd75B0/h1qBE4X8WxO8BFZ/AhzZ
 WXUqd/WDvrinFSwNoMbD8Jhuo8+8f7nD/eVwl9615iih7pEADqWVOG8NBJlYgW645DaZ
 52Z+tqGbKp/CIiIKqXFcamnW1R4dxXVX4FmV3pjQMfSqbSBR4w3t3cu1b7jlFYUm+4wH
 ZdaWA8OBG9jMdpRqkHOQLE7e7FfySx6AeIxowYXD60OPJZvj2jj8la4LgJE7uprOTn3K
 oDvF7gqQLPToT6NuJKWVdKdyG3RnEDg318RkBJiahGoGxX5eqKhCqT/+M0DPUiq7CrKE
 0XGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8oMzq9xtuA+Mva9yi0wpA3o9ClRLIrnmOhkLoHwnO9M=;
 b=DdoboMdxVkaQqm2nGexoy3lmJz7/dfXbRq1W3qGY5w7s7Bv930HHKWKLfWs+TMJXLW
 KG7m7sfUl9ph3jjIk8+v3jGeZiZse0ovE+FNWl/VsQZQ5qRJy8ysdKgirxpOSd7IlWn3
 39mubzriUapFufe+sQCDvP3HFkIwrYWH89DImuSQqWUAcwO124z9OpyT1v53XrxHZqkZ
 WPdciZn6YNAXSsXOk23h2RU2yLT0kNuK8FEhb2jJ2IbiRuDPuobVF0RibLSz3//bw5lH
 NxlqIqRfGLeboKmWBRimjVASteXJ3QkFh3EjWjIJj67Ijbqkn8P+cI//8ra+46SnP4Np
 i64Q==
X-Gm-Message-State: AOAM530dB522xkx8oc6FSegI13mU+bH+kkaFsVwT91/yPIoZX10SWA1L
 PslZO/fGy0mSCqYYpDeboqZ57Q==
X-Google-Smtp-Source: ABdhPJwyboQQx9b/MG5iXvambfsCUcLyIIwML48gFhpQAYtk5f8TNUung9gRT7mcLkICbNfwlvRUFA==
X-Received: by 2002:a5d:66cb:: with SMTP id k11mr15653190wrw.253.1636701253136; 
 Thu, 11 Nov 2021 23:14:13 -0800 (PST)
Received: from [192.168.8.106] (18.red-2-142-115.dynamicip.rima-tde.net.
 [2.142.115.18])
 by smtp.gmail.com with ESMTPSA id n15sm11600331wmq.38.2021.11.11.23.14.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 23:14:12 -0800 (PST)
Subject: Re: [RFC PATCH v2 02/30] target/loongarch: Add CSR registers
 definition
To: yangxiaojuan <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
 <1636594528-8175-3-git-send-email-yangxiaojuan@loongson.cn>
 <7bb438bb-e4ae-8f28-8f9e-7baecbccc1ac@linaro.org>
 <bd00cd00-2dea-d6dc-f151-62ca3d90003d@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a8559cea-1441-57fd-e44f-e19219199dbc@linaro.org>
Date: Fri, 12 Nov 2021 08:14:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <bd00cd00-2dea-d6dc-f151-62ca3d90003d@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.449,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 11/12/21 3:14 AM, yangxiaojuan wrote:
>>> +#define  EXCODE_IP                   64
>>
>> What's this?
>>
> 
> The manual 6.1.3 says the exception number of an interrupt is the exception number plus an offset of 64. This defines the offset, sorry, the name is bad, maybe change a name or just use 64 directly in the exception handle is better.
Perhaps

#define EXCCODE_EXTERNAL_INT   64   /* plus external interrupt number */

?

r~

