Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DEE564D70
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 07:46:30 +0200 (CEST)
Received: from localhost ([::1]:57696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Euk-00085k-2W
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 01:46:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8Eqv-0006ir-Cg
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 01:42:34 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:33672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8Eqt-0004uv-Hl
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 01:42:33 -0400
Received: by mail-pl1-x62b.google.com with SMTP id n10so7695339plp.0
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 22:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BHYqMC73acL/niN6ibehfoSr2MDEro8d3+Z7ATqA+ho=;
 b=e29uWKr4sIVQy+28Zm72G8EnybGpgSc6ae3Ghn3lC/g+HRkGYlJ5AC41UvD6BvpoDT
 ULypBNng0DK14/71xtZPn6LWrJzeEX5kidk1O5veTbNyQgMEL4YTtrguJxmVF9lETAt0
 lsrhhJjstUyT4TYndHE3lgk5GQlztn2QlicTzsW4sBDjeMA7dVe5DT0cqKlsUsQs2dEG
 mX637EN3/s6mU9QekeGsPa9EFLIYwwgWan+eswTJvHAAcksME//C6+a9nhaahDo/UKc8
 9/DAZ5Zh2lAF024uvhny+0pFDM0YP0qA2tsiY7BmEDf2v1BIMzzLoVRyfMjOWm8/lAtY
 nLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BHYqMC73acL/niN6ibehfoSr2MDEro8d3+Z7ATqA+ho=;
 b=6WarJALFTkk9zxDQdDtePXOAubzFA8JZMjlIVrYv7LRZ7W3hyChS0xcacQYwPuVGcT
 BmCbwtbDEXCIUiquzkXSehHDjNrvJlJu84jCNvQUIzA2p3yzXgmT2Tf0F4b/jwUStEj5
 8fcec1/Ey2jNZI4uiwHh1BmeUj2+mxb6GFQUWErVO1u1xdxK77g7TGuJt7G7s10eQOeC
 CON+kSlooeT6Cx+6cDJU76h56kOmU9XJ1QC+I4ZeVXe1rJae0Zq+H9WkOv0ixdU5TBZz
 zBDnMg228QD5Bv2fvaeWx5SLNltNCL0gJTnvTmFrAfB3LqX27lWXtX9AIJLZWrqxudcA
 /iOA==
X-Gm-Message-State: AJIora8vJWRb1EuQsNhlFHZzoHtV6m8wCgbMJDN+RUqzwFQ/KM60KauB
 BcM2Ej4ef5VKMj0TZ62+bYCVzhs2znOnKBiQ
X-Google-Smtp-Source: AGRyM1v1pQUlJvVgE+w57vleWS2lNYW17aW6ngDWp3TshdW7QlUvMjzEKaLV3QJ2aBwTpVoseoiwTQ==
X-Received: by 2002:a17:90a:66c1:b0:1ed:4de4:6a57 with SMTP id
 z1-20020a17090a66c100b001ed4de46a57mr35092692pjl.84.1656913349988; 
 Sun, 03 Jul 2022 22:42:29 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 gw5-20020a17090b0a4500b001e2afd35791sm11530550pjb.18.2022.07.03.22.42.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jul 2022 22:42:29 -0700 (PDT)
Message-ID: <07600341-1c11-9e66-d8e9-d552dcf450ee@linaro.org>
Date: Mon, 4 Jul 2022 11:12:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v21 00/13] Add LoongArch linux-user emulation support
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu
References: <20220703085913.772936-1-richard.henderson@linaro.org>
 <12cd505b-aeb2-d111-bbe8-1cfd1a7a55b5@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <12cd505b-aeb2-d111-bbe8-1cfd1a7a55b5@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/4/22 09:27, gaosong wrote:
> Hi, Richard
> 
> On 2022/7/3 下午4:59, Richard Henderson wrote:
>> Hi.  This is Song Gao's v20 [1], with patch 2 extensively rewritten
>> so that it handles lock_user properly.  It compiles, but I need
>> to update the docker image we produced last year so that I can
>> properly test this.
>>
>> In the meantime, Song, can you please test this?
>>
> Yes, I can,   but which test do you mean?
> Test linxu-user with docker image?  like : 
> https://wiki.qemu.org/Testing/DockerBuild#linux-user_Docker_targets
> 
> I had done test case 'make check'  and 'make check-tcg'.

I just meant check-tcg with the loongarch64 compiler installed.
Thanks.

Queueing this patch set.


r~

