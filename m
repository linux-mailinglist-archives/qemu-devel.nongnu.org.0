Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A83968F164
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 15:56:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPlrD-0001lg-QZ; Wed, 08 Feb 2023 09:55:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPlqs-0001iP-6Q
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 09:55:16 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPlqm-00077r-ID
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 09:55:13 -0500
Received: by mail-wm1-x336.google.com with SMTP id o36so13516118wms.1
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 06:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sgPt09+VPT+UtqKIBZM2t1PsZ3qMQmBcWWNsdGYqhCs=;
 b=N6qzaNCmxCVQdk2sY6dWmxjjmueOWKvVpF7NX0sqMJBi8MsqV2An8uVT+74dTZHIsM
 NCJcYsR+xvrRBEjASmKEBW8GoOdreYz8VO/FqeqzFwvPe+lB7EwBw7PwRjZSIUz+V4iR
 0BDBP992QCpogTgnPPb4lLhDgILIdl9+XD5Xwb/mnRzNvnXyMIz3dC72Xi/Pktiic1p3
 aHDh0ernr2EXMwRXTh2x4TOWLuVq7ikAdOgbP2kg3AbQ06p3vHImkkeUSh04zL7/ZutG
 Akuwlf3utg2yS63EqeUA8+Tk5b4E8eWok9W/U3XCSvzDYjziSw/EDCu1O5yg/R8vL3u5
 qB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sgPt09+VPT+UtqKIBZM2t1PsZ3qMQmBcWWNsdGYqhCs=;
 b=fSFCy4c7hbVEttUkj7OiaNkIi57nA5a6eVktrgSk799p0kwW8AGLmkFdlQk5Ftyr83
 nJnsa5npLf91lpP/cV1jc7nc3acKelSQuqB9fyQMTIWWmTor1/XQo3WNP7mztKKUNsQw
 XuZbr4KPhRdovxGcYvwG4odDEzuZlTMsITHxl3TSPGvx1dJo26v6/vYdIwItzGnko/JK
 U9Cp3uyxtFYu9ePIRIOi2PdUe3G7QKFIYTj7YJKC8nwSi7qciZLsZ6F8Vq4bWmpeE1uf
 uhFaTovyux6tdgGVEJJjCf8t0A3Vp9+4yHsubo4G567yckgcIhmetD3ecYkMms/wg456
 JzmA==
X-Gm-Message-State: AO0yUKX14CZpCoFejeZEjT/tGR/kXr3XaTZSDO/ELtwxouCtnYiYKHr6
 VOsdHPozxyOQB5aOI1RUGBqSvuBimyrbLPLH
X-Google-Smtp-Source: AK7set/LCqER/aXQJbZKYjQ0NzLJFQtmB5PBQN3UhhD8D37kIyYaPGlhsHwi6Z6/0ups7OwXamnoOw==
X-Received: by 2002:a05:600c:4496:b0:3dc:de85:5007 with SMTP id
 e22-20020a05600c449600b003dcde855007mr6798249wmo.21.1675868100787; 
 Wed, 08 Feb 2023 06:55:00 -0800 (PST)
Received: from [192.168.254.175] ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a05600c2cc800b003dfefe115b9sm2383229wmc.0.2023.02.08.06.54.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 06:55:00 -0800 (PST)
Message-ID: <6f5c2539-8a18-63c3-d12e-b2cffeb27a8b@linaro.org>
Date: Wed, 8 Feb 2023 15:54:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v3 2/2] migration: Calculate ram size once
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20230208141402.18865-1-quintela@redhat.com>
 <20230208141402.18865-3-quintela@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230208141402.18865-3-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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

On 8/2/23 15:14, Juan Quintela wrote:
> We are recalculating ram size continously, when we know that it don't
> change during migration.  Create a field in RAMState to track it.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>   migration/ram.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


