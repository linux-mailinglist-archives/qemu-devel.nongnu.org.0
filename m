Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 938E16670B8
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 12:17:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFv00-0002sC-Aw; Thu, 12 Jan 2023 05:39:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFuzy-0002rI-1L
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:39:54 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFuzw-0003I5-FR
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 05:39:53 -0500
Received: by mail-wm1-x330.google.com with SMTP id q8so1069098wmo.5
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 02:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VQ65F6dw3xnfVYyqriIsPGGwMYgejyypDQTem/aYIUg=;
 b=Hj3Qq4Jk7Xsx0vzo1xZ9znQhZvPv+k87dEn3zRcmCUgexLqsHdE/hEUUXgr7JEwbjm
 gOlFSrksxJOPlrEr+6Ud3q3kvttN1iOsVEaJhDX+QQ/wJ3vPieEz2gCuspTZtS9W3HRW
 yKVCuj8kIwux0gUMaXt6n4/6kM34Tu/v1m3NS9Ba8LRhsrxcxmyWECjPrhzqUVM9RP4w
 cl/3BaTJ6yFHgp+e13p147fAaJcG96kohFOYKdw1J+78n6cB6G+1y5998w5E24D/s0sc
 frFbVpBcCn2jYhmXANHrtIj+92d/WoDcl4L03+h2EMTFMHVPL7m/5UEYLpBeLhLHzNFp
 G5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VQ65F6dw3xnfVYyqriIsPGGwMYgejyypDQTem/aYIUg=;
 b=WhLgExCm7xFdW+VfGtvJQjNG20fdATnH+bYipZxRAtfmo/CG5pqnrIl3QZ1T1bXLpO
 O6qZ91h4yxIAz23WQQpjfNnqH8W8mNVyqIRzl9e3TukjdkVCKDG1Yb3CK6OqNFyh2E9C
 LIRA9j2xnmZen5CVaGuvLVbbxlpa+vaeX2c9QnY0LBl0QqIkjdRpUj31kdDW00809pPH
 49DtM3mPvAsr+aQxz59OFr/sy45Q71ApQRs+Ljd/twAMYrRlwDrWM4R8aVdaN2ngsuF4
 toWXdvNhIwmlAAUrQCAmPA8llHRZETd/6R7taCDQJmu37c3ElKSQZ9O8YjgqUliyF5sV
 hAiw==
X-Gm-Message-State: AFqh2kp4h1z0m3Okfyv6wEnm2k5iw72L6NOT/3nJ5g1jwlvyXLxHX6PB
 Je7tD1nn7ePu2T37/kIpjoV6Vg==
X-Google-Smtp-Source: AMrXdXt0voxGe9aihlbBHHrMZcYlbGDlo42tyshFr1DPBUAnParp1BguL10IBwwBDKV8bFd7k+ewVw==
X-Received: by 2002:a05:600c:3caa:b0:3d9:cb4c:af5a with SMTP id
 bg42-20020a05600c3caa00b003d9cb4caf5amr25891590wmb.33.1673519991012; 
 Thu, 12 Jan 2023 02:39:51 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 b10-20020adfe64a000000b00287da7ee033sm16151493wrn.46.2023.01.12.02.39.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Jan 2023 02:39:50 -0800 (PST)
Message-ID: <84374ddc-4e0d-56c7-5591-7bc5acc1e2fb@linaro.org>
Date: Thu, 12 Jan 2023 11:39:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 01/31] e1000e: Fix the code style
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
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
References: <20230112095743.20123-1-akihiko.odaki@daynix.com>
 <20230112095743.20123-2-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230112095743.20123-2-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> igb implementation first starts off by copying e1000e code. Correct the
> code style before that.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/net/e1000.c         |  41 ++++++++--------
>   hw/net/e1000e.c        |  72 ++++++++++++++--------------
>   hw/net/e1000e_core.c   | 103 ++++++++++++++++++++++-------------------
>   hw/net/e1000e_core.h   |  66 +++++++++++++-------------
>   hw/net/e1000x_common.h |  44 +++++++++---------
>   5 files changed, 168 insertions(+), 158 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


