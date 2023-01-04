Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E819365D28D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 13:26:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD2pm-0005cL-3g; Wed, 04 Jan 2023 07:25:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD2pg-0005ae-BG
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 07:25:24 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD2pc-0002Pa-H1
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 07:25:21 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 m26-20020a05600c3b1a00b003d9811fcaafso19750957wms.5
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 04:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8QSYR6uHlu04bR4YK2/7LGbSVHyMK9sKt8FbRT5azGU=;
 b=WfloE6my1lLdrrJtYzIaZPMHoABqeyL4zMqzzQ3OgvhAuQvxKe7TUNyqxClc5b+FN/
 brQ35DpvP/HQe5jhADNgAtLTMDTXI36q3QNcXffzz4zM2CbvhNmp9fN/DUWYhZ7kbbDm
 7u0QqsofGLbMTzgwGHRE4otPh+1dyQ48wEJezo0usEYvh4eYmmJwFG8Jc//VgJ1daZ35
 GmBbGT3eyI7SM9N++Mt4iOS9NOX4lihXRCuPY2f47NJDTruJSU1kJzlqU6YodeLeyfkz
 Bd+zD7zfd5DHyQWkeP6D4GPb7J6rWPhNWkDEt5pQRgoLLO+7zn7clvaiQ2MZrNZrpBRL
 URPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8QSYR6uHlu04bR4YK2/7LGbSVHyMK9sKt8FbRT5azGU=;
 b=b0Ujae0AyMzc68NlFhBpwa/MQaZUBhUkrCLc2CBGdELU5YmzAkamg8OVUGxChV9WuZ
 Gjy6faz7ENHN82+J5xdCTHf2H0sMIvosND94ng48OPhx2UAcGrma9wYmcvywGWdvDYFK
 rF4CZblnhR2do6ZbzWsH1qTVilEGoCPnS3/JsRM0LbhvS2vy8Dx9wVFdDJSjr/mZk68x
 nZHdIvFi28AW/fYgvu7iEx8OZ9do+5+f3+FvAcyw/p8i2U5dS1KHaJpynzwl683U1jVp
 3sKq9im+XgRxPQsfP8WfY2jDpGEDNdTTOqtqByuMbDgsZGUUq7MtcZ67EMK3qUnJTLSN
 EiNg==
X-Gm-Message-State: AFqh2kqtRYvbgKHgFtd7NRZWXl9royqL/uun/WP/YFEyo+NPrVU1+GyB
 cuOUb8pVKCg2bZFu71Drejf2dQ==
X-Google-Smtp-Source: AMrXdXsBuJ40liGctYxj06rhczg+AYOmTrOsXscQwmdasHfQIiw0pNzu8bm+N2KOpI4yojpjcKTAAg==
X-Received: by 2002:a05:600c:2217:b0:3d2:267d:64da with SMTP id
 z23-20020a05600c221700b003d2267d64damr32541211wml.10.1672835118805; 
 Wed, 04 Jan 2023 04:25:18 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 hg24-20020a05600c539800b003cf71b1f66csm45210891wmb.0.2023.01.04.04.25.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 04:25:18 -0800 (PST)
Message-ID: <b3ae4407-63c0-bc0f-7971-d1f1ec6535e0@linaro.org>
Date: Wed, 4 Jan 2023 13:25:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] tests/qemu-iotests/262: Check for availability of
 "blkverify" first
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>
References: <20230104112850.261480-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230104112850.261480-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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

On 4/1/23 12:28, Thomas Huth wrote:
> In downstream RHEL builds, we do not have "blkverify" enabled, so
> iotest 262 is currently failing there. Thus let's list "blkverify"
> as required item so that the test properly gets skipped instead if
> "blkverify" is missing.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qemu-iotests/262 | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


