Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB6031DB83
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 15:33:41 +0100 (CET)
Received: from localhost ([::1]:58196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCNtc-0004OJ-3b
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 09:33:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCNrz-0003Ye-Gn
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 09:31:59 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lCNrv-0004cY-Gt
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 09:31:59 -0500
Received: by mail-wr1-x436.google.com with SMTP id r21so17579335wrr.9
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 06:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BHNj0CsMa8fBSRbxi+Me5az+imrRkM91kLCrLrDQvAA=;
 b=RkKkcOCsCXWjZNtTrohUTRVjmHmeqePt0CR5mWa8AjZQDEcn4wCQT9VbjL6XWj1zz6
 Xu1/MV+8SUi31koMrWxrOPw/BJNraCbgEs9uZ4lP29GPqJQWcbq4/EI7y3JshdOZ43K0
 Ol0eLHEe9MqOwWnIbcGm9fghtTF8KYJ/jGlOLlAzR03Re7cSYc7MnoLVJcyfnpANEz9C
 43ajeTmAhhF/xtHKBcNkDTCFaBRz43cakBojyQq+paTwjtuKs5RgFkvUg1pi3OgzKcDY
 0osS45Jfe5PG1YqiYJwzIH9x9A+DCU2YqMzeHdQvu5qOzrRDmWjD9YkMxKnIQXWM/ODT
 ZHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BHNj0CsMa8fBSRbxi+Me5az+imrRkM91kLCrLrDQvAA=;
 b=J3giUMquK6TegrZ44xBu/Qoe3u8QljNEVBg7WKUTxs12FOHb8e1G53rOeLxf5ojlkL
 Ak0KipjSkD8EyfEbZj8k/naY3i+5l5tyEJjN4rwKjTSAzSwICd3nzE3THvUqphNlqvyA
 a2RXFcBg2UzkK+Exy5x99zUc5uCVy8xehMtJlXPlSFTg/wPOzyV0NEpW19Z4atPV9hK0
 f9yS3sbBfJRL/7GUL7cfIWms9PFbXDJ1wVwf12u7AK0RmyOKGW29Bm6sMAAQkYr7gwm9
 MUTH9ogubN6u4ktfb3D6f3q23VkW6WGbtq9ftYDf94RxvLQHIDOnctv2P88nQs7/IEuf
 hrKw==
X-Gm-Message-State: AOAM532OuiG0zDh/TiErsRjxa5KG70v5lq4qszFi0XyemyZxIkOo/HP9
 khed46jwh0pSywWtiEr+b4M=
X-Google-Smtp-Source: ABdhPJwwpnlY8JJhdMQeN9JKBjWyuJTspQXY6pyTHoJ9TDkPo2M5y1c0t9Zqctp5xYzHnvaUxDoegw==
X-Received: by 2002:adf:a2c2:: with SMTP id t2mr10810395wra.47.1613572314058; 
 Wed, 17 Feb 2021 06:31:54 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f14sm3183012wmc.32.2021.02.17.06.31.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Feb 2021 06:31:53 -0800 (PST)
Subject: Re: [PATCH v2 7/7] tests/avocado: add boot_xen tests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210211171945.18313-1-alex.bennee@linaro.org>
 <20210211171945.18313-8-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <16d8366f-6f94-3a97-b9e0-9962e3d173a1@amsat.org>
Date: Wed, 17 Feb 2021 15:31:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210211171945.18313-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: julien@xen.org, andre.przywara@arm.com, stefano.stabellini@linaro.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, xen-devel@lists.xenproject.org,
 stefano.stabellini@xilinx.com, stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/21 6:19 PM, Alex Bennée wrote:
> These tests make sure we can boot the Xen hypervisor with a Dom0
> kernel using the guest-loader. We currently have to use a kernel I
> built myself because there are issues using the Debian kernel images.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  MAINTAINERS                  |   1 +
>  tests/acceptance/boot_xen.py | 117 +++++++++++++++++++++++++++++++++++
>  2 files changed, 118 insertions(+)
>  create mode 100644 tests/acceptance/boot_xen.py

> diff --git a/tests/acceptance/boot_xen.py b/tests/acceptance/boot_xen.py
> new file mode 100644
> index 0000000000..8c7e091d40
> --- /dev/null
> +++ b/tests/acceptance/boot_xen.py
> @@ -0,0 +1,117 @@
> +# Functional test that boots a Xen hypervisor with a domU kernel and
> +# checks the console output is vaguely sane .
> +#
> +# Copyright (c) 2020 Linaro

2021?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

