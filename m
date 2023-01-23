Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 270C4677594
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 08:27:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJrDF-0005YC-U5; Mon, 23 Jan 2023 02:25:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJrCy-0005Vf-Go
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 02:25:39 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJrCv-0006D0-S8
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 02:25:36 -0500
Received: by mail-wr1-x42c.google.com with SMTP id t5so9885254wrq.1
 for <qemu-devel@nongnu.org>; Sun, 22 Jan 2023 23:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HB1/QeBkm2hRdMTD3BOgsdtjebQYUh2d/gTlXGQ4b9A=;
 b=A8itqXrn3kXoqrdkodTC1dR8MNICtsbXrfsiRveeYC55U3W+yE4aKVPiE6wBeNTNSk
 TAB6ksub7uVxqxG1ziAe/M3R9cmc/TzgAvA8a3DDeA9OgZHG3db2p1vZD1SYvsJhCKI8
 umUcShthzLRVEj+xEKuQzXZgtqlP+wZr4NekDP12LJAzPyCytmwQoFdVGj63w232VrAX
 5oQRArLzbd4L/xIC+Qywpgd+miy/2sVDciAj4ECAnY3arBRgkV9zarXb2jmgoVRC6I+1
 A8H3lfW/4cevuX5fx5dafO56cgh4keiLR5cHd8sUCro1r5Inqik2uSFPSWBg2VLuVR2I
 /u4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HB1/QeBkm2hRdMTD3BOgsdtjebQYUh2d/gTlXGQ4b9A=;
 b=mk7+C/2E2Ml5Z6fJbC9Wx95hjbK/s6VxfVpgYkhQgPOdY+tX7M0VhvwaS8thRmm36M
 k9yKfgXQtcT07Oitm90XHk89egVToXzgfQnCRX2qCX8v9CbM3rAjEQfp9Rztm7uxI051
 zo3UBKSric04XsiPNX4Va7mgVINLO4lA/gaIoe1q7FT3A0GVzzInHBCWITPh2vPTRknc
 2Fu2YuiYNRi7vrhhujxoCbxxLiSetUWSVfsPx5BlX9TxmxQUEYuy1wQHhzentKor6gvp
 zA4DlretxOQcq9q8oMl2LumoL0ybEPAAXE3kuTWJ+FLzc+83NH/D9BryEP+5DKi1K1Np
 7uRA==
X-Gm-Message-State: AFqh2kod+svmmSfxVr0CQzw1gjnliIqoVwEuJ3mzsoaCLc/VhE4Sl2Lh
 xtcL9iqU7jaxadWdrWC/1xVHzQ==
X-Google-Smtp-Source: AMrXdXtwTEMIkFG5S5IASUO6NoG91Jy7ZtbKQw9uMF3nGdk+iu2vRNQIsnI1os7JmxanM12jgbg6sw==
X-Received: by 2002:adf:f0c8:0:b0:2bf:9656:d1a8 with SMTP id
 x8-20020adff0c8000000b002bf9656d1a8mr8225219wro.32.1674458729218; 
 Sun, 22 Jan 2023 23:25:29 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 w7-20020adfd4c7000000b002baa780f0fasm4117229wrk.111.2023.01.22.23.25.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Jan 2023 23:25:28 -0800 (PST)
Message-ID: <af8222c9-539d-214f-4d5b-ab1862891503@linaro.org>
Date: Mon, 23 Jan 2023 08:25:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 3/5] hw/char/pl011: implement a reset method
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
References: <20230120155447.31702-1-eiakovlev@linux.microsoft.com>
 <20230120155447.31702-4-eiakovlev@linux.microsoft.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230120155447.31702-4-eiakovlev@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 20/1/23 16:54, Evgeny Iakovlev wrote:
> PL011 currently lacks a reset method. Implement it.
> 
> Signed-off-by: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
> ---
>   hw/char/pl011.c | 26 +++++++++++++++++++++-----
>   1 file changed, 21 insertions(+), 5 deletions(-)

>   static void pl011_class_init(ObjectClass *oc, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(oc);
>   
>       dc->realize = pl011_realize;
> +    dc->reset = pl011_reset;
Maybe directly implement as ResettableHoldPhase from "hw/resettable.h".

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

