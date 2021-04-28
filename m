Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B732D36E24C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 01:54:38 +0200 (CEST)
Received: from localhost ([::1]:54462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbu0r-0002zB-Cz
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 19:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbtzp-0002aG-Bo
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 19:53:34 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:47004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lbtzk-00027H-6m
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 19:53:32 -0400
Received: by mail-pl1-x62d.google.com with SMTP id s20so17925404plr.13
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 16:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Rc1EcwO35DWlu34IxVUUiztuC5p2zQCX3B6N7LwsgQY=;
 b=jiKrpcN4ccviDywHHW6aEBFi/3egv/Jpaxfl+NdTF139lubksAFT8Zi9VNVHT7nR3R
 dHXCXYzKQAchxKP0GNY4SVkOCNyV5A/o5nBHBXpyGR+PK4WzKwEINKJdJ/bu8Y/P5f76
 aaEgJV93TD8LzBp6ZLo11ieC3PvLdbdCQbXOYpFmz3xmQuu4Vz3X+dIzT8T6vpKdRQSP
 4jK0JxVUui5pGHh7GUj1WRFxtJ8iXGYMeh0zHOlbeXgWXNFLpUL6tdYUo+FfFA3wGTV6
 iepUqZXzDMtrui0Xuie0F/8mHjAwXki82xHvjO3uvPn3CH5kFOguClrhJ5Wcs9uyWDOV
 RRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Rc1EcwO35DWlu34IxVUUiztuC5p2zQCX3B6N7LwsgQY=;
 b=nwWJVU4I68g6otmmRcSuUadFGch4/gXFwxNBc0OhDp25O7SVXFqiOC3c9xwRUzmJDk
 6DLa3YgDWx+na7zRk4s3xEaqBcUGvZ88GTCUYSKyEYEHMv1HEquox/aduv+vc5nLhayt
 SvgY4rWl9AOEpBNGIoU/31eyYFAvRuXvURBSnT0L5akilu9FyllKAZC2NyVlSnhGOQAu
 hxyHnV8/zjA3i6XbeUvy/KPX0Bp+jZaIgIccjcP2uLQitxSPpqNqqMIbnVR8/Nqh929O
 01HBvVdt0bnwldH0dNLPn7mMb40m/zXORcQ01xINHE3nbRcmppYCsCCtMYx+7VH9xjNf
 05Kw==
X-Gm-Message-State: AOAM533if6UBUY0kB3oR//QB/ibUnr3UzYLJkYICgz+wMurXjImDV8Td
 1q5hpF0SVMC4kd+1svqqvdmNgw==
X-Google-Smtp-Source: ABdhPJx34v0mBoFzqxzHlDTQklYScA2PZ3V8fIr3LbVvPcWiB34h2BxXNpKFuCusOsjggpFJ6UzTKA==
X-Received: by 2002:a17:90b:17c7:: with SMTP id
 me7mr3517060pjb.96.1619654005255; 
 Wed, 28 Apr 2021 16:53:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id ga1sm544056pjb.5.2021.04.28.16.53.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 16:53:24 -0700 (PDT)
Subject: Re: [PATCH v4 00/26] Hexagon (target/hexagon) update
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1617930474-31979-1-git-send-email-tsimpson@quicinc.com>
 <c28f4f95-fdfc-c67e-d9fb-dea67b56e337@linaro.org>
 <BYAPR02MB48867209D1BF82760A925ECADE409@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4c7b584e-f4ce-39ce-72a6-2a6e5eb69b46@linaro.org>
Date: Wed, 28 Apr 2021 16:53:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB48867209D1BF82760A925ECADE409@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 4:20 PM, Taylor Simpson wrote:
> I get -Wno-unused-function added to the compiler command line, so I don't see the error.

Ah, looks like it's the version of glib on your system.  The flag gets added in 
configure beneath:

# Silence clang warnings triggered by glib < 2.57.2


> Both were introduced in patch 22/26.  Should I fix this by respinning the series or sending a single patch?

I can cherry-pick a single patch.


r~

