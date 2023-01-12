Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 719A4667033
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 11:50:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFv9U-0008OE-AW; Thu, 12 Jan 2023 05:49:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFv9F-0008Hs-Qi
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:49:32 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFv9E-0005Da-2p
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:49:29 -0500
Received: by mail-wr1-x432.google.com with SMTP id r2so17659076wrv.7
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 02:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b/pz+hLq/z2vpKBvPE7NcmVyZAAiwhGmTF13ac4KeBY=;
 b=cLeYkzZJQAxudQZMdTycuo/ReR08ueK9HYgRft5/sgnWLYv1Dwbz3dB7MQaJMyDKhD
 aAB8SUhAQKDBba8eSNwVOzFiUMUNRQDgN6Q4mWlQ9+q1Dq6ZHCJ8CieyXstyWrlQOutP
 7Dejb6euIQugJ/yBuXP6ENyyV7Yc1k7wdx5LCSlohegpB/071WmIxg9sEy1i9FX8rvHq
 tCpHuggaPcZtGIqhvuni5LTuk5C/qZN99RYfDEYtmQRqrwEzuF44LcdyI/0vPuzbFCEg
 04zLKM3i1AYgJra+xW0Et49XVEDEvLLEdPeTQm9y67GYHr/eynmIGtK5/lcxCqYCZb/n
 oEfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b/pz+hLq/z2vpKBvPE7NcmVyZAAiwhGmTF13ac4KeBY=;
 b=s3Nv3UjR/7YsVfa/NLfz8m1Bl/+BMfSAttJ5x4WEZ2XnkaXN77xs4gPBQtwkGMNfb9
 g4PtvbrOryrAv2ea12D9Z1fjH2ADV/dm5zYqWXHKo9z6KpM5XHn5PrunMMJiIxhgeS9L
 Pn7IIQfRLj38jMvd31n/qE/p1/62QCebs8ycbsYZIqXi5OwCTtBeyob1aBc6Pg921T3j
 ezDTYjRuKk5PCELSzTYs9k1CCDXybgtQS2u6rRa0BhKUCLP8w5pJzJqhnpEjJ3D/jFh9
 vQ0CFBn2Z0TnFVZolnXoBi/feSLYeleMH9No9tnGJtGup7sudBfYptQyYGg3PQUAsBCW
 hxIA==
X-Gm-Message-State: AFqh2koSiwDEMaHBMqLQCNnUaCCMy8wa2lTfRjAnnpbuyY1ppFMwH9/C
 bhtkMQR5GUgffVUNg3C2Nvc8yQ==
X-Google-Smtp-Source: AMrXdXt3aqWbsMnZHqSAnj4bM22PkJJPTuDqgG50gqy4t7Vx2YnKfJNAzRe7e+gKH/0h99zjtBX6UA==
X-Received: by 2002:adf:fe0e:0:b0:2bd:c03f:c010 with SMTP id
 n14-20020adffe0e000000b002bdc03fc010mr4160208wrr.40.1673520566691; 
 Thu, 12 Jan 2023 02:49:26 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h10-20020a1ccc0a000000b003d237d60318sm21579166wmb.2.2023.01.12.02.49.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 02:49:26 -0800 (PST)
Message-ID: <f586a1af-dbe6-5343-69dc-74b4baa64d92@linaro.org>
Date: Thu, 12 Jan 2023 11:49:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 14/31] e1000e: Configure ResettableClass
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230112095743.20123-1-akihiko.odaki@daynix.com>
 <20230112095743.20123-15-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230112095743.20123-15-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

On 12/1/23 10:57, Akihiko Odaki wrote:
> This is part of recent efforts of refactoring e1000 and e1000e.
> 
> DeviceClass's reset member is deprecated so migrate to ResettableClass.
> Thre is no behavioral difference.

Typo 'There'.

> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/net/e1000e.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)


